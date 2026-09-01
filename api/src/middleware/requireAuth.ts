import type { Request, Response, NextFunction } from "express";
import type { PrincipalContext } from "@lashibi/rbac";
import { loadPrincipalContext } from "@lashibi/rbac";
import { prisma } from "../lib/prisma";
import { verifySession, COOKIE_NAME } from "../lib/session";

declare global {
  namespace Express {
    interface Request {
      principal?: PrincipalContext;
      authUserId?: string;
    }
  }
}

export async function requireAuth(req: Request, res: Response, next: NextFunction) {
  const token = req.cookies?.[COOKIE_NAME];
  if (!token) return res.status(401).json({ error: "Not authenticated" });

  try {
    const claims = verifySession(token);
    req.principal = await loadPrincipalContext(prisma, claims.tenantId, claims.sub);
    req.authUserId = claims.authUserId;
    next();
  } catch {
    return res.status(401).json({ error: "Invalid or expired session" });
  }
}
