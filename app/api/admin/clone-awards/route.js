import { NextResponse } from "next/server";
import { getDatabase } from "../../../../lib/member-auth";
import { isAdminRequest } from "../../../../lib/admin-auth";
export const runtime = "nodejs";
export const dynamic = "force-dynamic";
const json = (data,status=200)=>NextResponse.json(data,{status});
export async function GET(){
 if(!(await isAdminRequest())) return json({error:"Acesso administrativo necessário."},401);
 try{
  const sql=getDatabase();
  const [seasons,tracks,levels,challenges,submissions,leaderboard]=await Promise.all([
   sql`SELECT id,name,starts_at,ends_at,submission_deadline,review_deadline,status,rules_version FROM clone_awards_seasons ORDER BY starts_at DESC LIMIT 30`,
   sql`SELECT id,slug,name,description,icon_key,is_active,sort_order FROM clone_awards_tracks ORDER BY sort_order,name`,
   sql`SELECT l.id,l.track_id,l.level_number,l.title,l.description FROM clone_awards_levels l JOIN clone_awards_tracks t ON t.id=l.track_id ORDER BY t.sort_order,l.level_number`,
   sql`SELECT c.id,c.track_id,c.level_id,c.challenge_key,c.title,c.instructions,c.evidence_requirements,c.xp,c.sort_order,c.is_active,l.level_number,t.name AS track_name FROM clone_awards_challenges c JOIN clone_awards_levels l ON l.id=c.level_id JOIN clone_awards_tracks t ON t.id=c.track_id ORDER BY t.sort_order,l.level_number,c.sort_order`,
   sql`SELECT s.id,s.season_id,s.account_id,s.track_id,s.challenge_id,s.evidence_url,s.evidence_note,s.status,s.review_note,s.submitted_at,a.email,COALESCE(NULLIF(a.display_name,''),'Aluno') AS display_name,c.title AS challenge_title,t.name AS track_name,se.name AS season_name FROM clone_awards_submissions s JOIN member_accounts a ON a.id=s.account_id JOIN clone_awards_challenges c ON c.id=s.challenge_id JOIN clone_awards_tracks t ON t.id=s.track_id JOIN clone_awards_seasons se ON se.id=s.season_id WHERE s.status IN ('pending','resubmit','rejected') ORDER BY s.submitted_at ASC LIMIT 250`,
   sql`SELECT a.id,COALESCE(NULLIF(a.display_name,''),'Aluno') AS display_name,a.email,e.track_id,t.name AS track_name,SUM(x.xp)::int AS xp FROM clone_awards_xp_ledger x JOIN member_accounts a ON a.id=x.account_id JOIN clone_awards_enrollments e ON e.account_id=x.account_id AND e.season_id=x.season_id AND e.track_id=x.track_id JOIN clone_awards_tracks t ON t.id=e.track_id GROUP BY a.id,a.display_name,a.email,e.track_id,t.name ORDER BY xp DESC LIMIT 100`
  ]);
  return json({seasons,tracks,levels,challenges,submissions,leaderboard});
 }catch(e){console.error("Clone Awards admin GET",e);return json({error:"Não foi possível consultar o Clone Awards. Verifique se a migration 004 foi aplicada no ambiente de teste."},503)}
}
export async function POST(request){
 if(!(await isAdminRequest())) return json({error:"Acesso administrativo necessário."},401);
 let b;try{b=await request.json()}catch{return json({error:"JSON inválido."},400)}
 const sql=getDatabase();
 try{
  if(b.action==="create-season"){
   const name=String(b.name||"").trim().slice(0,120);const start=new Date(b.startsAt),end=new Date(b.endsAt),submission=new Date(b.submissionDeadline),review=new Date(b.reviewDeadline);
   if(!name||[start,end,submission,review].some(d=>Number.isNaN(d.getTime()))||!(start<end&&start<=submission&&submission<=end&&submission<=review))return json({error:"Informe datas válidas: início antes do fim e prazo de envio entre o início e o fim da temporada, antes do prazo de revisão."},400);
   if(b.status==="active"){const active=await sql`SELECT id FROM clone_awards_seasons WHERE status='active' LIMIT 1`;if(active.length)return json({error:"Já existe uma temporada ativa. Encerre-a antes de ativar outra."},409)}
   const rows=await sql`INSERT INTO clone_awards_seasons(name,starts_at,ends_at,submission_deadline,review_deadline,status,created_by) VALUES(${name},${start.toISOString()},${end.toISOString()},${submission.toISOString()},${review.toISOString()},'draft','admin') RETURNING id`;
   return json({ok:true,id:rows[0].id},201);
  }
  if(b.action==="season-status"){
   const allowed=["draft","scheduled","active","reviewing","closed","archived"];if(!allowed.includes(b.status)||!b.id)return json({error:"Status inválido."},400);
   if(b.status==="active"){
    const active=await sql`SELECT id FROM clone_awards_seasons WHERE status='active' AND id<>${b.id} LIMIT 1`;
    if(active.length)return json({error:"Já existe outra temporada ativa."},409);
    const target=await sql`SELECT starts_at,ends_at,submission_deadline,review_deadline FROM clone_awards_seasons WHERE id=${b.id} LIMIT 1`;
    if(!target.length)return json({error:"Temporada não encontrada."},404);
    const season=target[0],now=Date.now();
    if(new Date(season.starts_at).getTime()>now||new Date(season.ends_at).getTime()<=now||new Date(season.submission_deadline).getTime()<now||new Date(season.submission_deadline).getTime()>new Date(season.ends_at).getTime()||new Date(season.review_deadline).getTime()<new Date(season.submission_deadline).getTime())
      return json({error:"Só é possível ativar uma temporada dentro do período de vigência e antes do prazo final de envio. Para uma temporada futura, mantenha o rascunho até a data de início."},409);
    const trackCount=await sql`SELECT COUNT(*)::int AS count FROM clone_awards_tracks WHERE is_active=true`;
    if(Number(trackCount[0]?.count)!==5)return json({error:"A temporada não pode ser ativada: o catálogo precisa ter exatamente 5 trilhas ativas."},409);
    const invalidTracks=await sql`SELECT t.slug FROM clone_awards_tracks t LEFT JOIN clone_awards_levels l ON l.track_id=t.id LEFT JOIN clone_awards_challenges c ON c.level_id=l.id AND c.track_id=t.id AND c.is_active=true WHERE t.is_active=true GROUP BY t.id,t.slug HAVING COUNT(DISTINCT l.id)<>15 OR COUNT(c.id)<>150 OR COALESCE(SUM(c.xp),0)<>15000 LIMIT 1`;
    if(invalidTracks.length)return json({error:"A temporada não pode ser ativada: cada trilha precisa ter 15 níveis, 150 desafios ativos e exatamente 15.000 XP."},409);
    const invalidLevels=await sql`SELECT t.slug,l.level_number FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id LEFT JOIN clone_awards_challenges c ON c.level_id=l.id AND c.track_id=t.id AND c.is_active=true WHERE t.is_active=true GROUP BY t.slug,l.level_number HAVING COUNT(c.id)<>10 OR MIN(c.xp)<>30+(l.level_number-1)*10 OR MAX(c.xp)<>30+(l.level_number-1)*10 LIMIT 1`;
    if(invalidLevels.length)return json({error:"A temporada não pode ser ativada: cada nível precisa ter 10 desafios ativos com a pontuação prevista para esse nível."},409);
   }
   await sql`UPDATE clone_awards_seasons SET status=${b.status},updated_at=now() WHERE id=${b.id}`;return json({ok:true});
  }
  if(b.action==="save-track"){
   const name=String(b.name||"").trim().slice(0,120),slug=String(b.slug||"").trim().toLowerCase().replace(/[^a-z0-9-]/g,"-").slice(0,100),description=String(b.description||"").slice(0,1000),icon=String(b.iconKey||"trophy").slice(0,40);
   if(!name||!slug)return json({error:"Nome e slug são obrigatórios."},400);
   if(b.id)await sql`UPDATE clone_awards_tracks SET name=${name},slug=${slug},description=${description},icon_key=${icon},is_active=${b.isActive!==false},sort_order=${Math.max(0,Number(b.sortOrder)||0)},updated_at=now() WHERE id=${b.id}`;
   else await sql`INSERT INTO clone_awards_tracks(name,slug,description,icon_key,is_active,sort_order) VALUES(${name},${slug},${description},${icon},${b.isActive!==false},${Math.max(0,Number(b.sortOrder)||0)})`;
   return json({ok:true});
  }
  if(b.action==="save-level"){
   const n=Number(b.levelNumber);if(!b.trackId||!Number.isInteger(n)||n<1||n>15||!String(b.title||"").trim())return json({error:"Trilha, título e nível de 1 a 15 são obrigatórios."},400);
   if(b.id)await sql`UPDATE clone_awards_levels SET track_id=${b.trackId},level_number=${n},title=${String(b.title).trim().slice(0,160)},description=${String(b.description||"").slice(0,2000)} WHERE id=${b.id}`;
   else await sql`INSERT INTO clone_awards_levels(track_id,level_number,title,description) VALUES(${b.trackId},${n},${String(b.title).trim().slice(0,160)},${String(b.description||"").slice(0,2000)})`;
   return json({ok:true});
  }
  if(b.action==="save-challenge"){
   const xp=Number(b.xp),order=Math.max(0,Number(b.sortOrder)||0);
   if(!b.trackId||!b.levelId||!String(b.key||"").trim()||!String(b.title||"").trim()||!String(b.instructions||"").trim()||!String(b.evidenceRequirements||"").trim()||!Number.isInteger(xp)||xp<1||xp>10000)return json({error:"Preencha trilha, nível, chave, título, instruções, evidência e XP válido."},400);
   const level=await sql`SELECT id FROM clone_awards_levels WHERE id=${b.levelId} AND track_id=${b.trackId} LIMIT 1`;if(!level.length)return json({error:"O nível não pertence à trilha selecionada."},400);
   if(b.id)await sql`UPDATE clone_awards_challenges SET track_id=${b.trackId},level_id=${b.levelId},challenge_key=${String(b.key).trim().slice(0,120)},title=${String(b.title).trim().slice(0,180)},instructions=${String(b.instructions).trim().slice(0,5000)},evidence_requirements=${String(b.evidenceRequirements).trim().slice(0,2000)},xp=${xp},sort_order=${order},is_active=${b.isActive!==false},updated_at=now() WHERE id=${b.id}`;
   else await sql`INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active) VALUES(${b.trackId},${b.levelId},${String(b.key).trim().slice(0,120)},${String(b.title).trim().slice(0,180)},${String(b.instructions).trim().slice(0,5000)},${String(b.evidenceRequirements).trim().slice(0,2000)},${xp},${order},${b.isActive!==false})`;
   return json({ok:true});
  }
  if(b.action==="review-submission"){
   if(!b.id||!["approved","rejected","resubmit"].includes(b.status))return json({error:"Decisão inválida."},400);
   const note=String(b.note||"").trim().slice(0,2000);
   if(b.status!=="approved"&&!note)return json({error:"Inclua uma orientação para o aluno."},400);
   const rows=await sql`SELECT s.id,s.status,s.season_id,s.account_id,s.track_id,s.challenge_id,c.xp,se.status AS season_status FROM clone_awards_submissions s JOIN clone_awards_challenges c ON c.id=s.challenge_id AND c.track_id=s.track_id JOIN clone_awards_enrollments e ON e.season_id=s.season_id AND e.account_id=s.account_id AND e.track_id=s.track_id JOIN clone_awards_seasons se ON se.id=s.season_id WHERE s.id=${b.id} AND s.status IN ('pending','resubmit','rejected') LIMIT 1`;
   if(!rows.length)return json({error:"Envio já revisado ou não encontrado."},409);
   const s=rows[0];
   if(!["active","reviewing"].includes(s.season_status))return json({error:"Temporada não aceita revisões."},409);
   const reviewer="admin";
   const updated=await sql`WITH changed AS (UPDATE clone_awards_submissions SET status=${b.status},review_note=${note||null},reviewed_by=${reviewer},reviewed_at=now(),updated_at=now() WHERE id=${s.id} AND status IN ('pending','resubmit','rejected') RETURNING id,season_id,account_id,track_id,challenge_id), award AS (INSERT INTO clone_awards_xp_ledger(season_id,account_id,track_id,submission_id,source_key,entry_type,xp,reason,actor) SELECT changed.season_id,changed.account_id,changed.track_id,changed.id,'challenge:'||changed.challenge_id::text,'award',c.xp,'Evidência aprovada',${reviewer} FROM changed JOIN clone_awards_challenges c ON c.id=changed.challenge_id WHERE ${b.status}='approved' ON CONFLICT(season_id,account_id,source_key,entry_type) DO NOTHING RETURNING id), audit AS (INSERT INTO clone_awards_audit_log(season_id,account_id,actor,action,entity_type,entity_id,details) SELECT changed.season_id,changed.account_id,${reviewer},${"submission_"+b.status},'submission',changed.id,${JSON.stringify({note})}::jsonb FROM changed RETURNING id) SELECT id FROM changed`;
   if(!updated.length)return json({error:"Este envio já foi revisado por outra ação."},409);
   return json({ok:true});
  }
  return json({error:"Ação administrativa desconhecida."},400);
 }catch(e){console.error("Clone Awards admin POST",e);return json({error:"Falha ao salvar. Confira campos obrigatórios, duplicidades e migration 004."},500)}
}
