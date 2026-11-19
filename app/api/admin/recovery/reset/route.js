import { NextResponse } from "next/server";
import { getDatabase } from "../../../../lib/member-auth";
import { hashAdminPassword, hashAdminValue, writeAdminSecurityEvent, writeAdminAudit } from "../../../../lib/admin-auth";
export const runtime="nodejs";
export const dynamic="force-dynamic";
const OWNER_EMAIL="luizfernandogxp19@gmail.com";
export async function POST(request){
  let body;try{body=await request.json();}catch{return NextResponse.json({error:"Requisição inválida."},{status:400});}
  const token=String(body?.token||""),password=String(body?.password||"");
  if(token.length<30||token.length>200||password.length<12||password.length>200) return NextResponse.json({error:"Link inválido ou expirado. A senha deve ter pelo menos 12 caracteres."},{status:400});
  try{
    const sql=getDatabase(), tokenHash=hashAdminValue(token), passwordHash=hashAdminPassword(password);
    const changed=await sql`WITH claimed AS (
      UPDATE admin_users SET invite_token_hash=NULL,invite_expires_at=NULL, password_hash=${passwordHash},updated_at=now()
      WHERE email=${OWNER_EMAIL} AND role='owner' AND status='active' AND totp_enabled_at IS NOT NULL
      AND invite_token_hash=${tokenHash} AND invite_expires_at>now()
      RETURNING id,email
    ), revoked AS (
      UPDATE admin_sessions SET revoked_at=now() FROM claimed
      WHERE admin_sessions.admin_id=claimed.id AND admin_sessions.revoked_at IS NULL
      RETURNING admin_sessions.id
    ) SELECT id,email FROM claimed`;
    if(!changed.length) return NextResponse.json({error:"Link inválido, expirado ou já utilizado. Solicite outro."},{status:400});
    await writeAdminSecurityEvent({adminId:changed[0].id,email:OWNER_EMAIL,eventType:"owner_password_reset_completed",success:true,request});
    await writeAdminAudit({adminId:changed[0].id,email:OWNER_EMAIL,action:"owner_password_reset",targetType:"admin_user",targetId:changed[0].id,metadata:{sessions_revoked:true,totp_preserved:true}});
    return NextResponse.json({ok:true,message:"Senha redefinida. Entre com a nova senha e seu código 2FA."});
  }catch(error){console.error("Owner password reset failed",error instanceof Error?error.message:"unknown_error");return NextResponse.json({error:"Não foi possível redefinir a senha agora."},{status:500});}
}