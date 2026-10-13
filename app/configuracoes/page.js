"use client";

import { useEffect, useRef, useState } from "react";
import Link from "next/link";

const KEY = "ocd-user-settings";
const COLORS = [{name:"Vermelho",value:"#ff3045"},{name:"Azul",value:"#3987ff"},{name:"Roxo",value:"#9b6dff"},{name:"Verde",value:"#35c98a"},{name:"Laranja",value:"#ff8a3d"}];

export default function ConfiguracoesPage() {
  const [settings,setSettings] = useState({name:"Minha jornada",photo:"",theme:"dark",accent:"#ff3045",notifications:false});
  const [ready,setReady] = useState(false);
  const [installPrompt,setInstallPrompt] = useState(null);
  const [installed,setInstalled] = useState(false);
  const [message,setMessage] = useState("");
  const fileRef = useRef(null);
  useEffect(() => {
    try { const saved=JSON.parse(localStorage.getItem(KEY)||"{}"); setSettings(s=>({...s,...saved})); } catch {}
    setInstalled(window.matchMedia("(display-mode: standalone)").matches || window.navigator.standalone === true);
    const capture=e=>{e.preventDefault();setInstallPrompt(e);};
    window.addEventListener("beforeinstallprompt",capture);
    if ("serviceWorker" in navigator) navigator.serviceWorker.register("/sw.js").catch(()=>{});
    setReady(true);
    return ()=>window.removeEventListener("beforeinstallprompt",capture);
  },[]);
  useEffect(()=>{if(!ready)return;document.documentElement.dataset.theme=settings.theme;document.documentElement.style.setProperty("--accent",settings.accent);document.documentElement.style.setProperty("--accent-dark",settings.accent);try{localStorage.setItem(KEY,JSON.stringify(settings));}catch{}},[settings,ready]);
  const update=(patch)=>setSettings(s=>({...s,...patch}));
  const choosePhoto=e=>{const file=e.target.files?.[0];if(!file)return;if(!file.type.startsWith("image/")){setMessage("Escolha um arquivo de imagem.");return;}if(file.size>2*1024*1024){setMessage("A imagem deve ter até 2 MB.");return;}const reader=new FileReader();reader.onload=()=>{update({photo:String(reader.result)});setMessage("Foto atualizada neste dispositivo.");};reader.readAsDataURL(file);};
  const notifications=async()=>{if(!("Notification" in window)){setMessage("Este navegador não oferece suporte a notificações.");return;}if(Notification.permission==="granted"){update({notifications:true});setMessage("Notificações já estão autorizadas neste navegador.");return;}if(Notification.permission==="denied"){setMessage("Notificações bloqueadas. Altere a permissão nas configurações do navegador.");return;}const permission=await Notification.requestPermission();update({notifications:permission==="granted"});setMessage(permission==="granted"?"Permissão de notificações ativada.":"Permissão não concedida.");if(permission==="granted")new Notification("O Clone Digital",{body:"Notificações ativadas neste dispositivo."});};
  const install=async()=>{if(installPrompt){installPrompt.prompt();const result=await installPrompt.userChoice;if(result?.outcome==="accepted")setInstalled(true);setInstallPrompt(null);return;}setMessage(/iphone|ipad|ipod/i.test(navigator.userAgent)?"No Safari: toque em Compartilhar e depois em “Adicionar à Tela de Início”.":"Para instalar, abra o menu do navegador e escolha “Instalar app” ou “Adicionar à tela inicial”.");};
  return <main className="settings-page">
    <header className="settings-header"><Link href="/painel" className="settings-back">← Voltar ao painel</Link><div className="settings-kicker">O CLONE DIGITAL / PREFERÊNCIAS</div><h1>Configurações</h1><p>Personalize seu espaço de trabalho do seu jeito.</p></header>
    {message&&<div className="settings-message" role="status">{message}<button onClick={()=>setMessage("")} aria-label="Fechar aviso">×</button></div>}
    <div className="settings-grid">
      <section className="settings-card profile-settings"><div className="settings-card-title"><span className="settings-symbol">01</span><div><h2>Seu perfil</h2><p>Como você aparece no painel.</p></div></div>
        <div className="settings-profile-preview"><button className="settings-avatar" onClick={()=>fileRef.current?.click()} aria-label="Alterar foto">{settings.photo?<img src={settings.photo} alt="Foto de perfil"/>:<span>{(settings.name||"U").trim().slice(0,2).toUpperCase()}</span>}<i>+</i></button><div><b>Foto de perfil</b><p>JPG, PNG ou WebP · até 2 MB</p><button className="settings-text-button" onClick={()=>fileRef.current?.click()}>Escolher imagem</button>{settings.photo&&<button className="settings-text-button muted-button" onClick={()=>update({photo:""})}>Remover</button>}<input ref={fileRef} type="file" accept="image/*" hidden onChange={choosePhoto}/></div></div>
        <label className="settings-label" htmlFor="profile-name">Nome de exibição</label><input id="profile-name" className="settings-input" maxLength={60} value={settings.name} onChange={e=>update({name:e.target.value})} placeholder="Como quer ser chamado?"/><small className="settings-hint">Suas preferências ficam salvas neste navegador.</small>
      </section>
      <section className="settings-card"><div className="settings-card-title"><span className="settings-symbol">02</span><div><h2>Aparência</h2><p>Escolha o visual do seu painel.</p></div></div><div className="settings-label">TEMA DO PAINEL</div><div className="theme-options"><button className={settings.theme==="dark"?"theme-option selected":"theme-option"} onClick={()=>update({theme:"dark"})}><span className="theme-swatch dark-swatch">◐</span><b>Escuro</b><small>Confortável à noite</small></button><button className={settings.theme==="light"?"theme-option selected":"theme-option"} onClick={()=>update({theme:"light"})}><span className="theme-swatch light-swatch">☼</span><b>Claro</b><small>Mais luminosidade</small></button></div><div className="settings-label color-label">COR DE DESTAQUE</div><div className="color-options">{COLORS.map(c=><button key={c.value} title={c.name} aria-label={c.name} aria-pressed={settings.accent===c.value} className={settings.accent===c.value?"color-option selected":"color-option"} style={{"--swatch":c.value}} onClick={()=>update({accent:c.value})}><span/></button>)}</div><p className="settings-hint">A cor escolhida destaca botões, ícones e elementos ativos.</p></section>
      <section className="settings-card"><div className="settings-card-title"><span className="settings-symbol">03</span><div><h2>Notificações</h2><p>Permita avisos neste dispositivo.</p></div></div><div className="settings-row"><div><b>Notificações do navegador</b><p>Autorize notificações quando disponíveis.</p></div><button className={settings.notifications?"settings-toggle on":"settings-toggle"} role="switch" aria-checked={settings.notifications} onClick={notifications}><span/></button></div><small className="settings-hint">A permissão é controlada pelo navegador. Notificações push em segundo plano exigem configuração adicional de servidor.</small></section>
      <section className="settings-card"><div className="settings-card-title"><span className="settings-symbol">04</span><div><h2>Instalar aplicativo</h2><p>Tenha o O Clone Digital na tela inicial.</p></div></div><div className="install-card"><div className="install-icon">C<span>D</span></div><div className="install-copy"><b>O Clone Digital</b><p>Acesso rápido, em uma janela própria.</p><small>{installed?"Aplicativo já instalado neste dispositivo":"Disponível como aplicativo web (PWA)"}</small></div></div><button className="settings-primary" onClick={install} disabled={installed}>{installed?"Aplicativo instalado":"＋  Adicionar à tela inicial"}</button><p className="settings-hint install-hint">iPhone/iPad: abra esta página no Safari, toque em Compartilhar e selecione “Adicionar à Tela de Início”. Android: use “Instalar app” no menu do navegador.</p></section>
    </div>
    <footer className="settings-footer"><span>O CLONE DIGITAL · PREFERÊNCIAS</span><Link href="/painel">Voltar para o painel →</Link></footer>
  </main>;
}
