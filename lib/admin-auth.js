import crypto from "node:crypto";
import { cookies } from "next/headers";
import { getDatabase, hashPassword, verifyPassword, normalizeEmail } from "./member-auth";

export const ADMIN_COOKIE = "ocd_admin_session";
const LEGACY_MAX_AGE = 28800;
const SESSION_MAX_AGE = 60 * 60 * 12;

export function safeEqual(a,b) {
  const x=Buffer.from(String(a||"")), y=Buffer.from(String(b||""));
  return x.length===y.length && crypto.timingSafeEqual(x,y);
}
function legacySignature(payload) {
  const secret=process.env.ADMIN_PANEL_PASSWORD;
  if(!secret) throw new Error("ADMIN_PANEL_PASSWORD não configurada");
  return crypto.createHmac("sha256",secret).update(payload).digest("base64url");
}
export function verifyAdminPassword(password) {
  return Boolean(process.env.ADMIN_PANEL_PASSWORD && typeof password==="string" && safeEqual(password,process.env.ADMIN_PANEL_PASSWORD));
}
export function makeAdminSession() {
  const payload=String(Date.now()+LEGACY_MAX_AGE*1000);
  return {value:payload+"."+legacySignature(payload),maxAge:LEGACY_MAX_AGE};
}
function validLegacySession(value) {
  if(!value||!process.env.ADMIN_PANEL_PASSWORD) return false;
  const [payload,sig,extra]=value.split(".");
  if(!payload||!sig||extra||!/^\d+$/.test(payload)) return false;
  const exp=Number(payload);
  return Number.isSafeInteger(exp)&&exp>Date.now()&&exp<=Date.now()+LEGACY_MAX_AGE*1000+60000&&safeEqual(sig,legacySignature(payload));
}
export function adminCookieOptions(maxAge) {
  return {httpOnly:true,secure:process.env.NODE_ENV==="production",sameSite:"strict",path:"/api/admin",maxAge};
}
export function hashAdminValue(value) {
  return crypto.createHash("sha256").update(String(value)).digest("hex");
}
export function createAdminOpaqueToken() {
  return crypto.randomBytes(32).toString("base64url");
}
export function hashAdminPassword(value) {
  const salt=crypto.randomBytes(16).toString("hex");
  const derived=crypto.scryptSync(value,salt,64).toString("hex");
  return "scrypt:"+salt+":"+derived;
}
export function verifyAdminPasswordHash(value,stored) {
  if(typeof stored!=="string") return false;
  const [algorithm,salt,expectedHex]=stored.split(":");
  if(algorithm!=="scrypt"||!salt||!(/^[a-f0-9]{128}$/i).test(expectedHex||"")) return false;
  const actual=crypto.scryptSync(value,salt,64), expected=Buffer.from(expectedHex,"hex");
  return actual.length===expected.length&&crypto.timingSafeEqual(actual,expected);
}
function encryptionKey() {
  const raw=process.env.ADMIN_TOTP_ENCRYPTION_KEY?.trim();
  if(!raw) throw new Error("ADMIN_TOTP_ENCRYPTION_KEY não configurada");
  const key=Buffer.from(raw,"base64");
  if(key.length!==32) throw new Error("ADMIN_TOTP_ENCRYPTION_KEY deve ser Base64 de 32 bytes");
  return key;
}
export function encryptTotpSecret(secret) {
  const iv=crypto.randomBytes(12), cipher=crypto.createCipheriv("aes-256-gcm",encryptionKey(),iv);
  const encrypted=Buffer.concat([cipher.update(secret,"utf8"),cipher.final()]);
  return [iv.toString("base64url"),cipher.getAuthTag().toString("base64url"),encrypted.toString("base64url")].join(".");
}
export function decryptTotpSecret(value) {
  const [iv,tag,data]=String(value||"").split(".");
  if(!iv||!tag||!data) throw new Error("Segredo 2FA inválido");
  const decipher=crypto.createDecipheriv("aes-256-gcm",encryptionKey(),Buffer.from(iv,"base64url"));
  decipher.setAuthTag(Buffer.from(tag,"base64url"));
  return Buffer.concat([decipher.update(Buffer.from(data,"base64url")),decipher.final()]).toString("utf8");
}
const BASE32="ABCDEFGHIJKLMNOPQRSTUVWXYZ234567";
export function generateTotpSecret() {
  const bytes=crypto.randomBytes(20); let bits=0,value=0,out="";
  for(const byte of bytes){value=(value<<8)|byte;bits+=8;while(bits>=5){out+=BASE32[(value>>>(bits-5))&31];bits-=5;}}
  if(bits) out+=BASE32[(value<<(5-bits))&31];
  return out;
}
function decodeBase32(value) {
  let bits=0,buffer=0; const out=[];
  for(const char of String(value).replace(/=+$/,"").toUpperCase()){
    const idx=BASE32.indexOf(char); if(idx<0) throw new Error("Segredo TOTP inválido");
    buffer=(buffer<<5)|idx; bits+=5;
    if(bits>=8){out.push((buffer>>>(bits-8))&255);bits-=8;}
  }
  return Buffer.from(out);
}
export function verifyTotp(secret,code,now=Date.now()) {
  const clean=String(code||"").replace(/\s/g,"");
  if(!/^\d{6}$/.test(clean)) return false;
  const key=decodeBase32(secret);
  for(let drift=-1;drift<=1;drift++){
    const counter=Math.floor(now/30000)+drift, msg=Buffer.alloc(8);
    msg.writeBigUInt64BE(BigInt(counter));
    const digest=crypto.createHmac("sha1",key).update(msg).digest();
    const offset=digest[digest.length-1]&15;
    const binary=((digest[offset]&127)<<24)|((digest[offset+1]&255)<<16)|((digest[offset+2]&255)<<8)|(digest[offset+3]&255);
    const otp=String(binary%1000000).padStart(6,"0");
    if(safeEqual(otp,clean)) return true;
  }
  return false;
}
export function totpUri(secret,email) {
  const label=encodeURIComponent("O Clone Digital:"+email);
  return "otpauth://totp/"+label+"?secret="+secret+"&issuer=O%20Clone%20Digital&algorithm=SHA1&digits=6&period=30";
}
export function generateRecoveryCodes(count=10) {
  return Array.from({length:count},()=>crypto.randomBytes(5).toString("hex").toUpperCase().match(/.{1,5}/g).join("-"));
}
export async function getCurrentAdmin() {
  try {
    const jar=await cookies(), token=jar.get(ADMIN_COOKIE)?.value;
    if(!token) return null;
    const sql=getDatabase();
    const rows=await sql`SELECT u.id,u.email,u.role,u.permissions,s.id AS session_id
      FROM admin_sessions s JOIN admin_users u ON u.id=s.admin_id
      WHERE s.token_hash=${hashAdminValue(token)} AND s.expires_at>now()
        AND s.revoked_at IS NULL AND u.status='active' AND u.totp_enabled_at IS NOT NULL
      LIMIT 1`;
    if(!rows.length) return null;
    await sql`UPDATE admin_sessions SET last_seen_at=now() WHERE id=${rows[0].session_id} AND last_seen_at<now()-interval '5 minutes'`;
    return rows[0];
  } catch(error) {
    console.error("Admin session lookup failed",error instanceof Error?error.message:"unknown_error");
    return null;
  }
}
export async function isAdminRequest() {
  if(await getCurrentAdmin()) return true;
  try {
    const jar=await cookies(), token=jar.get(ADMIN_COOKIE)?.value;
    if(!validLegacySession(token)||!process.env.ADMIN_PANEL_PASSWORD) return false;
    const sql=getDatabase();
    const rows=await sql`SELECT 1 FROM admin_users WHERE status='active' AND totp_enabled_at IS NOT NULL LIMIT 1`;
    return rows.length===0;
  } catch { return false; }
}
export async function createAdminSession(adminId,request) {
  const token=createAdminOpaqueToken(), sql=getDatabase();
  const ua=(request?.headers?.get("user-agent")||"").slice(0,500);
  const forwarded=request?.headers?.get("x-forwarded-for")||"";
  const ip=forwarded.split(",")[0]?.trim()||request?.headers?.get("x-real-ip")||"";
  const ipHash=ip?hashAdminValue(ip):null;
  const device=ua.includes("Edg/")?"Microsoft Edge":ua.includes("Chrome/")?"Chrome":ua.includes("Firefox/")?"Firefox":ua.includes("Safari/")?"Safari":"Navegador";
  await sql`INSERT INTO admin_sessions(admin_id,token_hash,expires_at,user_agent,ip_hash,device_label)
    VALUES(${adminId},${hashAdminValue(token)},now()+interval '12 hours',${ua||null},${ipHash},${device})`;
  return {value:token,maxAge:SESSION_MAX_AGE};
}
export async function revokeCurrentAdminSession() {
  try {
    const jar=await cookies(), token=jar.get(ADMIN_COOKIE)?.value;
    if(!token) return;
    const sql=getDatabase();
    await sql`UPDATE admin_sessions SET revoked_at=now() WHERE token_hash=${hashAdminValue(token)} AND revoked_at IS NULL`;
  } catch {}
}
export async function writeAdminSecurityEvent({adminId=null,email=null,eventType,success=false,request=null,metadata={}}) {
  try {
    const sql=getDatabase(), forwarded=request?.headers?.get("x-forwarded-for")||"";
    const ip=forwarded.split(",")[0]?.trim()||request?.headers?.get("x-real-ip")||"";
    const ua=(request?.headers?.get("user-agent")||"").slice(0,500);
    await sql`INSERT INTO auth_security_events(admin_id,email,event_type,success,ip_hash,user_agent,metadata)
      VALUES(${adminId},${email},${eventType},${success},${ip?hashAdminValue(ip):null},${ua||null},${JSON.stringify(metadata)}::jsonb)`;
  } catch(error) { console.error("Admin security event failed",error instanceof Error?error.message:"unknown_error"); }
}
export async function writeAdminAudit({adminId=null,email=null,action,targetType=null,targetId=null,metadata={}}) {
  try {
    const sql=getDatabase();
    await sql`INSERT INTO admin_audit_logs(actor_admin_id,actor_email,action,target_type,target_id,metadata)
      VALUES(${adminId},${email},${action},${targetType},${targetId},${JSON.stringify(metadata)}::jsonb)`;
  } catch(error) { console.error("Admin audit write failed",error instanceof Error?error.message:"unknown_error"); }
}
export { hashPassword, verifyPassword, normalizeEmail };
