"use client";

import { useEffect, useState } from "react";
import "./push-opt-in-prompt.css";

const DEFER_KEY = "ocd-push-opt-in-deferred-until";
const DEFER_DAYS = 7;

function isStandalone() {
  return window.matchMedia("(display-mode: standalone)").matches || window.navigator.standalone === true;
}

export default function PushOptInPrompt() {
  const [visible, setVisible] = useState(false);
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState("");
  const [unsupported, setUnsupported] = useState(false);

  useEffect(() => {
    let live = true;
    const timer = window.setTimeout(async () => {
      try {
        if (!("Notification" in window) || !("serviceWorker" in navigator) || !("PushManager" in window)) return;
        const response = await fetch("/api/push/subscribe", { credentials: "same-origin", cache: "no-store" });
        if (!live || response.status === 401 || !response.ok) return;
        const data = await response.json();
        if (!live || !data.configured || data.subscribed) return;
        if (Notification.permission === "denied") return;
        let deferredUntil = 0;
        try { deferredUntil = Number(localStorage.getItem(DEFER_KEY) || 0); } catch {}
        if (deferredUntil > Date.now()) return;
        setVisible(true);
      } catch {}
    }, 3000);
    return () => { live = false; window.clearTimeout(timer); };
  }, []);

  function defer() {
    try { localStorage.setItem(DEFER_KEY, String(Date.now() + DEFER_DAYS * 24 * 60 * 60 * 1000)); } catch {}
    setVisible(false);
  }

  async function activate() {
    if (busy) return;
    setBusy(true);
    setError("");
    try {
      if (!window.isSecureContext) throw new Error("As notificações precisam de uma conexão HTTPS segura.");
      if (!("Notification" in window) || !("serviceWorker" in navigator) || !("PushManager" in window)) {
        setUnsupported(true);
        throw new Error("Este navegador não oferece suporte a notificações push.");
      }
      if (/iphone|ipad|ipod/i.test(navigator.userAgent) && !isStandalone()) {
        setUnsupported(true);
        throw new Error("No iPhone ou iPad, adicione o app à Tela de Início pelo Safari e abra-o por lá para ativar as notificações.");
      }
      const permission = Notification.permission === "default" ? await Notification.requestPermission() : Notification.permission;
      if (permission !== "granted") {
        if (permission === "denied") {
          setUnsupported(true);
          throw new Error("A permissão está bloqueada no navegador. Altere a permissão nas configurações do navegador e tente novamente.");
        }
        throw new Error("A permissão não foi concedida. Você pode tentar novamente mais tarde.");
      }
      const configResponse = await fetch("/api/push/subscribe", { credentials: "same-origin", cache: "no-store" });
      const config = await configResponse.json();
      if (!configResponse.ok || !config.configured || !config.publicKey) throw new Error(config.error || "As notificações ainda não estão configuradas no servidor.");
      const registration = await navigator.serviceWorker.register("/sw.js", { scope: "/" });
      await navigator.serviceWorker.ready;
      const normalizedKey = config.publicKey.replace(/-/g, "+").replace(/_/g, "/");
      const applicationServerKey = Uint8Array.from(atob(normalizedKey + "=".repeat((4 - normalizedKey.length % 4) % 4)), c => c.charCodeAt(0));
      let subscription = await registration.pushManager.getSubscription();
      if (!subscription) subscription = await registration.pushManager.subscribe({ userVisibleOnly: true, applicationServerKey });
      const saveResponse = await fetch("/api/push/subscribe", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        credentials: "same-origin",
        body: JSON.stringify({ subscription: subscription.toJSON() })
      });
      const saved = await saveResponse.json();
      if (!saveResponse.ok) throw new Error(saved.error || "Não foi possível registrar este dispositivo.");
      try { localStorage.removeItem(DEFER_KEY); } catch {}
      setVisible(false);
      // Inform the member locally that opt-in succeeded without sending an unsolicited test push.
      setNotice("Notificações ativadas! Você receberá avisos e atualizações do O Clone Digital.");
    } catch (e) {
      setError(e?.message || "Não foi possível ativar as notificações.");
    } finally {
      setBusy(false);
    }
  }

  const [notice, setNotice] = useState("");
  if (notice) return <div className="push-optin-toast" role="status"><span>✓</span><div><strong>Notificações ativadas</strong><p>Você receberá avisos e atualizações do O Clone Digital.</p></div><button onClick={() => setNotice("")} aria-label="Fechar">×</button></div>;
  if (!visible) return null;
  return <div className="push-optin-backdrop" role="presentation">
    <section className="push-optin-card" role="dialog" aria-modal="true" aria-labelledby="push-optin-title">
      <div className="push-optin-icon" aria-hidden="true"><svg viewBox="0 0 24 24" fill="none"><path d="M18 8a6 6 0 0 0-12 0c0 7-3 7-3 9h18c0-2-3-2-3-9M10 21h4" stroke="currentColor" strokeWidth="1.7" strokeLinecap="round" strokeLinejoin="round"/></svg></div>
      <span className="push-optin-eyebrow">FIQUE POR DENTRO</span>
      <h2 id="push-optin-title">Não perca nenhuma novidade</h2>
      <p>Ative as notificações para receber avisos importantes, atualizações e novidades do O Clone Digital diretamente neste dispositivo.</p>
      {error && <p className="push-optin-error" role="alert">{error}</p>}
      {unsupported && <p className="push-optin-help">Você pode ajustar as permissões do navegador e ativar as notificações depois em Configurações.</p>}
      <div className="push-optin-actions"><button className="push-optin-primary" onClick={activate} disabled={busy}>{busy ? "Ativando…" : "Ativar notificações"}</button><button className="push-optin-later" onClick={defer} disabled={busy}>Ativar depois</button></div>
      <small>Você pode alterar essa preferência a qualquer momento.</small>
    </section>
  </div>;
}
