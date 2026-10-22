"use client";

import { useEffect, useState } from "react";

export default function AffiliateCheckoutLink({ checkoutUrl }) {
  const [referral, setReferral] = useState(null);
  const [email, setEmail] = useState("");
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState("");
  useEffect(() => {
    fetch("/api/affiliate/referral", { cache: "no-store" })
      .then((r) => r.json()).then((data) => setReferral(data.hasReferral ? data.code : ""))
      .catch(() => setReferral(""));
  }, []);
  async function continueToCheckout(event) {
    event.preventDefault();
    setError("");
    if (!referral) { window.location.href = checkoutUrl; return; }
    setBusy(true);
    try {
      const response = await fetch("/api/affiliate/referral", {
        method: "POST", headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email, code: referral }),
      });
      const data = await response.json();
      if (!response.ok) throw new Error(data.error || "Não foi possível registrar a indicação.");
      window.location.href = checkoutUrl;
    } catch (e) { setError(e.message || "Não foi possível registrar a indicação."); }
    finally { setBusy(false); }
  }
  return <>
    {referral === null ? <button type="button" disabled className="sales-button sales-button-primary sales-buy-button" style={{ width: "100%", justifyContent: "center", opacity: .65 }}>Verificando indicação…</button> : referral ? <form onSubmit={continueToCheckout} style={{ margin: "14px 0", padding: 14, border: "1px solid #38383f", borderRadius: 12, background: "#15151b" }}>
      <label htmlFor="affiliate-customer-email" style={{ display: "block", fontSize: 13, color: "#d4d4d8", marginBottom: 8 }}>Você veio por indicação. Informe o e-mail que usará na compra para registrar a indicação.</label>
      <input id="affiliate-customer-email" type="email" autoComplete="email" required value={email} onChange={(e) => setEmail(e.target.value)} placeholder="seu@email.com" style={{ width: "100%", boxSizing: "border-box", padding: 12, borderRadius: 9, border: "1px solid #3f3f46", background: "#0b0b0f", color: "#fff" }} />
      {error && <p role="alert" style={{ color: "#fca5a5", fontSize: 13 }}>{error}</p>}
      <button disabled={busy || referral === null} type="submit" className="sales-button sales-button-primary sales-buy-button" style={{ marginTop: 10, width: "100%", justifyContent: "center" }}>{busy ? "Registrando indicação…" : "Continuar para o checkout"}</button>
      <p style={{ color: "#a1a1aa", fontSize: 11, lineHeight: 1.5, marginBottom: 0 }}>A atribuição depende do uso do mesmo e-mail no checkout. O pagamento continua sendo feito diretamente na SyncPay.</p>
    </form> : <a className="sales-button sales-button-primary sales-buy-button" href={checkoutUrl} target="_blank" rel="noreferrer">Quero acessar agora <span aria-hidden="true">↗</span></a>}
  </>;
}
