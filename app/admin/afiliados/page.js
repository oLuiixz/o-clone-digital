"use client";

import { useEffect, useState } from "react";
import Link from "next/link";

const money = (cents) => new Intl.NumberFormat("pt-BR", { style: "currency", currency: "BRL" }).format((Number(cents) || 0) / 100);
const statusLabel = (status) => ({ pending: "Pendente", approved: "Aprovado", blocked: "Bloqueado" }[status] || status);

export default function AdminAffiliatesPage() {
  const [rows, setRows] = useState([]);
  const [busy, setBusy] = useState("");
  const [error, setError] = useState("");
  const [notice, setNotice] = useState("");

  async function load() {
    setError("");
    const response = await fetch("/api/admin/affiliates", { cache: "no-store" });
    const body = await response.json();
    if (!response.ok) throw new Error(body.error || "Não foi possível carregar os afiliados.");
    setRows(body.affiliates || []);
  }

  useEffect(() => { load().catch((e) => setError(e.message)); }, []);

  async function update(row, status) {
    setBusy(row.id); setError(""); setNotice("");
    try {
      const response = await fetch("/api/admin/affiliates", {
        method: "PATCH", headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ id: row.id, status, commission_percent: Number(row.commission_percent ?? 40) }),
      });
      const body = await response.json();
      if (!response.ok) throw new Error(body.error || "Não foi possível atualizar.");
      setNotice("Afiliado atualizado.");
      await load();
    } catch (e) { setError(e.message); }
    finally { setBusy(""); }
  }

  async function saveCommission(row, value) {
    setBusy(row.id); setError(""); setNotice("");
    try {
      const response = await fetch("/api/admin/affiliates", {
        method: "PATCH", headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ id: row.id, status: row.status, commission_percent: Number(value) }),
      });
      const body = await response.json();
      if (!response.ok) throw new Error(body.error || "Não foi possível salvar a comissão.");
      setNotice("Comissão atualizada.");
      await load();
    } catch (e) { setError(e.message); }
    finally { setBusy(""); }
  }

  return <main style={{ minHeight: "100vh", padding: "clamp(20px, 4vw, 48px)", background: "var(--background, #0b0b0f)", color: "var(--foreground, #f4f4f5)" }}>
    <div style={{ maxWidth: 1180, margin: "0 auto" }}>
      <Link href="/admin" style={{ color: "var(--accent, #ff5364)", textDecoration: "none" }}>← Voltar ao admin</Link>
      <h1 style={{ fontSize: "clamp(30px, 4vw, 44px)", margin: "26px 0 8px" }}>Gestão de afiliados</h1>
      <p style={{ opacity: .75, lineHeight: 1.6 }}>Aprove inscrições, bloqueie afiliados e configure a comissão de cada participante.</p>
      {error && <p role="alert" style={{ padding: 14, borderRadius: 10, background: "#35151a", color: "#fecaca" }}>{error}</p>}
      {notice && <p role="status" style={{ padding: 14, borderRadius: 10, background: "#102b1d", color: "#bbf7d0" }}>{notice}</p>}
      <div style={{ display: "grid", gap: 14, marginTop: 24 }}>
        {rows.map((row) => <section key={row.id} style={{ border: "1px solid var(--border, #27272a)", borderRadius: 16, padding: 20, background: "var(--card, #121216)" }}>
          <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start", gap: 16, flexWrap: "wrap" }}>
            <div>
              <h2 style={{ margin: "0 0 6px", fontSize: 19 }}>{row.display_name || row.email}</h2>
              <p style={{ margin: "0 0 8px", opacity: .72, fontSize: 14 }}>{row.email} · Código: {row.code}</p>
              <span style={{ fontSize: 12, border: "1px solid var(--border, #3f3f46)", borderRadius: 999, padding: "5px 9px" }}>{statusLabel(row.status)}</span>
            </div>
            <div style={{ display: "flex", gap: 8, flexWrap: "wrap" }}>
              {row.status !== "approved" && <button disabled={!!busy} onClick={() => update(row, "approved")} style={buttonStyle}>Aprovar</button>}
              {row.status !== "blocked" && <button disabled={!!busy} onClick={() => update(row, "blocked")} style={{ ...buttonStyle, background: "#7f1d1d" }}>Bloquear</button>}
              {row.status !== "pending" && <button disabled={!!busy} onClick={() => update(row, "pending")} style={{ ...buttonStyle, background: "#3f3f46" }}>Voltar para pendente</button>}
            </div>
          </div>
          <div style={{ display: "flex", gap: 22, flexWrap: "wrap", marginTop: 18, fontSize: 14 }}>
            <span>Cliques: <strong>{row.clicks ?? 0}</strong></span>
            <span>Vendas atribuídas: <strong>{row.sales ?? 0}</strong></span>
            <span>Comissões registradas: <strong>{money(row.commission_cents)}</strong></span>
            <label style={{ display: "inline-flex", alignItems: "center", gap: 8 }}>Comissão
              <input aria-label={"Comissão de " + (row.email || row.code)} type="number" min="0" max="100" step="0.5" defaultValue={row.commission_percent ?? 40} id={"commission-" + row.id} style={{ width: 78, padding: "7px 9px", borderRadius: 8, border: "1px solid var(--border, #3f3f46)", background: "var(--background, #0b0b0f)", color: "inherit" }} /> %
              <button disabled={!!busy} onClick={() => saveCommission(row, document.getElementById("commission-" + row.id)?.value)} style={{ ...buttonStyle, background: "#3f3f46" }}>Salvar</button>
            </label>
          </div>
        </section>)}
        {!rows.length && !error && <p style={{ opacity: .7 }}>Nenhuma solicitação de afiliação encontrada.</p>}
      </div>
    </div>
  </main>;
}

const buttonStyle = { border: 0, borderRadius: 9, padding: "10px 14px", background: "#ff3045", color: "#fff", fontWeight: 700, cursor: "pointer" };
