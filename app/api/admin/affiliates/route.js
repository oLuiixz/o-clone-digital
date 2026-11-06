import { NextResponse } from "next/server";
import { getDatabase } from "../../../../lib/member-auth";
import { isAdminRequest } from "../../../../lib/admin-auth";
import webpush from "web-push";
import { sendResendEmail } from "../../../../lib/resend-email";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

export async function GET() {
  if (!(await isAdminRequest())) return NextResponse.json({ error: "Não autorizado." }, { status: 401 });
  try {
    const sql = getDatabase();
    const affiliates = await sql`
      SELECT a.id, a.code, a.status, a.commission_percent, a.syncpay_recipient_id, a.created_at,
             m.email, m.display_name,
             (SELECT count(*)::int FROM affiliate_clicks c WHERE c.affiliate_id = a.id) AS clicks,
             (SELECT count(*)::int FROM affiliate_commissions c WHERE c.affiliate_id = a.id AND c.status <> 'reversed') AS sales,
             (SELECT COALESCE(sum(c.commission_cents),0)::int FROM affiliate_commissions c WHERE c.affiliate_id = a.id AND c.status IN ('pending','approved','paid')) AS commission_cents
      FROM affiliates a JOIN member_accounts m ON m.id = a.account_id
      ORDER BY CASE a.status WHEN 'pending' THEN 0 WHEN 'approved' THEN 1 ELSE 2 END, a.created_at DESC
      LIMIT 500
    `;
    return NextResponse.json({ affiliates });
  } catch (error) {
    console.error("Admin affiliates load failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível carregar os afiliados." }, { status: 500 });
  }
}

export async function PATCH(request) {
  if (!(await isAdminRequest())) return NextResponse.json({ error: "Não autorizado." }, { status: 401 });
  let body;
  try { body = await request.json(); } catch { return NextResponse.json({ error: "Requisição inválida." }, { status: 400 }); }
  const id = String(body?.id || "");
  const status = String(body?.status || "");
  const commission = Number(body?.commission_percent);
  if (!/^[0-9a-f-]{36}$/i.test(id)) return NextResponse.json({ error: "Afiliado inválido." }, { status: 400 });
  if (!["pending", "approved", "blocked"].includes(status)) return NextResponse.json({ error: "Status inválido." }, { status: 400 });
  if (!Number.isFinite(commission) || commission < 0 || commission > 100) return NextResponse.json({ error: "Comissão deve ficar entre 0% e 100%." }, { status: 400 });
  try {
    const sql = getDatabase();
    const before = await sql`SELECT a.status, a.syncpay_recipient_id, m.id AS account_id, m.email, m.display_name FROM affiliates a JOIN member_accounts m ON m.id = a.account_id WHERE a.id = ${id} LIMIT 1`;
    if (status === "approved" && !String(before[0]?.syncpay_recipient_id || "").trim()) return NextResponse.json({ error: "Cadastre e valide o identificador recebedor SyncPay antes de aprovar este afiliado." }, { status: 409 });
    const rows = await sql`
      UPDATE affiliates SET status = ${status}, commission_percent = ${commission}, updated_at = now()
      WHERE id = ${id}
      RETURNING id, status, commission_percent
    `;
    if (!rows.length) return NextResponse.json({ error: "Afiliado não encontrado." }, { status: 404 });
    if (status === "approved" && before[0]?.status !== "approved") {
      const person = before[0];
      const title = "Sua solicitação de afiliado foi aprovada!";
      const bodyText = "Parabéns! Sua solicitação para participar do programa de afiliados do O Clone Digital foi aceita. Acesse a área de afiliados para consultar seu link e acompanhar seus resultados.";
      const target = "https://oclonedigital.xyz/afiliados";
      try {
        if (person?.email && process.env.RESEND_API_KEY && process.env.RESEND_FROM_EMAIL) {
          const esc = value => String(value ?? "").replace(/[&<>"']/g, ch => ({ "&":"&amp;", "<":"&lt;", ">":"&gt;", '"':"&quot;", "'":"&#39;" }[ch]));
          await sendResendEmail({ to: person.email, subject: "Sua inscrição no programa de afiliados foi aprovada", text: `Olá ${person.display_name || ""}! ${bodyText} ${target}`, html: `<div style="font-family:Arial,sans-serif;background:#15151b;color:#f4f4f5;padding:28px;border-radius:12px"><h1>${esc(title)}</h1><p>${esc(bodyText)}</p><a href="${target}" style="color:white;background:#ff3045;padding:12px 18px;border-radius:8px;text-decoration:none">Abrir Afiliados</a></div>` });
        }
      } catch (error) { console.error("Affiliate approval email failed", error instanceof Error ? error.message : "unknown_error"); }
      try {
        if (person?.account_id && process.env.VAPID_PUBLIC_KEY && process.env.VAPID_PRIVATE_KEY && process.env.VAPID_SUBJECT) {
          const subs = await sql`SELECT endpoint, p256dh, auth FROM member_push_subscriptions WHERE account_id = ${person.account_id}`;
          webpush.setVapidDetails(process.env.VAPID_SUBJECT, process.env.VAPID_PUBLIC_KEY, process.env.VAPID_PRIVATE_KEY);
          await Promise.allSettled(subs.map(sub => webpush.sendNotification({ endpoint: sub.endpoint, keys: { p256dh: sub.p256dh, auth: sub.auth } }, JSON.stringify({ title, body: bodyText, url: "/afiliados", tag: "affiliate-approved" }))));
        }
      } catch (error) { console.error("Affiliate approval push failed", error instanceof Error ? error.message : "unknown_error"); }
    }
    return NextResponse.json({ affiliate: rows[0] });
  } catch (error) {
    console.error("Admin affiliate update failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível atualizar o afiliado." }, { status: 500 });
  }
}
