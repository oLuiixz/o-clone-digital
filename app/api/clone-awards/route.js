import { NextResponse } from "next/server";
import { getCurrentMember, getDatabase, hasActiveAccess } from "../../../lib/member-auth";
export const runtime = "nodejs";
export const dynamic = "force-dynamic";

export async function GET() {
  const member = await getCurrentMember();
  if (!member) return NextResponse.json({ error: "Acesso restrito a membros ativos." }, { status: 401 });
  if (!(await hasActiveAccess(member.email))) return NextResponse.json({ error: "Sua assinatura não está ativa para acessar o Clone Awards." }, { status: 403 });
  try {
    const sql = getDatabase();
    const seasons = await sql`SELECT id, name, starts_at, ends_at, submission_deadline, review_deadline, status FROM clone_awards_seasons WHERE status IN ('active','reviewing','closed','archived') ORDER BY starts_at DESC LIMIT 5`;
    const season = seasons.find(s => s.status === "active" || s.status === "reviewing") || seasons[0] || null;
    const tracks = await sql`SELECT id, slug, name, description, icon_key, sort_order FROM clone_awards_tracks WHERE is_active = true ORDER BY sort_order, name`;
    if (!season) return NextResponse.json({ season: null, tracks, enrollment: null, levels: [], leaderboard: [], history: [] });
    const enrollments = await sql`SELECT e.id, e.track_id, t.name AS track_name, e.selected_at FROM clone_awards_enrollments e JOIN clone_awards_tracks t ON t.id=e.track_id WHERE e.season_id=${season.id} AND e.account_id=${member.id} LIMIT 1`;
    const enrollment = enrollments[0] || null;
    let levels = [], history = [], leaderboard = [];
    if (enrollment) {
      levels = await sql`SELECT l.id, l.level_number, l.title, l.description, c.id AS challenge_id, c.challenge_key, c.title AS challenge_title, c.instructions, c.evidence_requirements, c.xp, c.sort_order, s.status AS submission_status, s.evidence_url, s.evidence_note, s.review_note FROM clone_awards_levels l LEFT JOIN clone_awards_challenges c ON c.level_id=l.id AND c.is_active=true LEFT JOIN clone_awards_submissions s ON s.challenge_id=c.id AND s.account_id=${member.id} AND s.season_id=${season.id} AND s.track_id=${enrollment.track_id} WHERE l.track_id=${enrollment.track_id} ORDER BY l.level_number,c.sort_order,c.title`;
      history = await sql`SELECT action, details, created_at FROM clone_awards_audit_log WHERE season_id=${season.id} AND account_id=${member.id} ORDER BY created_at DESC LIMIT 15`;
    }
    leaderboard = await sql`SELECT a.id, COALESCE(NULLIF(a.display_name,''),'Aluno') AS display_name, a.photo_data, SUM(x.xp)::int AS xp FROM clone_awards_xp_ledger x JOIN member_accounts a ON a.id=x.account_id JOIN clone_awards_enrollments e ON e.season_id=x.season_id AND e.account_id=x.account_id AND e.track_id=x.track_id WHERE x.season_id=${season.id} AND x.entry_type IN ('award','reversal','adjustment') GROUP BY a.id,a.display_name,a.photo_data ORDER BY xp DESC, min(x.created_at) ASC LIMIT 50`;
    const mine = await sql`SELECT COALESCE(SUM(xp),0)::int AS xp FROM clone_awards_xp_ledger WHERE season_id=${season.id} AND account_id=${member.id}`;
    return NextResponse.json({ season, tracks, enrollment, levels, leaderboard, history, xp: Number(mine[0]?.xp || 0) });
  } catch (error) {
    console.error("Clone Awards GET failed", error instanceof Error ? error.message : "unknown");
    return NextResponse.json({ error: "Clone Awards ainda precisa da migration 004 no banco. Peça ao administrador para preparar o banco." }, { status: 503 });
  }
}

