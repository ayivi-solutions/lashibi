import type { Request, Response, NextFunction } from "express";
import { authorize, ResourceContext } from "@lashibi/rbac";
import { prisma } from "../lib/prisma";

const POLICY_VERSION = "LSH-AUTHZ-0.1.0"; // bump when the permission catalog changes

// Wraps a route with a real authorization check against the caller's
// PrincipalContext (set by requireAuth) and writes an AuthDecision row
// for every evaluation — allow or deny — mirroring the prototype's
// logDecision(). resourceFn lets a route supply resource-specific
// context (branchId/classification/ownerId) for scope/classification
// checks; omit it for module-level checks with no specific resource.
export function requirePermission(
  permission: string,
  resourceFn?: (req: Request) => ResourceContext
) {
  return async (req: Request, res: Response, next: NextFunction) => {
    const principal = req.principal;
    if (!principal) return res.status(401).json({ error: "Not authenticated" });

    const resource = resourceFn ? resourceFn(req) : {};
    const decision = authorize(principal, permission, resource);

    await prisma.authDecision.create({
      data: {
        tenantId: principal.tenantId,
        principalType: "USER",
        principalId: principal.userId,
        action: permission,
        resourceType: (resource.resourceType as string) ?? null,
        resourceId: resource.id ?? null,
        resourceTenantId: principal.tenantId,
        resourceBranchId: (resource.branchId as string) ?? null,
        classification: resource.classification ?? null,
        policyVersion: POLICY_VERSION,
        result: decision.result,
        reason: decision.reason,
      },
    });

    if (!decision.allowed) {
      return res.status(403).json({ error: "Access denied", reason: decision.reason });
    }

    // TODO(phase: step-up/approval wiring): decision.requiresStepUp and
    // decision.requiresApproval are computed but not yet enforced here —
    // that needs SecuritySession (authLevel/stepUpUntil) and the
    // ApprovalRequest workflow wired in before these can block the request.
    next();
  };
}
