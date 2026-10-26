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
  const [videoTracks, setVideoTracks] = useState([]);
  const roomRef = useRef(null);
  const stageRef = useRef(null);

  useEffect(() => () => { roomRef.current?.disconnect(); }, []);

  function refreshParticipants(room) {
    setParticipants([
      { id: room.localParticipant.identity, name: "Você", local: true },
      ...Array.from(room.remoteParticipants.values()).map(p => ({ id: p.identity, name: p.name || "Membro", local: false }))
    ]);
  }

  function attachVideo(track, participant, source) {
    const element = track.attach();
    element.autoplay = true;
    element.playsInline = true;
    element.className = "community-voice-video-tile";
    element.dataset.voiceTrack = participant.identity + ":" + source;
    const tile = document.createElement("div");
    tile.className = "community-voice-video-wrap";
    tile.dataset.voiceTile = participant.identity + ":" + source;
    tile.appendChild(element);
    const label = document.createElement("span");
    label.className = "community-voice-video-label";
    label.textContent = participant.name || "Membro";
    tile.appendChild(label);
    stageRef.current?.appendChild(tile);
    setVideoTracks(old => [...old.filter(item => item !== tile.dataset.voiceTile), tile.dataset.voiceTile]);
  }

  async function join(roomName) {
    if (roomRef.current) await leave();
    setStatus("Conectando à sala…");
    try {
      const response = await fetch("/api/community/voice-token", { method: "POST", headers: { "Content-Type": "application/json" }, body: JSON.stringify({ room: roomName }) });
      const data = await response.json().catch(() => ({}));
      if (!response.ok) throw new Error(data.error || `Falha ao gerar acesso (HTTP ${response.status}).`);
      if (!data.serverUrl || !data.token) throw new Error("O servidor não retornou a URL e o token do LiveKit.");
      const { Room, RoomEvent, Track } = await import("livekit-client");
      const room = new Room({ adaptiveStream: true, dynacast: true });
      room.on(RoomEvent.ParticipantConnected, () => refreshParticipants(room));
      room.on(RoomEvent.ParticipantDisconnected, () => refreshParticipants(room));
      room.on(RoomEvent.TrackSubscribed, (track, publication, participant) => {
        if (track.kind === Track.Kind.Audio) {
          const el = track.attach();
          el.autoplay = true;
          el.dataset.voiceRoom = "true";
          document.body.appendChild(el);
        } else if (track.kind === Track.Kind.Video) {
          attachVideo(track, participant, publication.source);
        }
      });
      room.on(RoomEvent.TrackUnsubscribed, (track, publication, participant) => {
        track.detach().forEach(el => el.remove());
        document.querySelector(`[data-voice-tile="${participant.identity}:${publication.source}"]`)?.remove();
        setVideoTracks(old => old.filter(item => item !== participant.identity + ":" + publication.source));
      });
      room.on(RoomEvent.LocalTrackPublished, (publication) => {
        if (publication.kind === Track.Kind.Video && publication.track) attachVideo(publication.track, room.localParticipant, publication.source);
      });
      room.on(RoomEvent.LocalTrackUnpublished, (publication) => {
        if (publication.track) publication.track.detach().forEach(el => el.remove());
        document.querySelectorAll(`[data-voice-tile^="${room.localParticipant.identity}:"]`).forEach(el => el.remove());
      });
      room.on(RoomEvent.Disconnected, () => { setConnected(false); setActiveRoom(""); });
      await room.connect(data.serverUrl, data.token);
      roomRef.current = room;
      try { await room.localParticipant.setMicrophoneEnabled(true); } catch (e) { setStatus("Conectado, mas o microfone não foi liberado. Confira a permissão do navegador."); }
      setActiveRoom(roomName); setConnected(true); setMic(true);
      refreshParticipants(room);
      if (!status.startsWith("Conectado, mas")) setStatus("");
    } catch (e) {
      const message = String(e?.message || "Falha ao conectar.");
      setStatus(/permission denied|not authorized|unauthorized/i.test(message)
        ? "Permission denied pelo LiveKit. Confira se a API Key é de service account e se URL, API Key e Secret pertencem ao mesmo projeto."
        : message);
    }
  }

  async function leave() {
    try { await roomRef.current?.disconnect(); } catch {}
    roomRef.current = null;
    document.querySelectorAll("[data-voice-room], [data-voice-tile]").forEach(el => el.remove());
    setConnected(false); setActiveRoom(""); setCamera(false); setSharing(false); setParticipants([]); setVideoTracks([]);
  }

  async function toggleMic() {
    try { const next = !mic; await roomRef.current?.localParticipant.setMicrophoneEnabled(next); setMic(next); setStatus(""); }
    catch (e) { setStatus(e?.message || "Não foi possível acessar o microfone. Confira as permissões do navegador."); }
  }
  async function toggleCamera() {
    try {
      const next = !camera;
      await roomRef.current?.localParticipant.setCameraEnabled(next);
      setCamera(next); setStatus("");
    } catch (e) { setStatus(e?.message || "Câmera indisponível. Confira as permissões do navegador."); }
  }
  async function toggleShare() {
    try {
      const next = !sharing;
      await roomRef.current?.localParticipant.setScreenShareEnabled(next);
      setSharing(next); setStatus("");
    } catch (e) { setStatus(e?.message || "Compartilhamento de tela não disponível neste navegador ou dispositivo."); }
  }

  return <section className="community-voice">
    <div className="community-voice-heading"><div><span className="community-voice-kicker">AO VIVO</span><h2>Canais de voz</h2><p>Entre em uma sala para conversar em tempo real.</p></div><span className="community-voice-count">{connected ? "Conectado" : "3 salas"}</span></div>
    <div className="community-voice-grid">
      <div className="community-voice-list">{ROOMS.map(room => <button type="button" key={room.id} className={"community-voice-room" + (activeRoom === room.id ? " selected" : "")} onClick={() => join(room.id)} disabled={connected && activeRoom === room.id}><span className="community-voice-room-icon">⌁</span><span><strong>{room.name}</strong><small>{room.description}</small></span><span className="community-voice-arrow">›</span></button>)}</div>
      <div className="community-voice-stage">
        {connected ? <>
          <div className="community-voice-live"><i /> CONECTADO À {ROOMS.find(r => r.id === activeRoom)?.name.toUpperCase()}</div>
          <div className="community-voice-participants">{participants.map(p => <div className="community-voice-person" key={p.id}><span>{p.local ? "♩" : "♫"}</span><strong>{p.name}</strong><small>{p.local ? (mic ? "Seu microfone está ligado" : "Seu microfone está desligado") : "Participante"}</small></div>)}</div>
          <div className="community-voice-video-grid" ref={stageRef} />
          <div className="community-voice-controls"><button type="button" onClick={toggleMic} className={mic ? "" : "muted"}>{mic ? "Microfone ligado" : "Microfone desligado"}</button><button type="button" onClick={toggleCamera} className={camera ? "enabled" : ""}>{camera ? "Desligar câmera" : "Ligar câmera"}</button><button type="button" onClick={toggleShare} className={sharing ? "enabled" : ""}>{sharing ? "Parar compartilhamento" : "Compartilhar tela"}</button><button type="button" className="leave" onClick={leave}>Sair da sala</button></div>
        </> : <div className="community-voice-idle"><span>♫</span><strong>Escolha um canal de voz</strong><p>Microfone, vídeo e compartilhamento de tela ficam disponíveis após conectar.</p></div>}
      </div>
    </div>{status && <p className="community-voice-status" role="status">{status}</p>}
    <style jsx>{`
      .community-voice{margin:0;padding:20px;border:1px solid var(--line);border-radius:16px;background:var(--panel);color:var(--text);min-width:0}
      .community-voice-heading{display:flex;justify-content:space-between;align-items:center;gap:12px;margin-bottom:16px}.community-voice-heading h2{font-size:18px;color:var(--text);margin:5px 0}.community-voice-heading p,.community-voice-idle p{font-size:12px;color:var(--muted);margin:0;line-height:1.5}.community-voice-kicker{font-size:10px;letter-spacing:1.3px;color:var(--accent);font-weight:800}.community-voice-count{font-size:11px;padding:6px 9px;border-radius:999px;background:color-mix(in srgb,var(--accent) 12%,var(--card));color:var(--accent);white-space:nowrap}
      .community-voice-grid{display:grid;grid-template-columns:1fr;gap:10px}.community-voice-list{display:flex;flex-direction:column;gap:7px}.community-voice-room{display:flex;align-items:center;gap:9px;text-align:left;padding:11px;border-radius:11px;border:1px solid var(--line);background:var(--card);color:var(--text);cursor:pointer;min-width:0}.community-voice-room.selected{border-color:var(--accent);background:color-mix(in srgb,var(--accent) 8%,var(--card))}.community-voice-room:disabled{opacity:.7}.community-voice-room-icon{font-size:20px;color:var(--accent)}.community-voice-room strong,.community-voice-room small{display:block}.community-voice-room strong{font-size:12px}.community-voice-room small{font-size:10px;color:var(--muted);margin-top:3px}.community-voice-arrow{margin-left:auto;font-size:20px;color:var(--muted)}
      .community-voice-stage{min-height:190px;border:1px solid var(--line);border-radius:12px;padding:12px;background:var(--card);min-width:0}.community-voice-idle{height:100%;min-height:165px;display:flex;align-items:center;justify-content:center;flex-direction:column;text-align:center;gap:8px}.community-voice-idle>span{font-size:28px;color:var(--accent)}.community-voice-idle strong{font-size:13px;color:var(--text)}.community-voice-live{font-size:10px;letter-spacing:.7px;color:var(--accent);font-weight:800}.community-voice-live i{display:inline-block;width:7px;height:7px;background:#38c987;border-radius:50%;margin-right:6px}
      .community-voice-participants{display:flex;gap:7px;flex-wrap:wrap;margin:12px 0}.community-voice-person{display:flex;flex-direction:column;gap:4px;min-width:90px;padding:9px;border-radius:9px;background:var(--panel);border:1px solid var(--line)}.community-voice-person span{color:var(--accent)}.community-voice-person strong{font-size:11px;color:var(--text)}.community-voice-person small{font-size:10px;color:var(--muted)}
      .community-voice-video-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(140px,1fr));gap:8px}.community-voice-video-wrap{position:relative;min-width:0;overflow:hidden;border-radius:10px;background:var(--panel);aspect-ratio:16/9}.community-voice-video-tile{display:block;width:100%;height:100%;object-fit:cover}.community-voice-video-label{position:absolute;left:8px;bottom:7px;padding:4px 7px;border-radius:6px;background:#0009;color:#fff;font-size:10px}
      .community-voice-controls{display:flex;gap:6px;flex-wrap:wrap;margin-top:12px}.community-voice-controls button{border:1px solid var(--line);border-radius:9px;padding:8px 10px;background:var(--panel);color:var(--text);font-size:11px;cursor:pointer}.community-voice-controls button.enabled{background:color-mix(in srgb,#38c987 13%,var(--card));border-color:#38c987}.community-voice-controls button.muted,.community-voice-controls button.leave{background:color-mix(in srgb,var(--accent) 10%,var(--card));border-color:var(--accent)}.community-voice-status{font-size:12px;color:var(--accent);margin:10px 0 0;overflow-wrap:anywhere}
      @media(max-width:650px){.community-voice{padding:13px}.community-voice-heading h2{font-size:17px}.community-voice-controls button{flex:1}}
    `}</style>
  </section>;
}
