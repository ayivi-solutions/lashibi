-- CreateEnum
CREATE TYPE "lashibi"."TenantStatus" AS ENUM ('ACTIVE', 'SUSPENDED', 'ARCHIVED');

-- CreateEnum
CREATE TYPE "lashibi"."BranchType" AS ENUM ('HEAD_OFFICE', 'RENTAL_HUB', 'AIRPORT_DESK', 'WORKSHOP', 'SALES_YARD', 'STOCK_LOCATION', 'OTHER');

-- CreateEnum
CREATE TYPE "lashibi"."UserStatus" AS ENUM ('INVITED', 'ACTIVE', 'SUSPENDED', 'DISABLED', 'ARCHIVED');

-- CreateEnum
CREATE TYPE "lashibi"."Classification" AS ENUM ('PUBLIC', 'INTERNAL', 'CONFIDENTIAL', 'RESTRICTED', 'CRITICAL');

-- CreateEnum
CREATE TYPE "lashibi"."ScopeType" AS ENUM ('TENANT', 'BRANCH', 'SELF', 'ASSIGNED', 'RESOURCE', 'CORPORATE_ACCOUNT');

-- CreateEnum
CREATE TYPE "lashibi"."PermissionEffect" AS ENUM ('ALLOW', 'DENY');

-- CreateEnum
CREATE TYPE "lashibi"."PrincipalType" AS ENUM ('USER', 'SERVICE', 'API_CLIENT', 'DEVICE', 'SYSTEM', 'AI_AGENT');

-- CreateEnum
CREATE TYPE "lashibi"."AuthDecisionResult" AS ENUM ('ALLOW', 'DENY', 'STEP_UP_REQUIRED', 'APPROVAL_REQUIRED', 'ERROR');

-- CreateEnum
CREATE TYPE "lashibi"."AuthEventType" AS ENUM ('SESSION_ESTABLISHED', 'SESSION_REFRESHED', 'SESSION_REVOKED', 'LOGIN_SUCCESS', 'LOGIN_FAILURE', 'MFA_CHALLENGE', 'MFA_SUCCESS', 'MFA_FAILURE', 'FACTOR_ENROLLED', 'FACTOR_RESET', 'STEP_UP_REQUIRED', 'STEP_UP_SUCCESS', 'STEP_UP_FAILURE', 'DEVICE_TRUST_CHANGED', 'RISK_CHANGED');

-- CreateEnum
CREATE TYPE "lashibi"."SessionStatus" AS ENUM ('ACTIVE', 'REVOKED', 'EXPIRED', 'COMPROMISED');

-- CreateEnum
CREATE TYPE "lashibi"."ApprovalStatus" AS ENUM ('PENDING', 'APPROVED', 'REJECTED', 'CANCELLED', 'EXPIRED');

-- CreateEnum
CREATE TYPE "lashibi"."ApprovalDecisionType" AS ENUM ('APPROVE', 'REJECT');

-- CreateEnum
CREATE TYPE "lashibi"."TemporaryGrantStatus" AS ENUM ('PENDING', 'ACTIVE', 'EXPIRED', 'REVOKED', 'REJECTED');

-- CreateEnum
CREATE TYPE "lashibi"."BreakGlassStatus" AS ENUM ('REQUESTED', 'ACTIVE', 'CLOSED', 'EXPIRED', 'REJECTED');

-- CreateEnum
CREATE TYPE "lashibi"."DeviceTrustStatus" AS ENUM ('UNKNOWN', 'TRUSTED', 'LIMITED', 'BLOCKED');

-- CreateEnum
CREATE TYPE "lashibi"."EmploymentStatus" AS ENUM ('ACTIVE', 'LEAVE', 'SUSPENDED', 'TERMINATED', 'ARCHIVED');

-- CreateEnum
CREATE TYPE "lashibi"."DriverAvailabilityStatus" AS ENUM ('AVAILABLE', 'ASSIGNED', 'ON_TRIP', 'OFF_DUTY', 'LEAVE', 'SUSPENDED');

-- CreateEnum
CREATE TYPE "lashibi"."TechnicianAvailabilityStatus" AS ENUM ('AVAILABLE', 'ASSIGNED', 'OFF_DUTY', 'LEAVE', 'SUSPENDED');

-- CreateEnum
CREATE TYPE "lashibi"."CustomerType" AS ENUM ('INDIVIDUAL', 'CORPORATE');

-- CreateEnum
CREATE TYPE "lashibi"."CustomerStatus" AS ENUM ('PROSPECT', 'ACTIVE', 'RESTRICTED', 'DORMANT', 'ARCHIVED');

-- CreateEnum
CREATE TYPE "lashibi"."IdentityType" AS ENUM ('GHANA_CARD', 'PASSPORT', 'DRIVERS_LICENCE', 'TIN', 'COMPANY_REGISTRATION', 'OTHER');

-- CreateEnum
CREATE TYPE "lashibi"."ConsentType" AS ENUM ('TERMS', 'PRIVACY', 'MARKETING', 'LOCATION_TRACKING', 'VEHICLE_PASSPORT_SHARE', 'CREDIT_CHECK', 'INSURANCE_PROCESSING');

-- CreateEnum
CREATE TYPE "lashibi"."VehicleStatus" AS ENUM ('ONBOARDING', 'AVAILABLE', 'RESERVED', 'DISPATCH_PENDING', 'ON_RENTAL', 'WORKSHOP', 'MAINTENANCE', 'ACCIDENT_HOLD', 'INSURANCE_HOLD', 'SALES_STOCK', 'SOLD', 'RETIRED', 'ARCHIVED');

-- CreateEnum
CREATE TYPE "lashibi"."VehicleOwnershipType" AS ENUM ('OWNED', 'LEASED', 'CONSIGNMENT', 'CUSTOMER', 'THIRD_PARTY');

-- CreateEnum
CREATE TYPE "lashibi"."FuelType" AS ENUM ('PETROL', 'DIESEL', 'HYBRID', 'PLUG_IN_HYBRID', 'ELECTRIC', 'LPG', 'OTHER');

-- CreateEnum
CREATE TYPE "lashibi"."TransmissionType" AS ENUM ('AUTOMATIC', 'MANUAL', 'CVT', 'DCT', 'OTHER');

-- CreateEnum
CREATE TYPE "lashibi"."OdometerSource" AS ENUM ('MANUAL', 'INSPECTION', 'TELEMETRY', 'WORKSHOP', 'RENTAL_PICKUP', 'RENTAL_RETURN', 'SALES_INSPECTION', 'IMPORT', 'CORRECTION');

-- CreateEnum
CREATE TYPE "lashibi"."VehicleDocumentType" AS ENUM ('REGISTRATION', 'ROADWORTHINESS', 'INSURANCE', 'IMPORT', 'CUSTOMS', 'PURCHASE', 'OWNERSHIP', 'WARRANTY', 'OTHER');

-- CreateEnum
CREATE TYPE "lashibi"."RentalType" AS ENUM ('SELF_DRIVE', 'CHAUFFEUR', 'CORPORATE', 'TOUR_PACKAGE', 'LONG_TERM');

-- CreateEnum
CREATE TYPE "lashibi"."ReservationStatus" AS ENUM ('DRAFT', 'QUOTED', 'RESERVED', 'AWAITING_PAYMENT', 'CONFIRMED', 'CANCELLED', 'EXPIRED', 'CONVERTED');

-- CreateEnum
CREATE TYPE "lashibi"."VehicleAllocationStatus" AS ENUM ('HELD', 'CONFIRMED', 'RELEASED', 'REPLACED', 'CANCELLED');

-- CreateEnum
CREATE TYPE "lashibi"."RentalAgreementStatus" AS ENUM ('DRAFT', 'AWAITING_SIGNATURE', 'AWAITING_PAYMENT', 'AWAITING_DISPATCH', 'DISPATCHED', 'ON_HIRE', 'EXTENSION_REQUESTED', 'OVERDUE', 'RETURN_INSPECTION', 'RECONCILIATION', 'COMPLETED', 'CANCELLED');

-- CreateEnum
CREATE TYPE "lashibi"."DriverAssignmentStatus" AS ENUM ('ASSIGNED', 'ACCEPTED', 'ACTIVE', 'COMPLETED', 'REPLACED', 'CANCELLED');

-- CreateEnum
CREATE TYPE "lashibi"."RentalExtensionStatus" AS ENUM ('REQUESTED', 'APPROVED', 'REJECTED', 'CANCELLED');

-- CreateEnum
CREATE TYPE "lashibi"."RentalChargeType" AS ENUM ('BASE_RENTAL', 'DRIVER', 'DELIVERY', 'PICKUP', 'INSURANCE', 'FUEL', 'EXCESS_MILEAGE', 'DAMAGE', 'FINE', 'TOLL', 'CLEANING', 'LATE_RETURN', 'EXTENSION', 'DISCOUNT', 'TAX', 'OTHER');

-- CreateEnum
CREATE TYPE "lashibi"."DepositStatus" AS ENUM ('REQUIRED', 'PENDING', 'HELD', 'PARTIALLY_RELEASED', 'RELEASED', 'FORFEITED', 'REFUNDED');

-- CreateEnum
CREATE TYPE "lashibi"."IncidentSeverity" AS ENUM ('LOW', 'MEDIUM', 'HIGH', 'CRITICAL');

-- CreateEnum
CREATE TYPE "lashibi"."IncidentStatus" AS ENUM ('OPEN', 'INVESTIGATING', 'INSURANCE', 'RESOLVED', 'CLOSED');

-- CreateEnum
CREATE TYPE "lashibi"."InspectionContext" AS ENUM ('RENTAL_PICKUP', 'RENTAL_RETURN', 'WORKSHOP_INTAKE', 'WORKSHOP_QC', 'FLEET_ROUTINE', 'SALES_ACQUISITION', 'SALES_HANDOVER', 'INSURANCE_ASSESSMENT');

-- CreateEnum
CREATE TYPE "lashibi"."InspectionStatus" AS ENUM ('DRAFT', 'IN_PROGRESS', 'COMPLETED', 'VERIFIED', 'VOIDED');

-- CreateEnum
CREATE TYPE "lashibi"."FindingStatus" AS ENUM ('PASS', 'FAIL', 'OBSERVATION', 'NOT_APPLICABLE');

-- CreateEnum
CREATE TYPE "lashibi"."DamageStatus" AS ENUM ('OBSERVED', 'PRE_EXISTING', 'NEW', 'DISPUTED', 'ASSESSED', 'REPAIRED', 'WAIVED', 'CLOSED');

-- CreateEnum
CREATE TYPE "lashibi"."TrackingDeviceStatus" AS ENUM ('PROVISIONED', 'ACTIVE', 'OFFLINE', 'SUSPENDED', 'RETIRED');

-- CreateEnum
CREATE TYPE "lashibi"."TelemetryAlertType" AS ENUM ('DEVICE_OFFLINE', 'GEOFENCE_ENTER', 'GEOFENCE_EXIT', 'SPEEDING', 'HARSH_BRAKING', 'HARSH_ACCELERATION', 'IGNITION_ANOMALY', 'LOW_BATTERY', 'ODOMETER_MISMATCH', 'SOS', 'TAMPER');

-- CreateEnum
CREATE TYPE "lashibi"."TelemetryAlertStatus" AS ENUM ('OPEN', 'ACKNOWLEDGED', 'RESOLVED', 'FALSE_POSITIVE');

-- CreateEnum
CREATE TYPE "lashibi"."TripStatus" AS ENUM ('PLANNED', 'ACTIVE', 'COMPLETED', 'CANCELLED');

-- CreateEnum
CREATE TYPE "lashibi"."WorkshopJobStatus" AS ENUM ('BOOKED', 'INTAKE', 'DIAGNOSIS', 'AWAITING_ESTIMATE_APPROVAL', 'AWAITING_PARTS', 'REPAIR', 'QC', 'READY_FOR_DELIVERY', 'COMPLETED', 'CANCELLED');

-- CreateEnum
CREATE TYPE "lashibi"."WorkshopItemType" AS ENUM ('LABOUR', 'PART', 'MATERIAL', 'FEE', 'DISCOUNT', 'TAX');

-- CreateEnum
CREATE TYPE "lashibi"."EstimateStatus" AS ENUM ('DRAFT', 'SENT', 'VIEWED', 'APPROVED', 'REJECTED', 'EXPIRED', 'SUPERSEDED');

-- CreateEnum
CREATE TYPE "lashibi"."StockMovementType" AS ENUM ('RECEIPT', 'ISSUE', 'TRANSFER_IN', 'TRANSFER_OUT', 'RETURN_IN', 'RETURN_OUT', 'ADJUSTMENT_IN', 'ADJUSTMENT_OUT', 'WRITE_OFF', 'RESERVATION', 'RELEASE');

-- CreateEnum
CREATE TYPE "lashibi"."PurchaseOrderStatus" AS ENUM ('DRAFT', 'PENDING_APPROVAL', 'APPROVED', 'ORDERED', 'PARTIALLY_RECEIVED', 'RECEIVED', 'CANCELLED');

-- CreateEnum
CREATE TYPE "lashibi"."GoodsReceiptStatus" AS ENUM ('DRAFT', 'POSTED', 'VOIDED');

-- CreateEnum
CREATE TYPE "lashibi"."SalesLeadStatus" AS ENUM ('NEW', 'QUALIFIED', 'TEST_DRIVE', 'NEGOTIATION', 'RESERVED', 'WON', 'LOST', 'DORMANT');

-- CreateEnum
CREATE TYPE "lashibi"."VehicleSaleStatus" AS ENUM ('DRAFT', 'RESERVED', 'AWAITING_PAYMENT', 'PAID', 'HANDOVER_PENDING', 'COMPLETED', 'CANCELLED');

-- CreateEnum
CREATE TYPE "lashibi"."InsurancePolicyStatus" AS ENUM ('ACTIVE', 'EXPIRING', 'EXPIRED', 'CANCELLED');

-- CreateEnum
CREATE TYPE "lashibi"."InsuranceClaimStatus" AS ENUM ('FNOL', 'DOCUMENTS_PENDING', 'ASSESSMENT', 'APPROVED', 'REPAIR', 'SETTLEMENT_PENDING', 'SETTLED', 'REJECTED', 'CLOSED');

-- CreateEnum
CREATE TYPE "lashibi"."InvoiceStatus" AS ENUM ('DRAFT', 'ISSUED', 'PARTIALLY_PAID', 'PAID', 'VOIDED', 'OVERDUE');

-- CreateEnum
CREATE TYPE "lashibi"."InvoiceSourceType" AS ENUM ('RENTAL', 'WORKSHOP', 'VEHICLE_SALE', 'PARTS', 'INSURANCE', 'OTHER');

-- CreateEnum
CREATE TYPE "lashibi"."PaymentMethod" AS ENUM ('MOBILE_MONEY', 'CARD', 'BANK_TRANSFER', 'CASH', 'CHEQUE', 'WALLET', 'OTHER');

-- CreateEnum
CREATE TYPE "lashibi"."PaymentStatus" AS ENUM ('PENDING', 'AUTHORIZED', 'SUCCEEDED', 'FAILED', 'REVERSED', 'REFUNDED');

-- CreateEnum
CREATE TYPE "lashibi"."RefundStatus" AS ENUM ('REQUESTED', 'APPROVAL_REQUIRED', 'APPROVED', 'PROCESSING', 'SUCCEEDED', 'FAILED', 'CANCELLED');

-- CreateEnum
CREATE TYPE "lashibi"."TaxSubmissionStatus" AS ENUM ('NOT_REQUIRED', 'QUEUED', 'SUBMITTED', 'ACCEPTED', 'REJECTED', 'RETRY');

-- CreateEnum
CREATE TYPE "lashibi"."CommunicationChannel" AS ENUM ('WHATSAPP', 'SMS', 'EMAIL', 'PUSH', 'PHONE', 'IN_APP');

