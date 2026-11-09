import { NextResponse } from "next/server";
import { getDatabase } from "../../../../lib/member-auth";
import { getCurrentAdmin,isAdminRequest,writeAdminAudit } from "../../../../lib/admin-auth";
export const runtime="nodejs";
export const dynamic="force-dynamic";
export async function GET(){
 if(!(await isAdminRequest())) return NextResponse.json({error:"Não autorizado."},{status:401});
 const admin=await getCurrentAdmin();
 if(!admin) return NextResponse.json({error:"Sessão administrativa legada. Ative a conta Owner para gerenciar dispositivos."},{status:409});
 try{
  const sql=getDatabase();
  const rows=await sql`SELECT id,device_label,user_agent,created_at,last_seen_at,expires_at,revoked_at
    FROM admin_sessions WHERE admin_id=${admin.id} ORDER BY created_at DESC LIMIT 50`;
  return NextResponse.json({admin:{email:admin.email,role:admin.role},currentSessionId:admin.session_id,sessions:rows});
 }catch(error){console.error("Admin sessions list failed",error instanceof Error?error.message:"unknown_error");return NextResponse.json({error:"Não foi possível carregar as sessões."},{status:500});}
}
export async function DELETE(request){
 if(!(await isAdminRequest())) return NextResponse.json({error:"Não autorizado."},{status:401});
 const admin=await getCurrentAdmin();
 if(!admin) return NextResponse.json({error:"Sessão administrativa legada."},{status:409});
 let body;try{body=await request.json()}catch{return NextResponse.json({error:"Dados inválidos."},{status:400});}
 const id=String(body?.sessionId||"");
 if(!/^[0-9a-f-]{36}$/i.test(id)) return NextResponse.json({error:"Sessão inválida."},{status:400});
 try{
  const sql=getDatabase();
  const rows=await sql`UPDATE admin_sessions SET revoked_at=now() WHERE id=${id} AND admin_id=${admin.id} AND revoked_at IS NULL RETURNING id`;
  if(!rows.length) return NextResponse.json({error:"Sessão não encontrada ou já revogada."},{status:404});
  await writeAdminAudit({adminId:admin.id,email:admin.email,action:"admin_session_revoked",targetType:"admin_session",targetId:id});
  return NextResponse.json({ok:true,currentSession:id===admin.session_id});
 }catch(error){console.error("Admin session revoke failed",error instanceof Error?error.message:"unknown_error");return NextResponse.json({error:"Não foi possível revogar a sessão."},{status:500});}
}
