import crypto from "node:crypto";
import { cookies } from "next/headers";
export const ADMIN_COOKIE="ocd_admin_session";
const MAX_AGE=28800;
function signature(payload){const secret=process.env.ADMIN_PANEL_PASSWORD;if(!secret)throw new Error("ADMIN_PANEL_PASSWORD não configurada");return crypto.createHmac("sha256",secret).update(payload).digest("base64url");}
export function safeEqual(a,b){const x=Buffer.from(String(a||"")),y=Buffer.from(String(b||""));return x.length===y.length&&crypto.timingSafeEqual(x,y);}
export function verifyAdminPassword(password){return Boolean(process.env.ADMIN_PANEL_PASSWORD&&typeof password==="string"&&safeEqual(password,process.env.ADMIN_PANEL_PASSWORD));}
export function makeAdminSession(){const payload=String(Date.now()+MAX_AGE*1000);return {value:payload+"."+signature(payload),maxAge:MAX_AGE};}
export function validAdminSession(value){if(!value||!process.env.ADMIN_PANEL_PASSWORD)return false;const [payload,sig,extra]=value.split(".");if(!payload||!sig||extra||!/^\d+$/.test(payload))return false;const exp=Number(payload);return Number.isSafeInteger(exp)&&exp>Date.now()&&exp<=Date.now()+MAX_AGE*1000+60000&&safeEqual(sig,signature(payload));}
export async function isAdminRequest(){try{const jar=await cookies();return validAdminSession(jar.get(ADMIN_COOKIE)?.value);}catch{return false;}}
export function adminCookieOptions(maxAge){return {httpOnly:true,secure:process.env.NODE_ENV==="production",sameSite:"strict",path:"/api/admin",maxAge};}