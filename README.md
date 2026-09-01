# Lashibi OS

Fleet/rentals tracking platform for Lashibi Autos. Turborepo monorepo, mirroring the Nexus EFOS project shape.

## Structure

- `api/` — Express API, Prisma (schema `lashibi`), JWT session auth (Supabase Auth verifies credentials; API issues its own httpOnly session cookie)
- `web/` — Next.js 16 frontend (scaffold only — no UI built yet)
- `packages/rbac/` — shared DB-driven RBAC/ABAC engine (`authorize()`/`can()`), consumed by both `api` (real enforcement) and `web` (UI gating only)

## Status

Schema validated (102 models, 65 enums, 0 errors). Auth + permission middleware chain wired end to end on one sample route (`/vehicles`). No business domain routes built beyond that yet.

## Setup

```bash
npm install
cp api/.env.example api/.env   # fill in DATABASE_URL, SUPABASE_URL, SUPABASE_ANON_KEY, SESSION_JWT_SECRET
cd api && npx prisma migrate dev --name init
cd .. && npm run dev
```

See `MIGRATION_SECURITY_NOTES.md` for schema-level SQL that Prisma can't express (RLS, partitioning, CHECK constraints, append-only triggers).
