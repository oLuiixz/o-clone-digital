import { NextResponse } from "next/server";
import { getDatabase, hashPassword, hashToken } from "../../../../lib/member-auth";
export const runtime = "nodejs";
export const dynamic = "force-dynamic";
export async function POST(request) {
 let body; try { body = await request.json(); } catch { return NextResponse.json({error:"Requisição inválida."},{status:400}); }
 const token = typeof body?.token === "string" ? body.token : "";
 const password = typeof body?.password === "string" ? body.password : "";
 if (token.length < 32 || token.length > 200 || password.length < 10 || password.length > 128) return NextResponse.json({error:"Link inválido ou senha fora dos requisitos."},{status:400});
 try {
  const sql=getDatabase();
  const claimed=await sql`UPDATE member_password_reset_tokens SET used_at=now() WHERE token_hash=${hashToken(token)} AND used_at IS NULL AND expires_at>now() RETURNING account_id`;
  if (!claimed.length) return NextResponse.json({error:"Link inválido, expirado ou já utilizado. Solicite outro."},{status:400});
  const accountId=claimed[0].account_id;
  await sql`UPDATE member_accounts SET password_hash=${hashPassword(password)},updated_at=now() WHERE id=${accountId}`;
  await sql`DELETE FROM member_sessions WHERE account_id=${accountId}`;
  return NextResponse.json({ok:true,redirect:"/login"});
 } catch(error) { console.error("Password reset failed",error instanceof Error?error.message:"unknown_error"); return NextResponse.json({error:"Não foi possível redefinir a senha agora."},{status:500}); }
}
