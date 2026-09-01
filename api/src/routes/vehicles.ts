import { Router } from "express";
import { requireAuth } from "../middleware/requireAuth";
import { requirePermission } from "../middleware/requirePermission";
import { prisma } from "../lib/prisma";

export const vehiclesRouter = Router();

vehiclesRouter.use(requireAuth);

// GET /vehicles — module-level check, no specific resource
vehiclesRouter.get("/", requirePermission("fleet.read"), async (req, res) => {
  const vehicles = await prisma.vehicle.findMany({
    where: { tenantId: req.principal!.tenantId },
    take: 50,
  });
  res.json(vehicles);
});

// GET /vehicles/:id — resource-level check: branch scope + classification.
// NOTE: this resourceFn doesn't yet fetch the vehicle's actual branchId/
// classification before the check runs, so scope/classification enforcement
// is a no-op here (defaults to INTERNAL/no-branch). Needs a pre-fetch once
// real resource-scoped routes are built — flagging rather than shipping
// silently-permissive enforcement.
vehiclesRouter.get(
  "/:id",
  requirePermission("fleet.detail", (req) => ({ resourceType: "vehicle", id: req.params.id })),
  async (req, res) => {
    const vehicle = await prisma.vehicle.findFirst({
      where: { tenantId: req.principal!.tenantId, id: req.params.id },
    });
    if (!vehicle) return res.status(404).json({ error: "Not found" });
    res.json(vehicle);
  }
);
