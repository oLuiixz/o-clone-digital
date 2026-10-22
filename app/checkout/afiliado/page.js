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
  const [method, setMethod] = useState("pix");
  const [email, setEmail] = useState("");
  const [name, setName] = useState("");
  const [cpf, setCpf] = useState("");
  const [accepted, setAccepted] = useState(false);

  useEffect(() => {
    fetch("/api/affiliate/referral", { cache: "no-store" })
      .then((response) => response.json())
      .then((data) => setReferral(data.hasReferral ? data.code : ""))
      .catch(() => setReferral(""));
  }, []);

  const isAffiliateCheckout = Boolean(referral);

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
        <span className="active"><i>1</i> Seus dados</span><b />
        <span><i>2</i> Pagamento</span><b />
        <span><i>3</i> Confirmação</span>
      </div>

      <section className="oc-checkout-layout">
        <div className="oc-checkout-main">
          <div className="oc-checkout-heading">
            <span className="oc-checkout-eyebrow">FINALIZAR PEDIDO</span>
            <h1>Seu próximo passo<br /><em>começa aqui.</em></h1>
            <p>Informe seus dados para continuar com segurança.</p>
          </div>

          <section className="oc-checkout-panel">
            <div className="oc-checkout-panel-title"><span>01</span><div><h2>Seus dados</h2><p>Use o e-mail em que deseja receber seu acesso.</p></div></div>
            <div className="oc-checkout-fields">
              <label>Nome completo<input value={name} onChange={(event) => setName(event.target.value)} autoComplete="name" placeholder="Como podemos te chamar?" /></label>
              <label>E-mail<input value={email} onChange={(event) => setEmail(event.target.value)} type="email" autoComplete="email" placeholder="voce@exemplo.com.br" /></label>
              <label>CPF <span className="optional">conforme exigido pelo meio de pagamento</span><input value={cpf} onChange={(event) => setCpf(event.target.value)} inputMode="numeric" autoComplete="off" placeholder="000.000.000-00" /></label>
            </div>
            {isAffiliateCheckout && <div className="oc-checkout-referral"><span aria-hidden="true">✓</span><div><b>Indicação reconhecida</b><small>Seu pedido será associado à indicação elegível. A comissão só é registrada após confirmação válida do pagamento.</small></div></div>}
          </section>

          <section className="oc-checkout-panel">
            <div className="oc-checkout-panel-title"><span>02</span><div><h2>Forma de pagamento</h2><p>As opções finais dependem da habilitação na SyncPay.</p></div></div>
            <div className="oc-checkout-methods">
              <button type="button" className={method === "pix" ? "selected" : ""} onClick={() => setMethod("pix")}><span className="oc-method-icon">▦</span><span><b>Pix</b><small>Pagamento instantâneo</small></span><i /></button>
              <button type="button" className={method === "card" ? "selected" : ""} onClick={() => setMethod("card")}><span className="oc-method-icon">▤</span><span><b>Cartão de crédito</b><small>Conforme disponibilidade da SyncPay</small></span><i /></button>
            </div>
            <div className="oc-checkout-provider-note"><span>i</span><p>Os dados de pagamento serão enviados diretamente ao fluxo seguro disponibilizado pela SyncPay. Esta tela de demonstração ainda não cria cobranças nem coleta dados de cartão.</p></div>
          </section>

          <label className="oc-checkout-consent"><input type="checkbox" checked={accepted} onChange={(event) => setAccepted(event.target.checked)} /> <span>Confirmo que revisei o pedido e concordo com os termos aplicáveis à compra.</span></label>
          <button className="oc-checkout-submit" type="button" disabled={!accepted || !name.trim() || !email.includes("@") || cpf.replace(/\D/g, "").length !== 11} title="Aguardando configuração e validação da API oficial da SyncPay">Continuar para pagamento <span aria-hidden="true">→</span></button>
          <p className="oc-checkout-blocked">Checkout em construção: o pagamento só será habilitado depois de validar o endpoint oficial de criação de transações da SyncPay.</p>
          <p className="oc-checkout-terms">Não informe dados de cartão nesta página enquanto a integração oficial não estiver concluída.</p>
        </div>

        <aside className="oc-checkout-summary">
          <div className="oc-summary-top"><span>RESUMO DO PEDIDO</span><span className="oc-summary-dot" /></div>
          <div className="oc-summary-product"><div className="oc-summary-art"><span>C</span><i>OCD / 01</i></div><div><span className="oc-summary-label">ACESSO DIGITAL</span><h2>O Clone Digital</h2><p>Acesso à plataforma educacional</p></div></div>
          <div className="oc-summary-includes"><span>INCLUSO NO ACESSO</span><p><i>✓</i> 16 módulos organizados por tema</p><p><i>✓</i> Conteúdo educacional e prático</p><p><i>✓</i> Acesso vinculado ao e-mail da compra</p></div>
          <div className="oc-summary-pricing"><div><span>Subtotal</span><b>{money(PRODUCT_PRICE)}</b></div><div><span>Desconto</span><b>—</b></div><div className="oc-summary-total"><span>Total</span><b>{money(PRODUCT_PRICE)}</b></div></div>
          <div className="oc-summary-secure"><span>✓</span><div><b>Compra protegida</b><small>A confirmação dependerá da notificação assinada do provedor.</small></div></div>
          <p className="oc-summary-disclaimer">Pagamento único. Resultados educacionais não representam promessa de vendas ou renda.</p>
        </aside>
      </section>
      <footer className="oc-checkout-footer"><span>© {new Date().getFullYear()} O Clone Digital</span><span>Checkout próprio · Integração SyncPay pendente</span><Link href="/">Voltar ao site</Link></footer>
    </main>
  );
}
