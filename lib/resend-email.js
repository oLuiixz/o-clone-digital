import { getAppBaseUrl } from "./member-auth";

function escapeHtml(value) {
  return String(value ?? "").replace(/[&<>"']/g, (c) => ({
    "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;",
  }[c]));
}

function ticketEmailHtml({ name = "", heading, intro, activationUrl, buttonLabel, notice, typeLabel, footerLabel }) {
  const safeName = escapeHtml(name);
  const safeUrl = escapeHtml(activationUrl);
  return `<!doctype html>
<html lang="pt-BR">
<head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><meta name="color-scheme" content="light dark"><title>${escapeHtml(heading)}</title></head>
<body style="margin:0;padding:0;background-color:#101014;font-family:Arial,Helvetica,sans-serif;color:#f7f7f8;">
  <div style="display:none;font-size:1px;color:#101014;line-height:1px;max-height:0;max-width:0;opacity:0;overflow:hidden;">${escapeHtml(heading)} — O Clone Digital</div>
  <table role="presentation" width="100%" cellspacing="0" cellpadding="0" border="0" style="width:100%;background-color:#101014;">
    <tr><td align="center" style="padding:28px 12px;">
      <table role="presentation" width="560" cellspacing="0" cellpadding="0" border="0" style="width:100%;max-width:560px;border-collapse:separate;border-spacing:0;">
        <tr><td style="padding:0 0 16px 2px;color:#a1a1aa;font-size:11px;letter-spacing:3px;font-weight:bold;">O CLONE <span style="color:#ff3045;">DIGITAL</span><span style="float:right;color:#ff3045;letter-spacing:1px;">ACESSO DIGITAL</span></td></tr>
        <tr><td style="background-color:#1b1b22;border:1px solid #35353e;border-top:3px solid #ff3045;border-radius:14px 14px 0 0;padding:30px 28px 24px;">
          <table role="presentation" width="100%" cellspacing="0" cellpadding="0" border="0"><tr>
            <td style="font-size:10px;letter-spacing:2px;color:#ff5263;font-weight:bold;text-transform:uppercase;">${escapeHtml(typeLabel)}</td>
            <td align="right"><span style="display:inline-block;border:1px solid #63303a;border-radius:20px;padding:5px 9px;color:#ff8792;font-size:9px;font-weight:bold;letter-spacing:1px;">OCD / DIGITAL</span></td>
          </tr></table>
          <h1 style="margin:22px 0 10px;font-size:30px;line-height:1.12;letter-spacing:-.7px;color:#ffffff;">${escapeHtml(heading)}</h1>
          <p style="margin:0 0 22px;font-size:15px;line-height:1.7;color:#c5c5ce;">Olá${safeName ? " " + safeName : ""}! ${escapeHtml(intro)}</p>
          <table role="presentation" width="100%" cellspacing="0" cellpadding="0" border="0"><tr>
            <td width="50%" valign="top" style="padding:0 8px 12px 0;"><div style="font-size:9px;letter-spacing:1.5px;color:#92929f;text-transform:uppercase;margin-bottom:7px;">PRODUTO</div><div style="font-size:14px;line-height:1.4;font-weight:bold;color:#ffffff;">O Clone Digital</div></td>
            <td width="50%" valign="top" style="padding:0 0 12px 8px;"><div style="font-size:9px;letter-spacing:1.5px;color:#92929f;text-transform:uppercase;margin-bottom:7px;">STATUS</div><div style="font-size:14px;line-height:1.4;font-weight:bold;color:#ff6574;">${escapeHtml(footerLabel)}</div></td>
          </tr></table>
          <table role="presentation" width="100%" cellspacing="0" cellpadding="0" border="0"><tr><td style="border-top:1px dashed #55515b;font-size:1px;line-height:1px;">&nbsp;</td></tr></table>
          <p style="margin:20px 0 10px;font-size:10px;letter-spacing:1.5px;color:#92929f;">SEU PRÓXIMO PASSO</p>
          <table role="presentation" cellspacing="0" cellpadding="0" border="0" style="margin:0 0 14px;"><tr><td align="center" bgcolor="#ff3045" style="border-radius:7px;"><a href="${safeUrl}" style="display:inline-block;padding:15px 22px;border:1px solid #ff3045;border-radius:7px;color:#ffffff;text-decoration:none;font-size:14px;font-weight:bold;">${escapeHtml(buttonLabel)} &nbsp; &#8594;</a></td></tr></table>
          <p style="margin:0;font-size:12px;line-height:1.65;color:#a7a7b2;">Se o botão não funcionar, copie e cole este endereço no navegador:<br><a href="${safeUrl}" style="color:#ff7b87;word-break:break-all;">${safeUrl}</a></p>
        </td></tr>
        <tr><td style="background-color:#25252e;border:1px solid #35353e;border-top:0;border-radius:0 0 14px 14px;padding:19px 28px 22px;">
          <table role="presentation" width="100%" cellspacing="0" cellpadding="0" border="0"><tr>
            <td valign="middle"><div style="font-family:monospace;font-size:18px;letter-spacing:2px;color:#f7f7f8;white-space:nowrap;">▌▏▌▌ ▏▌▏▌▌ ▌▌▏▏</div><div style="margin-top:6px;font-family:monospace;font-size:9px;letter-spacing:2px;color:#a1a1aa;">OCD-ACESSO-DIGITAL</div></td>
            <td align="right" valign="middle"><div style="font-size:9px;letter-spacing:1px;color:#a1a1aa;text-transform:uppercase;">${escapeHtml(notice)}</div><div style="margin-top:5px;font-size:11px;font-weight:bold;color:#ffffff;">O CLONE DIGITAL</div></td>
          </tr></table>
        </td></tr>
        <tr><td align="center" style="padding:20px 12px 0;font-size:11px;line-height:1.7;color:#777783;">Esta mensagem foi enviada porque houve uma ação relacionada ao seu acesso.<br>Se você não esperava este e-mail, pode ignorá-lo.</td></tr>
      </table>
    </td></tr>
  </table>
</body></html>`;
}

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
  const html = ticketEmailHtml({
    name, heading: "Seu acesso está pronto!", intro: "seu acesso está liberado. Crie sua senha pessoal para entrar na área do aluno.",
    activationUrl, buttonLabel: "Ativar minha conta", notice: "Link individual", typeLabel: "ATIVAÇÃO DE CONTA",
    footerLabel: "Ativação pendente",
  });
  return { subject, text, html };
}

export function memberAccessEmailContent({ activationUrl, name = "" }) {
  const safeName = String(name || "").replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[c]));
  const subject = "Seu acesso ao O Clone Digital está liberado";
  const text = `Olá${safeName ? " " + name : ""}! Sua compra foi confirmada. Entre na área do aluno com a senha que você já cadastrou: ${activationUrl}\n\nSe você não esperava esta mensagem, ignore-a.`;
  const html = ticketEmailHtml({
    name, heading: "Compra confirmada!", intro: "sua compra foi confirmada e o acesso à plataforma está liberado. Entre com a senha que você já cadastrou.",
    activationUrl, buttonLabel: "Entrar na área do aluno", notice: "Guarde este e-mail", typeLabel: "ACESSO LIBERADO",
    footerLabel: "Confirmado",
  });
  return { subject, text, html };
}

export function getActivationUrl(token) {
  const base = getAppBaseUrl();
  if (!base) throw new Error("NEXT_PUBLIC_APP_URL não configurada.");
  const url = new URL("/ativar", base);
  url.searchParams.set("token", token);
  return url.toString();
}
