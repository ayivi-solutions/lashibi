# Lashibi OS — Prisma Companion Migration / Security Notes

This file lists PostgreSQL/Supabase controls that are deliberately **not treated as Prisma-only concerns**.

## 1. Supabase Auth
- `lashibi.User.authUserId` maps to `auth.users.id` conceptually.
- Do not store application password hashes in `lashibi`.
- The API establishes the authenticated principal from trusted server-side authentication context.

## 2. Row-Level Security and tenant isolation
Enable RLS for every tenant-owned table.

Production policy evaluation should use trusted request/session context such as:
- tenant ID
- user/business principal ID
- branch/scope grants
- assignment/ownership context
- classification clearance

Do not allow the browser to set trusted tenant/role claims directly.

Composite relations in the Prisma schema deliberately repeat `tenantId` for core aggregate references. Add negative tests proving cross-tenant object IDs fail at API and database layers.

## 3. Authorization
The authoritative access pipeline is:

`Authentication -> Session assurance -> RBAC permissions -> ABAC/scope -> object ownership/assignment -> classification -> SoD -> approval/JIT -> decision -> audit evidence`

Frontend capability checks are UX only. Every protected API/service operation and object fetch must re-evaluate authorization.

## 4. CHECK constraints to add in SQL migrations
Prisma cannot express all required invariants. Add database CHECK constraints for at least:
- `year` and score ranges
- non-negative money/quantities/mileage
- session `idleExpiresAt <= absoluteExpiresAt`
- rental pickup/return date ordering
- allocation start/end ordering
- temporary grant start/end ordering
- break-glass start/end/expiry ordering
- percentage fields 0..100
- latitude/longitude bounds
- `ScopeGrant` conditional fields by `scopeType`
- deposit/refund totals not exceeding valid source amounts

## 5. Append-only / tamper-evident ledgers
Normal application roles must not UPDATE/DELETE:
- `AuthDecision`
- `AuditEvent`
- `AuthenticationEvent`
- `OdometerReading`
- posted `StockMovement`
- posted financial/provider transaction evidence
- completed inspection evidence

Use correction/reversal records rather than destructive mutation.

Use triggers or restricted stored procedures to calculate/verify `integrityHash` / `previousHash` where chain integrity is required.

## 6. Telemetry partitioning
`TelemetryReading` is intentionally a high-volume time-series table.

Production migration should partition by `capturedAt` (monthly/weekly depending on volume) and consider:
- BRIN indexes on time
- `(tenantId, vehicleId, capturedAt DESC)` indexes
- retention/downsampling policy
- separate hot/cold retention tiers
- PostGIS geometry if route/geofence volume warrants it

Do not expose raw unrestricted location history to ordinary rental/customer-service roles.

## 7. Unique active assignments / exclusion constraints
Use SQL partial unique or exclusion constraints where Prisma cannot express them, e.g.:
- one active tracking device assignment per device
- no overlapping active rental allocation for the same vehicle
- one active primary branch membership where required
- no overlapping active driver assignment if business rules prohibit it

## 8. Vehicle odometer
`Vehicle.currentOdometer` is a projection/cache, not the authoritative ledger.

Authoritative mileage comes from append-only `OdometerReading` records and telemetry. Database/service logic should prevent silent rollback. Approved corrections create a new `CORRECTION` record referencing `correctionOfId`.

## 9. Four-eyes / segregation of duties
Approval service must reject at least:
- requester approving their own request
- role/permission administrator approving their own elevation
- refund maker approving the same refund
- mileage correction maker approving the same correction
- inventory write-off maker approving the same write-off

JIT grants must expire automatically and be removed from effective permissions immediately.

## 10. Privileged access
- Separate daily-use and privileged identities.
- Privileged actions require phishing-resistant MFA/step-up.
- Break-glass is narrowly scoped, time-limited, reason-bound and enhanced-logged.
- Root/database/KMS/CI credentials must not be represented as ordinary application secrets.

## 11. Secrets and integrations
`credentialRef`, `secretHashRef` and `signingKeyRef` are references to an external managed secret/KMS system, not raw secrets.

Webhook ingress should enforce signature + timestamp + nonce/replay protection before business processing.

## 12. Financial integrity
Money-affecting records should use reversal/correction semantics, not deletion.
Reconcile:
- invoices
- payment provider callbacks
- allocations
- deposits
- refunds
- tax submissions

Sensitive finance actions should be approval-policy driven.

## 13. Soft deletion / retention
Core business history should generally be archived, not hard deleted. Apply retention/legal-hold policy to:
- customer PII
- tracking/location history
- communications
- security evidence
- finance/tax records
- rental agreements

## 14. Prisma migration gate
Before first production migration:
1. `prisma format`
2. `prisma validate`
3. generate migration in a disposable database
4. add SQL RLS/CHECK/trigger/partition controls
5. run cross-tenant/BOLA/BOPLA negative tests
6. run maker-checker/JIT/break-glass negative tests
7. verify immutable-ledger mutation attempts fail
8. verify restore/backup and audit chronology
