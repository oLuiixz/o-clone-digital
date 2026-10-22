"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import "./checkout.css";

const PRODUCT_PRICE = 17.9;

function money(value) {
  return new Intl.NumberFormat("pt-BR", { style: "currency", currency: "BRL" }).format(value);
}

export default function AffiliateCheckoutPage() {
  const [referral, setReferral] = useState(null);
  const [email, setEmail] = useState("");
  const [name, setName] = useState("");
  const [cpf, setCpf] = useState("");
  const [phone, setPhone] = useState("");
  const [accepted, setAccepted] = useState(false);
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState("");
  const [pix, setPix] = useState(null);

  useEffect(() => {
    fetch("/api/affiliate/referral", { cache: "no-store" })
      .then((response) => response.json())
      .then((data) => setReferral(data.hasReferral ? data.code : ""))
      .catch(() => setReferral(""));
  }, []);

  async function handleSubmit(event) {
    event.preventDefault();
    if (busy || pix) return;
    setBusy(true);
    setError("");
    try {
      if (referral) {
        const attribution = await fetch("/api/affiliate/referral", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ email, code: referral }),
        });
        const attributionData = await attribution.json().catch(() => ({}));
        if (!attribution.ok) throw new Error(attributionData.error || "Não foi possível validar a indicação.");
      }

      const response = await fetch("/api/checkout/syncpay", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ name, email, cpf, phone, method: "pix", accepted }),
      });
      const data = await response.json().catch(() => ({}));
      if (!response.ok) throw new Error(data.error || "Não foi possível gerar o Pix.");
      if (!data.payment?.pixCode || !data.payment?.identifier) throw new Error("A SyncPay não retornou os dados completos do Pix.");
      setPix(data.payment);
    } catch (submitError) {
      setError(submitError instanceof Error ? submitError.message : "Falha ao iniciar o pagamento.");
    } finally {
      setBusy(false);
    }
  }

  async function copyPixCode() {
    if (!pix?.pixCode) return;
    try {
      await navigator.clipboard.writeText(pix.pixCode);
      setError("Código Pix copiado. Abra o aplicativo do seu banco para concluir o pagamento.");
    } catch {
      setError("Não foi possível copiar automaticamente. Selecione e copie o código Pix exibido.");
    }
  }

  return (
    <main className="oc-checkout">
      <header className="oc-checkout-header">
        <Link href="/" className="oc-checkout-brand" aria-label="O Clone Digital — início">
          <span className="oc-checkout-logo">C</span>
          <span>O CLONE <b>DIGITAL</b><small>LABORATÓRIO DE OFERTAS</small></span>
        </Link>
        <div className="oc-checkout-security"><span aria-hidden="true">✓</span> Ambiente de checkout</div>
      </header>

      <div className="oc-checkout-progress" aria-label="Etapas do checkout">
        <span className={!pix ? "active" : ""}><i>1</i> Seus dados</span><b />
        <span className={pix ? "active" : ""}><i>2</i> Pagamento</span><b />
        <span><i>3</i> Confirmação</span>
      </div>

      <section className="oc-checkout-layout">
        <div className="oc-checkout-main">
          {!pix ? (
            <>
              <div className="oc-checkout-heading">
                <span className="oc-checkout-eyebrow">FINALIZAR PEDIDO</span>
                <h1>Seu próximo passo<br /><em>começa aqui.</em></h1>
                <p>Informe seus dados para gerar seu Pix com segurança.</p>
              </div>

              <form onSubmit={handleSubmit}>
                <section className="oc-checkout-panel">
                  <div className="oc-checkout-panel-title"><span>01</span><div><h2>Seus dados</h2><p>Use o e-mail em que deseja receber seu acesso.</p></div></div>
                  <div className="oc-checkout-fields">
                    <label>Nome completo<input required minLength={2} maxLength={120} value={name} onChange={(event) => setName(event.target.value)} autoComplete="name" placeholder="Como podemos te chamar?" /></label>
                    <label>E-mail<input required value={email} onChange={(event) => setEmail(event.target.value)} type="email" maxLength={320} autoComplete="email" placeholder="voce@exemplo.com.br" /></label>
                    <label>CPF <span className="optional">necessário para gerar o Pix</span><input required value={cpf} onChange={(event) => setCpf(event.target.value)} inputMode="numeric" autoComplete="off" placeholder="000.000.000-00" maxLength={14} /></label>
                    <label>Celular<input required value={phone} onChange={(event) => setPhone(event.target.value)} type="tel" inputMode="tel" autoComplete="tel" placeholder="(11) 99999-9999" maxLength={20} /></label>
                  </div>
                  {referral && <div className="oc-checkout-referral"><span aria-hidden="true">✓</span><div><b>Indicação reconhecida</b><small>A indicação elegível será associada ao pedido. A comissão depende da confirmação válida do pagamento.</small></div></div>}
                </section>

                <section className="oc-checkout-panel">
                  <div className="oc-checkout-panel-title"><span>02</span><div><h2>Forma de pagamento</h2><p>Pix disponível neste checkout.</p></div></div>
                  <div className="oc-checkout-methods">
                    <button type="button" className="selected" aria-pressed="true"><span className="oc-method-icon">▦</span><span><b>Pix</b><small>Pagamento instantâneo</small></span><i /></button>
                  </div>
                  <div className="oc-checkout-provider-note"><span>i</span><p>A cobrança é criada no servidor pela API oficial da SyncPay. O acesso só é liberado após confirmação do pagamento.</p></div>
                </section>

                <label className="oc-checkout-consent"><input type="checkbox" checked={accepted} onChange={(event) => setAccepted(event.target.checked)} required /> <span>Confirmo que revisei o pedido e concordo com os termos aplicáveis à compra.</span></label>
                {error && <p className="oc-checkout-blocked" role="alert">{error}</p>}
                <button className="oc-checkout-submit" type="submit" disabled={busy || !accepted || !name.trim() || !email.includes("@") || cpf.replace(/\D/g, "").length !== 11 || phone.replace(/\D/g, "").length < 10}>
                  {busy ? "Gerando Pix com segurança…" : <>Gerar Pix de {money(PRODUCT_PRICE)} <span aria-hidden="true">→</span></>}
                </button>
                <p className="oc-checkout-terms">Não solicitamos dados de cartão neste checkout. Não feche a página antes de copiar o código Pix.</p>
              </form>
            </>
          ) : (
            <div className="oc-checkout-heading">
              <span className="oc-checkout-eyebrow">PIX GERADO</span>
              <h1>Finalize seu<br /><em>pagamento.</em></h1>
              <p>Pedido criado. O acesso será liberado depois que a SyncPay confirmar o pagamento.</p>
              <section className="oc-checkout-panel">
                <div className="oc-checkout-panel-title"><span>02</span><div><h2>Pix copia e cola</h2><p>Total: {money(PRODUCT_PRICE)}</p></div></div>
                <textarea aria-label="Código Pix copia e cola" readOnly value={pix.pixCode} rows={5} onFocus={(event) => event.target.select()} />
                <button className="oc-checkout-submit" type="button" onClick={copyPixCode}>Copiar código Pix <span aria-hidden="true">▣</span></button>
                {error && <p role="status">{error}</p>}
                <p className="oc-checkout-terms">Após pagar, aguarde a confirmação automática. Não gere outra cobrança para o mesmo pedido.</p>
              </section>
            </div>
          )}
        </div>

        <aside className="oc-checkout-summary">
          <div className="oc-summary-top"><span>RESUMO DO PEDIDO</span><span className="oc-summary-dot" /></div>
          <div className="oc-summary-product"><div className="oc-summary-art"><span>C</span><i>OCD / 01</i></div><div><span className="oc-summary-label">ACESSO DIGITAL</span><h2>O Clone Digital</h2><p>Acesso à plataforma educacional</p></div></div>
          <div className="oc-summary-includes"><span>INCLUSO NO ACESSO</span><p><i>✓</i> 16 módulos organizados por tema</p><p><i>✓</i> Conteúdo educacional e prático</p><p><i>✓</i> Acesso vinculado ao e-mail da compra</p></div>
          <div className="oc-summary-pricing"><div><span>Subtotal</span><b>{money(PRODUCT_PRICE)}</b></div><div><span>Desconto</span><b>—</b></div><div className="oc-summary-total"><span>Total</span><b>{money(PRODUCT_PRICE)}</b></div></div>
          <div className="oc-summary-secure"><span>✓</span><div><b>Compra protegida</b><small>A confirmação depende da notificação validada do provedor.</small></div></div>
          <p className="oc-summary-disclaimer">Pagamento único. Resultados educacionais não representam promessa de vendas ou renda.</p>
        </aside>
      </section>
      <footer className="oc-checkout-footer"><span>© {new Date().getFullYear()} O Clone Digital</span><span>Checkout próprio · Pix via SyncPay</span><Link href="/">Voltar ao site</Link></footer>
    </main>
  );
}
