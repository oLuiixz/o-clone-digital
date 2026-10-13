import { NextResponse } from "next/server";
import { ADMIN_COOKIE,adminCookieOptions,makeAdminSession,verifyAdminPassword,isAdminRequest } from "../../../../lib/admin-auth";
export const runtime="nodejs";
export const dynamic="force-dynamic";

// Best-effort per-instance throttle. A durable cross-instance limiter would require
// a database/Redis table; this protects against rapid repeated guesses on warm instances.
const LOGIN_WINDOW_MS = 15 * 60 * 1000;
const LOGIN_MAX_ATTEMPTS = 5;
const loginAttempts = new Map();
function requestKey(request) {
  const forwarded = request.headers.get("x-forwarded-for");
  const ip = forwarded ? forwarded.split(",").map((part) => part.trim()).filter(Boolean).at(-1) : "";
  return ip || request.headers.get("x-real-ip") || "unknown";
}
function pruneLoginAttempts(now) {
  for (const [key, entry] of loginAttempts) {
    if (now - entry.windowStart >= LOGIN_WINDOW_MS) loginAttempts.delete(key);
  }
  // Keep memory bounded if the endpoint is hit with many distinct addresses.
  while (loginAttempts.size > 5000) loginAttempts.delete(loginAttempts.keys().next().value);
}
export async function GET(){return NextResponse.json({authenticated:await isAdminRequest()});}
export async function POST(request){
  if(!process.env.ADMIN_PANEL_PASSWORD)return NextResponse.json({error:"Configure ADMIN_PANEL_PASSWORD nas variáveis da Vercel."},{status:503});
  const now=Date.now();pruneLoginAttempts(now);
  const key=requestKey(request);
  let attempt=loginAttempts.get(key);
  if(!attempt||now-attempt.windowStart>=LOGIN_WINDOW_MS){attempt={windowStart:now,count:0,blockedUntil:0};loginAttempts.set(key,attempt);}
  if(attempt.blockedUntil>now){const retryAfter=Math.max(1,Math.ceil((attempt.blockedUntil-now)/1000));return NextResponse.json({error:"Muitas tentativas. Tente novamente em alguns minutos."},{status:429,headers:{"Retry-After":String(retryAfter)}});}
  let body;try{body=await request.json();}catch{return NextResponse.json({error:"Requisição inválida."},{status:400});}
  if(!verifyAdminPassword(body?.password)){
    attempt.count+=1;
    if(attempt.count>=LOGIN_MAX_ATTEMPTS)attempt.blockedUntil=now+LOGIN_WINDOW_MS;
    return NextResponse.json({error:attempt.blockedUntil>now?"Muitas tentativas. Tente novamente em 15 minutos.":"Senha incorreta."},{status:attempt.blockedUntil>now?429:401,headers:attempt.blockedUntil>now?{"Retry-After":String(Math.ceil((attempt.blockedUntil-now)/1000))}:{}});
  }
  loginAttempts.delete(key);
  const s=makeAdminSession();const response=NextResponse.json({authenticated:true});response.cookies.set(ADMIN_COOKIE,s.value,adminCookieOptions(s.maxAge));return response;
}
export async function DELETE(){const response=NextResponse.json({authenticated:false});response.cookies.set(ADMIN_COOKIE,"",adminCookieOptions(0));return response;}