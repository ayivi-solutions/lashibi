import { Router } from "express";
import { z } from "zod";
import { requireAuth } from "../middleware/requireAuth";
import { requirePermission } from "../middleware/requirePermission";
import { prisma } from "../lib/prisma";
import type { ResourceContext } from "@lashibi/rbac";

declare global {
  namespace Express {
    interface Request {
      vehicleResource?: ResourceContext;
    }
  }
}

export const vehiclesRouter = Router();

vehiclesRouter.use(requireAuth);

const VEHICLE_STATUSES = [
  "ONBOARDING", "AVAILABLE", "RESERVED", "DISPATCH_PENDING", "ON_RENTAL",
  "WORKSHOP", "MAINTENANCE", "ACCIDENT_HOLD", "INSURANCE_HOLD", "SALES_STOCK",
  "SOLD", "RETIRED", "ARCHIVED",
] as const;

const FUEL_TYPES = ["PETROL", "DIESEL", "HYBRID", "PLUG_IN_HYBRID", "ELECTRIC", "LPG", "OTHER"] as const;
const TRANSMISSION_TYPES = ["AUTOMATIC", "MANUAL", "CVT", "DCT", "OTHER"] as const;
const OWNERSHIP_TYPES = ["OWNED", "LEASED", "CONSIGNMENT", "CUSTOMER", "THIRD_PARTY"] as const;
const CLASSIFICATIONS = ["PUBLIC", "INTERNAL", "CONFIDENTIAL", "RESTRICTED", "CRITICAL"] as const;

const createVehicleSchema = z.object({
  homeBranchId: z.string().min(1),
  fleetNumber: z.string().min(1),
  vin: z.string().optional(),
  chassisNumber: z.string().optional(),
  engineNumber: z.string().optional(),
  currentPlateNumber: z.string().optional(),
  make: z.string().min(1),
  model: z.string().min(1),
  trim: z.string().optional(),
  year: z.number().int().gte(1970).lte(2100),
  colour: z.string().optional(),
  fuelType: z.enum(FUEL_TYPES).optional(),
  transmission: z.enum(TRANSMISSION_TYPES).optional(),
  bodyType: z.string().optional(),
  seatCount: z.number().int().positive().optional(),
  vehicleClass: z.string().optional(),
  ownershipType: z.enum(OWNERSHIP_TYPES).optional(),
  rentalEligible: z.boolean().optional(),
  salesEligible: z.boolean().optional(),
  classification: z.enum(CLASSIFICATIONS).optional(),
});

// All fields optional on update — this is a partial patch, not a replace.
const updateVehicleSchema = createVehicleSchema.partial();

const statusChangeSchema = z.object({
  status: z.enum(VEHICLE_STATUSES),
});

// Shared resource-scope pre-fetch: loads the vehicle's branchId/classification
// BEFORE the permission check runs, so authorize()'s scope/classification
// logic has real data to evaluate against — this is the fix for the gap
// flagged in the original scaffold (the check used to be a no-op here).
async function fetchVehicleResource(tenantId: string, id: string) {
  const vehicle = await prisma.vehicle.findFirst({
    where: { tenantId, id },
  });
  if (!vehicle) return null;
  return {
    id: vehicle.id,
    resourceType: "vehicle",
    branchId: vehicle.homeBranchId,
    classification: vehicle.classification,
  };
}

// GET /vehicles — list, branch-scoped implicitly by the DB query (not just
// the RBAC check) so a BRANCH-scoped user never even sees other branches'
// rows, regardless of what the client requests.
vehiclesRouter.get("/", requirePermission("fleet.read"), async (req, res) => {
  const { status, homeBranchId } = req.query;
  const vehicles = await prisma.vehicle.findMany({
    where: {
      tenantId: req.principal!.tenantId,
      archivedAt: null,
      ...(typeof status === "string" ? { status: status as (typeof VEHICLE_STATUSES)[number] } : {}),
      ...(typeof homeBranchId === "string" ? { homeBranchId } : {}),
    },
    orderBy: { createdAt: "desc" },
    take: 100,
  });
  res.json(vehicles);
});

