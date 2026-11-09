import { NextResponse } from "next/server";
import {
  hashAdminValue,hashAdminPassword,createAdminOpaqueToken,generateTotpSecret,
  encryptTotpSecret,decryptTotpSecret,verifyTotp,totpUri,generateRecoveryCodes,
  writeAdminSecurityEvent,writeAdminAudit
} from "../../../../lib/admin-auth";
import { getDatabase } from "../../../../lib/member-auth";
export const runtime="nodejs";
export const dynamic="force-dynamic";
export async function POST(request){
  let body;try{body=await request.json()}catch{return NextResponse.json({error:"Requisição inválida."},{status:400});}
  const token=String(body?.token||""),password=String(body?.password||""),code=String(body?.totpCode||"").replace(/\s/g,"");
  if(token.length<30) return NextResponse.json({error:"Convite inválido ou expirado."},{status:400});
  const sql=getDatabase(),tokenHash=hashAdminValue(token);
  try{
    const rows=await sql`SELECT id,email,role,status,password_hash,totp_secret_encrypted
      FROM admin_users WHERE invite_token_hash=${tokenHash} AND invite_expires_at>now() LIMIT 1`;
    const admin=rows[0];
    if(!admin||admin.status!=="pending") return NextResponse.json({error:"Este convite expirou ou já foi utilizado. Solicite um novo convite pelo acesso legado."},{status:410});
    if(!code){
      if(password.length<12||password.length>200) return NextResponse.json({error:"A senha deve ter pelo menos 12 caracteres."},{status:400});
      const secret=generateTotpSecret();
      await sql`UPDATE admin_users SET password_hash=${hashAdminPassword(password)},totp_secret_encrypted=${encryptTotpSecret(secret)},updated_at=now() WHERE id=${admin.id}`;
      await writeAdminSecurityEvent({adminId:admin.id,email:admin.email,eventType:"owner_password_created",success:true,request});
      return NextResponse.json({step:"totp_setup",secret,otpauthUrl:totpUri(secret,admin.email)});
    }
    if(!admin.password_hash||!admin.totp_secret_encrypted) return NextResponse.json({error:"Defina primeiro sua senha para configurar o autenticador."},{status:409});
    let valid=false;try{valid=verifyTotp(decryptTotpSecret(admin.totp_secret_encrypted),code);}catch{}
    if(!valid) return NextResponse.json({error:"Código incorreto. Confira o horário do celular e tente novamente."},{status:401});
    const recoveryCodes=generateRecoveryCodes(10);
    await sql`UPDATE admin_users SET status='active',totp_enabled_at=now(),invite_token_hash=NULL,invite_expires_at=NULL,updated_at=now() WHERE id=${admin.id}`;
    for(const recovery of recoveryCodes){
      await sql`INSERT INTO admin_recovery_codes(admin_id,code_hash) VALUES(${admin.id},${hashAdminValue(recovery)})`;
    }
    await writeAdminSecurityEvent({adminId:admin.id,email:admin.email,eventType:"owner_activated",success:true,request});
    await writeAdminAudit({adminId:admin.id,email:admin.email,action:"owner_account_activated",targetType:"admin_user",targetId:admin.id});
    return NextResponse.json({step:"complete",email:admin.email,recoveryCodes});
  }catch(error){
    console.error("Admin activation failed",error instanceof Error?error.message:"unknown_error");
    return NextResponse.json({error:"Não foi possível ativar a conta. Tente novamente."},{status:500});
  }
}
