import { NextResponse } from "next/server";
import { getCurrentMember, getDatabase } from "../../../../lib/member-auth";

export const runtime = "nodejs";

export async function GET() {
  const member = await getCurrentMember();
  if (!member) return NextResponse.json({ error: "Faça login para configurar notificações." }, { status: 401 });
  const configured = Boolean(process.env.VAPID_PUBLIC_KEY && process.env.VAPID_PRIVATE_KEY);
  const sql = getDatabase();
  const rows = await sql`SELECT endpoint FROM member_push_subscriptions WHERE account_id = ${member.id} LIMIT 1`;
  return NextResponse.json({ configured, subscribed: rows.length > 0, publicKey: configured ? process.env.VAPID_PUBLIC_KEY : null });
}

export async function POST(request) {
  const member = await getCurrentMember();
  if (!member) return NextResponse.json({ error: "Faça login para configurar notificações." }, { status: 401 });
  if (!process.env.VAPID_PUBLIC_KEY || !process.env.VAPID_PRIVATE_KEY) {
    return NextResponse.json({ error: "O serviço push ainda não foi configurado no servidor." }, { status: 503 });
  }
  let body;
  try { body = await request.json(); } catch { return NextResponse.json({ error: "Dados inválidos." }, { status: 400 }); }
  const sub = body?.subscription;
  if (!sub?.endpoint || !sub?.keys?.p256dh || !sub?.keys?.auth) {
    return NextResponse.json({ error: "O navegador não retornou uma inscrição push válida." }, { status: 400 });
  }
  const sql = getDatabase();
  await sql`INSERT INTO member_push_subscriptions (account_id, endpoint, p256dh, auth, user_agent, updated_at)
    VALUES (${member.id}, ${sub.endpoint}, ${sub.keys.p256dh}, ${sub.keys.auth}, ${(request.headers.get("user-agent") || "").slice(0, 500)}, now())
    ON CONFLICT (endpoint) DO UPDATE SET account_id = EXCLUDED.account_id, p256dh = EXCLUDED.p256dh, auth = EXCLUDED.auth, user_agent = EXCLUDED.user_agent, updated_at = now()`;
  return NextResponse.json({ ok: true, subscribed: true });
}

export async function DELETE() {
  const member = await getCurrentMember();
  if (!member) return NextResponse.json({ error: "Faça login para configurar notificações." }, { status: 401 });
  const sql = getDatabase();
  await sql`DELETE FROM member_push_subscriptions WHERE account_id = ${member.id}`;
  return NextResponse.json({ ok: true, subscribed: false });
}
