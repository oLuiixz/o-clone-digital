import { NextResponse } from "next/server";
import {
  ADMIN_COOKIE,adminCookieOptions,makeAdminSession,verifyAdminPassword,
  getCurrentAdmin,createAdminSession,verifyAdminPasswordHash,verifyTotp,
  decryptTotpSecret,hashAdminValue,createAdminOpaqueToken,writeAdminSecurityEvent,
  revokeCurrentAdminSession,isAdminRequest
} from "../../../../lib/admin-auth";
import { getDatabase,normalizeEmail } from "../../../../lib/member-auth";
import { sendResendEmail } from "../../../../lib/resend-email";
export const runtime="nodejs";
export const dynamic="force-dynamic";

function requestIp(request){
  const forwarded=request.headers.get("x-forwarded-for")||"";
  return forwarded.split(",")[0]?.trim()||request.headers.get("x-real-ip")||"unknown";
}
async function rateLimit(request,scope="admin_login"){
  const sql=getDatabase(), subject=hashAdminValue(requestIp(request));
  const rows=await sql`INSERT INTO auth_rate_limits(scope,subject_hash,window_started_at,attempts,blocked_until)
    VALUES(${scope},${subject},now(),1,NULL)
    ON CONFLICT(scope,subject_hash) DO UPDATE SET
      attempts=CASE WHEN auth_rate_limits.window_started_at < now()-interval '15 minutes' THEN 1 ELSE auth_rate_limits.attempts+1 END,
      window_started_at=CASE WHEN auth_rate_limits.window_started_at < now()-interval '15 minutes' THEN now() ELSE auth_rate_limits.window_started_at END,
      blocked_until=CASE WHEN auth_rate_limits.window_started_at < now()-interval '15 minutes' THEN NULL
        WHEN auth_rate_limits.attempts+1>=5 THEN now()+interval '15 minutes' ELSE auth_rate_limits.blocked_until END,
      updated_at=now()
    RETURNING attempts,blocked_until`;
  return rows[0];
}
async function inviteOwner(request){
  const sql=getDatabase();
  const active=await sql`SELECT 1 FROM admin_users WHERE status='active' AND totp_enabled_at IS NOT NULL LIMIT 1`;
  if(active.length) return {error:"O acesso legado foi encerrado. Entre com seu e-mail, senha e código 2FA."};
  if(!process.env.ADMIN_PANEL_PASSWORD) return {error:"Configure temporariamente ADMIN_PANEL_PASSWORD para iniciar a conta Owner."};
  const email="luizfernandogxp19@gmail.com";
  const existing=await sql`SELECT id,status FROM admin_users WHERE email=${email} LIMIT 1`;
  if(existing[0]?.status==="disabled") return {error:"A conta Owner está desativada. É necessária uma recuperação administrativa."};
  const token=createAdminOpaqueToken(), tokenHash=hashAdminValue(token);
  const expiry=new Date(Date.now()+30*60*1000).toISOString();
  if(existing.length){
    await sql`UPDATE admin_users SET role='owner',status='pending',invite_token_hash=${tokenHash},invite_expires_at=${expiry},invited_at=now(),updated_at=now() WHERE id=${existing[0].id}`;
  } else {
    await sql`INSERT INTO admin_users(email,role,status,permissions,invite_token_hash,invite_expires_at,invited_at)
      VALUES(${email},'owner','pending','{}'::jsonb,${tokenHash},${expiry},now())`;
  }
  const base=(process.env.NEXT_PUBLIC_APP_URL||"https://oclonedigital.xyz").replace(/\/$/,"");
  const inviteUrl=base+"/admin/ativar?token="+encodeURIComponent(token);
  try{
    await sendResendEmail({
      to:email,subject:"Configure o acesso Owner do O Clone Digital",
      text:"Foi solicitada a configuração da conta Owner do O Clone Digital. Este link expira em 30 minutos: "+inviteUrl,
      html:"<div style='font-family:Arial;background:#101014;color:#fff;padding:32px'><h1>Configurar conta Owner</h1><p>Use o link abaixo para definir sua senha e ativar o autenticador de dois fatores. O link expira em 30 minutos.</p><p><a style='display:inline-block;padding:14px 20px;background:#e9232b;color:white;text-decoration:none;border-radius:8px' href='"+inviteUrl+"'>Configurar minha conta Owner</a></p><p style='word-break:break-all'>"+inviteUrl+"</p></div>"
    });
  }catch(error){
    await writeAdminSecurityEvent({email,eventType:"owner_invite_email_failed",success:false,request,metadata:{reason:"resend_failed"}});
    return {error:"A conta pendente foi preparada, mas o convite não foi enviado. Verifique RESEND_API_KEY e RESEND_FROM_EMAIL e tente novamente."};
  }
  await writeAdminSecurityEvent({email,eventType:"owner_invite_sent",success:true,request});
  return {sent:true,email};
}
export async function GET(){
  const admin=await getCurrentAdmin();
  if(admin) return NextResponse.json({authenticated:true,admin:{id:admin.id,email:admin.email,role:admin.role},legacy:false});
  const legacy=await isAdminRequest();
  return NextResponse.json({authenticated:legacy,legacy});
}
export async function POST(request){
  let body;try{body=await request.json()}catch{return NextResponse.json({error:"Requisição inválida."},{status:400});}
  const email=normalizeEmail(body?.email);
  const password=typeof body?.password==="string"?body.password:"";
  const code=String(body?.totpCode||"").replace(/\s/g,"");
  if(!email && password){
    try{
      const legacyLimit=await rateLimit(request,"admin_legacy_bootstrap");
      if(legacyLimit?.blocked_until && new Date(legacyLimit.blocked_until)>new Date()) return NextResponse.json({error:"Muitas tentativas. Aguarde 15 minutos."},{status:429});
      if(!verifyAdminPassword(password)) return NextResponse.json({error:"Senha administrativa incorreta."},{status:401});
      const invite=await inviteOwner(request);
      if(invite.error) return NextResponse.json({error:invite.error},{status:403});
      const legacy=makeAdminSession(),response=NextResponse.json({authenticated:true,legacy:true,bootstrapSent:true,email:invite.email});
      response.cookies.set(ADMIN_COOKIE,legacy.value,adminCookieOptions(legacy.maxAge));
      return response;
    }catch(error){console.error("Owner bootstrap failed",error instanceof Error?error.message:"unknown_error");return NextResponse.json({error:"Não foi possível iniciar a conta Owner. Confira a conexão com o banco e as variáveis do Resend."},{status:500});}
  }
  if(!email||!password) return NextResponse.json({error:"Informe e-mail e senha. No primeiro acesso, deixe o e-mail vazio para solicitar o convite Owner."},{status:400});
  try{
    const limit=await rateLimit(request);
    if(limit?.blocked_until && new Date(limit.blocked_until)>new Date()) return NextResponse.json({error:"Muitas tentativas. Aguarde 15 minutos."},{status:429});
    const sql=getDatabase();
    const rows=await sql`SELECT id,email,password_hash,role,status,totp_secret_encrypted,totp_enabled_at FROM admin_users WHERE email=${email} LIMIT 1`;
    const admin=rows[0];
    if(!admin||admin.status!=="active"||!admin.totp_enabled_at||!verifyAdminPasswordHash(password,admin.password_hash)){
      await writeAdminSecurityEvent({adminId:admin?.id||null,email,eventType:"admin_login_failed",success:false,request});
      return NextResponse.json({error:"E-mail ou senha inválidos."},{status:401});
    }
    let secondFactorOk=false;
    if(body?.recoveryCode || (code.length!==6 && code.length>0)){
      const recovery=String(body?.recoveryCode||code).trim().toUpperCase();
      const used=await sql`UPDATE admin_recovery_codes SET used_at=now()
        WHERE admin_id=${admin.id} AND code_hash=${hashAdminValue(recovery)} AND used_at IS NULL RETURNING id`;
      secondFactorOk=used.length>0;
    } else {
      try{secondFactorOk=verifyTotp(decryptTotpSecret(admin.totp_secret_encrypted),code);}catch{secondFactorOk=false;}
    }
    if(!secondFactorOk){
      await writeAdminSecurityEvent({adminId:admin.id,email,eventType:"admin_2fa_failed",success:false,request});
      return NextResponse.json({error:"Código de autenticação inválido."},{status:401});
    }
    await sql`UPDATE auth_rate_limits SET attempts=0,blocked_until=NULL,updated_at=now() WHERE scope='admin_login' AND subject_hash=${hashAdminValue(requestIp(request))}`;
    const session=await createAdminSession(admin.id,request);
    await sql`UPDATE admin_users SET last_login_at=now(),updated_at=now() WHERE id=${admin.id}`;
    await writeAdminSecurityEvent({adminId:admin.id,email,eventType:"admin_login",success:true,request});
    const response=NextResponse.json({authenticated:true,admin:{id:admin.id,email:admin.email,role:admin.role}});
    response.cookies.set(ADMIN_COOKIE,session.value,adminCookieOptions(session.maxAge));
    return response;
  }catch(error){
    console.error("Admin login failed",error instanceof Error?error.message:"unknown_error");
    return NextResponse.json({error:"Não foi possível concluir o login. Tente novamente."},{status:500});
  }
}
export async function DELETE(){
  await revokeCurrentAdminSession();
  const response=NextResponse.json({authenticated:false});
  response.cookies.set(ADMIN_COOKIE,"",adminCookieOptions(0));
  return response;
}
