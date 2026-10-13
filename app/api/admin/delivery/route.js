import nodemailer from "nodemailer";
import { NextResponse } from "next/server";
import { createOpaqueToken,getAppBaseUrl,getDatabase,hashToken,normalizeEmail } from "../../../../lib/member-auth";
import { isAdminRequest } from "../../../../lib/admin-auth";
export const runtime="nodejs";
export const dynamic="force-dynamic";
export async function POST(request){
if(!(await isAdminRequest()))return NextResponse.json({error:"Não autorizado."},{status:401});
let body;try{body=await request.json();}catch{return NextResponse.json({error:"Requisição inválida."},{status:400});}
const orderId=typeof body?.orderId==="string"?body.orderId:"",action=body?.action;
if(!/^[0-9a-f-]{36}$/i.test(orderId)||!["generate","email","manual"].includes(action))return NextResponse.json({error:"Ação ou pedido inválido."},{status:400});
const sql=getDatabase();let transporter;
try{
const rows=await sql`SELECT o.id,o.customer_email,o.status,p.name AS product_name FROM orders o JOIN products p ON p.id=o.product_id JOIN entitlements e ON e.order_id=o.id AND e.status='active' WHERE o.id=${orderId} AND o.status='approved' LIMIT 1`;
if(!rows.length)return NextResponse.json({error:"Só é possível entregar compras aprovadas com acesso ativo."},{status:409});
const email=normalizeEmail(rows[0].customer_email);
if(action==="manual"){await sql`INSERT INTO admin_delivery_events(order_id,customer_email,channel,action,status,details) VALUES(${orderId},${email},'manual','manual_delivered','delivered',${String(body.details||"Entrega manual confirmada pelo administrador").slice(0,1000)})`;return NextResponse.json({ok:true,message:"Entrega manual registrada no histórico."});}
const user=process.env.SMTP_USER?.trim(),pass=process.env.SMTP_APP_PASSWORD?.replace(/\s/g,""),from=process.env.SMTP_FROM_EMAIL?.trim()||user,base=getAppBaseUrl();
if(action==="email"&&(!user||!pass||!from||!base)){await sql`INSERT INTO admin_delivery_events(order_id,customer_email,channel,action,status,details) VALUES(${orderId},${email},'email','email_failed','failed','Configuração SMTP ou URL do aplicativo ausente')`;return NextResponse.json({error:"SMTP/URL não configurado. Falha registrada."},{status:503});}
const token=createOpaqueToken(),tokenHash=hashToken(token),expires=new Date(Date.now()+1800000).toISOString();
await sql`INSERT INTO member_activation_tokens(email,token_hash,expires_at) VALUES(${email},${tokenHash},${expires})`;
const url=new URL("/ativar",base||"https://o-clone-digital.vercel.app");url.searchParams.set("token",token);
await sql`INSERT INTO admin_delivery_events(order_id,customer_email,channel,action,status,details) VALUES(${orderId},${email},'manual','activation_link_generated','generated','Link válido por 30 minutos; mostrado uma única vez')`;
if(action==="generate")return NextResponse.json({ok:true,activationUrl:url.toString(),expiresAt:expires});
try{transporter=nodemailer.createTransport({host:"smtp.gmail.com",port:465,secure:true,auth:{user,pass},connectionTimeout:10000,greetingTimeout:10000,socketTimeout:15000});await transporter.verify();
await sql`INSERT INTO admin_delivery_events(order_id,customer_email,channel,action,status,details) VALUES(${orderId},${email},'email','send_attempt','pending','Tentativa SMTP iniciada')`;
const result=await transporter.sendMail({from:{name:"O Clone Digital",address:from},to:email,subject:"Ative seu acesso ao O Clone Digital",text:"Seu acesso está pronto. Crie sua senha: "+url.toString()+"\nO link expira em 30 minutos e só pode ser usado uma vez.",html:`<div style="font-family:Arial,sans-serif"><h1>Seu acesso está pronto</h1><p><a href="${url.toString()}">Ativar minha conta</a></p><p>O link expira em 30 minutos e só pode ser usado uma vez.</p></div>`});
await sql`INSERT INTO admin_delivery_events(order_id,customer_email,channel,action,status,details,provider_message_id) VALUES(${orderId},${email},'email','email_accepted','sent','SMTP aceitou a mensagem; entrega na caixa de entrada ainda não confirmada',${String(result.messageId||"").slice(0,500)})`;
return NextResponse.json({ok:true,message:"E-mail aceito pelo servidor SMTP; isso não confirma chegada à caixa de entrada.",messageId:result.messageId||null});
}catch(error){const detail=String(error?.message||"Falha SMTP").slice(0,1000);await sql`INSERT INTO admin_delivery_events(order_id,customer_email,channel,action,status,details) VALUES(${orderId},${email},'email','email_failed','failed',${detail})`;return NextResponse.json({error:"Falha no envio: "+detail},{status:502});}
}catch(error){console.error("Admin delivery failed",error instanceof Error?error.message:"unknown_error");return NextResponse.json({error:"Falha na ação. Confira a migração 003 no Neon."},{status:500});}finally{transporter?.close();}
}