export async function POST(request) {
  const member = await getCurrentMember();
  if (!member) return NextResponse.json({ error: "Acesso restrito a membros ativos." }, { status: 401 });
  let body; try { body = await request.json(); } catch { return NextResponse.json({ error: "Dados inválidos." }, { status: 400 }); }
  const sql = getDatabase();
  try {
    const seasons = await sql`SELECT id,status,starts_at,ends_at,submission_deadline FROM clone_awards_seasons WHERE status IN ('active','reviewing') AND starts_at <= now() AND ends_at >= now() ORDER BY starts_at DESC LIMIT 1`;
    const season = seasons[0];
    if (!season) return NextResponse.json({ error: "Não há temporada ativa no momento." }, { status: 409 });
    if (body.action === "select-track") {
      const tracks = await sql`SELECT id FROM clone_awards_tracks WHERE id=${body.trackId} AND is_active=true LIMIT 1`;
      if (!tracks.length) return NextResponse.json({ error: "Trilha inválida." }, { status: 400 });
      const existing = await sql`SELECT id,track_id FROM clone_awards_enrollments WHERE season_id=${season.id} AND account_id=${member.id} LIMIT 1`;
      if (existing.length && existing[0].track_id === body.trackId) return NextResponse.json({ ok: true, unchanged: true });
      if (existing.length && body.confirmReset !== true) return NextResponse.json({ error: "Trocar de trilha reinicia o progresso competitivo desta temporada. Confirme para continuar.", requiresConfirmation: true }, { status: 409 });
      if (existing.length) {
        await sql`INSERT INTO clone_awards_audit_log(season_id,account_id,actor,action,entity_type,entity_id,details) VALUES (${season.id},${member.id},${member.email},'track_changed','enrollment',${existing[0].id},${JSON.stringify({fromTrackId:existing[0].track_id,toTrackId:body.trackId,resetCompetitiveProgress:true})}::jsonb)`;
        const priorAwards = await sql`SELECT source_key, submission_id, track_id, xp FROM clone_awards_xp_ledger WHERE season_id=${season.id} AND account_id=${member.id} AND entry_type='award'`;
        for (const award of priorAwards) {
          await sql`INSERT INTO clone_awards_xp_ledger(season_id,account_id,track_id,submission_id,source_key,entry_type,xp,reason,actor)
            VALUES (${season.id},${member.id},${award.track_id},${award.submission_id},${award.source_key},'reversal',${-Math.abs(Number(award.xp))},'Estorno de pontuação competitiva por troca de trilha',${member.email})
            ON CONFLICT(season_id,account_id,source_key,entry_type) DO NOTHING`;
        }
        await sql`UPDATE clone_awards_enrollments SET track_id=${body.trackId},selected_at=now(),updated_at=now() WHERE id=${existing[0].id}`;
      } else {
        await sql`INSERT INTO clone_awards_enrollments(season_id,account_id,track_id) VALUES (${season.id},${member.id},${body.trackId})`;
        await sql`INSERT INTO clone_awards_audit_log(season_id,account_id,actor,action,entity_type,details) VALUES (${season.id},${member.id},${member.email},'track_selected','enrollment',${JSON.stringify({trackId:body.trackId})}::jsonb)`;
      }
      return NextResponse.json({ ok: true });
    }
    if (body.action === "submit-evidence") {
      if (season.status !== "active" || new Date(season.submission_deadline) < new Date()) return NextResponse.json({ error: "O prazo de envio desta temporada terminou." }, { status: 409 });
      const enrollment = await sql`SELECT track_id FROM clone_awards_enrollments WHERE season_id=${season.id} AND account_id=${member.id} LIMIT 1`;
      if (!enrollment.length) return NextResponse.json({ error: "Escolha uma trilha antes de enviar desafios." }, { status: 409 });
      const challenge = await sql`SELECT c.id,c.track_id FROM clone_awards_challenges c WHERE c.id=${body.challengeId} AND c.track_id=${enrollment[0].track_id} AND c.is_active=true LIMIT 1`;
      if (!challenge.length) return NextResponse.json({ error: "Desafio inválido para sua trilha." }, { status: 400 });
      const note = typeof body.evidenceNote === "string" ? body.evidenceNote.trim().slice(0,3000) : "";
      const url = typeof body.evidenceUrl === "string" ? body.evidenceUrl.trim().slice(0,1000) : "";
      if (!note && !url) return NextResponse.json({ error: "Inclua um relato ou link como evidência." }, { status: 400 });
      if (url) { try { const parsed = new URL(url); if (!["https:","http:"].includes(parsed.protocol)) throw new Error(); } catch { return NextResponse.json({ error: "O link da evidência é inválido." }, { status: 400 }); } }
      const prior = await sql`SELECT id,status FROM clone_awards_submissions WHERE season_id=${season.id} AND account_id=${member.id} AND challenge_id=${body.challengeId} LIMIT 1`;
      if (prior.length && prior[0].status === "approved") return NextResponse.json({ error: "Este desafio já foi aprovado." }, { status: 409 });
      if (prior.length) await sql`UPDATE clone_awards_submissions SET evidence_url=${url||null},evidence_note=${note},status='pending',review_note=NULL,reviewed_by=NULL,reviewed_at=NULL,updated_at=now() WHERE id=${prior[0].id}`;
      else await sql`INSERT INTO clone_awards_submissions(season_id,account_id,track_id,challenge_id,evidence_url,evidence_note) VALUES (${season.id},${member.id},${enrollment[0].track_id},${body.challengeId},${url||null},${note})`;
      return NextResponse.json({ ok: true });
    }
    return NextResponse.json({ error: "Ação desconhecida." }, { status: 400 });
  } catch (error) {
    console.error("Clone Awards POST failed", error instanceof Error ? error.message : "unknown");
    return NextResponse.json({ error: "Não foi possível concluir a ação. Confirme se a migration 004 foi aplicada." }, { status: 503 });
  }
}
