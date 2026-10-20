import { NextResponse } from "next/server";
import webpush from "web-push";
import { isAdminRequest } from "../../../../lib/admin-auth";
import { getDatabase } from "../../../../lib/member-auth";
export const runtime="nodejs";
export const dynamic="force-dynamic";
export async function GET(){
 if(!(await isAdminRequest())) return NextResponse.json({error:"Não autorizado."},{status:401});
 try { const sql=getDatabase(); const rows=await sql`SELECT * FROM global_announcements ORDER BY created_at DESC LIMIT 100`; return NextResponse.json({announcements:rows}); }
 catch(e){ console.error("Admin announcements list failed",e?.message); return NextResponse.json({error:"Não foi possível carregar os avisos."},{status:500});}
}
export async function POST(request){
 if(!(await isAdminRequest())) return NextResponse.json({error:"Não autorizado."},{status:401});
 let body; try{body=await request.json()}catch{return NextResponse.json({error:"Dados inválidos."},{status:400})}
 const title=String(body?.title||"").trim().slice(0,120), message=String(body?.message||"").trim().slice(0,2000);
 let targetUrl=String(body?.targetUrl||"").trim().slice(0,500)||null;
 if(!title||!message) return NextResponse.json({error:"Informe o título e a mensagem."},{status:400});
 if(targetUrl){try{const u=new URL(targetUrl,"https://www.oclonedigital.xyz"); if(!["https:","http:"].includes(u.protocol)) throw new Error(); targetUrl=u.origin==="https://www.oclonedigital.xyz"?u.pathname+u.search+u.hash:u.href;}catch{return NextResponse.json({error:"Link inválido."},{status:400})}}
 const sql=getDatabase();
 try{
  const rows=await sql`INSERT INTO global_announcements(title,message,target_url,is_published,published_at) VALUES(${title},${message},${targetUrl},true,now()) RETURNING *`;
  const announcement=rows[0]; let attempted=0,sent=0;
  if(process.env.VAPID_PUBLIC_KEY&&process.env.VAPID_PRIVATE_KEY){
   webpush.setVapidDetails(process.env.VAPID_SUBJECT||"mailto:suporte@oclonedigital.xyz",process.env.VAPID_PUBLIC_KEY,process.env.VAPID_PRIVATE_KEY);
   const subs=await sql`SELECT endpoint,p256dh,auth FROM member_push_subscriptions`; attempted=subs.length;
   const payload=JSON.stringify({title:"O Clone Digital · "+title,body:message.slice(0,180),url:targetUrl||"/painel",tag:"ocd-announcement-"+announcement.id});
   const results=await Promise.allSettled(subs.map(async s=>{try{await webpush.sendNotification({endpoint:s.endpoint,keys:{p256dh:s.p256dh,auth:s.auth}},payload,{TTL:86400,urgency:"normal"});return true;}catch(e){if(e?.statusCode===404||e?.statusCode===410) await sql`DELETE FROM member_push_subscriptions WHERE endpoint=${s.endpoint}`;throw e;}}));
   sent=results.filter(r=>r.status==="fulfilled").length;
   await sql`UPDATE global_announcements SET push_attempted=${attempted},push_sent=${sent} WHERE id=${announcement.id}`;
  }
  return NextResponse.json({announcement,push:{attempted,sent}});
 }catch(e){console.error("Publish announcement failed",e?.message);return NextResponse.json({error:"Não foi possível publicar o aviso. Confira o banco e os logs."},{status:500})}
}
export async function PATCH(request){
 if(!(await isAdminRequest())) return NextResponse.json({error:"Não autorizado."},{status:401});
 let body;try{body=await request.json()}catch{return NextResponse.json({error:"Dados inválidos."},{status:400})}
 const id=Number(body?.id);if(!Number.isSafeInteger(id)||id<1)return NextResponse.json({error:"Aviso inválido."},{status:400});
 try {
  const sql=getDatabase();
  const rows=await sql`UPDATE global_announcements SET is_published=false,deactivated_at=COALESCE(deactivated_at,now()) WHERE id=${id} RETURNING id`;
  if(!rows.length)return NextResponse.json({error:"Aviso não encontrado."},{status:404});
  return NextResponse.json({ok:true});
 } catch(e) {
  console.error("Deactivate announcement failed",e?.message);
  return NextResponse.json({error:"Não foi possível desativar o aviso."},{status:500});
 }
}