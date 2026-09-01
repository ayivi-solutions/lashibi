import { PrismaClient } from "@prisma/client";

declare global {
  // eslint-disable-next-line no-var
  var __lashibiPrisma: PrismaClient | undefined;
}

export const prisma = global.__lashibiPrisma ?? new PrismaClient();

if (process.env.NODE_ENV !== "production") {
  global.__lashibiPrisma = prisma;
}
