import { NextResponse } from "next/server";
import { getCurrentMember,getDatabase } from "../../../lib/member-auth";
export const dynamic="force-dynamic";
export async function GET(){
 const member=await getCurrentMember();if(!member)return NextResponse.json({announcements:[]});
 try{const sql=getDatabase();const rows=await sql`SELECT a.id,a.title,a.message,a.target_url,a.published_at FROM global_announcements a LEFT JOIN global_announcement_reads r ON r.announcement_id=a.id AND r.account_id=${member.id} WHERE a.is_published=true AND r.announcement_id IS NULL ORDER BY a.published_at DESC LIMIT 10`;return NextResponse.json({announcements:rows});}
 catch(e){console.error("Announcements fetch failed",e?.message);return NextResponse.json({announcements:[]});}
}
export async function POST(request){
 const member=await getCurrentMember();if(!member)return NextResponse.json({error:"Não autorizado."},{status:401});
 let body;try{body=await request.json()}catch{return NextResponse.json({error:"Dados inválidos."},{status:400})}
 const id=Number(body?.id);if(!Number.isSafeInteger(id)||id<1)return NextResponse.json({error:"Aviso inválido."},{status:400});
 const sql=getDatabase();await sql`INSERT INTO global_announcement_reads(announcement_id,account_id) SELECT id,${member.id} FROM global_announcements WHERE id=${id} AND is_published=true ON CONFLICT DO NOTHING`;return NextResponse.json({ok:true});
}