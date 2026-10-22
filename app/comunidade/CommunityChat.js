"use client";

import { useCallback, useEffect, useRef, useState } from "react";

function shortTime(value) {
  try { return new Intl.DateTimeFormat("pt-BR", { hour: "2-digit", minute: "2-digit" }).format(new Date(value)); }
  catch { return ""; }
}
function initials(name) {
  return (name || "Membro").trim().split(/\s+/).slice(0, 2).map(part => part[0] || "").join("").toUpperCase();
}
function MessageMedia({ item }) {
  if (!item.media_data || !item.media_type) return null;
  if (item.media_type.startsWith("image/")) return <a href={item.media_data} target="_blank" rel="noreferrer" className="community-media-link"><img className="community-image" src={item.media_data} alt={item.media_name || "Imagem compartilhada"} loading="lazy" /></a>;
  if (item.media_type.startsWith("video/")) return <video className="community-video" src={item.media_data} controls preload="metadata" />;
  if (item.media_type.startsWith("audio/")) return <audio className="community-audio" src={item.media_data} controls preload="metadata" />;
  return null;
}

export default function CommunityChat({ currentMemberId }) {
  const [messages, setMessages] = useState([]);
  const [draft, setDraft] = useState("");
  const [replyTo, setReplyTo] = useState(null);
  const [file, setFile] = useState(null);
  const [fileData, setFileData] = useState("");
  const [loading, setLoading] = useState(true);
  const [sending, setSending] = useState(false);
  const [error, setError] = useState("");
  const [members, setMembers] = useState([]);
  const [membersOpen, setMembersOpen] = useState(false);
  const bottomRef = useRef(null);
  const inputRef = useRef(null);
  const lastId = useRef(0);

  const loadMessages = useCallback(async (initial = false) => {
    try {
      const url = initial || !lastId.current ? "/api/community" : "/api/community?after=" + lastId.current;
      const response = await fetch(url, { cache: "no-store" });
      const data = await response.json();
      if (!response.ok) throw new Error(data.error || "Falha ao carregar mensagens.");
      if (initial || !lastId.current) setMessages(data.messages || []);
      else if (data.messages?.length) setMessages(old => [...old, ...data.messages].slice(-150));
      const list = initial || !lastId.current ? data.messages || [] : data.messages || [];
      if (list.length) lastId.current = Math.max(lastId.current, ...list.map(item => Number(item.id)));
      setError("");
    } catch (e) { setError(e.message || "Não foi possível atualizar o chat."); }
    finally { setLoading(false); }
  }, []);

  const loadMembers = useCallback(async () => {
    try {
      const response = await fetch("/api/community?members=1", { cache: "no-store" });
      const data = await response.json();
      if (response.ok) setMembers(data.members || []);
    } catch {}
  }, []);

  useEffect(() => {
    if (!currentMemberId) return;
    const markRead = () => {
      try { localStorage.setItem("ocd-community-read-" + currentMemberId, new Date().toISOString()); } catch {}
    };
    markRead();
    const timer = setInterval(markRead, 4000);
    return () => clearInterval(timer);
  }, [currentMemberId]);

  useEffect(() => {
    loadMessages(true);
    const timer = setInterval(() => loadMessages(false), 4000);
    const heartbeat = () => fetch("/api/community", { method: "POST", headers: { "Content-Type": "application/json" }, body: JSON.stringify({ action: "heartbeat" }) }).catch(() => {});
    heartbeat(); loadMembers();
    const heartbeatTimer = setInterval(heartbeat, 25000);
    const membersTimer = setInterval(loadMembers, 20000);
    return () => { clearInterval(timer); clearInterval(heartbeatTimer); clearInterval(membersTimer); };
  }, [loadMessages, loadMembers]);
  useEffect(() => { bottomRef.current?.scrollIntoView({ behavior: "smooth", block: "end" }); }, [messages.length]);

  async function selectFile(event) {
    const selected = event.target.files?.[0];
    if (!selected) return;
    const allowed = ["image/jpeg", "image/png", "image/webp", "image/gif", "video/mp4", "video/webm", "audio/mpeg", "audio/mp4", "audio/ogg", "audio/webm", "audio/wav"];
    if (!allowed.includes(selected.type)) { setError("Formato não permitido. Envie imagem, vídeo MP4/WebM ou áudio compatível."); event.target.value = ""; return; }
    if (selected.size > 1_200_000) { setError("O arquivo deve ter no máximo 1,2 MB."); event.target.value = ""; return; }
    try {
      const reader = new FileReader();
      reader.onload = () => { setFile(selected); setFileData(String(reader.result || "")); setError(""); };
      reader.onerror = () => setError("Não foi possível ler o arquivo.");
      reader.readAsDataURL(selected);
    } catch { setError("Não foi possível ler o arquivo."); }
  }

  async function send(event) {
    event.preventDefault();
    if ((!draft.trim() && !fileData) || sending) return;
    setSending(true); setError("");
    try {
      const response = await fetch("/api/community", { method: "POST", headers: { "Content-Type": "application/json" }, body: JSON.stringify({ message: draft.trim(), mediaData: fileData, mediaType: file?.type || "", mediaName: file?.name || "", replyToId: replyTo?.id || null }) });
      const data = await response.json();
      if (!response.ok) throw new Error(data.error || "Não foi possível enviar.");
      const newMessage = data.message;
      setMessages(old => [...old, newMessage].slice(-150));
      lastId.current = Math.max(lastId.current, Number(newMessage.id));
      setDraft(""); setFile(null); setFileData(""); setReplyTo(null);
      if (inputRef.current) inputRef.current.value = "";
    } catch (e) { setError(e.message || "Não foi possível enviar a mensagem."); }
    finally { setSending(false); }
  }

  return <div className="community-layout"><section className="community-chat-card">
    <div className="community-chat-top"><div className="community-room-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.7"><path d="M20 11.5a7.5 7.5 0 0 1-7.5 7.5H5l-2 2v-9.5A7.5 7.5 0 0 1 10.5 4H12a8 8 0 0 1 8 7.5Z"/><path d="M8 11h.01M12 11h.01M16 11h.01"/></svg></div><div><h2>Conversa geral</h2><p>Todos os membros ativos · Atualização automática</p></div><span className="community-online"><i /> CHAT ATIVO</span></div>
    <div className="community-messages" aria-live="polite">
      {loading && <div className="community-empty">Carregando conversa…</div>}
      {!loading && messages.length === 0 && <div className="community-empty"><div className="community-empty-symbol">✳</div><h3>Comece a conversa</h3><p>Compartilhe o que está construindo, tire dúvidas ou conte uma conquista.</p></div>}
      {messages.map(item => {
        const mine = String(item.account_id || "") === String(currentMemberId);
        return <article className={mine ? "community-message mine" : "community-message"} key={item.id}>
          <div className="community-avatar">{item.photo_data ? <img src={item.photo_data} alt="" /> : initials(item.display_name)}</div>
          <div className="community-message-body"><div className="community-message-meta"><b>{mine ? "Você" : (item.display_name || "Membro")}</b><time>{shortTime(item.created_at)}</time></div>
            {item.parent_message_id && <div className="community-reply-quote"><strong>Respondendo a {item.parent_display_name || "um membro"}</strong><p>{item.parent_message || "Mensagem original"}</p></div>}
            {item.message && <p className="community-message-text">{item.message}</p>}
            <MessageMedia item={item} />
            {String(item.account_id || "") !== String(currentMemberId) && <button className="community-reply-button" type="button" onClick={() => { setReplyTo({ id: item.id, name: item.display_name || "Membro", message: item.message || "Mídia compartilhada" }); setError(""); }}>Responder</button>}
          </div>
        </article>;
      })}
      <div ref={bottomRef} />
    </div>
    {error && <div className="community-error" role="status">{error}</div>}
    <form className="community-composer" onSubmit={send}>
      {replyTo && <div className="community-reply-preview"><div><strong>Respondendo a {replyTo.name}</strong><span>{replyTo.message}</span></div><button type="button" onClick={() => setReplyTo(null)} aria-label="Cancelar resposta">×</button></div>}
      {file && <div className="community-file-preview"><span>{file.type.startsWith("image/") ? "Imagem" : file.type.startsWith("video/") ? "Vídeo" : "Áudio"} selecionado: {file.name}</span><button type="button" onClick={() => { setFile(null); setFileData(""); if (inputRef.current) inputRef.current.value = ""; }} aria-label="Remover anexo">×</button></div>}
      <textarea value={draft} onChange={e => setDraft(e.target.value)} maxLength={2000} placeholder="Escreva para a comunidade…" rows={2} aria-label="Mensagem" />
      <div className="community-composer-bottom"><div className="community-attach-group"><label className="community-attach" title="Anexar imagem, vídeo ou áudio"><input ref={inputRef} type="file" accept="image/jpeg,image/png,image/webp,image/gif,video/mp4,video/webm,audio/mpeg,audio/mp4,audio/ogg,audio/webm,audio/wav" onChange={selectFile} /><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.7"><path d="m21.4 11.1-8.9 8.9a5.5 5.5 0 0 1-7.8-7.8l9.2-9.1a3.7 3.7 0 0 1 5.2 5.2l-9.2 9.1a1.9 1.9 0 0 1-2.6-2.6l8.6-8.6"/></svg><span>Anexar mídia</span></label><span className="community-size-note">Até 1,2 MB por arquivo</span></div><button className="community-send" type="submit" disabled={sending || (!draft.trim() && !fileData)}>{sending ? "Enviando…" : "Enviar"} <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8"><path d="m22 2-7 20-4-9-9-4Z"/><path d="M22 2 11 13"/></svg></button></div>
    </form>
  </section>
  <aside className={"community-members-panel" + (membersOpen ? " is-open" : "")}>
    <button className="community-members-toggle" type="button" onClick={() => setMembersOpen(value => !value)} aria-expanded={membersOpen}>
      <span className="community-members-toggle-icon">♙</span><span>Membros <small>{members.length}</small></span><span className="community-members-chevron">{membersOpen ? "−" : "+"}</span>
    </button>
    <div className="community-members-content">
      <div className="community-members-heading"><div><strong>Membros</strong><span>{members.filter(person => person.online).length} online agora</span></div><span className="community-presence-indicator" /></div>
      <div className="community-members-list">{members.length ? members.map(person => <div className="community-member-row" key={person.id}>
        <div className="community-member-avatar">{person.photo_data ? <img src={person.photo_data} alt="" /> : initials(person.display_name)}<i className={person.online ? "is-online" : "is-offline"} title={person.online ? "Online" : "Offline"} /></div>
        <div className="community-member-details"><strong>{person.display_name}</strong><div className="community-member-tags"><span className={person.tags?.includes("Owner") ? "community-tag owner" : "community-tag"}>{person.tags?.includes("Owner") ? "Owner" : "Membro"}</span></div></div>
      </div>) : <p className="community-members-empty">A lista de membros será carregada aqui.</p>}</div>
    </div>
  </aside></div>;
}
