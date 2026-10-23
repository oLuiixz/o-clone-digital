import crypto from "node:crypto";
import { generateAuthenticationOptions, generateRegistrationOptions, verifyAuthenticationResponse, verifyRegistrationResponse } from "@simplewebauthn/server";
import { getAppBaseUrl, getDatabase, createSession, hasActiveAccess } from "./member-auth";

export function passkeyConfig() {
  const origin = getAppBaseUrl();
  if (!origin) throw new Error("Configure NEXT_PUBLIC_APP_URL com a origem HTTPS oficial.");
  return { origin, rpID: new URL(origin).hostname };
}
export function jsonError(error, status = 400) { return Response.json({ error }, { status }); }
export async function requirePasskeyMember() { const { getCurrentMember } = await import("./member-auth"); return getCurrentMember(); }
async function issueChallenge(challenge, accountId, purpose) {
  const sql = getDatabase();
  await sql`DELETE FROM member_passkey_challenges WHERE expires_at < now() OR consumed_at IS NOT NULL`;
  await sql`INSERT INTO member_passkey_challenges (challenge_hash, account_id, purpose, expires_at) VALUES (${crypto.createHash("sha256").update(challenge).digest("hex")}, ${accountId || null}, ${purpose}, now() + interval '5 minutes')`;
}
async function consumeChallenge(challenge, purpose, accountId) {
  if (!challenge) return false;
  const digest = crypto.createHash("sha256").update(challenge).digest("hex");
  const sql = getDatabase();
  const rows = await sql`UPDATE member_passkey_challenges SET consumed_at = now() WHERE challenge_hash = ${digest} AND purpose = ${purpose} AND consumed_at IS NULL AND expires_at > now() AND account_id IS NOT DISTINCT FROM ${accountId || null}::uuid RETURNING id`;
  return rows.length === 1;
}
export async function listPasskeys(member) {
  const sql = getDatabase();
  return sql`SELECT id, label, created_at, last_used_at, device_type, backed_up FROM member_passkeys WHERE account_id = ${member.id} ORDER BY created_at DESC`;
}
export async function registrationOptions(member) {
  const { rpID } = passkeyConfig(); const sql = getDatabase();
  const existing = await sql`SELECT credential_id, transports FROM member_passkeys WHERE account_id = ${member.id}`;
  const options = await generateRegistrationOptions({ rpName: "O Clone Digital", rpID, userName: member.email, userDisplayName: member.display_name || member.email, userID: new TextEncoder().encode(String(member.id)), attestationType: "none", authenticatorSelection: { residentKey: "preferred", userVerification: "required" }, excludeCredentials: existing.map(row => ({ id: row.credential_id, type: "public-key", transports: row.transports || [] })), timeout: 60000 });
  await issueChallenge(options.challenge, member.id, "registration"); return options;
}
export async function verifyRegistration(member, response, label) {
  const { origin, rpID } = passkeyConfig();
  let challenge; try { challenge = JSON.parse(Buffer.from(response.response.clientDataJSON, "base64url").toString()).challenge; } catch { throw new Error("Resposta da chave inválida."); }
  if (!(await consumeChallenge(challenge, "registration", member.id))) throw new Error("Desafio expirado ou já utilizado. Tente novamente.");
  const result = await verifyRegistrationResponse({ response, expectedChallenge: challenge, expectedOrigin: origin, expectedRPID: rpID, requireUserVerification: true });
  if (!result.verified || !result.registrationInfo) throw new Error("Não foi possível validar a chave de acesso.");
  const info = result.registrationInfo; const credential = info.credential || { id: info.credentialID ? Buffer.from(info.credentialID).toString("base64url") : response.id, publicKey: info.credentialPublicKey, counter: info.counter, transports: response.response.transports || [] };
  if (!credential.id || !credential.publicKey) throw new Error("Credencial WebAuthn incompleta.");
  const sql = getDatabase();
  await sql`INSERT INTO member_passkeys (account_id, credential_id, public_key, counter, transports, device_type, backed_up, label) VALUES (${member.id}, ${credential.id}, ${Buffer.from(credential.publicKey).toString("base64url")}, ${credential.counter || 0}, ${credential.transports || []}, ${info.credentialDeviceType || null}, ${Boolean(info.credentialBackedUp)}, ${String(label || "Minha chave de acesso").trim().slice(0,80)})`;
}
export async function authenticationOptions(email) {
  const normalized = typeof email === "string" ? email.trim().toLowerCase() : "";
  if (!normalized || normalized.length > 254) throw new Error("Informe o e-mail da sua conta.");
  const sql = getDatabase(); const accounts = await sql`SELECT id, email, email_verified_at FROM member_accounts WHERE lower(email) = ${normalized} LIMIT 1`;
  if (!accounts.length || !accounts[0].email_verified_at) throw new Error("Confira o e-mail ou entre com sua senha.");
  const account = accounts[0]; const rows = await sql`SELECT credential_id, transports FROM member_passkeys WHERE account_id = ${account.id}`;
  if (!rows.length) throw new Error("Esta conta ainda não tem chave de acesso cadastrada. Entre com sua senha.");
  const { rpID } = passkeyConfig(); const options = await generateAuthenticationOptions({ rpID, userVerification: "required", timeout: 60000, allowCredentials: rows.map(row => ({ id: row.credential_id, type: "public-key", transports: row.transports || [] })) });
  await issueChallenge(options.challenge, account.id, "authentication"); return options;
}
export async function verifyAuthentication(email, response) {
  const normalized = typeof email === "string" ? email.trim().toLowerCase() : ""; const sql = getDatabase();
  const accounts = await sql`SELECT id, email, email_verified_at FROM member_accounts WHERE lower(email) = ${normalized} LIMIT 1`;
  if (!accounts.length || !accounts[0].email_verified_at) throw new Error("Não foi possível validar a chave de acesso.");
  const account = accounts[0]; const rows = await sql`SELECT id, credential_id, public_key, counter, transports FROM member_passkeys WHERE account_id = ${account.id} AND credential_id = ${response?.id} LIMIT 1`;
  if (!rows.length) throw new Error("Chave de acesso não reconhecida.");
  let challenge; try { challenge = JSON.parse(Buffer.from(response.response.clientDataJSON, "base64url").toString()).challenge; } catch { throw new Error("Resposta da chave inválida."); }
  if (!(await consumeChallenge(challenge, "authentication", account.id))) throw new Error("Desafio expirado ou já utilizado. Tente novamente.");
  const { origin, rpID } = passkeyConfig(); const row = rows[0];
  const result = await verifyAuthenticationResponse({ response, expectedChallenge: challenge, expectedOrigin: origin, expectedRPID: rpID, credential: { id: row.credential_id, publicKey: Buffer.from(row.public_key, "base64url"), counter: Number(row.counter), transports: row.transports || [] }, requireUserVerification: true });
  if (!result.verified) throw new Error("Não foi possível validar a chave de acesso.");
  if (!(await hasActiveAccess(account.email))) throw new Error("Sua conta não possui acesso ativo à plataforma.");
  await sql`UPDATE member_passkeys SET counter = ${result.authenticationInfo.newCounter}, last_used_at = now() WHERE id = ${row.id}`;
  await createSession(account.id);
}
