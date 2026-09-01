import type { PrismaClient } from "@prisma/client";
import { PrincipalContext, EffectivePermission, ScopeGrantContext } from "./types";

// Flattens UserRole -> RoleDefinition -> RolePermission -> Permission into
// the effective ALLOW/DENY set for a user, plus their active ScopeGrants.
// Call once per request and pass the resulting context into authorize()/can()
// for every check in that request — don't re-query per permission check.
export async function loadPrincipalContext(
  prisma: PrismaClient,
  tenantId: string,
  userId: string
): Promise<PrincipalContext> {
  const user = await prisma.user.findFirstOrThrow({
    where: { tenantId, id: userId, active: true },
    select: { id: true, tenantId: true, clearance: true },
  });

  const userRoles = await prisma.userRole.findMany({
    where: {
      tenantId,
      userId,
      active: true,
      OR: [{ expiresAt: null }, { expiresAt: { gt: new Date() } }],
    },
    include: {
      role: {
        include: {
          permissions: { include: { permission: true } },
        },
      },
      scopes: {
        where: {
          active: true,
          OR: [{ expiresAt: null }, { expiresAt: { gt: new Date() } }],
        },
      },
    },
  });

  const permissions: EffectivePermission[] = [];
  const scopeGrants: ScopeGrantContext[] = [];

  for (const userRole of userRoles) {
    for (const rp of userRole.role.permissions) {
      permissions.push({ code: rp.permission.code, effect: rp.effect });
    }
    for (const grant of userRole.scopes) {
      scopeGrants.push({
        scopeType: grant.scopeType,
        branchId: grant.branchId,
        resourceType: grant.resourceType,
        resourceId: grant.resourceId,
      });
    }
  }

  return {
    userId: user.id,
    tenantId: user.tenantId,
    clearance: user.clearance,
    permissions,
    scopeGrants,
  };
}
