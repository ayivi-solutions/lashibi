import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

// Ported verbatim from the v4.1 prototype's POLICY object — do not
// hand-edit without checking the prototype stays in sync, or vice versa.
const ROLE_PERMISSIONS: Record<string, string[]> = {
  md: [
    "dashboard.*", "workshop.*", "rentals.*", "fleet.*", "sales.*", "inventory.*",
    "crm.*", "finance.*", "insurance.*", "passport.*", "ai.*", "portal.*",
    "drivers.*", "dispatch.*", "returns.*", "tracking.*", "telemetry.*",
    "approvals.read", "approvals.approve", "security.read", "audit.read",
    "session.revoke.self", "security.stepup", "pam.request",
  ],
  superadmin: ["*"],
  securityadmin: [
    "dashboard.read", "security.*", "iam.*", "audit.*", "approvals.read",
    "approvals.approve", "pam.*", "session.*", "admin.security.*", "crypto.*",
    "api.security.*",
  ],
  auditor: [
    "dashboard.read", "security.read", "audit.read", "approvals.read",
    "finance.summary", "rentals.read", "inventory.read", "session.read",
    "crypto.read", "api.security.read",
  ],
  approver: [
    "dashboard.read", "security.read", "approvals.read", "approvals.approve",
    "rentals.read", "finance.summary", "sales.read", "inventory.read",
    "security.stepup", "session.revoke.self",
  ],
  rental: [
    "dashboard.read", "rentals.*", "drivers.*", "dispatch.*", "returns.*",
    "tracking.*", "telemetry.*", "fleet.read", "fleet.detail", "crm.read",
    "crm.detail", "finance.summary", "insurance.read", "passport.read",
    "ai.read", "security.read", "audit.read", "pam.request",
    "security.stepup", "session.revoke.self",
  ],
  dispatcher: [
    "dashboard.read", "rentals.read", "rentals.booking.read", "rentals.create",
    "rentals.contact", "drivers.read", "drivers.detail", "dispatch.*",
    "returns.read", "returns.detail", "tracking.read", "tracking.playback",
    "telemetry.read", "telemetry.detail", "fleet.read", "fleet.detail",
    "crm.read", "security.read", "security.stepup", "session.revoke.self",
    "pam.request",
  ],
  fleet: [
    "dashboard.read", "fleet.*", "rentals.read", "rentals.telemetry",
    "tracking.read", "tracking.playback", "tracking.geofence", "telemetry.*",
    "drivers.read", "workshop.read", "insurance.read", "passport.read",
    "inventory.read", "ai.read", "security.read", "audit.read",
    "pam.request", "security.stepup", "session.revoke.self",
  ],
  driver: [
    "dashboard.read", "rentals.read", "rentals.contact", "drivers.self",
    "dispatch.self", "returns.self", "tracking.self", "telemetry.self",
    "session.revoke.self",
  ],
  finance: [
    "dashboard.read", "rentals.read", "rentals.booking.read", "rentals.finance",
    "sales.read", "inventory.read", "inventory.cost", "crm.read", "finance.*",
    "insurance.read", "returns.finance", "security.read", "audit.read",
    "approvals.read", "pam.request", "security.stepup", "session.revoke.self",
  ],
  workshop: [
    "dashboard.read", "workshop.*", "fleet.read", "fleet.detail",
    "inventory.read", "inventory.issue", "crm.read", "passport.read",
    "passport.service", "ai.read", "security.read", "audit.read",
    "pam.request", "security.stepup", "session.revoke.self",
  ],
  sales: [
    "dashboard.read", "sales.*", "crm.*", "finance.summary", "passport.read",
    "security.read", "audit.read", "pam.request", "security.stepup",
    "session.revoke.self",
  ],
  inventory: [
    "dashboard.read", "inventory.*", "workshop.read", "fleet.read",
    "security.read", "audit.read", "pam.request", "security.stepup",
    "session.revoke.self",
  ],
  technician: [
    "workshop.assigned", "workshop.update.assigned", "inventory.issue",
    "inventory.read", "passport.service", "session.revoke.self",
  ],
  customer: [
    "dashboard.read", "rentals.read", "rentals.booking.read", "rentals.create",
    "rentals.contact", "workshop.read", "sales.read", "crm.*", "security.read",
    "session.revoke.self",
  ],
};

const ROLE_META: Record<
  string,
  { label: string; clearance: "PUBLIC" | "INTERNAL" | "CONFIDENTIAL" | "RESTRICTED" | "CRITICAL"; privileged: boolean }
> = {
  md: { label: "Managing Director", clearance: "RESTRICTED", privileged: false },
  superadmin: { label: "Super Admin (PAM identity)", clearance: "CRITICAL", privileged: true },
  securityadmin: { label: "Security Administrator", clearance: "CRITICAL", privileged: true },
  auditor: { label: "Security / Internal Auditor", clearance: "CRITICAL", privileged: false },
  approver: { label: "Independent Approver", clearance: "RESTRICTED", privileged: false },
  rental: { label: "Rental Manager", clearance: "RESTRICTED", privileged: false },
  dispatcher: { label: "Rental Dispatcher", clearance: "CONFIDENTIAL", privileged: false },
  fleet: { label: "Fleet Manager", clearance: "RESTRICTED", privileged: false },
  driver: { label: "Driver", clearance: "INTERNAL", privileged: false },
  finance: { label: "Finance Manager", clearance: "RESTRICTED", privileged: false },
  workshop: { label: "Workshop Manager", clearance: "CONFIDENTIAL", privileged: false },
  sales: { label: "Sales Manager", clearance: "CONFIDENTIAL", privileged: false },
  inventory: { label: "Inventory Officer", clearance: "CONFIDENTIAL", privileged: false },
  technician: { label: "Technician", clearance: "INTERNAL", privileged: false },
  customer: { label: "Customer Service", clearance: "CONFIDENTIAL", privileged: false },
};
// NOTE: clearance here maps the prototype's 0-4 integer scale onto the
// schema's 5-step Classification enum (0->PUBLIC .. 4->CRITICAL) at the
// nearest matching step. Worth a manual review pass once real role/data
// classification decisions are made — this is a reasonable default, not
// a verified-correct mapping.

