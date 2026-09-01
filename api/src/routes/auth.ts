import { Router } from "express";
import { z } from "zod";
import { prisma } from "../lib/prisma";
import { supabaseAuth } from "../lib/supabase";
import { signSession, setSessionCookie, clearSessionCookie } from "../lib/session";

export const authRouter = Router();

const loginSchema = z.object({
  email: z.string().email(),
  password: z.string().min(1),
});

authRouter.post("/login", async (req, res) => {
  const parsed = loginSchema.safeParse(req.body);
  if (!parsed.success) {
    return res.status(400).json({ error: "Invalid email or password format" });
  }
  const { email, password } = parsed.data;

  // Step 1: Supabase Auth verifies the credential itself.
  const { data, error } = await supabaseAuth.auth.signInWithPassword({ email, password });
  if (error || !data.user) {
    return res.status(401).json({ error: "Invalid credentials" });
  }

  // Step 2: resolve the Supabase identity to a Lashibi business principal.
  // NOTE: tenantId resolution is single-tenant-default for now (see
  // MIGRATION_SECURITY_NOTES) — multi-tenant login will need a tenant
  // selection step before this lookup.
  const user = await prisma.user.findFirst({
    where: { authUserId: data.user.id, active: true },
  });

  if (!user) {
    return res.status(403).json({ error: "No Lashibi account linked to this identity" });
  }

  // Step 3: API mints its own session — not Supabase's token — because the
  // API is the authorization authority (role/scope/classification live here).
  const token = signSession({
    sub: user.id,
    tenantId: user.tenantId,
    authUserId: data.user.id,
  });
  setSessionCookie(res, token);

  return res.json({ userId: user.id, tenantId: user.tenantId });
});

authRouter.post("/logout", (_req, res) => {
  clearSessionCookie(res);
  return res.status(204).send();
});
