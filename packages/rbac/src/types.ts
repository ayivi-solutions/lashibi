export type Classification =
  | "PUBLIC"
  | "INTERNAL"
  | "CONFIDENTIAL"
  | "RESTRICTED"
  | "CRITICAL";

export const CLASS_LEVEL: Record<Classification, number> = {
  PUBLIC: 0,
  INTERNAL: 1,
  CONFIDENTIAL: 2,
  RESTRICTED: 3,
  CRITICAL: 4,
};

export type ScopeType = "ALL" | "BRANCH" | "SELF" | "RESOURCE";

export interface EffectivePermission {
  code: string; // e.g. "rentals.create", "finance.refund"
  effect: "ALLOW" | "DENY";
}

export interface ScopeGrantContext {
  scopeType: ScopeType;
  branchId?: string | null;
  resourceType?: string | null;
  resourceId?: string | null;
}

// Everything needed to evaluate an authorize() call, assembled once per
// request (see loadPrincipalContext) and reused across checks in that request.
export interface PrincipalContext {
  userId: string;
  tenantId: string;
  clearance: Classification;
  permissions: EffectivePermission[];
  scopeGrants: ScopeGrantContext[];
}

// The resource being acted on. branchId/classification/ownerId are the fields
// authorize() actually reasons about; anything else is caller-defined context.
export interface ResourceContext {
  id?: string;
  branchId?: string | null;
  classification?: Classification;
  ownerId?: string | null; // e.g. handledById, createdById
  assignedUserId?: string | null; // e.g. driver/technician self-scoping
  [key: string]: unknown;
}

export type AuthDecisionResult =
  | "ALLOW"
  | "DENY"
  | "STEP_UP_REQUIRED"
  | "APPROVAL_REQUIRED";

export interface AuthorizeResult {
  allowed: boolean;
  result: AuthDecisionResult;
  reason: string;
  requiresStepUp: boolean;
  requiresApproval: boolean;
}
