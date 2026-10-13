import { NextResponse } from "next/server";
import { cookies } from "next/headers";
import { getDatabase, hashToken, SESSION_COOKIE } from "../../../../lib/member-auth";
export const runtime = "nodejs";
export const dynamic = "force-dynamic";
export async function POST() {
 const jar = await cookies();
 const token = jar.get(SESSION_COOKIE)?.value;
 if (token) {
  try { const sql = getDatabase(); await sql`DELETE FROM member_sessions WHERE token_hash = ${hashToken(token)}`; }
  catch (error) { console.error("Logout failed", error instanceof Error ? error.message : "unknown_error"); return NextResponse.json({error:"Não foi possível encerrar a sessão."},{status:500}); }
 }
 jar.set(SESSION_COOKIE, "", {httpOnly:true, secure:process.env.NODE_ENV === "production", sameSite:"lax", path:"/", maxAge:0});
 return NextResponse.json({ok:true, redirect:"/login"});
}
