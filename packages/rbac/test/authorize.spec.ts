import { authorize } from "../src/authorize";
import type { PrincipalContext } from "../src/types";

let failures = 0;
function check(label: string, actual: boolean, expected: boolean) {
  const pass = actual === expected;
  if (!pass) failures++;
  console.log(`${pass ? "PASS" : "FAIL"} — ${label} (expected ${expected}, got ${actual})`);
}

// --- Scenario 1: driver has no fleet.* permission at all ---
const driverCtx: PrincipalContext = {
  userId: "u-driver",
  tenantId: "t1",
  clearance: "INTERNAL",
  permissions: [
    { code: "rentals.read", effect: "ALLOW" },
    { code: "rentals.contact", effect: "ALLOW" },
  ],
  scopeGrants: [{ scopeType: "SELF" }],
};
check("driver denied fleet.read (no matching entitlement)", authorize(driverCtx, "fleet.read").allowed, false);

// --- Scenario 2/3: dispatcher has read-only fleet access ---
const dispatcherCtx: PrincipalContext = {
  userId: "u-dispatch",
  tenantId: "t1",
  clearance: "CONFIDENTIAL",
  permissions: [
    { code: "fleet.read", effect: "ALLOW" },
    { code: "fleet.detail", effect: "ALLOW" },
  ],
  scopeGrants: [{ scopeType: "TENANT" }],
};
check("dispatcher denied fleet.create (not in permission set)", authorize(dispatcherCtx, "fleet.create").allowed, false);
check("dispatcher allowed fleet.read", authorize(dispatcherCtx, "fleet.read").allowed, true);

// --- Scenario 4/5: fleet manager scoped to one branch ---
const fleetMgrCtx: PrincipalContext = {
  userId: "u-fleet",
  tenantId: "t1",
  clearance: "RESTRICTED",
  permissions: [{ code: "fleet.*", effect: "ALLOW" }],
  scopeGrants: [{ scopeType: "BRANCH", branchId: "branch-accra" }],
};
check(
  "branch-scoped fleet manager denied update on a different branch's vehicle",
  authorize(fleetMgrCtx, "fleet.update", {
    id: "v1", resourceType: "vehicle", branchId: "branch-airport", classification: "INTERNAL",
  }).allowed,
  false
);
check(
  "branch-scoped fleet manager allowed update on their own branch's vehicle",
  authorize(fleetMgrCtx, "fleet.update", {
    id: "v2", resourceType: "vehicle", branchId: "branch-accra", classification: "INTERNAL",
  }).allowed,
  true
);

// --- Scenario 6/7: classification must not exceed role clearance ---
const mdCtx: PrincipalContext = {
  userId: "u-md",
  tenantId: "t1",
  clearance: "RESTRICTED", // level 3
  permissions: [{ code: "fleet.*", effect: "ALLOW" }],
  scopeGrants: [{ scopeType: "TENANT" }],
};
check(
  "MD (RESTRICTED clearance) denied archive on a CRITICAL-classified vehicle",
  authorize(mdCtx, "fleet.archive", { id: "v3", resourceType: "vehicle", classification: "CRITICAL" }).allowed,
  false
);

const superadminCtx: PrincipalContext = {
  userId: "u-super",
  tenantId: "t1",
  clearance: "CRITICAL",
  permissions: [{ code: "*", effect: "ALLOW" }],
  scopeGrants: [{ scopeType: "TENANT" }],
};
check(
  "superadmin (CRITICAL clearance, * permission) allowed archive on CRITICAL vehicle",
  authorize(superadminCtx, "fleet.archive", { id: "v3", resourceType: "vehicle", classification: "CRITICAL" }).allowed,
  true
);

// --- Bonus: deny-overrides-allow, in case a future role gets an explicit DENY rule ---
const restrictedCtx: PrincipalContext = {
  userId: "u-restricted",
  tenantId: "t1",
  clearance: "RESTRICTED",
  permissions: [
    { code: "fleet.*", effect: "ALLOW" },
    { code: "fleet.archive", effect: "DENY" },
  ],
  scopeGrants: [{ scopeType: "TENANT" }],
};
check(
  "explicit DENY on fleet.archive overrides the fleet.* ALLOW",
  authorize(restrictedCtx, "fleet.archive", { id: "v4", resourceType: "vehicle" }).allowed,
  false
);

console.log(`\n${failures === 0 ? "ALL PASS" : `${failures} FAILURE(S)`}`);
process.exit(failures === 0 ? 0 : 1);
