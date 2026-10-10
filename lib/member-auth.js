import crypto from "node:crypto";
import { neon } from "@neondatabase/serverless";
import { cookies } from "next/headers";

export const SESSION_COOKIE = "ocd_member_session";
export const SESSION_MAX_AGE_SECONDS = 60 * 60 * 24 * 30;

export function getDatabase() {
  const url = process.env.DATABASE_URL;
  if (!url) throw new Error("DATABASE_URL is not configured");
  return neon(url);
}

export function normalizeEmail(value) {
  return typeof value === "string" ? value.trim().toLowerCase() : "";
}

export function hashToken(value) {
  return crypto.createHash("sha256").update(value).digest("hex");
}

export function createOpaqueToken() {
  return crypto.randomBytes(32).toString("base64url");
}

export function hashPassword(password) {
  const salt = crypto.randomBytes(16).toString("hex");
  const derived = crypto.scryptSync(password, salt, 64).toString("hex");
  return `scrypt:${salt}:${derived}`;
}

export function verifyPassword(password, stored) {
  if (typeof stored !== "string") return false;
  const [algorithm, salt, expectedHex] = stored.split(":");
  if (algorithm !== "scrypt" || !salt || !/^[a-f0-9]{128}$/i.test(expectedHex || "")) return false;
  const actual = crypto.scryptSync(password, salt, 64);
  const expected = Buffer.from(expectedHex, "hex");
  return actual.length === expected.length && crypto.timingSafeEqual(actual, expected);
}

export async function hasActiveAccess(email) {
  const sql = getDatabase();
  const rows = await sql`
    SELECT 1 FROM entitlements e
    JOIN products p ON p.id = e.product_id AND p.is_active = true
    JOIN orders o ON o.id = e.order_id AND o.status = 'approved'
    WHERE lower(e.customer_email) = ${normalizeEmail(email)}
      AND e.status = 'active'
    LIMIT 1
  `;
  return rows.length > 0;
}

export async function createSession(accountId) {
  const token = createOpaqueToken();
  const tokenHash = hashToken(token);
  const expiresAt = new Date(Date.now() + SESSION_MAX_AGE_SECONDS * 1000).toISOString();
  const sql = getDatabase();
  await sql`INSERT INTO member_sessions (account_id, token_hash, expires_at)
    VALUES (${accountId}, ${tokenHash}, ${expiresAt})`;
  const jar = await cookies();
  jar.set(SESSION_COOKIE, token, {
    httpOnly: true,
    secure: process.env.NODE_ENV === "production",
    sameSite: "lax",
    path: "/",
    maxAge: SESSION_MAX_AGE_SECONDS,
  });
}

export async function getCurrentMember() {
  try {
    const jar = await cookies();
    const token = jar.get(SESSION_COOKIE)?.value;
    if (!token) return null;
    const sql = getDatabase();
    const rows = await sql`
      SELECT a.id, a.email
      FROM member_sessions s
      JOIN member_accounts a ON a.id = s.account_id
      WHERE s.token_hash = ${hashToken(token)}
        AND s.expires_at > now()
        AND a.email_verified_at IS NOT NULL
      LIMIT 1
    `;
    if (!rows.length || !(await hasActiveAccess(rows[0].email))) return null;
    return rows[0];
  } catch (error) {
    console.error("Member session lookup failed", error instanceof Error ? error.message : "unknown_error");
    return null;
  }
}