function splitCode(code: string): { domain: string; action: string } {
  const idx = code.indexOf(".");
  if (idx === -1) return { domain: code, action: code };
  return { domain: code.slice(0, idx), action: code.slice(idx + 1) };
}

async function main() {
  const adminAuthUserId = process.env.SEED_ADMIN_AUTH_USER_ID;
  if (!adminAuthUserId) {
    throw new Error(
      "SEED_ADMIN_AUTH_USER_ID is not set. Create the Supabase Auth user first " +
        "(Dashboard -> Authentication -> Users -> Add user, email gdzorkpey@lashibigh.com), " +
        "copy its UUID, and set SEED_ADMIN_AUTH_USER_ID in api/.env before running this seed."
    );
  }

  await prisma.countryPack.upsert({
    where: { code: "GH" },
    update: {},
    create: {
      code: "GH",
      name: "Ghana",
      currencyCode: "GHS",
      defaultTimezone: "Africa/Accra",
      locale: "en-GH",
      config: {},
    },
  });

  const tenant = await prisma.tenant.upsert({
    where: { slug: "lashibi-autos" },
    update: {},
    create: {
      name: "Lashibi Autos",
      slug: "lashibi-autos",
      countryPackCode: "GH",
      timezone: "Africa/Accra",
    },
  });

  const branchDefs: { code: string; name: string; type: "HEAD_OFFICE" | "RENTAL_HUB" | "AIRPORT_DESK" | "WORKSHOP" }[] = [
    { code: "accra", name: "Accra", type: "RENTAL_HUB" },
    { code: "airport", name: "Airport", type: "AIRPORT_DESK" },
    { code: "workshop", name: "Workshop", type: "WORKSHOP" },
  ];
  const branches: Record<string, string> = {};
  for (const b of branchDefs) {
    const branch = await prisma.branch.upsert({
      where: { tenantId_code: { tenantId: tenant.id, code: b.code } },
      update: {},
      create: { tenantId: tenant.id, code: b.code, name: b.name, type: b.type },
    });
    branches[b.code] = branch.id;
  }

  // Deduplicated permission catalog across all roles.
  const allCodes = new Set<string>();
  for (const codes of Object.values(ROLE_PERMISSIONS)) {
    for (const c of codes) allCodes.add(c);
  }
  const permissionIds: Record<string, string> = {};
  for (const code of allCodes) {
    const { domain, action } = splitCode(code);
    const perm = await prisma.permission.upsert({
      where: { code },
      update: {},
      create: { code, domain, action },
    });
    permissionIds[code] = perm.id;
  }

  // Roles + their permission grants.
  const roleIds: Record<string, string> = {};
  for (const [roleCode, meta] of Object.entries(ROLE_META)) {
    const role = await prisma.roleDefinition.upsert({
      where: { tenantId_code: { tenantId: tenant.id, code: roleCode } },
      update: {},
      create: {
        tenantId: tenant.id,
        code: roleCode,
        name: meta.label,
        builtIn: true,
        privileged: meta.privileged,
      },
    });
    roleIds[roleCode] = role.id;

    for (const code of ROLE_PERMISSIONS[roleCode]) {
      await prisma.rolePermission.upsert({
        where: {
          tenantId_roleId_permissionId: {
            tenantId: tenant.id,
            roleId: role.id,
            permissionId: permissionIds[code],
          },
        },
        update: {},
        create: {
          tenantId: tenant.id,
          roleId: role.id,
          permissionId: permissionIds[code],
          effect: "ALLOW",
        },
      });
    }
  }

  // First admin user: Godwin Dzorkpey, role = md.
  const adminUser = await prisma.user.upsert({
    where: { tenantId_email: { tenantId: tenant.id, email: "gdzorkpey@lashibigh.com" } },
    update: {},
    create: {
      tenantId: tenant.id,
      authUserId: adminAuthUserId,
      email: "gdzorkpey@lashibigh.com",
      name: "Godwin Dzorkpey",
      status: "ACTIVE",
      clearance: ROLE_META.md.clearance,
      primaryBranchId: branches.accra,
    },
  });

  const userRole = await prisma.userRole.create({
    data: {
      tenantId: tenant.id,
      userId: adminUser.id,
      roleId: roleIds.md,
    },
  });

  await prisma.scopeGrant.create({
    data: {
      tenantId: tenant.id,
      userRoleId: userRole.id,
      scopeType: "TENANT",
    },
  });

  console.log(`Seeded: tenant=${tenant.slug}, branches=${Object.keys(branches).join(",")}, roles=${Object.keys(roleIds).length}, admin=${adminUser.email}`);
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
