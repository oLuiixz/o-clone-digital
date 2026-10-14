"use client";

import { useState } from "react";

export default function MemberFeedback() {
  const [open, setOpen] = useState(false);
  const [category, setCategory] = useState("Sugestão");
  const [title, setTitle] = useState("");
  const [description, setDescription] = useState("");
  const [context, setContext] = useState("");
  const [busy, setBusy] = useState(false);
  const [message, setMessage] = useState("");
  const [error, setError] = useState("");

  async function submit(event) {
    event.preventDefault();
    setBusy(true); setError(""); setMessage("");
    try {
      const response = await fetch("/api/member/feedback", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        credentials: "same-origin",
        body: JSON.stringify({ category, title, description, context }),
      });
      const data = await response.json();
      if (!response.ok) throw new Error(data.error || "Não foi possível enviar sua mensagem.");
      setMessage(data.message || "Feedback enviado com sucesso.");
      setTitle(""); setDescription(""); setContext(""); setCategory("Sugestão");
    } catch (e) {
      setError(e.message || "Ocorreu um erro. Tente novamente.");
    } finally { setBusy(false); }
  }

  return (
    <section className="member-feedback" aria-labelledby="member-feedback-title">
      <div className="member-feedback-copy">
        <span className="member-feedback-kicker">SUA VOZ IMPORTA</span>
        <h2 id="member-feedback-title">Ajude a melhorar o O Clone Digital</h2>
        <p>Tem uma ideia, encontrou um erro ou sente falta de algo? Envie seu feedback diretamente para a equipe.</p>
      </div>
      <button type="button" className="member-feedback-open" onClick={() => { setOpen(v => !v); setError(""); }}>{open ? "Fechar formulário" : "Enviar sugestão"}</button>
      {open && <form className="member-feedback-form" onSubmit={submit}>
        <label>Tipo de feedback
          <select value={category} onChange={e => setCategory(e.target.value)}>
            <option>Sugestão</option><option>Melhoria</option><option>Nova funcionalidade</option><option>Bug/erro</option>
          </select>
        </label>
        <label>Título
          <input required minLength={4} maxLength={120} value={title} onChange={e => setTitle(e.target.value)} placeholder="Resuma sua ideia ou problema" />
        </label>
        <label>Detalhes
          <textarea required minLength={10} maxLength={3000} rows={4} value={description} onChange={e => setDescription(e.target.value)} placeholder="Explique sua sugestão com o máximo de contexto possível" />
        </label>
        <label>Onde aconteceu? <span>(opcional)</span>
          <input maxLength={160} value={context} onChange={e => setContext(e.target.value)} placeholder="Ex.: Módulo 02, página de configurações…" />
        </label>
        {error && <p className="member-feedback-error" role="alert">{error}</p>}
        {message && <p className="member-feedback-success" role="status">{message}</p>}
        <button type="submit" disabled={busy}>{busy ? "Enviando…" : "Enviar feedback"}</button>
      </form>}
      <style jsx>{`
        .member-feedback{display:flex;align-items:center;justify-content:space-between;gap:24px;flex-wrap:wrap;margin:28px 0 8px;padding:24px;border:1px solid var(--border-color,#303039);border-radius:18px;background:linear-gradient(120deg,rgba(255,48,69,.09),rgba(255,255,255,.015))}
        .member-feedback-copy{flex:1;min-width:220px}.member-feedback-kicker{font-size:10px;letter-spacing:.16em;font-weight:800;color:#ff5365}.member-feedback h2{font-size:clamp(18px,2vw,23px);margin:8px 0}.member-feedback p{color:var(--muted-color,#a5a5af);line-height:1.55;margin:0}
        .member-feedback button{border:0;border-radius:10px;padding:12px 16px;background:#ff3045;color:white;font-weight:750;cursor:pointer}.member-feedback button:disabled{opacity:.6;cursor:wait}
        .member-feedback-form{flex-basis:100%;display:grid;gap:14px;padding-top:18px;border-top:1px solid var(--border-color,#303039)}.member-feedback-form label{display:grid;gap:7px;font-size:13px;font-weight:650}.member-feedback-form label span{display:inline;color:var(--muted-color,#a5a5af);font-weight:400}.member-feedback-form input,.member-feedback-form select,.member-feedback-form textarea{width:100%;min-width:0;border:1px solid var(--border-color,#383842);border-radius:9px;padding:12px;background:var(--input-bg,#111116);color:inherit;font:inherit}.member-feedback-form textarea{resize:vertical}.member-feedback-error,.member-feedback-success{padding:11px 13px;border-radius:9px}.member-feedback-error{background:rgba(255,48,69,.12);color:#ff9aa5!important}.member-feedback-success{background:rgba(45,180,110,.12);color:#79dfa7!important}.member-feedback-form button{justify-self:start}
        @media(max-width:600px){.member-feedback{padding:18px}.member-feedback-open{width:100%}.member-feedback-form button{width:100%}}
      `}</style>
    </section>
  );
}
