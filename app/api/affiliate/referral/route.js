import { NextResponse } from "next/server";
import { cookies } from "next/headers";
import { getDatabase } from "../../../../lib/member-auth";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

export async function GET() {
  const jar = await cookies();
  const code = String(jar.get("ocd_affiliate_ref")?.value || "").trim().toLowerCase();
  if (!/^[a-z0-9-]{3,40}$/.test(code)) return NextResponse.json({ hasReferral: false });
  try {
    const sql = getDatabase();
    const rows = await sql`SELECT code FROM affiliates WHERE lower(code) = ${code} AND status = 'approved' LIMIT 1`;
    return NextResponse.json({ hasReferral: rows.length > 0, code: rows[0]?.code || null });
  } catch {
    return NextResponse.json({ hasReferral: false });
  }
}

export async function POST(request) {
  let body;
  try { body = await request.json(); } catch { return NextResponse.json({ error: "Dados inválidos." }, { status: 400 }); }
  const email = String(body?.email || "").trim().toLowerCase();
  const code = String(body?.code || "").trim().toLowerCase();
  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email) || email.length > 320) {
    return NextResponse.json({ error: "Informe um e-mail válido. Use o mesmo e-mail na compra." }, { status: 400 });
  }
  if (!/^[a-z0-9-]{3,40}$/.test(code)) return NextResponse.json({ error: "Link de indicação inválido." }, { status: 400 });
  try {
    const sql = getDatabase();
    const affiliate = await sql`SELECT id FROM affiliates WHERE lower(code) = ${code} AND status = 'approved' LIMIT 1`;
    if (!affiliate.length) return NextResponse.json({ error: "Este link de indicação não está ativo." }, { status: 400 });
    await sql`INSERT INTO affiliate_attributions (affiliate_id, customer_email, expires_at)
      VALUES (${affiliate[0].id}, ${email}, now() + interval '30 days')`;
    return NextResponse.json({ saved: true });
  } catch (error) {
    console.error("Affiliate attribution failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível registrar a indicação agora. Tente novamente." }, { status: 503 });
  }
}
