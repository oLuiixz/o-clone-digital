"use client";

import { useCallback, useEffect, useMemo, useState } from "react";
import Link from "next/link";
import "./page.css";

const STATUSES = ["Recebida", "Em análise", "Planejada", "Em desenvolvimento", "Concluída", "Não planejada"];
const fmtDate = value => value ? new Date(value).toLocaleString("pt-BR", { dateStyle: "short", timeStyle: "short" }) : "—";

export default function AdminFeedbackPage() {
  const [authenticated, setAuthenticated] = useState(false);
  const [checking, setChecking] = useState(true);
  const [password, setPassword] = useState("");
  const [items, setItems] = useState([]);
  const [category, setCategory] = useState("Todas");
  const [status, setStatus] = useState("Todos");
  const [search, setSearch] = useState("");
  const [selected, setSelected] = useState(null);
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState("");
  const [notice, setNotice] = useState("");
  const [responseText, setResponseText] = useState("");

  const load = useCallback(async () => {
    const response = await fetch("/api/admin/feedback", { credentials: "same-origin", cache: "no-store" });
    const data = await response.json();
    if (response.status === 401) { setAuthenticated(false); return; }
    if (!response.ok) throw new Error(data.error || "Não foi possível carregar.");
    setAuthenticated(true); setItems(data.feedback || []);
  }, []);

  useEffect(() => { load().catch(e => setError(e.message)).finally(() => setChecking(false)); }, [load]);

  async function login(event) {
    event.preventDefault(); setBusy(true); setError("");
    try {
      const response = await fetch("/api/admin/session", { method: "POST", headers: { "Content-Type": "application/json" }, credentials: "same-origin", body: JSON.stringify({ password }) });
      const data = await response.json();
      if (!response.ok) throw new Error(data.error || "Falha no login.");
      setPassword(""); await load();
    } catch (e) { setError(e.message); } finally { setBusy(false); }
  }

  async function updateStatus(item, nextStatus, options = {}) {
    setBusy(true); setError(""); setNotice("");
    try {
      const response = await fetch("/api/admin/feedback", { method: "PATCH", headers: { "Content-Type": "application/json" }, credentials: "same-origin", body: JSON.stringify({ id: item.id, status: nextStatus, ...(options.sendNotification ? { responseText: options.responseText ?? responseText, sendNotification: true } : {}) }) });
      const data = await response.json();
      if (!response.ok) throw new Error(data.error || "Falha ao atualizar.");
      setItems(current => current.map(row => row.id === item.id ? { ...row, ...data.feedback, status: nextStatus } : row));
      setSelected(current => current?.id === item.id ? { ...current, ...data.feedback, status: nextStatus } : current);
      if (options.sendNotification) {
        if (data.notification?.sent) setNotice("Resposta salva e e-mail enviado ao membro.");
        else setNotice(data.notification?.error || "Resposta salva, mas não foi possível enviar a notificação.");
      } else if (data.notification?.sent) setNotice("Status atualizado e membro notificado por e-mail.");
      else if (data.notification?.error) setError(data.notification.error);
      else setNotice("Status atualizado.");
    } catch (e) { setError(e.message); } finally { setBusy(false); }
  }

  const filtered = useMemo(() => items.filter(item =>
    (category === "Todas" || item.category === category) &&
    (status === "Todos" || item.status === status) &&
    [item.title, item.description, item.member_name, item.member_email, item.category].join(" ").toLowerCase().includes(search.toLowerCase())
  ), [items, category, status, search]);

  if (checking) return <main className="feedback-admin"><p>Verificando acesso administrativo…</p></main>;
  if (!authenticated) return <main className="feedback-admin"><form className="feedback-login" onSubmit={login}><Link href="/admin">← Painel administrativo</Link><p className="eyebrow">O CLONE DIGITAL · ACESSO RESTRITO</p><h1>Feedback dos membros</h1><p>Entre com a senha administrativa para visualizar as sugestões.</p><label>Senha administrativa<input type="password" autoComplete="current-password" required value={password} onChange={e => setPassword(e.target.value)} /></label>{error && <p className="feedback-error">{error}</p>}<button disabled={busy}>{busy ? "Entrando…" : "Entrar"}</button></form></main>;

  return <main className="feedback-admin"><header className="feedback-top"><div><Link href="/admin">← Voltar ao painel</Link><p className="eyebrow">O CLONE DIGITAL · COMUNIDADE</p><h1>Feedback dos membros</h1><p>Ideias, melhorias e correções enviadas por quem usa o app.</p></div><button className="secondary" onClick={() => load().catch(e => setError(e.message))}>Atualizar</button></header>
    <div className="feedback-stats"><article><small>Total recebido</small><strong>{items.length}</strong></article><article><small>Aguardando análise</small><strong>{items.filter(i => i.status === "Recebida").length}</strong></article><article><small>Concluídas</small><strong>{items.filter(i => i.status === "Concluída").length}</strong></article></div>
    {error && <p className="feedback-alert error">{error}</p>}{notice && <p className="feedback-alert">{notice}</p>}
    <section className="feedback-filters"><input aria-label="Buscar feedback" placeholder="Buscar título, membro ou descrição…" value={search} onChange={e => setSearch(e.target.value)} /><select value={category} onChange={e => setCategory(e.target.value)}><option>Todas</option><option>Sugestão</option><option>Melhoria</option><option>Nova funcionalidade</option><option>Bug/erro</option></select><select value={status} onChange={e => setStatus(e.target.value)}><option>Todos</option>{STATUSES.map(s => <option key={s}>{s}</option>)}</select></section>
    <section className="feedback-list">{filtered.map(item => <article className="feedback-item" key={item.id}><button className="feedback-item-main" onClick={() => { setSelected(item); setResponseText(item.response_text || ""); }}><span className="feedback-item-meta"><span className="feedback-category">{item.category}</span><span className="feedback-status">{item.status}</span><time>{fmtDate(item.created_at)}</time></span><strong>{item.title}</strong><p>{item.description}</p><small>Enviado por {item.member_name || item.member_email} · {item.member_email}</small></button><label className="feedback-status-control">Status<select disabled={busy} value={item.status} onChange={e => updateStatus(item, e.target.value)}>{STATUSES.map(s => <option key={s}>{s}</option>)}</select></label></article>)}{!filtered.length && <p className="feedback-empty">Nenhuma sugestão encontrada com esses filtros.</p>}</section>
    {selected && <div className="feedback-overlay" role="presentation" onClick={() => setSelected(null)}><section className="feedback-detail" role="dialog" aria-modal="true" onClick={e => e.stopPropagation()}><button className="detail-close" onClick={() => setSelected(null)} aria-label="Fechar">×</button><span className="feedback-category">{selected.category}</span><h2>{selected.title}</h2><p className="detail-description">{selected.description}</p>{selected.context && <p><b>Contexto:</b> {selected.context}</p>}<p><b>Enviado por:</b> {selected.member_name || selected.member_email} ({selected.member_email})</p><p><b>Data:</b> {fmtDate(selected.created_at)}</p><label>Status<select disabled={busy} value={selected.status} onChange={e => updateStatus(selected, e.target.value)}>{STATUSES.map(s => <option key={s}>{s}</option>)}</select></label><label className="feedback-response-label">Resposta ao membro<textarea rows={5} maxLength={3000} placeholder="Escreva uma resposta, explique a correção ou informe o que foi resolvido…" value={responseText} onChange={e => setResponseText(e.target.value)} /></label>{selected.notified_at && <p className="feedback-notified">Última notificação enviada em {fmtDate(selected.notified_at)}.</p>}<button className="detail-primary" disabled={busy || (!responseText.trim() && selected.status !== "Concluída")} onClick={() => updateStatus(selected, selected.status, { sendNotification: true, responseText })}>{busy ? "Salvando…" : "Salvar resposta e notificar membro"}</button><button className="detail-secondary" onClick={() => setSelected(null)}>Fechar</button></section></div>}
  </main>;
}
