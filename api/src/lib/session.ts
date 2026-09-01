import jwt from "jsonwebtoken";
import type { Response } from "express";

const COOKIE_NAME = "lashibi_session";
const SESSION_TTL_SECONDS = 8 * 60 * 60; // 8 hours, matches prototype's absoluteExpiry

export interface SessionClaims {
  sub: string; // lashibi User.id
  tenantId: string;
  authUserId: string; // Supabase auth.users id, kept for audit trail
}

function getSecret(): string {
  const secret = process.env.SESSION_JWT_SECRET;
  if (!secret) throw new Error("SESSION_JWT_SECRET is not set");
  return secret;
}

export function signSession(claims: SessionClaims): string {
  return jwt.sign(claims, getSecret(), { expiresIn: SESSION_TTL_SECONDS });
}

export function verifySession(token: string): SessionClaims {
  return jwt.verify(token, getSecret()) as SessionClaims;
}

export function setSessionCookie(res: Response, token: string): void {
  res.cookie(COOKIE_NAME, token, {
    httpOnly: true,
    secure: process.env.NODE_ENV === "production",
    sameSite: "lax",
    maxAge: SESSION_TTL_SECONDS * 1000,
    path: "/",
  });
}

export function clearSessionCookie(res: Response): void {
  res.clearCookie(COOKIE_NAME, { path: "/" });
}

export { COOKIE_NAME };
