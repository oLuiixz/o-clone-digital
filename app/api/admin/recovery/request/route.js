import { NextResponse } from "next/server";
import { getDatabase, normalizeEmail } from "../../../../lib/member-auth";
import { createAdminOpaqueToken, hashAdminValue, writeAdminSecurityEvent } from "../../../../lib/admin-auth";
import { sendResendEmail } from "../../../../lib/resend-email";
export const runtime="nodejs";
export const dynamic="force-dynamic";
const OWNER_EMAIL="luizfernandogxp19@gmail.com";
export async function POST(request){
  let body; try{body=await request.json();}catch{return NextResponse.json({error:"Requisição inválida."},{status:400});}
  const email=normalizeEmail(body?.email);
  if(email!==OWNER_EMAIL) return NextResponse.json({message:"Se a conta Owner corresponder ao e-mail informado, enviaremos um link de recuperação."});
  try{
    const sql=getDatabase();
    const ip=(request.headers.get("x-forwarded-for")||request.headers.get("x-real-ip")||"unknown").split(",")[0].trim();
    const subject=hashAdminValue(ip+"|"+email);
    const limits=await sql`INSERT INTO auth_rate_limits(scope,subject_hash,window_started_at,attempts,blocked_until)
      VALUES('owner_password_recovery',${subject},now(),1,NULL)
      ON CONFLICT(scope,subject_hash) DO UPDATE SET
      attempts=CASE WHEN auth_rate_limits.window_started_at<now()-interval '30 minutes' THEN 1 ELSE auth_rate_limits.attempts+1 END,
      window_started_at=CASE WHEN auth_rate_limits.window_started_at<now()-interval '30 minutes' THEN now() ELSE auth_rate_limits.window_started_at END,
      blocked_until=CASE WHEN auth_rate_limits.window_started_at<now()-interval '30 minutes' THEN NULL WHEN auth_rate_limits.attempts+1>=3 THEN now()+interval '30 minutes' ELSE auth_rate_limits.blocked_until END,
      updated_at=now() RETURNING attempts,blocked_until`;
    if(limits[0]?.blocked_until && new Date(limits[0].blocked_until)>new Date()) return NextResponse.json({error:"Muitas solicitações. Aguarde 30 minutos."},{status:429});
    const rows=await sql`SELECT id FROM admin_users WHERE email=${OWNER_EMAIL} AND role='owner' AND status='active' AND totp_enabled_at IS NOT NULL LIMIT 1`;
    if(!rows.length) return NextResponse.json({message:"Se a conta Owner corresponder ao e-mail informado, enviaremos um link de recuperação."});
    const token=createAdminOpaqueToken(), expires=new Date(Date.now()+15*60*1000).toISOString();
    await sql`UPDATE admin_users SET invite_token_hash=${hashAdminValue(token)},invite_expires_at=${expires},updated_at=now() WHERE id=${rows[0].id}`;
    const base=(process.env.NEXT_PUBLIC_APP_URL||"https://oclonedigital.xyz").replace(/\/$/,"");
    const url=base+"/admin/recuperar?token="+encodeURIComponent(token);
    await sendResendEmail({to:OWNER_EMAIL,subject:"Recuperação segura do acesso Owner - O Clone Digital",
      text:"Foi solicitada a redefinição da senha do painel Owner. Acesse "+url+" . O link expira em 15 minutos e só pode ser usado uma vez. Seu 2FA continuará ativo.",
      html:"<div style='font-family:Arial;background:#101014;color:#fff;padding:32px'><h1>Recuperar acesso Owner</h1><p>Use o link abaixo para redefinir a senha do painel. Seu autenticador 2FA continuará ativo.</p><p><a style='display:inline-block;padding:14px 20px;background:#e9232b;color:white;text-decoration:none;border-radius:8px' href='"+url+"'>Redefinir senha</a></p><p>Link válido por 15 minutos e de uso único.</p></div>"});
    await writeAdminSecurityEvent({adminId:rows[0].id,email:OWNER_EMAIL,eventType:"owner_password_reset_requested",success:true,request});
    return NextResponse.json({message:"Se a conta Owner corresponder ao e-mail informado, enviaremos um link de recuperação."});
  }catch(error){console.error("Owner password recovery request failed",error instanceof Error?error.message:"unknown_error");return NextResponse.json({error:"Não foi possível enviar a recuperação agora. Verifique o serviço de e-mail."},{status:503});}
}