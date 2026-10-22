"use client";

import { useEffect, useState } from "react";
import Link from "next/link";

export default function AfiliadosPage() {
  const [data, setData] = useState(null);
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState("");
  const [message, setMessage] = useState("");

  async function load() {
    setError("");
    try {
      const response = await fetch("/api/member/affiliates", { cache: "no-store" });
      const body = await response.json();
      if (!response.ok) throw new Error(body.error || "Não foi possível carregar o programa.");
      setData(body);
    } catch (e) { setError(e.message || "Não foi possível carregar o programa."); }
  }
  useEffect(() => { load(); }, []);

  async function apply() {
    setBusy(true); setError(""); setMessage("");
    try {
      const response = await fetch("/api/member/affiliates", { method: "POST" });
      const body = await response.json();
      if (!response.ok) throw new Error(body.error || "Não foi possível enviar a solicitação.");
      setMessage(body.message || "Solicitação enviada.");
      await load();
    } catch (e) { setError(e.message || "Não foi possível enviar a solicitação."); }
    finally { setBusy(false); }
  }

  const affiliate = data?.affiliate;
  const money = (cents) => new Intl.NumberFormat("pt-BR", { style: "currency", currency: "BRL" }).format((Number(cents) || 0) / 100);

  return <main style={{ minHeight: "100vh", background: "#0b0b0f", color: "#f4f4f5", padding: "clamp(20px, 5vw, 56px)", fontFamily: "inherit" }}>
    <div style={{ maxWidth: 880, margin: "0 auto" }}>
      <Link href="/painel" style={{ color: "#ff5364", textDecoration: "none", fontSize: 14 }}>← Voltar ao painel</Link>
      <p style={{ color: "#ff5364", letterSpacing: ".16em", fontSize: 12, fontWeight: 700, marginTop: 34 }}>O CLONE DIGITAL</p>
      <h1 style={{ fontSize: "clamp(32px, 5vw, 48px)", lineHeight: 1.08, margin: "12px 0" }}>Programa de afiliados</h1>
      <p style={{ color: "#a1a1aa", maxWidth: 650, lineHeight: 1.7 }}>Indique o O Clone Digital e acompanhe seu desempenho. A comissão definida para o programa é de 40% sobre vendas elegíveis confirmadas.</p>

      {error && <div role="alert" style={{ marginTop: 24, padding: 16, border: "1px solid #7f1d1d", borderRadius: 12, color: "#fecaca", background: "#2a1015" }}>{error}</div>}
      {message && <div role="status" style={{ marginTop: 24, padding: 16, border: "1px solid #166534", borderRadius: 12, color: "#bbf7d0", background: "#102318" }}>{message}</div>}
      {!data && !error && <p style={{ marginTop: 28, color: "#a1a1aa" }}>Carregando programa...</p>}
      {data && !affiliate && <section style={{ marginTop: 30, border: "1px solid #27272a", borderRadius: 18, padding: 24, background: "#121216" }}>
        <h2 style={{ fontSize: 22, marginTop: 0 }}>Torne-se um afiliado</h2>
        <p style={{ color: "#a1a1aa", lineHeight: 1.7 }}>A afiliação é exclusiva para compradores com acesso ativo ao O Clone Digital. Ao solicitar, sua inscrição ficará pendente até a aprovação administrativa.</p>
        <button onClick={apply} disabled={busy} style={{ border: 0, borderRadius: 10, padding: "13px 18px", background: "#ff3045", color: "#fff", fontWeight: 700, cursor: busy ? "wait" : "pointer", opacity: busy ? .7 : 1 }}>{busy ? "Enviando..." : "Solicitar afiliação"}</button>
      </section>}
      {affiliate && <section style={{ marginTop: 30, border: "1px solid #27272a", borderRadius: 18, padding: 24, background: "#121216" }}>
        <div style={{ display: "flex", justifyContent: "space-between", gap: 16, flexWrap: "wrap", alignItems: "center" }}>
          <h2 style={{ fontSize: 22, margin: 0 }}>Sua afiliação</h2>
          <span style={{ border: "1px solid #3f3f46", borderRadius: 999, padding: "6px 11px", color: affiliate.status === "approved" ? "#86efac" : affiliate.status === "blocked" ? "#fca5a5" : "#fde68a", fontSize: 13 }}>{affiliate.status === "approved" ? "Aprovado" : affiliate.status === "blocked" ? "Bloqueado" : "Aguardando aprovação"}</span>
        </div>
        <div style={{ marginTop: 22, padding: 16, borderRadius: 12, background: "#1b1b22" }}>
          <div style={{ color: "#a1a1aa", fontSize: 13 }}>Seu código</div><strong style={{ fontSize: 20, letterSpacing: ".04em" }}>{affiliate.code}</strong>
          {affiliate.status === "approved" && <p style={{ color: "#a1a1aa", fontSize: 13, marginBottom: 0 }}>Link de indicação: https://oclonedigital.xyz/r/{affiliate.code}</p>}
        </div>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fit, minmax(145px, 1fr))", gap: 12, marginTop: 18 }}>
          {[["Comissão", (affiliate.commission_percent || 40) + "%"], ["Cliques", data.stats?.clicks ?? 0], ["Vendas atribuídas", data.stats?.sales ?? 0], ["Comissão registrada", money(data.stats?.commission_cents)], ["Já repassado", money(data.stats?.paid_cents)]].map(([label, value]) => <div key={label} style={{ border: "1px solid #27272a", borderRadius: 12, padding: 16 }}><div style={{ color: "#a1a1aa", fontSize: 12 }}>{label}</div><div style={{ fontSize: 21, fontWeight: 700, marginTop: 8 }}>{value}</div></div>)}
        </div>
        <p style={{ color: "#a1a1aa", lineHeight: 1.6, fontSize: 13, marginTop: 20 }}>As métricas de vendas e comissões serão atualizadas após a integração completa da atribuição de pedidos e a confirmação do fluxo de split/repasse. O cadastro e o painel não significam que pagamentos já estão sendo enviados automaticamente.</p>
      </section>}
    </div>
  </main>;
}