// GET /vehicles/:id — resource-scoped detail.
vehiclesRouter.get(
  "/:id",
  async (req, res, next) => {
    const resource = await fetchVehicleResource(req.principal!.tenantId, req.params.id);
    if (!resource) return res.status(404).json({ error: "Not found" });
    req.vehicleResource = resource;
    next();
  },
  requirePermission("fleet.detail", (req) => req.vehicleResource!),
  async (req, res) => {
    const vehicle = await prisma.vehicle.findFirst({
      where: { tenantId: req.principal!.tenantId, id: req.params.id },
    });
    if (!vehicle) return res.status(404).json({ error: "Not found" });
    res.json(vehicle);
  }
);

// POST /vehicles — create.
vehiclesRouter.post("/", requirePermission("fleet.create"), async (req, res) => {
  const parsed = createVehicleSchema.safeParse(req.body);
  if (!parsed.success) {
    return res.status(400).json({ error: "Invalid vehicle data", details: parsed.error.flatten() });
  }
  const tenantId = req.principal!.tenantId;

  // Confirm the branch actually belongs to this tenant before creating —
  // the composite FK in the schema would reject this at the DB level too,
  // but a clean 400 here beats a raw Prisma error reaching the client.
  const branch = await prisma.branch.findFirst({ where: { tenantId, id: parsed.data.homeBranchId } });
  if (!branch) return res.status(400).json({ error: "homeBranchId is not a valid branch for this tenant" });

  try {
    const vehicle = await prisma.vehicle.create({
      data: { tenantId, ...parsed.data },
    });
    res.status(201).json(vehicle);
  } catch (e: any) {
    if (e.code === "P2002") {
      return res.status(409).json({ error: "Duplicate fleetNumber, VIN, chassisNumber, or plate number" });
    }
    throw e;
  }
});

// PATCH /vehicles/:id — partial update, resource-scoped.
vehiclesRouter.patch(
  "/:id",
  async (req, res, next) => {
    const resource = await fetchVehicleResource(req.principal!.tenantId, req.params.id);
    if (!resource) return res.status(404).json({ error: "Not found" });
    req.vehicleResource = resource;
    next();
  },
  requirePermission("fleet.update", (req) => req.vehicleResource!),
  async (req, res) => {
    const parsed = updateVehicleSchema.safeParse(req.body);
    if (!parsed.success) {
      return res.status(400).json({ error: "Invalid vehicle data", details: parsed.error.flatten() });
    }
    try {
      const vehicle = await prisma.vehicle.update({
        where: { tenantId_id: { tenantId: req.principal!.tenantId, id: req.params.id } },
        data: parsed.data,
      });
      res.json(vehicle);
    } catch (e: any) {
      if (e.code === "P2002") {
        return res.status(409).json({ error: "Duplicate fleetNumber, VIN, chassisNumber, or plate number" });
      }
      throw e;
    }
  }
);

// PATCH /vehicles/:id/status — separate endpoint from the general update,
// deliberately: status transitions (e.g. -> WORKSHOP, -> ACCIDENT_HOLD) are
// operational events with their own permission, not a generic field edit.
vehiclesRouter.patch(
  "/:id/status",
  async (req, res, next) => {
    const resource = await fetchVehicleResource(req.principal!.tenantId, req.params.id);
    if (!resource) return res.status(404).json({ error: "Not found" });
    req.vehicleResource = resource;
    next();
  },
  requirePermission("fleet.update", (req) => req.vehicleResource!),
  async (req, res) => {
    const parsed = statusChangeSchema.safeParse(req.body);
    if (!parsed.success) {
      return res.status(400).json({ error: "Invalid status", details: parsed.error.flatten() });
    }
    const vehicle = await prisma.vehicle.update({
      where: { tenantId_id: { tenantId: req.principal!.tenantId, id: req.params.id } },
      data: { status: parsed.data.status },
    });
    res.json(vehicle);
  }
);

// DELETE /vehicles/:id — soft-delete only. Vehicles are financial/audit
// assets; hard-deleting one would orphan rental history, telemetry, and
// audit trail rows that reference it. archivedAt is how it leaves fleet
// view without destroying that history.
vehiclesRouter.delete(
  "/:id",
  async (req, res, next) => {
    const resource = await fetchVehicleResource(req.principal!.tenantId, req.params.id);
    if (!resource) return res.status(404).json({ error: "Not found" });
    req.vehicleResource = resource;
    next();
  },
  requirePermission("fleet.archive", (req) => req.vehicleResource!),
  async (req, res) => {
    await prisma.vehicle.update({
      where: { tenantId_id: { tenantId: req.principal!.tenantId, id: req.params.id } },
      data: { archivedAt: new Date(), status: "ARCHIVED" },
    });
    res.status(204).send();
  }
);
