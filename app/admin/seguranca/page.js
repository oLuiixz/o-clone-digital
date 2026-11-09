"use client";
import {useEffect,useState} from "react";
import "../admin.css";
export default function AdminSecurityPage(){
 const [data,setData]=useState(null),[busy,setBusy]=useState(true),[error,setError]=useState(""),[notice,setNotice]=useState("");
 async function load(){
  setBusy(true);setError("");
  try{
   const session=await fetch("/api/admin/session",{cache:"no-store"}).then(r=>r.json());
   if(!session.authenticated){window.location.replace("/admin");return;}
   const r=await fetch("/api/admin/sessions",{cache:"no-store"}),j=await r.json();
   if(!r.ok)throw Error(j.error||"Não foi possível carregar os dispositivos.");
   setData(j);
  }catch(e){setError(e.message||"Falha ao carregar.");}finally{setBusy(false);}
 }
 useEffect(()=>{load();},[]);
 async function revoke(id){
  if(!window.confirm("Revogar esta sessão administrativa? O dispositivo precisará entrar novamente."))return;
  setError("");setNotice("");
  try{
   const r=await fetch("/api/admin/sessions",{method:"DELETE",headers:{"Content-Type":"application/json"},body:JSON.stringify({sessionId:id})});
   const j=await r.json();if(!r.ok)throw Error(j.error||"Não foi possível revogar.");
   if(j.current){await fetch("/api/admin/session",{method:"DELETE"});window.location.replace("/admin");return;}
   setNotice("Sessão revogada.");await load();
  }catch(e){setError(e.message);}
 }
 async function logout(){await fetch("/api/admin/session",{method:"DELETE"});window.location.replace("/admin");}
 return <main className="admin-page admin-settings-route">
  <aside className="admin-sidebar"><a className="admin-sidebar-brand" href="/admin"><span className="admin-logo-mark">OC</span><span>O CLONE <b>DIGITAL</b><small>PAINEL ADMINISTRATIVO</small></span></a><nav className="admin-sidebar-nav" aria-label="Navegação administrativa"><a href="/admin">Dashboard</a><a href="/admin/configuracoes">Configurações</a><a className="is-active" href="/admin/seguranca" aria-current="page">Segurança e dispositivos</a></nav><div className="admin-sidebar-bottom"><span className="admin-sidebar-status"><i/> SISTEMA OPERACIONAL</span><p>O Clone Digital<br/><small>Evolução constante.</small></p></div></aside>
  <div className="admin-shell"><header className="admin-top"><div><p className="admin-eyebrow">ADMINISTRAÇÃO / SEGURANÇA</p><h1 className="admin-route-title">Segurança e dispositivos</h1></div><div className="admin-top-actions"><a className="secondary" href="/admin">Voltar ao painel</a><button className="secondary" onClick={logout}>Sair</button></div></header>
   <section className="admin-heading"><div><p className="admin-eyebrow">SESSÕES ADMINISTRATIVAS</p><h2>Dispositivos conectados</h2><p>Revogue individualmente qualquer sessão que você não reconheça. A sessão atual fica identificada.</p></div></section>
   {error&&<p className="admin-error">{error}</p>}{notice&&<div className="alert">{notice}</div>}
   <section className="admin-section settings-section"><div className="section-title"><div className="section-heading"><span className="section-kicker"><i/> CONTA</span><h2>{data?.admin?.email||"Conta Owner"}</h2><p>Perfil: {data?.admin?.role==="owner"?"Owner":"Administrador"}</p></div><button className="secondary" disabled={busy} onClick={load}>{busy?"Atualizando…":"Atualizar"}</button></div>
    {busy?<p>Carregando sessões…</p>:data?.sessions?.length? <div className="settings-grid">{data.sessions.map(s=><article className="settings-card" key={s.id}><div className="settings-card-top"><b>{s.device_label||"Dispositivo"}</b><span className={"settings-status "+(!s.revoked_at&&new Date(s.expires_at)>new Date()?"ok":"missing")}>{s.id===data.currentSessionId?"Sessão atual":s.revoked_at?"Revogada":new Date(s.expires_at)>new Date()?"Ativa":"Expirada"}</span></div><p>{s.user_agent||"Navegador não identificado"}</p><p>Iniciada: {new Date(s.created_at).toLocaleString("pt-BR")}</p><p>Última atividade: {new Date(s.last_seen_at).toLocaleString("pt-BR")}</p>{!s.revoked_at&&new Date(s.expires_at)>new Date()&&<button className="secondary" onClick={()=>revoke(s.id)}>Revogar sessão</button>}</article>)}</div>:<p>Nenhuma sessão encontrada.</p>}
   </section>
  </div>
 </main>;
}
