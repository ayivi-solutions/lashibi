import {
  CLASS_LEVEL,
  Classification,
  PrincipalContext,
  ResourceContext,
  AuthorizeResult,
} from "./types";

// "rentals.*" matches "rentals.create"; "*" matches everything.
export function wildcardMatch(rule: string, permission: string): boolean {
  if (rule === "*" || rule === permission) return true;
  if (rule.endsWith(".*")) return permission.startsWith(rule.slice(0, -1));
  return false;
}

// Deny-overrides-allow: an explicit DENY rule beats any matching ALLOW,
// regardless of which role granted it. This is what makes SoD/negative
// rules meaningful instead of just "most permissive role wins".
export function hasRule(ctx: PrincipalContext, permission: string): boolean {
  let allowed = false;
  for (const p of ctx.permissions) {
    if (!wildcardMatch(p.code, permission)) continue;
    if (p.effect === "DENY") return false;
    allowed = true;
  }
  return allowed;
}

function resourceInScope(ctx: PrincipalContext, resource: ResourceContext): boolean {
  if (!resource || Object.keys(resource).length === 0) return true;
  if (ctx.scopeGrants.some((g) => g.scopeType === "TENANT")) return true;

  for (const grant of ctx.scopeGrants) {
    if (grant.scopeType === "BRANCH") {
      if (!resource.branchId || resource.branchId === grant.branchId) return true;
    }
    if (grant.scopeType === "SELF") {
      if (resource.ownerId && resource.ownerId === ctx.userId) return true;
    }
    if (grant.scopeType === "ASSIGNED") {
      if (resource.assignedUserId && resource.assignedUserId === ctx.userId) return true;
    }
    if (grant.scopeType === "RESOURCE") {
      if (
        resource.id &&
        grant.resourceId === resource.id &&
        (!grant.resourceType || grant.resourceType === resource["resourceType"])
      ) {
        return true;
      }
    }
    if (grant.scopeType === "CORPORATE_ACCOUNT") {
      if (
        resource.corporateAccountId &&
        resource.corporateAccountId === grant.corporateAccountId
      ) {
        return true;
      }
    }
  }
  return false;
}

function classificationAllowed(ctx: PrincipalContext, resource: ResourceContext): boolean {
  const level = CLASS_LEVEL[(resource.classification as Classification) ?? "INTERNAL"];
  return CLASS_LEVEL[ctx.clearance] >= level;
}

// Actions that must never proceed without a fresh re-authentication.
// Enforcement (checking session.authLevel/stepUpUntil) lands with the
// SecuritySession wiring — this list just flags which actions need it.
const STEP_UP_ACTIONS = new Set([
  "finance.refund",
  "returns.damageWaiver",
  "telemetry.override",
  "tracking.history.export",
  "admin.role.update",
  "approvals.approve",
  "pam.breakglass",
  "session.revoke.other",
]);

// Actions that must route through the ApprovalRequest/ApprovalDecision
// workflow rather than executing directly.
const APPROVAL_ACTIONS = new Set([
  "finance.refund",
  "returns.damageWaiver",
  "tracking.history.export",
  "admin.role.update",
  "inventory.writeoff",
]);

export function authorize(
  ctx: PrincipalContext,
  permission: string,
  resource: ResourceContext = {},
  options: { approval?: boolean; stepUp?: boolean } = {}
): AuthorizeResult {
  if (!hasRule(ctx, permission)) {
    return {
      allowed: false,
      result: "DENY",
      reason: "No matching entitlement",
      requiresStepUp: false,
      requiresApproval: false,
    };
  }

  if (!resourceInScope(ctx, resource)) {
    return {
      allowed: false,
      result: "DENY",
      reason: "Resource outside assigned data scope",
      requiresStepUp: false,
      requiresApproval: false,
    };
  }

  if (!classificationAllowed(ctx, resource)) {
    return {
      allowed: false,
      result: "DENY",
      reason: "Classification exceeds role clearance",
      requiresStepUp: false,
      requiresApproval: false,
    };
  }

  const requiresStepUp = options.stepUp || STEP_UP_ACTIONS.has(permission);
  const requiresApproval = options.approval || APPROVAL_ACTIONS.has(permission);

  return {
    allowed: true,
    result: requiresApproval
      ? "APPROVAL_REQUIRED"
      : requiresStepUp
        ? "STEP_UP_REQUIRED"
        : "ALLOW",
    reason: "Explicit entitlement",
    requiresStepUp,
    requiresApproval,
  };
}

export function can(
  ctx: PrincipalContext,
  permission: string,
  resource: ResourceContext = {}
): boolean {
  return authorize(ctx, permission, resource).allowed;
}
