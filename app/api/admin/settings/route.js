import { NextResponse } from "next/server";
import { getDatabase, getAppBaseUrl } from "../../../../lib/member-auth";
import { isAdminRequest } from "../../../../lib/admin-auth";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

export async function GET() {
  if (!(await isAdminRequest())) return NextResponse.json({ error: "Não autorizado." }, { status: 401 });
  const checks = {
    appUrl: Boolean(getAppBaseUrl()),
    database: false,
    resend: Boolean(process.env.RESEND_API_KEY?.trim() && process.env.RESEND_FROM_EMAIL?.trim()),
    adminPassword: Boolean(process.env.ADMIN_PANEL_PASSWORD),
  };
  let products = [];
  try {
    const sql = getDatabase();
    await sql`SELECT 1 AS connected`;
    checks.database = true;
    products = await sql`SELECT id, name, slug, is_active FROM products ORDER BY name`;
    return NextResponse.json({ checks, products, checkedAt: new Date().toISOString() });
  } catch (error) {
    console.error("Admin settings diagnostics failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ checks, products, checkedAt: new Date().toISOString(), warning: "Não foi possível consultar o banco. Confira a conexão e as migrações no painel da Vercel/Neon." }, { status: 200 });
  }
}