-- CreateEnum
CREATE TYPE "lashibi"."CommunicationDirection" AS ENUM ('INBOUND', 'OUTBOUND');

-- CreateEnum
CREATE TYPE "lashibi"."AiRunStatus" AS ENUM ('QUEUED', 'RUNNING', 'COMPLETED', 'FAILED', 'REJECTED_BY_POLICY');

-- CreateTable
CREATE TABLE "lashibi"."CountryPack" (
    "code" VARCHAR(2) NOT NULL,
    "name" TEXT NOT NULL,
    "currencyCode" VARCHAR(3) NOT NULL,
    "defaultTimezone" TEXT NOT NULL,
    "locale" TEXT NOT NULL,
    "config" JSONB NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "CountryPack_pkey" PRIMARY KEY ("code")
);

-- CreateTable
CREATE TABLE "lashibi"."TaxRule" (
    "id" TEXT NOT NULL,
    "countryPackCode" VARCHAR(2) NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "rate" DECIMAL(9,6) NOT NULL,
    "compoundOrder" INTEGER NOT NULL DEFAULT 0,
    "effectiveFrom" TIMESTAMPTZ(3) NOT NULL,
    "effectiveTo" TIMESTAMPTZ(3),
    "active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "TaxRule_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."Tenant" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "status" "lashibi"."TenantStatus" NOT NULL DEFAULT 'ACTIVE',
    "countryPackCode" VARCHAR(2) NOT NULL DEFAULT 'GH',
    "timezone" TEXT NOT NULL DEFAULT 'Africa/Accra',
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,
    "archivedAt" TIMESTAMPTZ(3),

    CONSTRAINT "Tenant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."Branch" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" "lashibi"."BranchType" NOT NULL,
    "timezone" TEXT NOT NULL DEFAULT 'Africa/Accra',
    "active" BOOLEAN NOT NULL DEFAULT true,
    "address" JSONB,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "Branch_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."User" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "authUserId" UUID NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "status" "lashibi"."UserStatus" NOT NULL DEFAULT 'INVITED',
    "clearance" "lashibi"."Classification" NOT NULL DEFAULT 'INTERNAL',
    "primaryBranchId" TEXT,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,
    "archivedAt" TIMESTAMPTZ(3),

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."UserBranchMembership" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "branchId" TEXT NOT NULL,
    "isPrimary" BOOLEAN NOT NULL DEFAULT false,
    "startsAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "endsAt" TIMESTAMPTZ(3),

    CONSTRAINT "UserBranchMembership_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."RoleDefinition" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "builtIn" BOOLEAN NOT NULL DEFAULT false,
    "privileged" BOOLEAN NOT NULL DEFAULT false,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "RoleDefinition_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."Permission" (
    "id" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "domain" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "description" TEXT,
    "sensitive" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Permission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."RolePermission" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "roleId" TEXT NOT NULL,
    "permissionId" TEXT NOT NULL,
    "effect" "lashibi"."PermissionEffect" NOT NULL DEFAULT 'ALLOW',
    "condition" JSONB,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RolePermission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."UserRole" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "roleId" TEXT NOT NULL,
    "startsAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expiresAt" TIMESTAMPTZ(3),
    "grantedById" TEXT,
    "reason" TEXT,
    "active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "UserRole_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."ScopeGrant" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "userRoleId" TEXT NOT NULL,
    "scopeType" "lashibi"."ScopeType" NOT NULL,
    "branchId" TEXT,
    "resourceType" TEXT,
    "resourceId" TEXT,
    "corporateAccountId" TEXT,
    "condition" JSONB,
    "startsAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expiresAt" TIMESTAMPTZ(3),
    "active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "ScopeGrant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."SoDPolicy" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "permissionAId" TEXT NOT NULL,
    "permissionBId" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "makerChecker" BOOLEAN NOT NULL DEFAULT true,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SoDPolicy_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."ApprovalPolicy" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "actionPattern" TEXT NOT NULL,
    "resourceType" TEXT,
    "minimumApprovals" INTEGER NOT NULL DEFAULT 1,
    "makerCheckerRequired" BOOLEAN NOT NULL DEFAULT true,
    "stepUpRequired" BOOLEAN NOT NULL DEFAULT false,
    "approverPermission" TEXT NOT NULL,
    "amountThreshold" DECIMAL(18,2),
    "classificationFloor" "lashibi"."Classification",
    "active" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "ApprovalPolicy_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."ApprovalRequest" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "policyCode" TEXT,
    "action" TEXT NOT NULL,
    "resourceType" TEXT,
    "resourceId" TEXT,
    "classification" "lashibi"."Classification" NOT NULL DEFAULT 'RESTRICTED',
    "requestedById" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "payload" JSONB,
    "status" "lashibi"."ApprovalStatus" NOT NULL DEFAULT 'PENDING',
    "requiredApprovals" INTEGER NOT NULL DEFAULT 1,
    "expiresAt" TIMESTAMPTZ(3),
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "ApprovalRequest_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."ApprovalDecision" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "approvalRequestId" TEXT NOT NULL,
    "approverId" TEXT NOT NULL,
    "decision" "lashibi"."ApprovalDecisionType" NOT NULL,
    "reason" TEXT,
    "stepUpSessionId" TEXT,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ApprovalDecision_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."TemporaryAccessGrant" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "permissionId" TEXT NOT NULL,
    "scopeType" "lashibi"."ScopeType" NOT NULL,
    "branchId" TEXT,
    "resourceType" TEXT,
    "resourceId" TEXT,
    "approvalRequestId" TEXT,
    "status" "lashibi"."TemporaryGrantStatus" NOT NULL DEFAULT 'PENDING',
    "startsAt" TIMESTAMPTZ(3) NOT NULL,
    "expiresAt" TIMESTAMPTZ(3) NOT NULL,
    "revokedAt" TIMESTAMPTZ(3),
    "reason" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TemporaryAccessGrant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."BreakGlassSession" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "scope" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "status" "lashibi"."BreakGlassStatus" NOT NULL DEFAULT 'REQUESTED',
    "startedAt" TIMESTAMPTZ(3),
    "expiresAt" TIMESTAMPTZ(3),
    "endedAt" TIMESTAMPTZ(3),
    "retrospectiveReview" TEXT,
    "reviewedById" TEXT,
    "reviewedAt" TIMESTAMPTZ(3),
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "BreakGlassSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."DeviceRegistration" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "deviceKey" TEXT NOT NULL,
    "label" TEXT,
    "platform" TEXT,
    "trustStatus" "lashibi"."DeviceTrustStatus" NOT NULL DEFAULT 'UNKNOWN',
    "firstSeenAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "lastSeenAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "revokedAt" TIMESTAMPTZ(3),
    "metadata" JSONB,

    CONSTRAINT "DeviceRegistration_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."SecuritySession" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "deviceId" TEXT,
    "status" "lashibi"."SessionStatus" NOT NULL DEFAULT 'ACTIVE',
    "authLevel" INTEGER NOT NULL DEFAULT 1,
    "mfaSatisfied" BOOLEAN NOT NULL DEFAULT false,
    "riskScore" INTEGER NOT NULL DEFAULT 0,
    "issuedAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "lastSeenAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "idleExpiresAt" TIMESTAMPTZ(3) NOT NULL,
    "absoluteExpiresAt" TIMESTAMPTZ(3) NOT NULL,
    "stepUpExpiresAt" TIMESTAMPTZ(3),
    "revokedAt" TIMESTAMPTZ(3),
    "revokeReason" TEXT,
    "ipAddress" TEXT,
    "userAgent" TEXT,
    "context" JSONB,

    CONSTRAINT "SecuritySession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."AuthenticationEvent" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "userId" TEXT,
    "sessionId" TEXT,
    "eventType" "lashibi"."AuthEventType" NOT NULL,
    "result" TEXT,
    "reason" TEXT,
    "authLevel" INTEGER,
    "riskScore" INTEGER,
    "deviceKey" TEXT,
    "ipAddress" TEXT,
    "userAgent" TEXT,
    "context" JSONB,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AuthenticationEvent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."AuthDecision" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "principalType" "lashibi"."PrincipalType" NOT NULL,
    "principalId" TEXT NOT NULL,
    "principalSnapshot" JSONB,
    "sessionId" TEXT,
    "requestId" TEXT,
    "correlationId" TEXT,
    "roleSnapshot" JSONB,
    "scopeSnapshot" JSONB,
    "action" TEXT NOT NULL,
    "resourceType" TEXT,
    "resourceId" TEXT,
    "resourceTenantId" TEXT,
    "resourceBranchId" TEXT,
    "classification" "lashibi"."Classification",
    "policyVersion" TEXT NOT NULL,
    "result" "lashibi"."AuthDecisionResult" NOT NULL,
    "reasonCode" TEXT,
    "reason" TEXT NOT NULL,
    "context" JSONB,
    "ipAddress" TEXT,
    "deviceId" TEXT,
    "userAgent" TEXT,
    "integrityHash" TEXT,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AuthDecision_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."AuditEvent" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "actorType" "lashibi"."PrincipalType" NOT NULL,
    "actorId" TEXT,
    "actorSnapshot" JSONB,
    "sessionId" TEXT,
    "requestId" TEXT,
    "correlationId" TEXT,
    "action" TEXT NOT NULL,
    "entityType" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "branchId" TEXT,
    "classification" "lashibi"."Classification" NOT NULL DEFAULT 'INTERNAL',
    "before" JSONB,
    "after" JSONB,
    "metadata" JSONB,
    "previousHash" TEXT,
    "integrityHash" TEXT,
    "occurredAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AuditEvent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."EmployeeProfile" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "employeeNumber" TEXT NOT NULL,
    "branchId" TEXT NOT NULL,
    "jobTitle" TEXT NOT NULL,
    "employmentStatus" "lashibi"."EmploymentStatus" NOT NULL DEFAULT 'ACTIVE',
    "hireDate" DATE,
    "phone" TEXT,
    "emergencyContact" JSONB,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "EmployeeProfile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."DriverProfile" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "employeeProfileId" TEXT NOT NULL,
    "licenceNumber" TEXT NOT NULL,
    "licenceClass" TEXT NOT NULL,
    "licenceIssuedAt" DATE,
    "licenceExpiry" DATE NOT NULL,
    "availability" "lashibi"."DriverAvailabilityStatus" NOT NULL DEFAULT 'AVAILABLE',
    "safetyScore" INTEGER NOT NULL DEFAULT 100,
    "customerRating" DECIMAL(3,2),
    "classification" "lashibi"."Classification" NOT NULL DEFAULT 'CONFIDENTIAL',
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "DriverProfile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."DriverShift" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "driverId" TEXT NOT NULL,
    "branchId" TEXT NOT NULL,
    "startsAt" TIMESTAMPTZ(3) NOT NULL,
    "endsAt" TIMESTAMPTZ(3),
    "checkInAt" TIMESTAMPTZ(3),
    "checkOutAt" TIMESTAMPTZ(3),
    "notes" TEXT,

    CONSTRAINT "DriverShift_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."TechnicianProfile" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "employeeProfileId" TEXT NOT NULL,
    "skillTags" TEXT[],
    "availability" "lashibi"."TechnicianAvailabilityStatus" NOT NULL DEFAULT 'AVAILABLE',
    "certificationData" JSONB,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "TechnicianProfile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."FileAsset" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "storageProvider" TEXT NOT NULL,
    "bucket" TEXT NOT NULL,
    "objectKey" TEXT NOT NULL,
    "originalName" TEXT,
    "mimeType" TEXT NOT NULL,
    "sizeBytes" BIGINT NOT NULL,
    "sha256" TEXT NOT NULL,
    "classification" "lashibi"."Classification" NOT NULL DEFAULT 'INTERNAL',
    "uploadedById" TEXT,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "FileAsset_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."Customer" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "customerNumber" TEXT NOT NULL,
    "type" "lashibi"."CustomerType" NOT NULL,
    "status" "lashibi"."CustomerStatus" NOT NULL DEFAULT 'PROSPECT',
    "displayName" TEXT NOT NULL,
    "primaryPhone" TEXT,
    "primaryEmail" TEXT,
    "classification" "lashibi"."Classification" NOT NULL DEFAULT 'CONFIDENTIAL',
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,
    "archivedAt" TIMESTAMPTZ(3),

    CONSTRAINT "Customer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."CustomerContact" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "kind" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "label" TEXT,
    "primary" BOOLEAN NOT NULL DEFAULT false,
    "verifiedAt" TIMESTAMPTZ(3),
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CustomerContact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."CustomerIdentity" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "type" "lashibi"."IdentityType" NOT NULL,
    "identifierCiphertext" TEXT,
    "identifierHash" TEXT NOT NULL,
    "identifierLast4" TEXT,
    "issuingCountry" VARCHAR(2),
    "issuedAt" DATE,
    "expiresAt" DATE,
    "verifiedAt" TIMESTAMPTZ(3),
    "classification" "lashibi"."Classification" NOT NULL DEFAULT 'RESTRICTED',
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CustomerIdentity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."CustomerDocument" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "fileAssetId" TEXT NOT NULL,
    "type" "lashibi"."IdentityType",
    "title" TEXT NOT NULL,
    "classification" "lashibi"."Classification" NOT NULL DEFAULT 'RESTRICTED',
    "validFrom" DATE,
    "validTo" DATE,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CustomerDocument_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."CustomerConsent" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "type" "lashibi"."ConsentType" NOT NULL,
    "version" TEXT NOT NULL,
    "granted" BOOLEAN NOT NULL,
    "capturedAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "withdrawnAt" TIMESTAMPTZ(3),
    "evidence" JSONB,

    CONSTRAINT "CustomerConsent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."CorporateAccount" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "legalName" TEXT NOT NULL,
    "tinHash" TEXT,
    "registrationNo" TEXT,
    "creditLimit" DECIMAL(18,2),
    "paymentTermsDays" INTEGER,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "CorporateAccount_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."Vehicle" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "homeBranchId" TEXT NOT NULL,
    "fleetNumber" TEXT NOT NULL,
    "vin" TEXT,
    "chassisNumber" TEXT,
    "engineNumber" TEXT,
    "currentPlateNumber" TEXT,
    "make" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "trim" TEXT,
    "year" INTEGER NOT NULL,
    "colour" TEXT,
    "fuelType" "lashibi"."FuelType",
    "transmission" "lashibi"."TransmissionType",
    "bodyType" TEXT,
    "seatCount" INTEGER,
    "vehicleClass" TEXT,
    "ownershipType" "lashibi"."VehicleOwnershipType" NOT NULL DEFAULT 'OWNED',
    "status" "lashibi"."VehicleStatus" NOT NULL DEFAULT 'ONBOARDING',
    "currentOdometer" INTEGER NOT NULL DEFAULT 0,
    "acquisitionDate" DATE,
    "acquisitionCost" DECIMAL(18,2),
    "rentalEligible" BOOLEAN NOT NULL DEFAULT false,
    "salesEligible" BOOLEAN NOT NULL DEFAULT false,
    "classification" "lashibi"."Classification" NOT NULL DEFAULT 'INTERNAL',
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,
    "archivedAt" TIMESTAMPTZ(3),

    CONSTRAINT "Vehicle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."VehicleRegistration" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "vehicleId" TEXT NOT NULL,
    "plateNumber" TEXT NOT NULL,
    "countryCode" VARCHAR(2) NOT NULL,
    "validFrom" DATE NOT NULL,
    "validTo" DATE,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "VehicleRegistration_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."VehicleDocument" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "vehicleId" TEXT NOT NULL,
    "fileAssetId" TEXT NOT NULL,
    "type" "lashibi"."VehicleDocumentType" NOT NULL,
    "documentNumber" TEXT,
    "validFrom" DATE,
    "validTo" DATE,
    "classification" "lashibi"."Classification" NOT NULL DEFAULT 'RESTRICTED',
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "VehicleDocument_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."VehiclePassport" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "vehicleId" TEXT NOT NULL,
    "trustScore" INTEGER NOT NULL DEFAULT 0,
    "healthScore" INTEGER NOT NULL DEFAULT 0,
    "verifiedRecords" INTEGER NOT NULL DEFAULT 0,
    "classification" "lashibi"."Classification" NOT NULL DEFAULT 'RESTRICTED',
    "issuedAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "VehiclePassport_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."OdometerReading" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "vehicleId" TEXT NOT NULL,
    "readingKm" INTEGER NOT NULL,
    "source" "lashibi"."OdometerSource" NOT NULL,
    "rentalAgreementId" TEXT,
    "inspectionId" TEXT,
    "workshopJobId" TEXT,
    "capturedById" TEXT,
    "capturedAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "evidenceFileId" TEXT,
    "verifiedAt" TIMESTAMPTZ(3),
    "correctionOfId" TEXT,
    "reason" TEXT,
    "classification" "lashibi"."Classification" NOT NULL DEFAULT 'RESTRICTED',
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "OdometerReading_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."VehicleMaintenancePlan" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "vehicleId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "intervalKm" INTEGER,
    "intervalDays" INTEGER,
    "nextDueKm" INTEGER,
    "nextDueAt" DATE,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "VehicleMaintenancePlan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."TrackingDevice" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "provider" TEXT NOT NULL,
    "externalDeviceId" TEXT NOT NULL,
    "imeiHash" TEXT,
    "serialNumber" TEXT,
    "status" "lashibi"."TrackingDeviceStatus" NOT NULL DEFAULT 'PROVISIONED',
    "installedAt" TIMESTAMPTZ(3),
    "lastSeenAt" TIMESTAMPTZ(3),
    "classification" "lashibi"."Classification" NOT NULL DEFAULT 'RESTRICTED',
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TrackingDevice_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."VehicleDeviceAssignment" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "vehicleId" TEXT NOT NULL,
    "deviceId" TEXT NOT NULL,
    "startsAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "endsAt" TIMESTAMPTZ(3),
    "active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "VehicleDeviceAssignment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."TelemetryReading" (
    "id" BIGSERIAL NOT NULL,
    "tenantId" TEXT NOT NULL,
    "vehicleId" TEXT NOT NULL,
    "deviceId" TEXT NOT NULL,
    "capturedAt" TIMESTAMPTZ(3) NOT NULL,
    "receivedAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "latitude" DECIMAL(9,6),
    "longitude" DECIMAL(9,6),
    "speedKph" DECIMAL(7,2),
    "headingDegrees" DECIMAL(6,2),
    "altitudeMeters" DECIMAL(9,2),
    "ignitionOn" BOOLEAN,
    "fuelPercent" DECIMAL(5,2),
    "batteryVolts" DECIMAL(6,2),
    "odometerKm" DECIMAL(12,2),
    "engineMinutes" INTEGER,
    "signalQuality" INTEGER,
    "rawPayload" JSONB,
    "classification" "lashibi"."Classification" NOT NULL DEFAULT 'RESTRICTED',

    CONSTRAINT "TelemetryReading_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."VehicleTrip" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "vehicleId" TEXT NOT NULL,
    "rentalAgreementId" TEXT,
    "driverId" TEXT,
    "status" "lashibi"."TripStatus" NOT NULL DEFAULT 'PLANNED',
    "startedAt" TIMESTAMPTZ(3),
    "endedAt" TIMESTAMPTZ(3),
    "startOdometerKm" DECIMAL(12,2),
    "endOdometerKm" DECIMAL(12,2),
    "distanceKm" DECIMAL(12,2),
    "maxSpeedKph" DECIMAL(7,2),
    "routeSummary" JSONB,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "VehicleTrip_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."TripEvent" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "tripId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "occurredAt" TIMESTAMPTZ(3) NOT NULL,
    "latitude" DECIMAL(9,6),
    "longitude" DECIMAL(9,6),
    "value" JSONB,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TripEvent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."Geofence" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "branchId" TEXT,
    "geometry" JSONB NOT NULL,
    "classification" "lashibi"."Classification" NOT NULL DEFAULT 'RESTRICTED',
    "active" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "Geofence_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."VehicleGeofenceAssignment" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "vehicleId" TEXT NOT NULL,
    "geofenceId" TEXT NOT NULL,
    "startsAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "endsAt" TIMESTAMPTZ(3),
    "active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "VehicleGeofenceAssignment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."GeofenceEvent" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "geofenceId" TEXT NOT NULL,
    "vehicleId" TEXT NOT NULL,
    "eventType" "lashibi"."TelemetryAlertType" NOT NULL,
    "occurredAt" TIMESTAMPTZ(3) NOT NULL,
    "latitude" DECIMAL(9,6),
    "longitude" DECIMAL(9,6),
    "telemetryId" BIGINT,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "GeofenceEvent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."TelemetryAlert" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "vehicleId" TEXT NOT NULL,
    "type" "lashibi"."TelemetryAlertType" NOT NULL,
    "status" "lashibi"."TelemetryAlertStatus" NOT NULL DEFAULT 'OPEN',
    "severity" "lashibi"."IncidentSeverity" NOT NULL DEFAULT 'MEDIUM',
    "openedAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "acknowledgedAt" TIMESTAMPTZ(3),
    "resolvedAt" TIMESTAMPTZ(3),
    "details" JSONB,
    "classification" "lashibi"."Classification" NOT NULL DEFAULT 'RESTRICTED',

    CONSTRAINT "TelemetryAlert_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."RentalReservation" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "branchId" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "reservationCode" TEXT NOT NULL,
    "rentalType" "lashibi"."RentalType" NOT NULL,
    "status" "lashibi"."ReservationStatus" NOT NULL DEFAULT 'DRAFT',
    "pickupLocation" JSONB,
    "returnLocation" JSONB,
    "scheduledPickupAt" TIMESTAMPTZ(3) NOT NULL,
    "scheduledReturnAt" TIMESTAMPTZ(3) NOT NULL,
    "requestedVehicleClass" TEXT,
    "requestedDriver" BOOLEAN NOT NULL DEFAULT false,
    "currencyCode" VARCHAR(3) NOT NULL DEFAULT 'GHS',
    "quotedAmount" DECIMAL(18,2),
    "createdById" TEXT NOT NULL,
    "classification" "lashibi"."Classification" NOT NULL DEFAULT 'RESTRICTED',
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,
    "cancelledAt" TIMESTAMPTZ(3),

    CONSTRAINT "RentalReservation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."RentalVehicleAllocation" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "reservationId" TEXT NOT NULL,
    "vehicleId" TEXT NOT NULL,
    "status" "lashibi"."VehicleAllocationStatus" NOT NULL DEFAULT 'HELD',
    "allocatedFrom" TIMESTAMPTZ(3) NOT NULL,
    "allocatedUntil" TIMESTAMPTZ(3) NOT NULL,
    "assignedById" TEXT NOT NULL,
    "reason" TEXT,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "releasedAt" TIMESTAMPTZ(3),

    CONSTRAINT "RentalVehicleAllocation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."RentalAgreement" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "reservationId" TEXT NOT NULL,
    "branchId" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "vehicleId" TEXT NOT NULL,
    "handledById" TEXT NOT NULL,
    "agreementCode" TEXT NOT NULL,
    "rentalType" "lashibi"."RentalType" NOT NULL,
    "status" "lashibi"."RentalAgreementStatus" NOT NULL DEFAULT 'DRAFT',
    "renterNameSnapshot" TEXT NOT NULL,
    "renterPhoneSnapshot" TEXT,
    "scheduledPickupAt" TIMESTAMPTZ(3) NOT NULL,
    "actualPickupAt" TIMESTAMPTZ(3),
    "dueReturnAt" TIMESTAMPTZ(3) NOT NULL,
    "actualReturnAt" TIMESTAMPTZ(3),
    "currencyCode" VARCHAR(3) NOT NULL DEFAULT 'GHS',
    "baseDailyRate" DECIMAL(18,2) NOT NULL,
    "agreedDays" INTEGER NOT NULL,
    "includedKmTotal" INTEGER,
    "excessKmRate" DECIMAL(18,2),
    "driverDailyRate" DECIMAL(18,2),
    "deliveryCharge" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "insuranceCharge" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "discountAmount" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "taxAmount" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "depositRequired" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "grossAmount" DECIMAL(18,2) NOT NULL,
    "classification" "lashibi"."Classification" NOT NULL DEFAULT 'RESTRICTED',
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "RentalAgreement_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."RentalDriverAssignment" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "rentalAgreementId" TEXT NOT NULL,
    "driverId" TEXT NOT NULL,
    "assignedById" TEXT NOT NULL,
    "status" "lashibi"."DriverAssignmentStatus" NOT NULL DEFAULT 'ASSIGNED',
    "assignedAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "acceptedAt" TIMESTAMPTZ(3),
    "startedAt" TIMESTAMPTZ(3),
    "endedAt" TIMESTAMPTZ(3),
    "reason" TEXT,

    CONSTRAINT "RentalDriverAssignment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."RentalExtension" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "rentalAgreementId" TEXT NOT NULL,
    "status" "lashibi"."RentalExtensionStatus" NOT NULL DEFAULT 'REQUESTED',
    "oldDueReturnAt" TIMESTAMPTZ(3) NOT NULL,
    "requestedReturnAt" TIMESTAMPTZ(3) NOT NULL,
    "approvedReturnAt" TIMESTAMPTZ(3),
    "requestedByType" "lashibi"."PrincipalType" NOT NULL,
    "requestedById" TEXT,
    "additionalCharge" DECIMAL(18,2),
    "approvalRequestId" TEXT,
    "reason" TEXT,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "RentalExtension_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."RentalCharge" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "rentalAgreementId" TEXT NOT NULL,
    "type" "lashibi"."RentalChargeType" NOT NULL,
    "description" TEXT NOT NULL,
    "quantity" DECIMAL(12,3) NOT NULL DEFAULT 1,
    "unitAmount" DECIMAL(18,2) NOT NULL,
    "amount" DECIMAL(18,2) NOT NULL,
    "taxable" BOOLEAN NOT NULL DEFAULT true,
    "sourceType" TEXT,
    "sourceId" TEXT,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "reversedAt" TIMESTAMPTZ(3),

    CONSTRAINT "RentalCharge_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."RentalDeposit" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "rentalAgreementId" TEXT NOT NULL,
    "status" "lashibi"."DepositStatus" NOT NULL DEFAULT 'REQUIRED',
    "requiredAmount" DECIMAL(18,2) NOT NULL,
    "heldAmount" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "releasedAmount" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "forfeitedAmount" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "paymentId" TEXT,
    "refundId" TEXT,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "RentalDeposit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."RentalIncident" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "rentalAgreementId" TEXT NOT NULL,
    "severity" "lashibi"."IncidentSeverity" NOT NULL,
    "status" "lashibi"."IncidentStatus" NOT NULL DEFAULT 'OPEN',
    "type" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "occurredAt" TIMESTAMPTZ(3) NOT NULL,
    "latitude" DECIMAL(9,6),
    "longitude" DECIMAL(9,6),
    "policeReference" TEXT,
    "insuranceClaimId" TEXT,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "RentalIncident_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."RentalFine" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "rentalAgreementId" TEXT NOT NULL,
    "authority" TEXT,
    "reference" TEXT,
    "description" TEXT NOT NULL,
    "occurredAt" TIMESTAMPTZ(3),
    "amount" DECIMAL(18,2) NOT NULL,
    "customerLiable" BOOLEAN NOT NULL DEFAULT true,
    "recovered" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RentalFine_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."RentalToll" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "rentalAgreementId" TEXT NOT NULL,
    "tollPoint" TEXT,
    "occurredAt" TIMESTAMPTZ(3) NOT NULL,
    "amount" DECIMAL(18,2) NOT NULL,
    "recovered" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RentalToll_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."RentalReturnReconciliation" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "rentalAgreementId" TEXT NOT NULL,
    "openingOdometerKm" INTEGER NOT NULL,
    "closingOdometerKm" INTEGER NOT NULL,
    "includedKm" INTEGER,
    "excessKm" INTEGER NOT NULL DEFAULT 0,
    "excessKmCharge" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "openingFuelPercent" DECIMAL(5,2),
    "closingFuelPercent" DECIMAL(5,2),
    "fuelCharge" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "damageCharge" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "finesAndTolls" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "otherCharges" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "depositReleased" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "finalAmount" DECIMAL(18,2) NOT NULL,
    "approvalRequestId" TEXT,
    "completedById" TEXT NOT NULL,
    "completedAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RentalReturnReconciliation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."InspectionTemplate" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "context" "lashibi"."InspectionContext" NOT NULL,
    "version" INTEGER NOT NULL DEFAULT 1,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "InspectionTemplate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."InspectionTemplateItem" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "templateId" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "label" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "required" BOOLEAN NOT NULL DEFAULT true,
    "sortOrder" INTEGER NOT NULL,
    "config" JSONB,

    CONSTRAINT "InspectionTemplateItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."VehicleInspection" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "vehicleId" TEXT NOT NULL,
    "templateId" TEXT NOT NULL,
    "context" "lashibi"."InspectionContext" NOT NULL,
    "status" "lashibi"."InspectionStatus" NOT NULL DEFAULT 'DRAFT',
    "rentalAgreementId" TEXT,
    "workshopJobId" TEXT,
    "vehicleSaleId" TEXT,
    "performedById" TEXT NOT NULL,
    "startedAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "completedAt" TIMESTAMPTZ(3),
    "odometerKm" INTEGER,
    "fuelPercent" DECIMAL(5,2),
    "latitude" DECIMAL(9,6),
    "longitude" DECIMAL(9,6),
    "customerSignature" JSONB,
    "classification" "lashibi"."Classification" NOT NULL DEFAULT 'RESTRICTED',

    CONSTRAINT "VehicleInspection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."InspectionFinding" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "inspectionId" TEXT NOT NULL,
    "templateItemId" TEXT NOT NULL,
    "status" "lashibi"."FindingStatus" NOT NULL,
    "value" JSONB,
    "notes" TEXT,
    "severity" "lashibi"."IncidentSeverity",
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "InspectionFinding_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."InspectionMedia" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "inspectionId" TEXT NOT NULL,
    "fileAssetId" TEXT NOT NULL,
    "category" TEXT,
    "capturedAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "metadata" JSONB,

    CONSTRAINT "InspectionMedia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."DamageRecord" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "vehicleId" TEXT NOT NULL,
    "inspectionId" TEXT,
    "position" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "description" TEXT,
    "severity" "lashibi"."IncidentSeverity" NOT NULL,
    "status" "lashibi"."DamageStatus" NOT NULL DEFAULT 'OBSERVED',
    "firstObservedAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "repairedAt" TIMESTAMPTZ(3),
    "classification" "lashibi"."Classification" NOT NULL DEFAULT 'RESTRICTED',

    CONSTRAINT "DamageRecord_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."DamageAssessment" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "damageRecordId" TEXT NOT NULL,
    "assessedById" TEXT NOT NULL,
    "repairEstimate" DECIMAL(18,2),
    "customerCharge" DECIMAL(18,2),
    "insurerCharge" DECIMAL(18,2),
    "notes" TEXT,
    "approvalRequestId" TEXT,
    "assessedAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DamageAssessment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."WorkBay" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "branchId" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "bayType" TEXT NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "WorkBay_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."WorkshopJob" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "branchId" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "vehicleId" TEXT NOT NULL,
    "bayId" TEXT,
    "jobCode" TEXT NOT NULL,
    "status" "lashibi"."WorkshopJobStatus" NOT NULL DEFAULT 'BOOKED',
    "complaint" TEXT NOT NULL,
    "diagnosis" TEXT,
    "intakeOdometerKm" INTEGER,
    "promisedAt" TIMESTAMPTZ(3),
    "openedById" TEXT NOT NULL,
    "openedAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "closedAt" TIMESTAMPTZ(3),
    "classification" "lashibi"."Classification" NOT NULL DEFAULT 'CONFIDENTIAL',

    CONSTRAINT "WorkshopJob_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."WorkshopAssignment" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "workshopJobId" TEXT NOT NULL,
    "technicianId" TEXT NOT NULL,
    "assignedById" TEXT NOT NULL,
    "assignedAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "startedAt" TIMESTAMPTZ(3),
    "completedAt" TIMESTAMPTZ(3),
    "labourMinutes" INTEGER,

    CONSTRAINT "WorkshopAssignment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."WorkshopEstimate" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "workshopJobId" TEXT NOT NULL,
    "version" INTEGER NOT NULL DEFAULT 1,
    "status" "lashibi"."EstimateStatus" NOT NULL DEFAULT 'DRAFT',
    "currencyCode" VARCHAR(3) NOT NULL DEFAULT 'GHS',
    "subtotal" DECIMAL(18,2) NOT NULL,
    "taxAmount" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "discountAmount" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "totalAmount" DECIMAL(18,2) NOT NULL,
    "sentAt" TIMESTAMPTZ(3),
    "approvedAt" TIMESTAMPTZ(3),
    "approvalEvidence" JSONB,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkshopEstimate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."WorkshopEstimateLine" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "estimateId" TEXT NOT NULL,
    "type" "lashibi"."WorkshopItemType" NOT NULL,
    "description" TEXT NOT NULL,
    "partId" TEXT,
    "quantity" DECIMAL(12,3) NOT NULL DEFAULT 1,
    "unitPrice" DECIMAL(18,2) NOT NULL,
    "amount" DECIMAL(18,2) NOT NULL,
    "sortOrder" INTEGER NOT NULL,

    CONSTRAINT "WorkshopEstimateLine_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."WorkshopJobItem" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "workshopJobId" TEXT NOT NULL,
    "type" "lashibi"."WorkshopItemType" NOT NULL,
    "description" TEXT NOT NULL,
    "partId" TEXT,
    "quantity" DECIMAL(12,3) NOT NULL DEFAULT 1,
    "unitCost" DECIMAL(18,2),
    "unitPrice" DECIMAL(18,2) NOT NULL,
    "amount" DECIMAL(18,2) NOT NULL,
    "postedAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkshopJobItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."Supplier" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "supplierCode" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "phone" TEXT,
    "email" TEXT,
    "tinHash" TEXT,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "Supplier_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."Part" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "sku" TEXT NOT NULL,
    "oemNumber" TEXT,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "unitOfMeasure" TEXT NOT NULL,
    "costPrice" DECIMAL(18,2),
    "sellingPrice" DECIMAL(18,2),
    "reorderLevel" DECIMAL(18,3),
    "classification" "lashibi"."Classification" NOT NULL DEFAULT 'INTERNAL',
    "active" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "Part_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."StockLocation" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "branchId" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "StockLocation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."StockBalance" (
    "tenantId" TEXT NOT NULL,
    "partId" TEXT NOT NULL,
    "locationId" TEXT NOT NULL,
    "onHand" DECIMAL(18,3) NOT NULL DEFAULT 0,
    "reserved" DECIMAL(18,3) NOT NULL DEFAULT 0,
    "available" DECIMAL(18,3) NOT NULL DEFAULT 0,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "StockBalance_pkey" PRIMARY KEY ("tenantId","partId","locationId")
);

-- CreateTable
CREATE TABLE "lashibi"."StockMovement" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "partId" TEXT NOT NULL,
    "locationId" TEXT NOT NULL,
    "type" "lashibi"."StockMovementType" NOT NULL,
    "quantity" DECIMAL(18,3) NOT NULL,
    "unitCost" DECIMAL(18,2),
    "sourceType" TEXT NOT NULL,
    "sourceId" TEXT NOT NULL,
    "performedById" TEXT NOT NULL,
    "approvalRequestId" TEXT,
    "occurredAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "metadata" JSONB,

    CONSTRAINT "StockMovement_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."PurchaseOrder" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "branchId" TEXT NOT NULL,
    "supplierId" TEXT NOT NULL,
    "poCode" TEXT NOT NULL,
    "status" "lashibi"."PurchaseOrderStatus" NOT NULL DEFAULT 'DRAFT',
    "currencyCode" VARCHAR(3) NOT NULL DEFAULT 'GHS',
    "subtotal" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "taxAmount" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "totalAmount" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "createdById" TEXT NOT NULL,
    "approvalRequestId" TEXT,
    "orderedAt" TIMESTAMPTZ(3),
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "PurchaseOrder_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."PurchaseOrderLine" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "purchaseOrderId" TEXT NOT NULL,
    "partId" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "quantity" DECIMAL(18,3) NOT NULL,
    "unitCost" DECIMAL(18,2) NOT NULL,
    "amount" DECIMAL(18,2) NOT NULL,

    CONSTRAINT "PurchaseOrderLine_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."GoodsReceipt" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "purchaseOrderId" TEXT NOT NULL,
    "receiptCode" TEXT NOT NULL,
    "status" "lashibi"."GoodsReceiptStatus" NOT NULL DEFAULT 'DRAFT',
    "receivedById" TEXT NOT NULL,
    "receivedAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "postedAt" TIMESTAMPTZ(3),

    CONSTRAINT "GoodsReceipt_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."GoodsReceiptLine" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "goodsReceiptId" TEXT NOT NULL,
    "purchaseOrderLineId" TEXT NOT NULL,
    "partId" TEXT NOT NULL,
    "quantityReceived" DECIMAL(18,3) NOT NULL,
    "quantityRejected" DECIMAL(18,3) NOT NULL DEFAULT 0,
    "notes" TEXT,

    CONSTRAINT "GoodsReceiptLine_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."VehicleSaleListing" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "vehicleId" TEXT NOT NULL,
    "listingCode" TEXT NOT NULL,
    "askingPrice" DECIMAL(18,2) NOT NULL,
    "currencyCode" VARCHAR(3) NOT NULL DEFAULT 'GHS',
    "published" BOOLEAN NOT NULL DEFAULT false,
    "publishedAt" TIMESTAMPTZ(3),
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "VehicleSaleListing_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."SalesLead" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "listingId" TEXT,
    "status" "lashibi"."SalesLeadStatus" NOT NULL DEFAULT 'NEW',
    "source" TEXT,
    "assignedToId" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "SalesLead_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."TestDrive" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "vehicleId" TEXT NOT NULL,
    "scheduledAt" TIMESTAMPTZ(3) NOT NULL,
    "startedAt" TIMESTAMPTZ(3),
    "endedAt" TIMESTAMPTZ(3),
    "supervisedById" TEXT,
    "outcome" TEXT,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TestDrive_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."VehicleSale" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "vehicleId" TEXT NOT NULL,
    "saleCode" TEXT NOT NULL,
    "status" "lashibi"."VehicleSaleStatus" NOT NULL DEFAULT 'DRAFT',
    "currencyCode" VARCHAR(3) NOT NULL DEFAULT 'GHS',
    "salePrice" DECIMAL(18,2) NOT NULL,
    "discountAmount" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "taxAmount" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "totalAmount" DECIMAL(18,2) NOT NULL,
    "handledById" TEXT NOT NULL,
    "reservedAt" TIMESTAMPTZ(3),
    "paidAt" TIMESTAMPTZ(3),
    "handedOverAt" TIMESTAMPTZ(3),
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "VehicleSale_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."InsurancePolicy" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "vehicleId" TEXT NOT NULL,
    "insurerName" TEXT NOT NULL,
    "policyNumber" TEXT NOT NULL,
    "policyType" TEXT NOT NULL,
    "status" "lashibi"."InsurancePolicyStatus" NOT NULL DEFAULT 'ACTIVE',
    "validFrom" DATE NOT NULL,
    "validTo" DATE NOT NULL,
    "premiumAmount" DECIMAL(18,2),
    "excessAmount" DECIMAL(18,2),
    "classification" "lashibi"."Classification" NOT NULL DEFAULT 'RESTRICTED',
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "InsurancePolicy_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."InsuranceClaim" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "vehicleId" TEXT NOT NULL,
    "policyId" TEXT,
    "claimCode" TEXT NOT NULL,
    "insurerClaimRef" TEXT,
    "status" "lashibi"."InsuranceClaimStatus" NOT NULL DEFAULT 'FNOL',
    "incidentAt" TIMESTAMPTZ(3) NOT NULL,
    "description" TEXT NOT NULL,
    "estimatedAmount" DECIMAL(18,2),
    "approvedAmount" DECIMAL(18,2),
    "settledAmount" DECIMAL(18,2),
    "classification" "lashibi"."Classification" NOT NULL DEFAULT 'RESTRICTED',
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "InsuranceClaim_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."ClaimAssessment" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "claimId" TEXT NOT NULL,
    "assessorName" TEXT NOT NULL,
    "assessedAt" TIMESTAMPTZ(3) NOT NULL,
    "assessedAmount" DECIMAL(18,2),
    "approvedAmount" DECIMAL(18,2),
    "findings" JSONB,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ClaimAssessment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."Invoice" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "invoiceNumber" TEXT NOT NULL,
    "sourceType" "lashibi"."InvoiceSourceType" NOT NULL,
    "sourceId" TEXT NOT NULL,
    "status" "lashibi"."InvoiceStatus" NOT NULL DEFAULT 'DRAFT',
    "currencyCode" VARCHAR(3) NOT NULL DEFAULT 'GHS',
    "subtotal" DECIMAL(18,2) NOT NULL,
    "taxAmount" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "discountAmount" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "totalAmount" DECIMAL(18,2) NOT NULL,
    "amountPaid" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "amountDue" DECIMAL(18,2) NOT NULL,
    "issuedAt" TIMESTAMPTZ(3),
    "dueAt" TIMESTAMPTZ(3),
    "classification" "lashibi"."Classification" NOT NULL DEFAULT 'CONFIDENTIAL',
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "Invoice_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."InvoiceLine" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "invoiceId" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "quantity" DECIMAL(12,3) NOT NULL DEFAULT 1,
    "unitPrice" DECIMAL(18,2) NOT NULL,
    "amount" DECIMAL(18,2) NOT NULL,
    "taxCode" TEXT,
    "taxRate" DECIMAL(9,6),
    "sourceLineType" TEXT,
    "sourceLineId" TEXT,

    CONSTRAINT "InvoiceLine_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."Payment" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "paymentCode" TEXT NOT NULL,
    "method" "lashibi"."PaymentMethod" NOT NULL,
    "status" "lashibi"."PaymentStatus" NOT NULL DEFAULT 'PENDING',
    "currencyCode" VARCHAR(3) NOT NULL DEFAULT 'GHS',
    "amount" DECIMAL(18,2) NOT NULL,
    "payerName" TEXT,
    "payerReference" TEXT,
    "provider" TEXT,
    "providerReference" TEXT,
    "receivedById" TEXT,
    "receivedAt" TIMESTAMPTZ(3),
    "classification" "lashibi"."Classification" NOT NULL DEFAULT 'CONFIDENTIAL',
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "Payment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."PaymentAllocation" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "paymentId" TEXT NOT NULL,
    "invoiceId" TEXT NOT NULL,
    "amount" DECIMAL(18,2) NOT NULL,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PaymentAllocation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."Refund" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "paymentId" TEXT NOT NULL,
    "refundCode" TEXT NOT NULL,
    "status" "lashibi"."RefundStatus" NOT NULL DEFAULT 'REQUESTED',
    "amount" DECIMAL(18,2) NOT NULL,
    "reason" TEXT NOT NULL,
    "requestedById" TEXT NOT NULL,
    "approvalRequestId" TEXT,
    "providerReference" TEXT,
    "processedAt" TIMESTAMPTZ(3),
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "Refund_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."PaymentProviderTransaction" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "paymentId" TEXT NOT NULL,
    "provider" TEXT NOT NULL,
    "transactionType" TEXT NOT NULL,
    "externalId" TEXT NOT NULL,
    "status" "lashibi"."PaymentStatus" NOT NULL,
    "amount" DECIMAL(18,2) NOT NULL,
    "requestPayload" JSONB,
    "responsePayload" JSONB,
    "occurredAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PaymentProviderTransaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."TaxSubmission" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "invoiceId" TEXT NOT NULL,
    "provider" TEXT NOT NULL DEFAULT 'GRA',
    "status" "lashibi"."TaxSubmissionStatus" NOT NULL DEFAULT 'QUEUED',
    "externalReference" TEXT,
    "requestHash" TEXT,
    "responseCode" TEXT,
    "responseSummary" TEXT,
    "attemptCount" INTEGER NOT NULL DEFAULT 0,
    "lastAttemptAt" TIMESTAMPTZ(3),
    "acceptedAt" TIMESTAMPTZ(3),
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TaxSubmission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."CommunicationLog" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "customerId" TEXT,
    "channel" "lashibi"."CommunicationChannel" NOT NULL,
    "direction" "lashibi"."CommunicationDirection" NOT NULL,
    "recipient" TEXT,
    "sender" TEXT,
    "templateCode" TEXT,
    "subject" TEXT,
    "contentSummary" TEXT,
    "provider" TEXT,
    "providerMessageId" TEXT,
    "status" TEXT NOT NULL,
    "sourceType" TEXT,
    "sourceId" TEXT,
    "classification" "lashibi"."Classification" NOT NULL DEFAULT 'CONFIDENTIAL',
    "occurredAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CommunicationLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."ApiClient" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "clientId" TEXT NOT NULL,
    "secretHashRef" TEXT,
    "scopes" TEXT[],
    "active" BOOLEAN NOT NULL DEFAULT true,
    "expiresAt" TIMESTAMPTZ(3),
    "lastUsedAt" TIMESTAMPTZ(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ApiClient_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."IntegrationConnection" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "provider" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "credentialRef" TEXT,
    "config" JSONB,
    "lastHealthAt" TIMESTAMPTZ(3),
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "IntegrationConnection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."WebhookEndpoint" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "integrationId" TEXT NOT NULL,
    "direction" TEXT NOT NULL,
    "eventPattern" TEXT NOT NULL,
    "endpointUrl" TEXT,
    "signingKeyRef" TEXT,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WebhookEndpoint_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."WebhookDelivery" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "endpointId" TEXT NOT NULL,
    "eventId" TEXT NOT NULL,
    "attempt" INTEGER NOT NULL DEFAULT 1,
    "signatureValid" BOOLEAN,
    "replayRejected" BOOLEAN NOT NULL DEFAULT false,
    "httpStatus" INTEGER,
    "responseSummary" TEXT,
    "sentAt" TIMESTAMPTZ(3),
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WebhookDelivery_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."AiRun" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "requestedById" TEXT NOT NULL,
    "purpose" TEXT NOT NULL,
    "sourceType" TEXT,
    "sourceId" TEXT,
    "provider" TEXT NOT NULL,
    "modelName" TEXT NOT NULL,
    "promptHash" TEXT,
    "inputClassification" "lashibi"."Classification" NOT NULL DEFAULT 'CONFIDENTIAL',
    "outputClassification" "lashibi"."Classification" NOT NULL DEFAULT 'CONFIDENTIAL',
    "status" "lashibi"."AiRunStatus" NOT NULL DEFAULT 'QUEUED',
    "policyDecisionId" TEXT,
    "resultSummary" TEXT,
    "confidence" DECIMAL(5,4),
    "humanReviewRequired" BOOLEAN NOT NULL DEFAULT false,
    "humanReviewedAt" TIMESTAMPTZ(3),
    "startedAt" TIMESTAMPTZ(3),
    "completedAt" TIMESTAMPTZ(3),
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AiRun_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lashibi"."AiFinding" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "aiRunId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "detail" TEXT,
    "severity" "lashibi"."IncidentSeverity",
    "confidence" DECIMAL(5,4),
    "evidence" JSONB,
    "accepted" BOOLEAN,
    "reviewedById" TEXT,
    "reviewedAt" TIMESTAMPTZ(3),
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AiFinding_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "TaxRule_countryPackCode_code_effectiveFrom_key" ON "lashibi"."TaxRule"("countryPackCode", "code", "effectiveFrom");

-- CreateIndex
CREATE UNIQUE INDEX "Tenant_slug_key" ON "lashibi"."Tenant"("slug");

-- CreateIndex
CREATE INDEX "Branch_tenantId_active_idx" ON "lashibi"."Branch"("tenantId", "active");

-- CreateIndex
CREATE UNIQUE INDEX "Branch_tenantId_id_key" ON "lashibi"."Branch"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "Branch_tenantId_code_key" ON "lashibi"."Branch"("tenantId", "code");

-- CreateIndex
CREATE INDEX "User_tenantId_status_idx" ON "lashibi"."User"("tenantId", "status");

-- CreateIndex
CREATE UNIQUE INDEX "User_tenantId_id_key" ON "lashibi"."User"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "User_tenantId_authUserId_key" ON "lashibi"."User"("tenantId", "authUserId");

-- CreateIndex
CREATE UNIQUE INDEX "User_tenantId_email_key" ON "lashibi"."User"("tenantId", "email");

-- CreateIndex
CREATE INDEX "UserBranchMembership_tenantId_branchId_idx" ON "lashibi"."UserBranchMembership"("tenantId", "branchId");

-- CreateIndex
CREATE UNIQUE INDEX "UserBranchMembership_tenantId_userId_branchId_key" ON "lashibi"."UserBranchMembership"("tenantId", "userId", "branchId");

-- CreateIndex
CREATE UNIQUE INDEX "RoleDefinition_tenantId_id_key" ON "lashibi"."RoleDefinition"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "RoleDefinition_tenantId_code_key" ON "lashibi"."RoleDefinition"("tenantId", "code");

-- CreateIndex
CREATE UNIQUE INDEX "Permission_code_key" ON "lashibi"."Permission"("code");

-- CreateIndex
CREATE INDEX "Permission_domain_action_idx" ON "lashibi"."Permission"("domain", "action");

-- CreateIndex
CREATE INDEX "RolePermission_permissionId_idx" ON "lashibi"."RolePermission"("permissionId");

-- CreateIndex
CREATE UNIQUE INDEX "RolePermission_tenantId_roleId_permissionId_key" ON "lashibi"."RolePermission"("tenantId", "roleId", "permissionId");

-- CreateIndex
CREATE INDEX "UserRole_tenantId_userId_active_idx" ON "lashibi"."UserRole"("tenantId", "userId", "active");

-- CreateIndex
CREATE INDEX "UserRole_tenantId_roleId_idx" ON "lashibi"."UserRole"("tenantId", "roleId");

-- CreateIndex
CREATE UNIQUE INDEX "UserRole_tenantId_id_key" ON "lashibi"."UserRole"("tenantId", "id");

-- CreateIndex
CREATE INDEX "ScopeGrant_tenantId_userRoleId_active_idx" ON "lashibi"."ScopeGrant"("tenantId", "userRoleId", "active");

-- CreateIndex
CREATE INDEX "ScopeGrant_tenantId_branchId_idx" ON "lashibi"."ScopeGrant"("tenantId", "branchId");

-- CreateIndex
CREATE INDEX "ScopeGrant_tenantId_resourceType_resourceId_idx" ON "lashibi"."ScopeGrant"("tenantId", "resourceType", "resourceId");

-- CreateIndex
CREATE INDEX "SoDPolicy_permissionAId_idx" ON "lashibi"."SoDPolicy"("permissionAId");

-- CreateIndex
CREATE INDEX "SoDPolicy_permissionBId_idx" ON "lashibi"."SoDPolicy"("permissionBId");

-- CreateIndex
CREATE UNIQUE INDEX "SoDPolicy_tenantId_code_key" ON "lashibi"."SoDPolicy"("tenantId", "code");

-- CreateIndex
CREATE INDEX "ApprovalPolicy_tenantId_actionPattern_active_idx" ON "lashibi"."ApprovalPolicy"("tenantId", "actionPattern", "active");

-- CreateIndex
CREATE UNIQUE INDEX "ApprovalPolicy_tenantId_code_key" ON "lashibi"."ApprovalPolicy"("tenantId", "code");

-- CreateIndex
CREATE INDEX "ApprovalRequest_tenantId_status_createdAt_idx" ON "lashibi"."ApprovalRequest"("tenantId", "status", "createdAt");

-- CreateIndex
CREATE INDEX "ApprovalRequest_tenantId_resourceType_resourceId_idx" ON "lashibi"."ApprovalRequest"("tenantId", "resourceType", "resourceId");

-- CreateIndex
CREATE UNIQUE INDEX "ApprovalRequest_tenantId_id_key" ON "lashibi"."ApprovalRequest"("tenantId", "id");

-- CreateIndex
CREATE INDEX "ApprovalDecision_tenantId_approverId_idx" ON "lashibi"."ApprovalDecision"("tenantId", "approverId");

-- CreateIndex
CREATE UNIQUE INDEX "ApprovalDecision_tenantId_approvalRequestId_approverId_key" ON "lashibi"."ApprovalDecision"("tenantId", "approvalRequestId", "approverId");

-- CreateIndex
CREATE INDEX "TemporaryAccessGrant_tenantId_userId_status_expiresAt_idx" ON "lashibi"."TemporaryAccessGrant"("tenantId", "userId", "status", "expiresAt");

-- CreateIndex
CREATE INDEX "TemporaryAccessGrant_tenantId_resourceType_resourceId_idx" ON "lashibi"."TemporaryAccessGrant"("tenantId", "resourceType", "resourceId");

-- CreateIndex
CREATE INDEX "BreakGlassSession_tenantId_userId_status_idx" ON "lashibi"."BreakGlassSession"("tenantId", "userId", "status");

-- CreateIndex
CREATE INDEX "DeviceRegistration_tenantId_userId_trustStatus_idx" ON "lashibi"."DeviceRegistration"("tenantId", "userId", "trustStatus");

-- CreateIndex
CREATE UNIQUE INDEX "DeviceRegistration_tenantId_id_key" ON "lashibi"."DeviceRegistration"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "DeviceRegistration_tenantId_deviceKey_key" ON "lashibi"."DeviceRegistration"("tenantId", "deviceKey");

-- CreateIndex
CREATE INDEX "SecuritySession_tenantId_userId_status_idx" ON "lashibi"."SecuritySession"("tenantId", "userId", "status");

-- CreateIndex
CREATE INDEX "SecuritySession_tenantId_absoluteExpiresAt_idx" ON "lashibi"."SecuritySession"("tenantId", "absoluteExpiresAt");

-- CreateIndex
CREATE UNIQUE INDEX "SecuritySession_tenantId_id_key" ON "lashibi"."SecuritySession"("tenantId", "id");

-- CreateIndex
CREATE INDEX "AuthenticationEvent_tenantId_userId_createdAt_idx" ON "lashibi"."AuthenticationEvent"("tenantId", "userId", "createdAt");

-- CreateIndex
CREATE INDEX "AuthenticationEvent_tenantId_sessionId_createdAt_idx" ON "lashibi"."AuthenticationEvent"("tenantId", "sessionId", "createdAt");

-- CreateIndex
CREATE INDEX "AuthDecision_tenantId_principalId_createdAt_idx" ON "lashibi"."AuthDecision"("tenantId", "principalId", "createdAt");

-- CreateIndex
CREATE INDEX "AuthDecision_tenantId_action_result_createdAt_idx" ON "lashibi"."AuthDecision"("tenantId", "action", "result", "createdAt");

-- CreateIndex
CREATE INDEX "AuthDecision_tenantId_resourceType_resourceId_createdAt_idx" ON "lashibi"."AuthDecision"("tenantId", "resourceType", "resourceId", "createdAt");

-- CreateIndex
CREATE INDEX "AuditEvent_tenantId_entityType_entityId_occurredAt_idx" ON "lashibi"."AuditEvent"("tenantId", "entityType", "entityId", "occurredAt");

-- CreateIndex
CREATE INDEX "AuditEvent_tenantId_actorId_occurredAt_idx" ON "lashibi"."AuditEvent"("tenantId", "actorId", "occurredAt");

-- CreateIndex
CREATE INDEX "AuditEvent_tenantId_correlationId_idx" ON "lashibi"."AuditEvent"("tenantId", "correlationId");

-- CreateIndex
CREATE INDEX "EmployeeProfile_tenantId_branchId_employmentStatus_idx" ON "lashibi"."EmployeeProfile"("tenantId", "branchId", "employmentStatus");

-- CreateIndex
CREATE UNIQUE INDEX "EmployeeProfile_tenantId_id_key" ON "lashibi"."EmployeeProfile"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "EmployeeProfile_tenantId_userId_key" ON "lashibi"."EmployeeProfile"("tenantId", "userId");

-- CreateIndex
CREATE UNIQUE INDEX "EmployeeProfile_tenantId_employeeNumber_key" ON "lashibi"."EmployeeProfile"("tenantId", "employeeNumber");

-- CreateIndex
CREATE INDEX "DriverProfile_tenantId_availability_idx" ON "lashibi"."DriverProfile"("tenantId", "availability");

-- CreateIndex
CREATE UNIQUE INDEX "DriverProfile_tenantId_id_key" ON "lashibi"."DriverProfile"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "DriverProfile_tenantId_employeeProfileId_key" ON "lashibi"."DriverProfile"("tenantId", "employeeProfileId");

-- CreateIndex
CREATE UNIQUE INDEX "DriverProfile_tenantId_licenceNumber_key" ON "lashibi"."DriverProfile"("tenantId", "licenceNumber");

-- CreateIndex
CREATE INDEX "DriverShift_tenantId_driverId_startsAt_idx" ON "lashibi"."DriverShift"("tenantId", "driverId", "startsAt");

-- CreateIndex
CREATE INDEX "TechnicianProfile_tenantId_availability_idx" ON "lashibi"."TechnicianProfile"("tenantId", "availability");

-- CreateIndex
CREATE UNIQUE INDEX "TechnicianProfile_tenantId_id_key" ON "lashibi"."TechnicianProfile"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "TechnicianProfile_tenantId_employeeProfileId_key" ON "lashibi"."TechnicianProfile"("tenantId", "employeeProfileId");

-- CreateIndex
CREATE INDEX "FileAsset_tenantId_sha256_idx" ON "lashibi"."FileAsset"("tenantId", "sha256");

-- CreateIndex
CREATE UNIQUE INDEX "FileAsset_tenantId_id_key" ON "lashibi"."FileAsset"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "FileAsset_tenantId_bucket_objectKey_key" ON "lashibi"."FileAsset"("tenantId", "bucket", "objectKey");

-- CreateIndex
CREATE INDEX "Customer_tenantId_status_idx" ON "lashibi"."Customer"("tenantId", "status");

-- CreateIndex
CREATE INDEX "Customer_tenantId_primaryPhone_idx" ON "lashibi"."Customer"("tenantId", "primaryPhone");

-- CreateIndex
CREATE UNIQUE INDEX "Customer_tenantId_id_key" ON "lashibi"."Customer"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "Customer_tenantId_customerNumber_key" ON "lashibi"."Customer"("tenantId", "customerNumber");

-- CreateIndex
CREATE INDEX "CustomerContact_tenantId_customerId_idx" ON "lashibi"."CustomerContact"("tenantId", "customerId");

-- CreateIndex
CREATE INDEX "CustomerContact_tenantId_kind_value_idx" ON "lashibi"."CustomerContact"("tenantId", "kind", "value");

-- CreateIndex
CREATE INDEX "CustomerIdentity_tenantId_customerId_idx" ON "lashibi"."CustomerIdentity"("tenantId", "customerId");

-- CreateIndex
CREATE UNIQUE INDEX "CustomerIdentity_tenantId_type_identifierHash_key" ON "lashibi"."CustomerIdentity"("tenantId", "type", "identifierHash");

-- CreateIndex
CREATE INDEX "CustomerDocument_tenantId_customerId_idx" ON "lashibi"."CustomerDocument"("tenantId", "customerId");

-- CreateIndex
CREATE INDEX "CustomerConsent_tenantId_customerId_type_idx" ON "lashibi"."CustomerConsent"("tenantId", "customerId", "type");

-- CreateIndex
CREATE INDEX "CorporateAccount_tenantId_legalName_idx" ON "lashibi"."CorporateAccount"("tenantId", "legalName");

-- CreateIndex
CREATE UNIQUE INDEX "CorporateAccount_tenantId_id_key" ON "lashibi"."CorporateAccount"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "CorporateAccount_tenantId_customerId_key" ON "lashibi"."CorporateAccount"("tenantId", "customerId");

-- CreateIndex
CREATE INDEX "Vehicle_tenantId_homeBranchId_status_idx" ON "lashibi"."Vehicle"("tenantId", "homeBranchId", "status");

-- CreateIndex
CREATE INDEX "Vehicle_tenantId_rentalEligible_status_idx" ON "lashibi"."Vehicle"("tenantId", "rentalEligible", "status");

-- CreateIndex
CREATE UNIQUE INDEX "Vehicle_tenantId_id_key" ON "lashibi"."Vehicle"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "Vehicle_tenantId_fleetNumber_key" ON "lashibi"."Vehicle"("tenantId", "fleetNumber");

-- CreateIndex
CREATE UNIQUE INDEX "Vehicle_tenantId_vin_key" ON "lashibi"."Vehicle"("tenantId", "vin");

-- CreateIndex
CREATE UNIQUE INDEX "Vehicle_tenantId_chassisNumber_key" ON "lashibi"."Vehicle"("tenantId", "chassisNumber");

-- CreateIndex
CREATE UNIQUE INDEX "Vehicle_tenantId_currentPlateNumber_key" ON "lashibi"."Vehicle"("tenantId", "currentPlateNumber");

-- CreateIndex
CREATE INDEX "VehicleRegistration_tenantId_vehicleId_active_idx" ON "lashibi"."VehicleRegistration"("tenantId", "vehicleId", "active");

-- CreateIndex
CREATE UNIQUE INDEX "VehicleRegistration_tenantId_plateNumber_validFrom_key" ON "lashibi"."VehicleRegistration"("tenantId", "plateNumber", "validFrom");

-- CreateIndex
CREATE INDEX "VehicleDocument_tenantId_vehicleId_type_idx" ON "lashibi"."VehicleDocument"("tenantId", "vehicleId", "type");

-- CreateIndex
CREATE INDEX "VehicleDocument_tenantId_validTo_idx" ON "lashibi"."VehicleDocument"("tenantId", "validTo");

-- CreateIndex
CREATE UNIQUE INDEX "VehiclePassport_tenantId_id_key" ON "lashibi"."VehiclePassport"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "VehiclePassport_tenantId_vehicleId_key" ON "lashibi"."VehiclePassport"("tenantId", "vehicleId");

-- CreateIndex
CREATE INDEX "OdometerReading_tenantId_vehicleId_capturedAt_idx" ON "lashibi"."OdometerReading"("tenantId", "vehicleId", "capturedAt");

-- CreateIndex
CREATE INDEX "OdometerReading_tenantId_rentalAgreementId_idx" ON "lashibi"."OdometerReading"("tenantId", "rentalAgreementId");

-- CreateIndex
CREATE INDEX "VehicleMaintenancePlan_tenantId_vehicleId_active_idx" ON "lashibi"."VehicleMaintenancePlan"("tenantId", "vehicleId", "active");

-- CreateIndex
CREATE INDEX "VehicleMaintenancePlan_tenantId_nextDueAt_idx" ON "lashibi"."VehicleMaintenancePlan"("tenantId", "nextDueAt");

-- CreateIndex
CREATE INDEX "TrackingDevice_tenantId_status_idx" ON "lashibi"."TrackingDevice"("tenantId", "status");

-- CreateIndex
CREATE UNIQUE INDEX "TrackingDevice_tenantId_id_key" ON "lashibi"."TrackingDevice"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "TrackingDevice_tenantId_provider_externalDeviceId_key" ON "lashibi"."TrackingDevice"("tenantId", "provider", "externalDeviceId");

-- CreateIndex
CREATE INDEX "VehicleDeviceAssignment_tenantId_vehicleId_active_idx" ON "lashibi"."VehicleDeviceAssignment"("tenantId", "vehicleId", "active");

-- CreateIndex
CREATE INDEX "VehicleDeviceAssignment_tenantId_deviceId_active_idx" ON "lashibi"."VehicleDeviceAssignment"("tenantId", "deviceId", "active");

-- CreateIndex
CREATE INDEX "TelemetryReading_tenantId_vehicleId_capturedAt_idx" ON "lashibi"."TelemetryReading"("tenantId", "vehicleId", "capturedAt");

-- CreateIndex
CREATE INDEX "TelemetryReading_tenantId_deviceId_capturedAt_idx" ON "lashibi"."TelemetryReading"("tenantId", "deviceId", "capturedAt");

-- CreateIndex
CREATE INDEX "VehicleTrip_tenantId_vehicleId_startedAt_idx" ON "lashibi"."VehicleTrip"("tenantId", "vehicleId", "startedAt");

-- CreateIndex
CREATE INDEX "VehicleTrip_tenantId_rentalAgreementId_idx" ON "lashibi"."VehicleTrip"("tenantId", "rentalAgreementId");

-- CreateIndex
CREATE UNIQUE INDEX "VehicleTrip_tenantId_id_key" ON "lashibi"."VehicleTrip"("tenantId", "id");

-- CreateIndex
CREATE INDEX "TripEvent_tenantId_tripId_occurredAt_idx" ON "lashibi"."TripEvent"("tenantId", "tripId", "occurredAt");

-- CreateIndex
CREATE INDEX "Geofence_tenantId_active_idx" ON "lashibi"."Geofence"("tenantId", "active");

-- CreateIndex
CREATE UNIQUE INDEX "Geofence_tenantId_id_key" ON "lashibi"."Geofence"("tenantId", "id");

-- CreateIndex
CREATE INDEX "VehicleGeofenceAssignment_tenantId_vehicleId_active_idx" ON "lashibi"."VehicleGeofenceAssignment"("tenantId", "vehicleId", "active");

-- CreateIndex
CREATE UNIQUE INDEX "VehicleGeofenceAssignment_tenantId_vehicleId_geofenceId_sta_key" ON "lashibi"."VehicleGeofenceAssignment"("tenantId", "vehicleId", "geofenceId", "startsAt");

-- CreateIndex
CREATE INDEX "GeofenceEvent_tenantId_vehicleId_occurredAt_idx" ON "lashibi"."GeofenceEvent"("tenantId", "vehicleId", "occurredAt");

-- CreateIndex
CREATE INDEX "GeofenceEvent_tenantId_geofenceId_occurredAt_idx" ON "lashibi"."GeofenceEvent"("tenantId", "geofenceId", "occurredAt");

-- CreateIndex
CREATE INDEX "TelemetryAlert_tenantId_vehicleId_status_openedAt_idx" ON "lashibi"."TelemetryAlert"("tenantId", "vehicleId", "status", "openedAt");

-- CreateIndex
CREATE INDEX "RentalReservation_tenantId_branchId_status_scheduledPickupA_idx" ON "lashibi"."RentalReservation"("tenantId", "branchId", "status", "scheduledPickupAt");

-- CreateIndex
CREATE INDEX "RentalReservation_tenantId_customerId_createdAt_idx" ON "lashibi"."RentalReservation"("tenantId", "customerId", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "RentalReservation_tenantId_id_key" ON "lashibi"."RentalReservation"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "RentalReservation_tenantId_reservationCode_key" ON "lashibi"."RentalReservation"("tenantId", "reservationCode");

-- CreateIndex
CREATE INDEX "RentalVehicleAllocation_tenantId_reservationId_status_idx" ON "lashibi"."RentalVehicleAllocation"("tenantId", "reservationId", "status");

-- CreateIndex
CREATE INDEX "RentalVehicleAllocation_tenantId_vehicleId_allocatedFrom_al_idx" ON "lashibi"."RentalVehicleAllocation"("tenantId", "vehicleId", "allocatedFrom", "allocatedUntil");

-- CreateIndex
CREATE INDEX "RentalAgreement_tenantId_branchId_status_dueReturnAt_idx" ON "lashibi"."RentalAgreement"("tenantId", "branchId", "status", "dueReturnAt");

-- CreateIndex
CREATE INDEX "RentalAgreement_tenantId_vehicleId_status_idx" ON "lashibi"."RentalAgreement"("tenantId", "vehicleId", "status");

-- CreateIndex
CREATE INDEX "RentalAgreement_tenantId_customerId_createdAt_idx" ON "lashibi"."RentalAgreement"("tenantId", "customerId", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "RentalAgreement_tenantId_id_key" ON "lashibi"."RentalAgreement"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "RentalAgreement_tenantId_agreementCode_key" ON "lashibi"."RentalAgreement"("tenantId", "agreementCode");

-- CreateIndex
CREATE INDEX "RentalDriverAssignment_tenantId_rentalAgreementId_status_idx" ON "lashibi"."RentalDriverAssignment"("tenantId", "rentalAgreementId", "status");

-- CreateIndex
CREATE INDEX "RentalDriverAssignment_tenantId_driverId_status_idx" ON "lashibi"."RentalDriverAssignment"("tenantId", "driverId", "status");

-- CreateIndex
CREATE INDEX "RentalExtension_tenantId_rentalAgreementId_status_idx" ON "lashibi"."RentalExtension"("tenantId", "rentalAgreementId", "status");

-- CreateIndex
CREATE INDEX "RentalCharge_tenantId_rentalAgreementId_type_idx" ON "lashibi"."RentalCharge"("tenantId", "rentalAgreementId", "type");

-- CreateIndex
CREATE INDEX "RentalDeposit_tenantId_rentalAgreementId_status_idx" ON "lashibi"."RentalDeposit"("tenantId", "rentalAgreementId", "status");

-- CreateIndex
CREATE INDEX "RentalIncident_tenantId_rentalAgreementId_status_idx" ON "lashibi"."RentalIncident"("tenantId", "rentalAgreementId", "status");

-- CreateIndex
CREATE INDEX "RentalFine_tenantId_rentalAgreementId_recovered_idx" ON "lashibi"."RentalFine"("tenantId", "rentalAgreementId", "recovered");

-- CreateIndex
CREATE INDEX "RentalToll_tenantId_rentalAgreementId_occurredAt_idx" ON "lashibi"."RentalToll"("tenantId", "rentalAgreementId", "occurredAt");

-- CreateIndex
CREATE INDEX "RentalReturnReconciliation_tenantId_rentalAgreementId_idx" ON "lashibi"."RentalReturnReconciliation"("tenantId", "rentalAgreementId");

-- CreateIndex
CREATE UNIQUE INDEX "InspectionTemplate_tenantId_id_key" ON "lashibi"."InspectionTemplate"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "InspectionTemplate_tenantId_code_version_key" ON "lashibi"."InspectionTemplate"("tenantId", "code", "version");

-- CreateIndex
CREATE INDEX "InspectionTemplateItem_tenantId_templateId_sortOrder_idx" ON "lashibi"."InspectionTemplateItem"("tenantId", "templateId", "sortOrder");

-- CreateIndex
CREATE UNIQUE INDEX "InspectionTemplateItem_tenantId_templateId_code_key" ON "lashibi"."InspectionTemplateItem"("tenantId", "templateId", "code");

-- CreateIndex
CREATE INDEX "VehicleInspection_tenantId_vehicleId_context_startedAt_idx" ON "lashibi"."VehicleInspection"("tenantId", "vehicleId", "context", "startedAt");

-- CreateIndex
CREATE INDEX "VehicleInspection_tenantId_rentalAgreementId_idx" ON "lashibi"."VehicleInspection"("tenantId", "rentalAgreementId");

-- CreateIndex
CREATE UNIQUE INDEX "VehicleInspection_tenantId_id_key" ON "lashibi"."VehicleInspection"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "InspectionFinding_tenantId_inspectionId_templateItemId_key" ON "lashibi"."InspectionFinding"("tenantId", "inspectionId", "templateItemId");

-- CreateIndex
CREATE INDEX "InspectionMedia_tenantId_inspectionId_idx" ON "lashibi"."InspectionMedia"("tenantId", "inspectionId");

-- CreateIndex
CREATE INDEX "DamageRecord_tenantId_vehicleId_status_idx" ON "lashibi"."DamageRecord"("tenantId", "vehicleId", "status");

-- CreateIndex
CREATE UNIQUE INDEX "DamageRecord_tenantId_id_key" ON "lashibi"."DamageRecord"("tenantId", "id");

-- CreateIndex
CREATE INDEX "DamageAssessment_tenantId_damageRecordId_idx" ON "lashibi"."DamageAssessment"("tenantId", "damageRecordId");

-- CreateIndex
CREATE UNIQUE INDEX "WorkBay_tenantId_id_key" ON "lashibi"."WorkBay"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "WorkBay_tenantId_branchId_code_key" ON "lashibi"."WorkBay"("tenantId", "branchId", "code");

-- CreateIndex
CREATE INDEX "WorkshopJob_tenantId_branchId_status_openedAt_idx" ON "lashibi"."WorkshopJob"("tenantId", "branchId", "status", "openedAt");

-- CreateIndex
CREATE INDEX "WorkshopJob_tenantId_vehicleId_openedAt_idx" ON "lashibi"."WorkshopJob"("tenantId", "vehicleId", "openedAt");

-- CreateIndex
CREATE UNIQUE INDEX "WorkshopJob_tenantId_id_key" ON "lashibi"."WorkshopJob"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "WorkshopJob_tenantId_jobCode_key" ON "lashibi"."WorkshopJob"("tenantId", "jobCode");

-- CreateIndex
CREATE INDEX "WorkshopAssignment_tenantId_workshopJobId_idx" ON "lashibi"."WorkshopAssignment"("tenantId", "workshopJobId");

-- CreateIndex
CREATE INDEX "WorkshopAssignment_tenantId_technicianId_assignedAt_idx" ON "lashibi"."WorkshopAssignment"("tenantId", "technicianId", "assignedAt");

-- CreateIndex
CREATE UNIQUE INDEX "WorkshopEstimate_tenantId_id_key" ON "lashibi"."WorkshopEstimate"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "WorkshopEstimate_tenantId_workshopJobId_version_key" ON "lashibi"."WorkshopEstimate"("tenantId", "workshopJobId", "version");

-- CreateIndex
CREATE INDEX "WorkshopEstimateLine_tenantId_estimateId_sortOrder_idx" ON "lashibi"."WorkshopEstimateLine"("tenantId", "estimateId", "sortOrder");

-- CreateIndex
CREATE INDEX "WorkshopJobItem_tenantId_workshopJobId_idx" ON "lashibi"."WorkshopJobItem"("tenantId", "workshopJobId");

-- CreateIndex
CREATE INDEX "WorkshopJobItem_tenantId_partId_idx" ON "lashibi"."WorkshopJobItem"("tenantId", "partId");

-- CreateIndex
CREATE UNIQUE INDEX "Supplier_tenantId_id_key" ON "lashibi"."Supplier"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "Supplier_tenantId_supplierCode_key" ON "lashibi"."Supplier"("tenantId", "supplierCode");

-- CreateIndex
CREATE INDEX "Part_tenantId_oemNumber_idx" ON "lashibi"."Part"("tenantId", "oemNumber");

-- CreateIndex
CREATE UNIQUE INDEX "Part_tenantId_id_key" ON "lashibi"."Part"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "Part_tenantId_sku_key" ON "lashibi"."Part"("tenantId", "sku");

-- CreateIndex
CREATE UNIQUE INDEX "StockLocation_tenantId_id_key" ON "lashibi"."StockLocation"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "StockLocation_tenantId_branchId_code_key" ON "lashibi"."StockLocation"("tenantId", "branchId", "code");

-- CreateIndex
CREATE INDEX "StockMovement_tenantId_partId_occurredAt_idx" ON "lashibi"."StockMovement"("tenantId", "partId", "occurredAt");

-- CreateIndex
CREATE INDEX "StockMovement_tenantId_sourceType_sourceId_idx" ON "lashibi"."StockMovement"("tenantId", "sourceType", "sourceId");

-- CreateIndex
CREATE INDEX "PurchaseOrder_tenantId_supplierId_status_idx" ON "lashibi"."PurchaseOrder"("tenantId", "supplierId", "status");

-- CreateIndex
CREATE UNIQUE INDEX "PurchaseOrder_tenantId_id_key" ON "lashibi"."PurchaseOrder"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "PurchaseOrder_tenantId_poCode_key" ON "lashibi"."PurchaseOrder"("tenantId", "poCode");

-- CreateIndex
CREATE INDEX "PurchaseOrderLine_tenantId_purchaseOrderId_idx" ON "lashibi"."PurchaseOrderLine"("tenantId", "purchaseOrderId");

-- CreateIndex
CREATE UNIQUE INDEX "GoodsReceipt_tenantId_id_key" ON "lashibi"."GoodsReceipt"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "GoodsReceipt_tenantId_receiptCode_key" ON "lashibi"."GoodsReceipt"("tenantId", "receiptCode");

-- CreateIndex
CREATE INDEX "GoodsReceiptLine_tenantId_goodsReceiptId_idx" ON "lashibi"."GoodsReceiptLine"("tenantId", "goodsReceiptId");

-- CreateIndex
CREATE INDEX "VehicleSaleListing_tenantId_vehicleId_published_idx" ON "lashibi"."VehicleSaleListing"("tenantId", "vehicleId", "published");

-- CreateIndex
CREATE UNIQUE INDEX "VehicleSaleListing_tenantId_id_key" ON "lashibi"."VehicleSaleListing"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "VehicleSaleListing_tenantId_listingCode_key" ON "lashibi"."VehicleSaleListing"("tenantId", "listingCode");

-- CreateIndex
CREATE INDEX "SalesLead_tenantId_status_createdAt_idx" ON "lashibi"."SalesLead"("tenantId", "status", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "SalesLead_tenantId_id_key" ON "lashibi"."SalesLead"("tenantId", "id");

-- CreateIndex
CREATE INDEX "TestDrive_tenantId_vehicleId_scheduledAt_idx" ON "lashibi"."TestDrive"("tenantId", "vehicleId", "scheduledAt");

-- CreateIndex
CREATE INDEX "TestDrive_tenantId_customerId_idx" ON "lashibi"."TestDrive"("tenantId", "customerId");

-- CreateIndex
CREATE INDEX "VehicleSale_tenantId_vehicleId_status_idx" ON "lashibi"."VehicleSale"("tenantId", "vehicleId", "status");

-- CreateIndex
CREATE UNIQUE INDEX "VehicleSale_tenantId_id_key" ON "lashibi"."VehicleSale"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "VehicleSale_tenantId_saleCode_key" ON "lashibi"."VehicleSale"("tenantId", "saleCode");

-- CreateIndex
CREATE INDEX "InsurancePolicy_tenantId_vehicleId_status_validTo_idx" ON "lashibi"."InsurancePolicy"("tenantId", "vehicleId", "status", "validTo");

-- CreateIndex
CREATE UNIQUE INDEX "InsurancePolicy_tenantId_id_key" ON "lashibi"."InsurancePolicy"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "InsurancePolicy_tenantId_policyNumber_key" ON "lashibi"."InsurancePolicy"("tenantId", "policyNumber");

-- CreateIndex
CREATE INDEX "InsuranceClaim_tenantId_vehicleId_status_idx" ON "lashibi"."InsuranceClaim"("tenantId", "vehicleId", "status");

-- CreateIndex
CREATE UNIQUE INDEX "InsuranceClaim_tenantId_id_key" ON "lashibi"."InsuranceClaim"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "InsuranceClaim_tenantId_claimCode_key" ON "lashibi"."InsuranceClaim"("tenantId", "claimCode");

-- CreateIndex
CREATE INDEX "ClaimAssessment_tenantId_claimId_assessedAt_idx" ON "lashibi"."ClaimAssessment"("tenantId", "claimId", "assessedAt");

-- CreateIndex
CREATE INDEX "Invoice_tenantId_status_dueAt_idx" ON "lashibi"."Invoice"("tenantId", "status", "dueAt");

-- CreateIndex
CREATE INDEX "Invoice_tenantId_sourceType_sourceId_idx" ON "lashibi"."Invoice"("tenantId", "sourceType", "sourceId");

-- CreateIndex
CREATE UNIQUE INDEX "Invoice_tenantId_id_key" ON "lashibi"."Invoice"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "Invoice_tenantId_invoiceNumber_key" ON "lashibi"."Invoice"("tenantId", "invoiceNumber");

-- CreateIndex
CREATE INDEX "InvoiceLine_tenantId_invoiceId_idx" ON "lashibi"."InvoiceLine"("tenantId", "invoiceId");

-- CreateIndex
CREATE INDEX "Payment_tenantId_status_createdAt_idx" ON "lashibi"."Payment"("tenantId", "status", "createdAt");

-- CreateIndex
CREATE INDEX "Payment_tenantId_provider_providerReference_idx" ON "lashibi"."Payment"("tenantId", "provider", "providerReference");

-- CreateIndex
CREATE UNIQUE INDEX "Payment_tenantId_id_key" ON "lashibi"."Payment"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "Payment_tenantId_paymentCode_key" ON "lashibi"."Payment"("tenantId", "paymentCode");

-- CreateIndex
CREATE INDEX "PaymentAllocation_tenantId_invoiceId_idx" ON "lashibi"."PaymentAllocation"("tenantId", "invoiceId");

-- CreateIndex
CREATE UNIQUE INDEX "PaymentAllocation_tenantId_paymentId_invoiceId_key" ON "lashibi"."PaymentAllocation"("tenantId", "paymentId", "invoiceId");

-- CreateIndex
CREATE INDEX "Refund_tenantId_status_createdAt_idx" ON "lashibi"."Refund"("tenantId", "status", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "Refund_tenantId_id_key" ON "lashibi"."Refund"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "Refund_tenantId_refundCode_key" ON "lashibi"."Refund"("tenantId", "refundCode");

-- CreateIndex
CREATE INDEX "PaymentProviderTransaction_tenantId_paymentId_occurredAt_idx" ON "lashibi"."PaymentProviderTransaction"("tenantId", "paymentId", "occurredAt");

-- CreateIndex
CREATE UNIQUE INDEX "PaymentProviderTransaction_tenantId_provider_externalId_key" ON "lashibi"."PaymentProviderTransaction"("tenantId", "provider", "externalId");

-- CreateIndex
CREATE INDEX "TaxSubmission_tenantId_invoiceId_status_idx" ON "lashibi"."TaxSubmission"("tenantId", "invoiceId", "status");

-- CreateIndex
CREATE INDEX "TaxSubmission_tenantId_status_lastAttemptAt_idx" ON "lashibi"."TaxSubmission"("tenantId", "status", "lastAttemptAt");

-- CreateIndex
CREATE INDEX "CommunicationLog_tenantId_customerId_occurredAt_idx" ON "lashibi"."CommunicationLog"("tenantId", "customerId", "occurredAt");

-- CreateIndex
CREATE INDEX "CommunicationLog_tenantId_sourceType_sourceId_idx" ON "lashibi"."CommunicationLog"("tenantId", "sourceType", "sourceId");

-- CreateIndex
CREATE INDEX "ApiClient_tenantId_active_idx" ON "lashibi"."ApiClient"("tenantId", "active");

-- CreateIndex
CREATE UNIQUE INDEX "ApiClient_tenantId_clientId_key" ON "lashibi"."ApiClient"("tenantId", "clientId");

-- CreateIndex
CREATE INDEX "IntegrationConnection_tenantId_type_status_idx" ON "lashibi"."IntegrationConnection"("tenantId", "type", "status");

-- CreateIndex
CREATE UNIQUE INDEX "IntegrationConnection_tenantId_id_key" ON "lashibi"."IntegrationConnection"("tenantId", "id");

-- CreateIndex
CREATE INDEX "WebhookEndpoint_tenantId_integrationId_active_idx" ON "lashibi"."WebhookEndpoint"("tenantId", "integrationId", "active");

-- CreateIndex
CREATE UNIQUE INDEX "WebhookEndpoint_tenantId_id_key" ON "lashibi"."WebhookEndpoint"("tenantId", "id");

-- CreateIndex
CREATE INDEX "WebhookDelivery_tenantId_endpointId_createdAt_idx" ON "lashibi"."WebhookDelivery"("tenantId", "endpointId", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "WebhookDelivery_tenantId_endpointId_eventId_attempt_key" ON "lashibi"."WebhookDelivery"("tenantId", "endpointId", "eventId", "attempt");

-- CreateIndex
CREATE INDEX "AiRun_tenantId_status_createdAt_idx" ON "lashibi"."AiRun"("tenantId", "status", "createdAt");

-- CreateIndex
CREATE INDEX "AiRun_tenantId_sourceType_sourceId_idx" ON "lashibi"."AiRun"("tenantId", "sourceType", "sourceId");

-- CreateIndex
CREATE UNIQUE INDEX "AiRun_tenantId_id_key" ON "lashibi"."AiRun"("tenantId", "id");

-- CreateIndex
CREATE INDEX "AiFinding_tenantId_aiRunId_idx" ON "lashibi"."AiFinding"("tenantId", "aiRunId");

-- AddForeignKey
ALTER TABLE "lashibi"."TaxRule" ADD CONSTRAINT "TaxRule_countryPackCode_fkey" FOREIGN KEY ("countryPackCode") REFERENCES "lashibi"."CountryPack"("code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."Tenant" ADD CONSTRAINT "Tenant_countryPackCode_fkey" FOREIGN KEY ("countryPackCode") REFERENCES "lashibi"."CountryPack"("code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."Branch" ADD CONSTRAINT "Branch_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "lashibi"."Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."User" ADD CONSTRAINT "User_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "lashibi"."Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."UserBranchMembership" ADD CONSTRAINT "UserBranchMembership_tenantId_userId_fkey" FOREIGN KEY ("tenantId", "userId") REFERENCES "lashibi"."User"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."UserBranchMembership" ADD CONSTRAINT "UserBranchMembership_tenantId_branchId_fkey" FOREIGN KEY ("tenantId", "branchId") REFERENCES "lashibi"."Branch"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."RoleDefinition" ADD CONSTRAINT "RoleDefinition_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "lashibi"."Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."RolePermission" ADD CONSTRAINT "RolePermission_tenantId_roleId_fkey" FOREIGN KEY ("tenantId", "roleId") REFERENCES "lashibi"."RoleDefinition"("tenantId", "id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."RolePermission" ADD CONSTRAINT "RolePermission_permissionId_fkey" FOREIGN KEY ("permissionId") REFERENCES "lashibi"."Permission"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."UserRole" ADD CONSTRAINT "UserRole_tenantId_userId_fkey" FOREIGN KEY ("tenantId", "userId") REFERENCES "lashibi"."User"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."UserRole" ADD CONSTRAINT "UserRole_tenantId_roleId_fkey" FOREIGN KEY ("tenantId", "roleId") REFERENCES "lashibi"."RoleDefinition"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."ScopeGrant" ADD CONSTRAINT "ScopeGrant_tenantId_userRoleId_fkey" FOREIGN KEY ("tenantId", "userRoleId") REFERENCES "lashibi"."UserRole"("tenantId", "id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."SoDPolicy" ADD CONSTRAINT "SoDPolicy_permissionAId_fkey" FOREIGN KEY ("permissionAId") REFERENCES "lashibi"."Permission"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."SoDPolicy" ADD CONSTRAINT "SoDPolicy_permissionBId_fkey" FOREIGN KEY ("permissionBId") REFERENCES "lashibi"."Permission"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."ApprovalRequest" ADD CONSTRAINT "ApprovalRequest_tenantId_requestedById_fkey" FOREIGN KEY ("tenantId", "requestedById") REFERENCES "lashibi"."User"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."ApprovalDecision" ADD CONSTRAINT "ApprovalDecision_tenantId_approvalRequestId_fkey" FOREIGN KEY ("tenantId", "approvalRequestId") REFERENCES "lashibi"."ApprovalRequest"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."ApprovalDecision" ADD CONSTRAINT "ApprovalDecision_tenantId_approverId_fkey" FOREIGN KEY ("tenantId", "approverId") REFERENCES "lashibi"."User"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."TemporaryAccessGrant" ADD CONSTRAINT "TemporaryAccessGrant_tenantId_userId_fkey" FOREIGN KEY ("tenantId", "userId") REFERENCES "lashibi"."User"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."TemporaryAccessGrant" ADD CONSTRAINT "TemporaryAccessGrant_permissionId_fkey" FOREIGN KEY ("permissionId") REFERENCES "lashibi"."Permission"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."TemporaryAccessGrant" ADD CONSTRAINT "TemporaryAccessGrant_tenantId_approvalRequestId_fkey" FOREIGN KEY ("tenantId", "approvalRequestId") REFERENCES "lashibi"."ApprovalRequest"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."BreakGlassSession" ADD CONSTRAINT "BreakGlassSession_tenantId_userId_fkey" FOREIGN KEY ("tenantId", "userId") REFERENCES "lashibi"."User"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."DeviceRegistration" ADD CONSTRAINT "DeviceRegistration_tenantId_userId_fkey" FOREIGN KEY ("tenantId", "userId") REFERENCES "lashibi"."User"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."SecuritySession" ADD CONSTRAINT "SecuritySession_tenantId_userId_fkey" FOREIGN KEY ("tenantId", "userId") REFERENCES "lashibi"."User"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."SecuritySession" ADD CONSTRAINT "SecuritySession_tenantId_deviceId_fkey" FOREIGN KEY ("tenantId", "deviceId") REFERENCES "lashibi"."DeviceRegistration"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."EmployeeProfile" ADD CONSTRAINT "EmployeeProfile_tenantId_userId_fkey" FOREIGN KEY ("tenantId", "userId") REFERENCES "lashibi"."User"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."DriverProfile" ADD CONSTRAINT "DriverProfile_tenantId_employeeProfileId_fkey" FOREIGN KEY ("tenantId", "employeeProfileId") REFERENCES "lashibi"."EmployeeProfile"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."DriverShift" ADD CONSTRAINT "DriverShift_tenantId_driverId_fkey" FOREIGN KEY ("tenantId", "driverId") REFERENCES "lashibi"."DriverProfile"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."TechnicianProfile" ADD CONSTRAINT "TechnicianProfile_tenantId_employeeProfileId_fkey" FOREIGN KEY ("tenantId", "employeeProfileId") REFERENCES "lashibi"."EmployeeProfile"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."Customer" ADD CONSTRAINT "Customer_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "lashibi"."Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."CustomerContact" ADD CONSTRAINT "CustomerContact_tenantId_customerId_fkey" FOREIGN KEY ("tenantId", "customerId") REFERENCES "lashibi"."Customer"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."CustomerIdentity" ADD CONSTRAINT "CustomerIdentity_tenantId_customerId_fkey" FOREIGN KEY ("tenantId", "customerId") REFERENCES "lashibi"."Customer"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."CustomerDocument" ADD CONSTRAINT "CustomerDocument_tenantId_customerId_fkey" FOREIGN KEY ("tenantId", "customerId") REFERENCES "lashibi"."Customer"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."CustomerDocument" ADD CONSTRAINT "CustomerDocument_tenantId_fileAssetId_fkey" FOREIGN KEY ("tenantId", "fileAssetId") REFERENCES "lashibi"."FileAsset"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."CustomerConsent" ADD CONSTRAINT "CustomerConsent_tenantId_customerId_fkey" FOREIGN KEY ("tenantId", "customerId") REFERENCES "lashibi"."Customer"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."CorporateAccount" ADD CONSTRAINT "CorporateAccount_tenantId_customerId_fkey" FOREIGN KEY ("tenantId", "customerId") REFERENCES "lashibi"."Customer"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."Vehicle" ADD CONSTRAINT "Vehicle_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "lashibi"."Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."Vehicle" ADD CONSTRAINT "Vehicle_tenantId_homeBranchId_fkey" FOREIGN KEY ("tenantId", "homeBranchId") REFERENCES "lashibi"."Branch"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."VehicleRegistration" ADD CONSTRAINT "VehicleRegistration_tenantId_vehicleId_fkey" FOREIGN KEY ("tenantId", "vehicleId") REFERENCES "lashibi"."Vehicle"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."VehicleDocument" ADD CONSTRAINT "VehicleDocument_tenantId_vehicleId_fkey" FOREIGN KEY ("tenantId", "vehicleId") REFERENCES "lashibi"."Vehicle"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."VehicleDocument" ADD CONSTRAINT "VehicleDocument_tenantId_fileAssetId_fkey" FOREIGN KEY ("tenantId", "fileAssetId") REFERENCES "lashibi"."FileAsset"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."VehiclePassport" ADD CONSTRAINT "VehiclePassport_tenantId_vehicleId_fkey" FOREIGN KEY ("tenantId", "vehicleId") REFERENCES "lashibi"."Vehicle"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."OdometerReading" ADD CONSTRAINT "OdometerReading_tenantId_vehicleId_fkey" FOREIGN KEY ("tenantId", "vehicleId") REFERENCES "lashibi"."Vehicle"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."OdometerReading" ADD CONSTRAINT "OdometerReading_correctionOfId_fkey" FOREIGN KEY ("correctionOfId") REFERENCES "lashibi"."OdometerReading"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."VehicleMaintenancePlan" ADD CONSTRAINT "VehicleMaintenancePlan_tenantId_vehicleId_fkey" FOREIGN KEY ("tenantId", "vehicleId") REFERENCES "lashibi"."Vehicle"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."VehicleDeviceAssignment" ADD CONSTRAINT "VehicleDeviceAssignment_tenantId_vehicleId_fkey" FOREIGN KEY ("tenantId", "vehicleId") REFERENCES "lashibi"."Vehicle"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."VehicleDeviceAssignment" ADD CONSTRAINT "VehicleDeviceAssignment_tenantId_deviceId_fkey" FOREIGN KEY ("tenantId", "deviceId") REFERENCES "lashibi"."TrackingDevice"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."TelemetryReading" ADD CONSTRAINT "TelemetryReading_tenantId_vehicleId_fkey" FOREIGN KEY ("tenantId", "vehicleId") REFERENCES "lashibi"."Vehicle"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."TelemetryReading" ADD CONSTRAINT "TelemetryReading_tenantId_deviceId_fkey" FOREIGN KEY ("tenantId", "deviceId") REFERENCES "lashibi"."TrackingDevice"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."VehicleTrip" ADD CONSTRAINT "VehicleTrip_tenantId_vehicleId_fkey" FOREIGN KEY ("tenantId", "vehicleId") REFERENCES "lashibi"."Vehicle"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."TripEvent" ADD CONSTRAINT "TripEvent_tenantId_tripId_fkey" FOREIGN KEY ("tenantId", "tripId") REFERENCES "lashibi"."VehicleTrip"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."VehicleGeofenceAssignment" ADD CONSTRAINT "VehicleGeofenceAssignment_tenantId_vehicleId_fkey" FOREIGN KEY ("tenantId", "vehicleId") REFERENCES "lashibi"."Vehicle"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."VehicleGeofenceAssignment" ADD CONSTRAINT "VehicleGeofenceAssignment_tenantId_geofenceId_fkey" FOREIGN KEY ("tenantId", "geofenceId") REFERENCES "lashibi"."Geofence"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."GeofenceEvent" ADD CONSTRAINT "GeofenceEvent_tenantId_geofenceId_fkey" FOREIGN KEY ("tenantId", "geofenceId") REFERENCES "lashibi"."Geofence"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."TelemetryAlert" ADD CONSTRAINT "TelemetryAlert_tenantId_vehicleId_fkey" FOREIGN KEY ("tenantId", "vehicleId") REFERENCES "lashibi"."Vehicle"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."RentalReservation" ADD CONSTRAINT "RentalReservation_tenantId_branchId_fkey" FOREIGN KEY ("tenantId", "branchId") REFERENCES "lashibi"."Branch"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."RentalReservation" ADD CONSTRAINT "RentalReservation_tenantId_customerId_fkey" FOREIGN KEY ("tenantId", "customerId") REFERENCES "lashibi"."Customer"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."RentalReservation" ADD CONSTRAINT "RentalReservation_tenantId_createdById_fkey" FOREIGN KEY ("tenantId", "createdById") REFERENCES "lashibi"."User"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."RentalVehicleAllocation" ADD CONSTRAINT "RentalVehicleAllocation_tenantId_reservationId_fkey" FOREIGN KEY ("tenantId", "reservationId") REFERENCES "lashibi"."RentalReservation"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."RentalVehicleAllocation" ADD CONSTRAINT "RentalVehicleAllocation_tenantId_vehicleId_fkey" FOREIGN KEY ("tenantId", "vehicleId") REFERENCES "lashibi"."Vehicle"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."RentalAgreement" ADD CONSTRAINT "RentalAgreement_tenantId_reservationId_fkey" FOREIGN KEY ("tenantId", "reservationId") REFERENCES "lashibi"."RentalReservation"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."RentalAgreement" ADD CONSTRAINT "RentalAgreement_tenantId_branchId_fkey" FOREIGN KEY ("tenantId", "branchId") REFERENCES "lashibi"."Branch"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."RentalAgreement" ADD CONSTRAINT "RentalAgreement_tenantId_customerId_fkey" FOREIGN KEY ("tenantId", "customerId") REFERENCES "lashibi"."Customer"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."RentalAgreement" ADD CONSTRAINT "RentalAgreement_tenantId_vehicleId_fkey" FOREIGN KEY ("tenantId", "vehicleId") REFERENCES "lashibi"."Vehicle"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."RentalAgreement" ADD CONSTRAINT "RentalAgreement_tenantId_handledById_fkey" FOREIGN KEY ("tenantId", "handledById") REFERENCES "lashibi"."User"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."RentalDriverAssignment" ADD CONSTRAINT "RentalDriverAssignment_tenantId_rentalAgreementId_fkey" FOREIGN KEY ("tenantId", "rentalAgreementId") REFERENCES "lashibi"."RentalAgreement"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."RentalDriverAssignment" ADD CONSTRAINT "RentalDriverAssignment_tenantId_driverId_fkey" FOREIGN KEY ("tenantId", "driverId") REFERENCES "lashibi"."DriverProfile"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."RentalExtension" ADD CONSTRAINT "RentalExtension_tenantId_rentalAgreementId_fkey" FOREIGN KEY ("tenantId", "rentalAgreementId") REFERENCES "lashibi"."RentalAgreement"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."RentalCharge" ADD CONSTRAINT "RentalCharge_tenantId_rentalAgreementId_fkey" FOREIGN KEY ("tenantId", "rentalAgreementId") REFERENCES "lashibi"."RentalAgreement"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."RentalDeposit" ADD CONSTRAINT "RentalDeposit_tenantId_rentalAgreementId_fkey" FOREIGN KEY ("tenantId", "rentalAgreementId") REFERENCES "lashibi"."RentalAgreement"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."RentalIncident" ADD CONSTRAINT "RentalIncident_tenantId_rentalAgreementId_fkey" FOREIGN KEY ("tenantId", "rentalAgreementId") REFERENCES "lashibi"."RentalAgreement"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."RentalFine" ADD CONSTRAINT "RentalFine_tenantId_rentalAgreementId_fkey" FOREIGN KEY ("tenantId", "rentalAgreementId") REFERENCES "lashibi"."RentalAgreement"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."RentalToll" ADD CONSTRAINT "RentalToll_tenantId_rentalAgreementId_fkey" FOREIGN KEY ("tenantId", "rentalAgreementId") REFERENCES "lashibi"."RentalAgreement"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."RentalReturnReconciliation" ADD CONSTRAINT "RentalReturnReconciliation_tenantId_rentalAgreementId_fkey" FOREIGN KEY ("tenantId", "rentalAgreementId") REFERENCES "lashibi"."RentalAgreement"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."InspectionTemplateItem" ADD CONSTRAINT "InspectionTemplateItem_tenantId_templateId_fkey" FOREIGN KEY ("tenantId", "templateId") REFERENCES "lashibi"."InspectionTemplate"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."VehicleInspection" ADD CONSTRAINT "VehicleInspection_tenantId_vehicleId_fkey" FOREIGN KEY ("tenantId", "vehicleId") REFERENCES "lashibi"."Vehicle"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."VehicleInspection" ADD CONSTRAINT "VehicleInspection_tenantId_templateId_fkey" FOREIGN KEY ("tenantId", "templateId") REFERENCES "lashibi"."InspectionTemplate"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."VehicleInspection" ADD CONSTRAINT "VehicleInspection_tenantId_rentalAgreementId_fkey" FOREIGN KEY ("tenantId", "rentalAgreementId") REFERENCES "lashibi"."RentalAgreement"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."InspectionFinding" ADD CONSTRAINT "InspectionFinding_tenantId_inspectionId_fkey" FOREIGN KEY ("tenantId", "inspectionId") REFERENCES "lashibi"."VehicleInspection"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."InspectionFinding" ADD CONSTRAINT "InspectionFinding_templateItemId_fkey" FOREIGN KEY ("templateItemId") REFERENCES "lashibi"."InspectionTemplateItem"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."InspectionMedia" ADD CONSTRAINT "InspectionMedia_tenantId_inspectionId_fkey" FOREIGN KEY ("tenantId", "inspectionId") REFERENCES "lashibi"."VehicleInspection"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."InspectionMedia" ADD CONSTRAINT "InspectionMedia_tenantId_fileAssetId_fkey" FOREIGN KEY ("tenantId", "fileAssetId") REFERENCES "lashibi"."FileAsset"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."DamageRecord" ADD CONSTRAINT "DamageRecord_tenantId_vehicleId_fkey" FOREIGN KEY ("tenantId", "vehicleId") REFERENCES "lashibi"."Vehicle"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."DamageRecord" ADD CONSTRAINT "DamageRecord_tenantId_inspectionId_fkey" FOREIGN KEY ("tenantId", "inspectionId") REFERENCES "lashibi"."VehicleInspection"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."DamageAssessment" ADD CONSTRAINT "DamageAssessment_tenantId_damageRecordId_fkey" FOREIGN KEY ("tenantId", "damageRecordId") REFERENCES "lashibi"."DamageRecord"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."WorkBay" ADD CONSTRAINT "WorkBay_tenantId_branchId_fkey" FOREIGN KEY ("tenantId", "branchId") REFERENCES "lashibi"."Branch"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."WorkshopJob" ADD CONSTRAINT "WorkshopJob_tenantId_branchId_fkey" FOREIGN KEY ("tenantId", "branchId") REFERENCES "lashibi"."Branch"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."WorkshopJob" ADD CONSTRAINT "WorkshopJob_tenantId_customerId_fkey" FOREIGN KEY ("tenantId", "customerId") REFERENCES "lashibi"."Customer"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."WorkshopJob" ADD CONSTRAINT "WorkshopJob_tenantId_vehicleId_fkey" FOREIGN KEY ("tenantId", "vehicleId") REFERENCES "lashibi"."Vehicle"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."WorkshopJob" ADD CONSTRAINT "WorkshopJob_tenantId_bayId_fkey" FOREIGN KEY ("tenantId", "bayId") REFERENCES "lashibi"."WorkBay"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."WorkshopAssignment" ADD CONSTRAINT "WorkshopAssignment_tenantId_workshopJobId_fkey" FOREIGN KEY ("tenantId", "workshopJobId") REFERENCES "lashibi"."WorkshopJob"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."WorkshopAssignment" ADD CONSTRAINT "WorkshopAssignment_tenantId_technicianId_fkey" FOREIGN KEY ("tenantId", "technicianId") REFERENCES "lashibi"."TechnicianProfile"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."WorkshopEstimate" ADD CONSTRAINT "WorkshopEstimate_tenantId_workshopJobId_fkey" FOREIGN KEY ("tenantId", "workshopJobId") REFERENCES "lashibi"."WorkshopJob"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."WorkshopEstimateLine" ADD CONSTRAINT "WorkshopEstimateLine_tenantId_estimateId_fkey" FOREIGN KEY ("tenantId", "estimateId") REFERENCES "lashibi"."WorkshopEstimate"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."WorkshopJobItem" ADD CONSTRAINT "WorkshopJobItem_tenantId_workshopJobId_fkey" FOREIGN KEY ("tenantId", "workshopJobId") REFERENCES "lashibi"."WorkshopJob"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."Supplier" ADD CONSTRAINT "Supplier_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "lashibi"."Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."Part" ADD CONSTRAINT "Part_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "lashibi"."Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."StockLocation" ADD CONSTRAINT "StockLocation_tenantId_branchId_fkey" FOREIGN KEY ("tenantId", "branchId") REFERENCES "lashibi"."Branch"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."StockBalance" ADD CONSTRAINT "StockBalance_tenantId_partId_fkey" FOREIGN KEY ("tenantId", "partId") REFERENCES "lashibi"."Part"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."StockBalance" ADD CONSTRAINT "StockBalance_tenantId_locationId_fkey" FOREIGN KEY ("tenantId", "locationId") REFERENCES "lashibi"."StockLocation"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."StockMovement" ADD CONSTRAINT "StockMovement_tenantId_partId_fkey" FOREIGN KEY ("tenantId", "partId") REFERENCES "lashibi"."Part"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."StockMovement" ADD CONSTRAINT "StockMovement_tenantId_locationId_fkey" FOREIGN KEY ("tenantId", "locationId") REFERENCES "lashibi"."StockLocation"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."PurchaseOrder" ADD CONSTRAINT "PurchaseOrder_tenantId_supplierId_fkey" FOREIGN KEY ("tenantId", "supplierId") REFERENCES "lashibi"."Supplier"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."PurchaseOrderLine" ADD CONSTRAINT "PurchaseOrderLine_tenantId_purchaseOrderId_fkey" FOREIGN KEY ("tenantId", "purchaseOrderId") REFERENCES "lashibi"."PurchaseOrder"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."PurchaseOrderLine" ADD CONSTRAINT "PurchaseOrderLine_tenantId_partId_fkey" FOREIGN KEY ("tenantId", "partId") REFERENCES "lashibi"."Part"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."GoodsReceipt" ADD CONSTRAINT "GoodsReceipt_tenantId_purchaseOrderId_fkey" FOREIGN KEY ("tenantId", "purchaseOrderId") REFERENCES "lashibi"."PurchaseOrder"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."GoodsReceiptLine" ADD CONSTRAINT "GoodsReceiptLine_tenantId_goodsReceiptId_fkey" FOREIGN KEY ("tenantId", "goodsReceiptId") REFERENCES "lashibi"."GoodsReceipt"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."VehicleSaleListing" ADD CONSTRAINT "VehicleSaleListing_tenantId_vehicleId_fkey" FOREIGN KEY ("tenantId", "vehicleId") REFERENCES "lashibi"."Vehicle"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."SalesLead" ADD CONSTRAINT "SalesLead_tenantId_customerId_fkey" FOREIGN KEY ("tenantId", "customerId") REFERENCES "lashibi"."Customer"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."SalesLead" ADD CONSTRAINT "SalesLead_tenantId_listingId_fkey" FOREIGN KEY ("tenantId", "listingId") REFERENCES "lashibi"."VehicleSaleListing"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."TestDrive" ADD CONSTRAINT "TestDrive_tenantId_customerId_fkey" FOREIGN KEY ("tenantId", "customerId") REFERENCES "lashibi"."Customer"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."TestDrive" ADD CONSTRAINT "TestDrive_tenantId_vehicleId_fkey" FOREIGN KEY ("tenantId", "vehicleId") REFERENCES "lashibi"."Vehicle"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."VehicleSale" ADD CONSTRAINT "VehicleSale_tenantId_customerId_fkey" FOREIGN KEY ("tenantId", "customerId") REFERENCES "lashibi"."Customer"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."VehicleSale" ADD CONSTRAINT "VehicleSale_tenantId_vehicleId_fkey" FOREIGN KEY ("tenantId", "vehicleId") REFERENCES "lashibi"."Vehicle"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."InsurancePolicy" ADD CONSTRAINT "InsurancePolicy_tenantId_vehicleId_fkey" FOREIGN KEY ("tenantId", "vehicleId") REFERENCES "lashibi"."Vehicle"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."InsuranceClaim" ADD CONSTRAINT "InsuranceClaim_tenantId_vehicleId_fkey" FOREIGN KEY ("tenantId", "vehicleId") REFERENCES "lashibi"."Vehicle"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."InsuranceClaim" ADD CONSTRAINT "InsuranceClaim_tenantId_policyId_fkey" FOREIGN KEY ("tenantId", "policyId") REFERENCES "lashibi"."InsurancePolicy"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."ClaimAssessment" ADD CONSTRAINT "ClaimAssessment_tenantId_claimId_fkey" FOREIGN KEY ("tenantId", "claimId") REFERENCES "lashibi"."InsuranceClaim"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."Invoice" ADD CONSTRAINT "Invoice_tenantId_customerId_fkey" FOREIGN KEY ("tenantId", "customerId") REFERENCES "lashibi"."Customer"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."InvoiceLine" ADD CONSTRAINT "InvoiceLine_tenantId_invoiceId_fkey" FOREIGN KEY ("tenantId", "invoiceId") REFERENCES "lashibi"."Invoice"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."PaymentAllocation" ADD CONSTRAINT "PaymentAllocation_tenantId_paymentId_fkey" FOREIGN KEY ("tenantId", "paymentId") REFERENCES "lashibi"."Payment"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."PaymentAllocation" ADD CONSTRAINT "PaymentAllocation_tenantId_invoiceId_fkey" FOREIGN KEY ("tenantId", "invoiceId") REFERENCES "lashibi"."Invoice"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."Refund" ADD CONSTRAINT "Refund_tenantId_paymentId_fkey" FOREIGN KEY ("tenantId", "paymentId") REFERENCES "lashibi"."Payment"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."PaymentProviderTransaction" ADD CONSTRAINT "PaymentProviderTransaction_tenantId_paymentId_fkey" FOREIGN KEY ("tenantId", "paymentId") REFERENCES "lashibi"."Payment"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."TaxSubmission" ADD CONSTRAINT "TaxSubmission_tenantId_invoiceId_fkey" FOREIGN KEY ("tenantId", "invoiceId") REFERENCES "lashibi"."Invoice"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."CommunicationLog" ADD CONSTRAINT "CommunicationLog_tenantId_customerId_fkey" FOREIGN KEY ("tenantId", "customerId") REFERENCES "lashibi"."Customer"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."ApiClient" ADD CONSTRAINT "ApiClient_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "lashibi"."Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."IntegrationConnection" ADD CONSTRAINT "IntegrationConnection_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "lashibi"."Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."WebhookEndpoint" ADD CONSTRAINT "WebhookEndpoint_tenantId_integrationId_fkey" FOREIGN KEY ("tenantId", "integrationId") REFERENCES "lashibi"."IntegrationConnection"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."WebhookDelivery" ADD CONSTRAINT "WebhookDelivery_tenantId_endpointId_fkey" FOREIGN KEY ("tenantId", "endpointId") REFERENCES "lashibi"."WebhookEndpoint"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lashibi"."AiFinding" ADD CONSTRAINT "AiFinding_tenantId_aiRunId_fkey" FOREIGN KEY ("tenantId", "aiRunId") REFERENCES "lashibi"."AiRun"("tenantId", "id") ON DELETE RESTRICT ON UPDATE CASCADE;
