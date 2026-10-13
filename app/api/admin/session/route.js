import { NextResponse } from "next/server";
import { ADMIN_COOKIE,adminCookieOptions,makeAdminSession,verifyAdminPassword,isAdminRequest } from "../../../../lib/admin-auth";
export const runtime="nodejs";
export const dynamic="force-dynamic";
export async function GET(){return NextResponse.json({authenticated:await isAdminRequest()});}
export async function POST(request){if(!process.env.ADMIN_PANEL_PASSWORD)return NextResponse.json({error:"Configure ADMIN_PANEL_PASSWORD nas variáveis da Vercel."},{status:503});let body;try{body=await request.json();}catch{return NextResponse.json({error:"Requisição inválida."},{status:400});}if(!verifyAdminPassword(body?.password))return NextResponse.json({error:"Senha incorreta."},{status:401});const s=makeAdminSession();const response=NextResponse.json({authenticated:true});response.cookies.set(ADMIN_COOKIE,s.value,adminCookieOptions(s.maxAge));return response;}
export async function DELETE(){const response=NextResponse.json({authenticated:false});response.cookies.set(ADMIN_COOKIE,"",adminCookieOptions(0));return response;}