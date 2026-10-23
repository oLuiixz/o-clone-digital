import { jsonError, listPasskeys, registrationOptions, requirePasskeyMember, verifyRegistration } from "../../../../lib/passkeys";
export const runtime = "nodejs";
export async function GET() {
 try { const member = await requirePasskeyMember(); if (!member) return jsonError("Faça login para gerenciar suas chaves de acesso.", 401); return Response.json({ passkeys: await listPasskeys(member) }); }
 catch (error) { console.error("Passkey list failed", error instanceof Error ? error.message : "unknown_error"); return jsonError("Não foi possível carregar as chaves de acesso.", 500); }
}
export async function POST(request) {
 try { const member = await requirePasskeyMember(); if (!member) return jsonError("Faça login para cadastrar uma chave de acesso.", 401); const body = await request.json();
  if (body.action === "options") return Response.json(await registrationOptions(member));
  if (body.action === "verify") { if (!body.response) return jsonError("Resposta da chave ausente."); await verifyRegistration(member, body.response, body.label); return Response.json({ ok: true, message: "Chave de acesso cadastrada neste dispositivo." }); }
  return jsonError("Ação inválida.");
 } catch (error) { console.error("Passkey registration failed", error instanceof Error ? error.message : "unknown_error"); return jsonError(error.message || "Não foi possível cadastrar a chave de acesso.", 400); }
}
export async function DELETE(request) {
 try { const member = await requirePasskeyMember(); if (!member) return jsonError("Faça login para gerenciar suas chaves.", 401); const { id } = await request.json(); if (!id) return jsonError("Chave inválida."); const { getDatabase } = await import("../../../../lib/member-auth"); const sql = getDatabase(); const rows = await sql`DELETE FROM member_passkeys WHERE id = ${id} AND account_id = ${member.id} RETURNING id`; if (!rows.length) return jsonError("Chave não encontrada.", 404); return Response.json({ ok: true }); }
 catch { return jsonError("Não foi possível remover a chave.", 500); }
}