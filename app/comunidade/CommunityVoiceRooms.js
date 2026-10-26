"use client";

import { useEffect, useRef, useState } from "react";

const ROOMS = [
  { id: "sala-geral", name: "Sala geral", description: "Converse com a comunidade" },
  { id: "networking", name: "Networking", description: "Conheça outros membros" },
  { id: "duvidas", name: "Dúvidas ao vivo", description: "Ajuda e troca de ideias" },
];

export default function CommunityVoiceRooms() {
  const [activeRoom, setActiveRoom] = useState("");
  const [status, setStatus] = useState("");
  const [connected, setConnected] = useState(false);
  const [mic, setMic] = useState(true);
  const [camera, setCamera] = useState(false);
  const [sharing, setSharing] = useState(false);
  const [participants, setParticipants] = useState([]);
  const roomRef = useRef(null);
  const videoRef = useRef(null);

  useEffect(() => () => { roomRef.current?.disconnect(); }, []);

  async function join(roomName) {
    if (roomRef.current) await leave();
    setStatus("Conectando…");
    try {
      const response = await fetch("/api/community/voice-token", { method: "POST", headers: { "Content-Type": "application/json" }, body: JSON.stringify({ room: roomName }) });
      const data = await response.json();
      if (!response.ok) throw new Error(data.error || "Não foi possível entrar na sala.");
      const { Room, RoomEvent, Track } = await import("livekit-client");
      const room = new Room({ adaptiveStream: true, dynacast: true });
      room.on(RoomEvent.ParticipantConnected, () => setParticipants(Array.from(room.remoteParticipants.values()).map(p => p.name || "Membro")));
      room.on(RoomEvent.ParticipantDisconnected, () => setParticipants(Array.from(room.remoteParticipants.values()).map(p => p.name || "Membro")));
      room.on(RoomEvent.TrackSubscribed, (track) => {
        if (track.kind === Track.Kind.Audio) {
          const el = track.attach();
          el.autoplay = true;
          el.dataset.voiceRoom = "true";
          document.body.appendChild(el);
        }
        if (track.kind === Track.Kind.Video && videoRef.current) track.attach(videoRef.current);
      });
      await room.connect(data.serverUrl, data.token);
      await room.localParticipant.setMicrophoneEnabled(true);
      roomRef.current = room;
      setActiveRoom(roomName); setConnected(true); setMic(true); setStatus("");
      setParticipants(Array.from(room.remoteParticipants.values()).map(p => p.name || "Membro"));
    } catch (e) { setStatus(e.message || "Falha ao conectar."); }
  }

  async function leave() {
    try { await roomRef.current?.disconnect(); } catch {}
    roomRef.current = null;
    document.querySelectorAll("[data-voice-room]").forEach(el => el.remove());
    setConnected(false); setActiveRoom(""); setCamera(false); setSharing(false); setParticipants([]);
  }

  async function toggleMic() {
    try { const next = !mic; await roomRef.current?.localParticipant.setMicrophoneEnabled(next); setMic(next); }
    catch { setStatus("Não foi possível acessar o microfone. Confira as permissões do navegador."); }
  }
  async function toggleCamera() {
    try {
      const next = !camera;
      await roomRef.current?.localParticipant.setCameraEnabled(next);
      setCamera(next);
    } catch { setStatus("Câmera indisponível. Confira as permissões do navegador."); }
  }
  async function toggleShare() {
    try {
      const next = !sharing;
      await roomRef.current?.localParticipant.setScreenShareEnabled(next);
      setSharing(next);
    } catch { setStatus("Compartilhamento de tela não disponível neste navegador ou dispositivo."); }
  }

  return <section className="community-voice">
    <div className="community-voice-heading"><div><span className="community-voice-kicker">AO VIVO</span><h2>Canais de voz</h2><p>Entre em uma sala para conversar em tempo real.</p></div><span className="community-voice-count">{connected ? "Conectado" : "3 salas"}</span></div>
    <div className="community-voice-grid">
      <div className="community-voice-list">{ROOMS.map(room => <button type="button" key={room.id} className={"community-voice-room" + (activeRoom === room.id ? " selected" : "")} onClick={() => join(room.id)} disabled={connected && activeRoom === room.id}><span className="community-voice-room-icon">⌁</span><span><strong>{room.name}</strong><small>{room.description}</small></span><span className="community-voice-arrow">›</span></button>)}</div>
      <div className="community-voice-stage">{connected ? <><div className="community-voice-live"><i /> CONECTADO À {ROOMS.find(r => r.id === activeRoom)?.name.toUpperCase()}</div><div className="community-voice-participants"><div className="community-voice-person"><span>♫</span><strong>Você</strong><small>{mic ? "Microfone ligado" : "Microfone desligado"}</small></div>{participants.map((p, i) => <div className="community-voice-person" key={p + i}><span>♫</span><strong>{p}</strong><small>Participante</small></div>)}</div><video ref={videoRef} autoPlay playsInline className="community-voice-video" /><div className="community-voice-controls"><button type="button" onClick={toggleMic} className={mic ? "" : "muted"}>{mic ? "♩ Microfone" : "× Microfone"}</button><button type="button" onClick={toggleCamera} className={camera ? "enabled" : ""}>{camera ? "Câmera ligada" : "Câmera"}</button><button type="button" onClick={toggleShare} className={sharing ? "enabled" : ""}>{sharing ? "Parar tela" : "Compartilhar tela"}</button><button type="button" className="leave" onClick={leave}>Sair da sala</button></div></> : <div className="community-voice-idle"><span>♫</span><strong>Escolha um canal de voz</strong><p>Microfone, vídeo e compartilhamento de tela ficam disponíveis após conectar.</p></div>}</div>
    </div>{status && <p className="community-voice-status" role="status">{status}</p>}
    <style jsx>{`
      .community-voice{margin:0 0 22px;padding:22px;border:1px solid var(--border-color,rgba(255,255,255,.1));border-radius:18px;background:var(--card-bg,rgba(20,20,26,.8));color:var(--text-color,inherit)}
      .community-voice-heading{display:flex;justify-content:space-between;align-items:center;gap:12px;margin-bottom:18px}.community-voice-heading h2{font-size:20px;margin:5px 0}.community-voice-heading p,.community-voice-idle p{font-size:13px;opacity:.7;margin:0}.community-voice-kicker{font-size:10px;letter-spacing:1.5px;color:#ff5268;font-weight:800}.community-voice-count{font-size:12px;padding:7px 10px;border-radius:999px;background:rgba(255,70,95,.1);color:#ff667a}
      .community-voice-grid{display:grid;grid-template-columns:minmax(210px,.75fr) minmax(0,1.5fr);gap:14px}.community-voice-list{display:flex;flex-direction:column;gap:8px}.community-voice-room{display:flex;align-items:center;gap:10px;text-align:left;padding:12px;border-radius:12px;border:1px solid var(--border-color,rgba(255,255,255,.1));background:transparent;color:inherit;cursor:pointer}.community-voice-room.selected{border-color:#ff5268;background:rgba(255,70,95,.08)}.community-voice-room:disabled{opacity:.7}.community-voice-room-icon{font-size:22px;color:#ff5268}.community-voice-room strong,.community-voice-room small{display:block}.community-voice-room strong{font-size:13px}.community-voice-room small{font-size:11px;opacity:.65;margin-top:4px}.community-voice-arrow{margin-left:auto;font-size:22px;opacity:.6}
      .community-voice-stage{min-height:210px;border:1px solid var(--border-color,rgba(255,255,255,.1));border-radius:14px;padding:14px}.community-voice-idle{height:100%;min-height:180px;display:flex;align-items:center;justify-content:center;flex-direction:column;text-align:center;gap:9px}.community-voice-idle>span{font-size:30px;color:#ff5268}.community-voice-idle strong{font-size:14px}.community-voice-live{font-size:10px;letter-spacing:1px;color:#ff667a;font-weight:800}.community-voice-live i{display:inline-block;width:7px;height:7px;background:#38c987;border-radius:50%;margin-right:6px}.community-voice-participants{display:flex;gap:8px;flex-wrap:wrap;margin:14px 0}.community-voice-person{display:flex;flex-direction:column;gap:4px;min-width:100px;padding:10px;border-radius:10px;background:rgba(127,127,127,.08)}.community-voice-person span{color:#ff5268}.community-voice-person strong{font-size:12px}.community-voice-person small{font-size:10px;opacity:.65}.community-voice-video{display:none;max-width:100%;max-height:220px;border-radius:10px}.community-voice-controls{display:flex;gap:7px;flex-wrap:wrap;margin-top:12px}.community-voice-controls button{border:1px solid var(--border-color,rgba(127,127,127,.25));border-radius:9px;padding:9px 11px;background:transparent;color:inherit;font-size:12px;cursor:pointer}.community-voice-controls button.enabled{background:rgba(55,190,130,.12);border-color:#38c987}.community-voice-controls button.muted,.community-voice-controls button.leave{background:rgba(255,70,95,.12);border-color:#ff5268}.community-voice-status{font-size:12px;color:#ff667a;margin:12px 0 0}
      @media(max-width:650px){.community-voice{padding:14px}.community-voice-grid{grid-template-columns:1fr}.community-voice-heading h2{font-size:18px}.community-voice-controls button{flex:1}}
    `}</style>
  </section>;
}
