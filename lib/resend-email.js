import { getAppBaseUrl } from "./member-auth";

export async function sendResendEmail({ to, subject, text, html }) {
  const apiKey = process.env.RESEND_API_KEY?.trim();
  const from = process.env.RESEND_FROM_EMAIL?.trim();
  if (!apiKey || !from) throw new Error("Resend não configurado: defina RESEND_API_KEY e RESEND_FROM_EMAIL.");
  const response = await fetch("https://api.resend.com/emails", {
    method: "POST",
    headers: { Authorization: `Bearer ${apiKey}`, "Content-Type": "application/json" },
    body: JSON.stringify({ from, to: [to], subject, text, html }),
    cache: "no-store",
  });
  const result = await response.json().catch(() => ({}));
  if (!response.ok) {
    console.error("Resend email failed", { status: response.status, name: result?.name, message: result?.message });
    throw new Error("O Resend não aceitou o e-mail. Confira o domínio remetente e a chave de API.");
  }
  return { id: result.id || null };
}

export function activationEmailContent({ activationUrl, name = "" }) {
  const safeName = String(name || "").replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[c]));
  const subject = "Seu acesso ao O Clone Digital está pronto";
  const text = `Olá${safeName ? " " + name : ""}! Seu acesso ao O Clone Digital está pronto. Crie sua senha neste link: ${activationUrl}\n\nO link expira em 30 minutos e só pode ser usado uma vez. Se você não esperava esta mensagem, ignore-a.`;
  const html = `<div style="font-family:Arial,sans-serif;max-width:560px;margin:32px auto;padding:28px;color:#171717;border:1px solid #eee;border-radius:14px"><p style="font-size:12px;letter-spacing:2px;color:#ff315b;font-weight:bold">O CLONE DIGITAL</p><h1 style="font-size:26px">Seu acesso está pronto!</h1><p>Olá${safeName ? " " + safeName : ""}! Seu acesso está liberado. Crie sua senha pessoal para entrar na área do aluno.</p><p style="margin:28px 0"><a href="${activationUrl}" style="display:inline-block;padding:14px 22px;background:linear-gradient(100deg,#ff315b,#a46bff);color:#fff;text-decoration:none;border-radius:8px;font-weight:bold">Ativar minha conta</a></p><p style="font-size:13px;color:#555">Por segurança, o link expira em 30 minutos e só pode ser usado uma vez.</p><p style="font-size:12px;color:#888">Se você não esperava esta mensagem, pode ignorá-la.</p></div>`;
  return { subject, text, html };
}

export function getActivationUrl(token) {
  const base = getAppBaseUrl();
  if (!base) throw new Error("NEXT_PUBLIC_APP_URL não configurada.");
  const url = new URL("/ativar", base);
  url.searchParams.set("token", token);
  return url.toString();
}
