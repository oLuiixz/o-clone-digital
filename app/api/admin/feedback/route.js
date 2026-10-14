import { NextResponse } from "next/server";
import { getDatabase } from "../../../../lib/member-auth";
import { isAdminRequest } from "../../../../lib/admin-auth";
import { sendResendEmail } from "../../../../lib/resend-email";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";
const STATUSES = ["Recebida", "Em análise", "Planejada", "Em desenvolvimento", "Concluída", "Não planejada"];

async function ensureTable(sql) {
  await sql`CREATE TABLE IF NOT EXISTS member_feedback (
    id BIGSERIAL PRIMARY KEY,
    account_id UUID NOT NULL REFERENCES member_accounts(id) ON DELETE CASCADE,
    category TEXT NOT NULL,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    context TEXT,
    status TEXT NOT NULL DEFAULT 'Recebida',
    response_text TEXT,
    notified_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
  )`;
  await sql`ALTER TABLE member_feedback ADD COLUMN IF NOT EXISTS response_text TEXT`;
  await sql`ALTER TABLE member_feedback ADD COLUMN IF NOT EXISTS notified_at TIMESTAMPTZ`;
}

function escapeHtml(value) {
  return String(value ?? "").replace(/[&<>"']/g, c => ({"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#39;"}[c]));
}
function feedbackEmail({ name, title, category, status, response }) {
  const safe = { name: escapeHtml(name), title: escapeHtml(title), category: escapeHtml(category), status: escapeHtml(status), response: escapeHtml(response).replace(/\n/g, "<br>") };
  const subject = status === "Concluída" ? "Sua solicitação foi resolvida · O Clone Digital" : "Tem uma atualização sobre seu feedback · O Clone Digital";
  const text = `Olá${name ? " " + name : ""}! Temos uma atualização sobre seu feedback: "${title}". Status: ${status}.${response ? "\n\nResposta da equipe:\n" + response : ""}\n\nObrigado por ajudar a melhorar o O Clone Digital. Acesse sua área de aluno: https://www.oclonedigital.xyz/painel`;
  const html = `<!doctype html><html lang="pt-BR"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"></head><body style="margin:0;background:#101014;color:#f7f7f8;font-family:Arial,Helvetica,sans-serif;padding:28px 12px"><div style="max-width:560px;margin:0 auto"><div style="font-size:12px;letter-spacing:3px;color:#aaa;padding:0 2px 16px;font-weight:bold">O CLONE <span style="color:#ff3045">DIGITAL</span></div><div style="background:#1b1b22;border:1px solid #35353e;border-top:3px solid #ff3045;border-radius:14px;padding:30px 26px"><div style="font-size:10px;letter-spacing:2px;color:#ff6574;font-weight:bold">ATUALIZAÇÃO DE FEEDBACK</div><h1 style="font-size:28px;line-height:1.2;margin:18px 0 10px">Temos novidades sobre sua solicitação.</h1><p style="color:#c5c5ce;line-height:1.7">Olá${safe.name ? " " + safe.name : ""}! A equipe atualizou o feedback que você enviou.</p><div style="border:1px solid #383841;border-radius:10px;padding:16px;margin:22px 0"><div style="font-size:10px;color:#999;letter-spacing:1px">FEEDBACK · ${safe.category}</div><h2 style="font-size:18px;margin:9px 0;color:#fff">${safe.title}</h2><div style="font-size:12px;color:#ff8792">Status: ${safe.status}</div></div>${response ? `<div style="font-size:10px;letter-spacing:1.5px;color:#999;margin-bottom:8px">RESPOSTA DA EQUIPE</div><div style="background:#25252e;border-radius:10px;padding:16px;color:#e2e2e8;line-height:1.7">${safe.response}</div>` : ""}<p style="color:#aaaab4;font-size:12px;line-height:1.7;margin:24px 0">Obrigado por contribuir para melhorar o O Clone Digital. Seu feedback ajuda a construir uma plataforma cada vez melhor.</p><a href="https://www.oclonedigital.xyz/painel" style="display:inline-block;background:#ff3045;color:white;text-decoration:none;font-weight:bold;border-radius:8px;padding:13px 18px">Acessar minha área</a></div><p style="text-align:center;color:#777783;font-size:11px;line-height:1.6;margin-top:20px">O Clone Digital · Mensagem automática sobre uma solicitação enviada por você.</p></div></body></html>`;
  return { subject, text, html };
}

export async function GET() {
  if (!(await isAdminRequest())) return NextResponse.json({ error: "Não autorizado." }, { status: 401 });
  try {
    const sql = getDatabase();
    await ensureTable(sql);
    const feedback = await sql`SELECT f.id, f.category, f.title, f.description, f.context, f.status, f.response_text, f.notified_at, f.created_at, f.updated_at,
      a.email AS member_email, a.display_name AS member_name
      FROM member_feedback f JOIN member_accounts a ON a.id = f.account_id
      ORDER BY CASE WHEN f.status = 'Recebida' THEN 0 ELSE 1 END, f.created_at DESC LIMIT 500`;
    return NextResponse.json({ feedback, statuses: STATUSES });
  } catch (error) {
    console.error("Admin feedback list failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível carregar as sugestões." }, { status: 500 });
  }
}

export async function PATCH(request) {
  if (!(await isAdminRequest())) return NextResponse.json({ error: "Não autorizado." }, { status: 401 });
  let body;
  try { body = await request.json(); } catch { return NextResponse.json({ error: "Requisição inválida." }, { status: 400 }); }
  const id = Number(body?.id);
  const status = typeof body?.status === "string" ? body.status : "";
  const responseText = typeof body?.responseText === "string" ? body.responseText.trim().slice(0, 3000) : "";
  const sendNotification = body?.sendNotification === true;
  if (!Number.isSafeInteger(id) || id < 1 || !STATUSES.includes(status)) return NextResponse.json({ error: "Informe uma solicitação e um status válido." }, { status: 400 });
  if (sendNotification && !responseText && status !== "Concluída") return NextResponse.json({ error: "Escreva uma resposta ou marque a solicitação como concluída para notificar o membro." }, { status: 400 });
  try {
    const sql = getDatabase();
    await ensureTable(sql);
    const before = await sql`SELECT f.id, f.status AS previous_status, f.response_text, a.email AS member_email, a.display_name AS member_name, f.title, f.category
      FROM member_feedback f JOIN member_accounts a ON a.id=f.account_id WHERE f.id=${id} LIMIT 1`;
    if (!before.length) return NextResponse.json({ error: "Sugestão não encontrada." }, { status: 404 });
    const current = before[0];
    const finalResponse = responseText || current.response_text || "";
    const rows = await sql`UPDATE member_feedback SET status = ${status}, response_text = ${finalResponse || null}, updated_at = now() WHERE id = ${id} RETURNING id, status, response_text, notified_at, updated_at`;
    const shouldNotify = sendNotification || (status === "Concluída" && current.previous_status !== "Concluída");
    let notification = { sent: false };
    if (shouldNotify) {
      try {
        const content = feedbackEmail({ name: current.member_name || "", title: current.title, category: current.category, status, response: finalResponse });
        const sent = await sendResendEmail({ to: current.member_email, ...content });
        const notified = await sql`UPDATE member_feedback SET notified_at=now() WHERE id=${id} RETURNING notified_at`;
        notification = { sent: true, messageId: sent.id || null, notifiedAt: notified[0]?.notified_at || null };
      } catch (error) {
        console.error("Feedback notification failed", error instanceof Error ? error.message : "unknown_error");
        notification = { sent: false, error: "O status foi salvo, mas o e-mail não foi enviado. Confira a configuração do Resend e tente notificar novamente." };
      }
    }
    return NextResponse.json({ ok: true, feedback: { ...rows[0], notified_at: notification.notifiedAt || rows[0].notified_at }, notification });
  } catch (error) {
    console.error("Admin feedback update failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível atualizar o status." }, { status: 500 });
  }
}
