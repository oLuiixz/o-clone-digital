"use client";

import { useEffect, useState } from "react";
import Link from "next/link";

export default function AdminLivePage() {
  const [url, setUrl] = useState("");
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState("");
  const [notice, setNotice] = useState("");
  useEffect(() => {
    fetch("/api/admin/live", { cache: "no-store" }).then(async (r) => {
      const data = await r.json();
      if (!r.ok) throw new Error(data.error || "Não foi possível carregar.");
      setUrl(data.video_url || "");
    }).catch((e) => setError(e.message));
  }, []);
  async function save(e) {
    e.preventDefault(); setBusy(true); setError(""); setNotice("");
    try {
      const r = await fetch("/api/admin/live", { method: "PUT", headers: { "Content-Type": "application/json" }, body: JSON.stringify({ video_url: url }) });
      const data = await r.json();
      if (!r.ok) throw new Error(data.error || "Não foi possível salvar.");
      setUrl(data.settings.video_url || "");
      setNotice(url.trim() ? "Transmissão salva. A área de membros já pode carregar o player." : "Configuração removida. A página ficará sem player até uma nova transmissão ser configurada.");
    } catch (e) { setError(e.message); }
    finally { setBusy(false); }
  }
  return <main style={{ minHeight: "100vh", padding: "clamp(20px, 4vw, 48px)", background: "var(--background, #0b0b0f)", color: "var(--foreground, #f4f4f5)" }}>
    <div style={{ maxWidth: 760, margin: "0 auto" }}>
      <Link href="/admin" style={{ color: "var(--accent, #ff5364)", textDecoration: "none" }}>← Voltar ao admin</Link>
      <h1 style={{ fontSize: "clamp(30px, 4vw, 44px)", margin: "28px 0 10px" }}>Configurar O Clone Ao Vivo</h1>
      <p style={{ opacity: .75, lineHeight: 1.7 }}>Cole o link de uma transmissão ou vídeo do YouTube. A página para membros autenticados usará esse player automaticamente. Você continua transmitindo pelo OBS; a plataforma incorpora o player.</p>
      <form onSubmit={save} style={{ marginTop: 24, padding: 24, border: "1px solid var(--border, #27272a)", borderRadius: 16, background: "var(--card, #121216)" }}>
        <label htmlFor="live-video-url" style={{ display: "block", marginBottom: 10, fontWeight: 700 }}>Link do YouTube Live ou ID do vídeo</label>
        <input id="live-video-url" value={url} onChange={(e) => setUrl(e.target.value)} placeholder="Cole aqui o link do YouTube Live" style={{ width: "100%", boxSizing: "border-box", padding: 13, borderRadius: 9, border: "1px solid var(--border, #3f3f46)", background: "var(--background, #0b0b0f)", color: "inherit" }} />
        <p style={{ fontSize: 13, opacity: .65, lineHeight: 1.6 }}>Para remover o player, apague o link e salve. O chat ainda não está integrado nesta etapa.</p>
        {error && <p role="alert" style={{ color: "#fca5a5" }}>{error}</p>}
        {notice && <p role="status" style={{ color: "#86efac" }}>{notice}</p>}
        <button disabled={busy} type="submit" style={{ marginTop: 8, border: 0, borderRadius: 9, padding: "12px 18px", background: "#ff3045", color: "#fff", fontWeight: 700, cursor: busy ? "wait" : "pointer" }}>{busy ? "Salvando…" : "Salvar transmissão"}</button>
        <a href="/ao-vivo" style={{ display: "inline-block", marginLeft: 16, color: "var(--accent, #ff5364)" }}>Ver página de membros ↗</a>
      </form>
    </div>
  </main>;
}
