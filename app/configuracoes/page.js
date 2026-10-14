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
  const [showInstallHelp,setShowInstallHelp] = useState(false);
  const [iosDevice,setIosDevice] = useState(false);
  const [pushConfigured,setPushConfigured] = useState(false);
  const [pushSubscribed,setPushSubscribed] = useState(false);
  const [pushBusy,setPushBusy] = useState(false);
  const [feedback,setFeedback] = useState({category:"Sugestão",title:"",description:"",context:""});
  const [feedbackBusy,setFeedbackBusy] = useState(false);
  const [feedbackNotice,setFeedbackNotice] = useState("");
  const fileRef = useRef(null);
  useEffect(() => {
    fetch("/api/member/profile", { credentials: "same-origin" }).then(r=>r.ok?r.json():null).then(saved=>{if(saved)setSettings(s=>({...s,...saved}));}).catch(()=>{});
    fetch("/api/push/subscribe", { credentials: "same-origin" }).then(r=>r.ok?r.json():null).then(data=>{if(data){setPushConfigured(Boolean(data.configured));setPushSubscribed(Boolean(data.subscribed));setSettings(s=>({...s,notifications:Boolean(data.subscribed)}));}}).catch(()=>{});
    setInstalled(window.matchMedia("(display-mode: standalone)").matches || window.navigator.standalone === true);
    setIosDevice(/iphone|ipad|ipod/i.test(navigator.userAgent) || (navigator.platform === "MacIntel" && navigator.maxTouchPoints > 1));
    const capture=e=>{e.preventDefault();setInstallPrompt(e);};
    window.addEventListener("beforeinstallprompt",capture);
    if ("serviceWorker" in navigator) navigator.serviceWorker.register("/sw.js").catch(()=>{});
    setReady(true);
    return ()=>window.removeEventListener("beforeinstallprompt",capture);
  },[]);
  useEffect(()=>{if(!ready)return;document.documentElement.dataset.theme=settings.theme;document.documentElement.style.setProperty("--accent",settings.accent);document.documentElement.style.setProperty("--accent-dark",settings.accent);try{localStorage.setItem(KEY,JSON.stringify(settings));}catch{}},[settings,ready]);
  const saveProfile=async()=>{setMessage("Salvando preferências…");try{const response=await fetch("/api/member/profile",{method:"PUT",headers:{"Content-Type":"application/json"},credentials:"same-origin",body:JSON.stringify(settings)});const data=await response.json();if(!response.ok)throw new Error(data.error||"Não foi possível salvar.");setSettings(s=>({...s,...data}));setMessage("Perfil e preferências salvos na sua conta.");}catch(error){setMessage(error.message||"Erro ao salvar as preferências.");}};
  const update=(patch)=>setSettings(s=>({...s,...patch}));
  const submitFeedback=async(e)=>{e.preventDefault();if(feedbackBusy)return;setFeedbackBusy(true);setFeedbackNotice("");try{const response=await fetch("/api/member/feedback",{method:"POST",headers:{"Content-Type":"application/json"},credentials:"same-origin",body:JSON.stringify(feedback)});const data=await response.json();if(!response.ok)throw new Error(data.error||"Não foi possível enviar sua sugestão.");setFeedback({category:"Sugestão",title:"",description:"",context:""});setFeedbackNotice(data.message||"Feedback enviado com sucesso.");}catch(error){setFeedbackNotice(error.message||"Erro ao enviar feedback.");}finally{setFeedbackBusy(false);}};
  const choosePhoto=e=>{const file=e.target.files?.[0];if(!file)return;if(!file.type.startsWith("image/")){setMessage("Escolha um arquivo de imagem.");return;}if(file.size>2*1024*1024){setMessage("A imagem deve ter até 2 MB.");return;}const reader=new FileReader();reader.onload=()=>{update({photo:String(reader.result)});setMessage("Foto selecionada. Salve as alterações para sincronizar com sua conta.");};reader.readAsDataURL(file);};
  const notifications=async()=>{
    if(pushBusy)return;
    setPushBusy(true);
    try {
      if(pushSubscribed) {
        const registration = await navigator.serviceWorker?.getRegistration("/");
        const subscription = await registration?.pushManager?.getSubscription();
        if(subscription) await subscription.unsubscribe();
        const response = await fetch("/api/push/subscribe",{method:"DELETE",credentials:"same-origin"});
        if(!response.ok) throw new Error("Não foi possível desativar as notificações.");
        setPushSubscribed(false);update({notifications:false});setMessage("Notificações push desativadas neste dispositivo.");return;
      }
      if(!window.isSecureContext) throw new Error("As notificações exigem uma conexão HTTPS segura.");
      if(!("serviceWorker" in navigator) || !("PushManager" in window) || !("Notification" in window)) throw new Error("Este navegador não oferece suporte a notificações push. No iPhone, use o Safari e adicione o app à Tela de Início antes de ativar.");
      if(/iphone|ipad|ipod/i.test(navigator.userAgent) && !window.navigator.standalone && !window.matchMedia("(display-mode: standalone)").matches) throw new Error("No iPhone/iPad, primeiro toque em Compartilhar no Safari e escolha “Adicionar à Tela de Início”. Depois abra o app pela tela inicial e tente novamente.");
      const configResponse=await fetch("/api/push/subscribe",{credentials:"same-origin"});
      const config=await configResponse.json();
      if(!configResponse.ok) throw new Error(config.error||"Não foi possível consultar a configuração push.");
      if(!config.configured || !config.publicKey) throw new Error("As notificações push ainda precisam ser configuradas no servidor. Falta configurar as chaves VAPID na Vercel.");
      let permission=Notification.permission;
      if(permission==="default") permission=await Notification.requestPermission();
      if(permission!=="granted") throw new Error(permission==="denied"?"A permissão está bloqueada. Altere as notificações nas configurações do navegador e tente novamente.":"Você não autorizou as notificações.");
      const registration=await navigator.serviceWorker.register("/sw.js",{scope:"/"});
      await navigator.serviceWorker.ready;
      const normalizedKey=config.publicKey.replace(/-/g,"+").replace(/_/g,"/");const applicationServerKey=Uint8Array.from(atob(normalizedKey+"=".repeat((4-normalizedKey.length%4)%4)),c=>c.charCodeAt(0));
      const subscription=await registration.pushManager.subscribe({userVisibleOnly:true,applicationServerKey});
      const response=await fetch("/api/push/subscribe",{method:"POST",headers:{"Content-Type":"application/json"},credentials:"same-origin",body:JSON.stringify({subscription:subscription.toJSON()})});
      const data=await response.json();
      if(!response.ok)throw new Error(data.error||"Não foi possível registrar este dispositivo.");
      setPushSubscribed(true);update({notifications:true});setMessage("Notificações push ativadas! Enviando uma notificação de teste…");
      const testResponse=await fetch("/api/push/test",{method:"POST",credentials:"same-origin"});
      const testData=await testResponse.json();
      if(!testResponse.ok) setMessage("Push ativado, mas o teste não foi entregue: "+(testData.error||"tente novamente."));
      else setMessage("Push ativado! Uma notificação de teste foi enviada para este dispositivo.");
    } catch(error) {
      setMessage(error?.message||"Não foi possível ativar as notificações push.");
    } finally { setPushBusy(false); }
  };
  const install=async()=>{
    if(window.matchMedia("(display-mode: standalone)").matches || window.navigator.standalone === true){setInstalled(true);setMessage("O Clone Digital já está instalado neste dispositivo.");return;}
    if(installPrompt){installPrompt.prompt();const result=await installPrompt.userChoice;if(result?.outcome==="accepted")setInstalled(true);setInstallPrompt(null);return;}
    setShowInstallHelp(true);
  };
  return <main className="settings-page">
    <header className="settings-header"><Link href="/painel" className="settings-back">← Voltar ao painel</Link><div className="settings-kicker">O CLONE DIGITAL / PREFERÊNCIAS</div><h1>Configurações</h1><p>Personalize seu espaço de trabalho do seu jeito.</p></header>
    {message&&<div className="settings-message" role="status">{message}<button onClick={()=>setMessage("")} aria-label="Fechar aviso">×</button></div>}
    <div className="settings-grid">
      <section className="settings-card profile-settings"><div className="settings-card-title"><span className="settings-symbol">01</span><div><h2>Seu perfil</h2><p>Como você aparece no painel.</p></div></div>
        <div className="settings-profile-preview"><button className="settings-avatar" onClick={()=>fileRef.current?.click()} aria-label="Alterar foto">{settings.photo?<img src={settings.photo} alt="Foto de perfil"/>:<span>{(settings.name||"U").trim().slice(0,2).toUpperCase()}</span>}<i>+</i></button><div><b>Foto de perfil</b><p>JPG, PNG ou WebP · até 2 MB</p><button className="settings-text-button" onClick={()=>fileRef.current?.click()}>Escolher imagem</button>{settings.photo&&<button className="settings-text-button muted-button" onClick={()=>update({photo:""})}>Remover</button>}<input ref={fileRef} type="file" accept="image/*" hidden onChange={choosePhoto}/></div></div>
        <label className="settings-label" htmlFor="profile-name">Nome de exibição</label><input id="profile-name" className="settings-input" maxLength={60} value={settings.name} onChange={e=>update({name:e.target.value})} placeholder="Como quer ser chamado?"/><small className="settings-hint">Nome, foto, tema e cor serão sincronizados com sua conta ao salvar.</small>
      </section>
      <section className="settings-card"><div className="settings-card-title"><span className="settings-symbol">02</span><div><h2>Aparência</h2><p>Escolha o visual do seu painel.</p></div></div><div className="settings-label">TEMA DO PAINEL</div><div className="theme-options"><button className={settings.theme==="dark"?"theme-option selected":"theme-option"} onClick={()=>update({theme:"dark"})}><span className="theme-swatch dark-swatch">◐</span><b>Escuro</b><small>Confortável à noite</small></button><button className={settings.theme==="light"?"theme-option selected":"theme-option"} onClick={()=>update({theme:"light"})}><span className="theme-swatch light-swatch">☼</span><b>Claro</b><small>Mais luminosidade</small></button></div><div className="settings-label color-label">COR DE DESTAQUE</div><div className="color-options">{COLORS.map(c=><button key={c.value} title={c.name} aria-label={c.name} aria-pressed={settings.accent===c.value} className={settings.accent===c.value?"color-option selected":"color-option"} style={{"--swatch":c.value}} onClick={()=>update({accent:c.value})}><span/></button>)}</div><p className="settings-hint">A cor escolhida destaca botões, ícones e elementos ativos.</p></section>
      <section className="settings-card"><div className="settings-card-title"><span className="settings-symbol">03</span><div><h2>Notificações push</h2><p>Receba avisos mesmo com o site fechado.</p></div></div><div className="settings-row"><div><b>{pushSubscribed?"Push ativado neste dispositivo":"Ativar notificações push"}</b><p>{pushConfigured?"Permita o envio de notificações para este aparelho.":"O servidor ainda precisa das chaves VAPID para enviar push."}</p></div><button className={pushSubscribed?"settings-toggle on":"settings-toggle"} role="switch" aria-checked={pushSubscribed} disabled={pushBusy} onClick={notifications}><span/></button></div>{pushBusy&&<small className="settings-hint">Configurando este dispositivo…</small>}<small className="settings-hint">Android: use Chrome. iPhone/iPad: iOS 16.4 ou superior, abra no Safari, adicione à Tela de Início e depois abra o aplicativo instalado. A permissão sozinha não ativa o envio push; o aparelho também precisa estar inscrito no servidor.</small></section>
      <section className="settings-card feedback-settings"><div className="settings-card-title"><span className="settings-symbol">05</span><div><h2>Sugestões e melhorias</h2><p>Ajude a construir as próximas versões do O Clone Digital.</p></div></div><p className="settings-hint">Encontrou um erro, teve uma ideia ou gostaria de ver uma nova funcionalidade? Envie para análise diretamente por aqui.</p><form className="member-feedback-form" onSubmit={submitFeedback}><label className="settings-label" htmlFor="feedback-category">Tipo de feedback</label><select id="feedback-category" className="settings-input" value={feedback.category} onChange={e=>setFeedback(v=>({...v,category:e.target.value}))}><option>Sugestão</option><option>Melhoria</option><option>Nova funcionalidade</option><option>Bug/erro</option></select><label className="settings-label" htmlFor="feedback-title">Título</label><input id="feedback-title" className="settings-input" minLength={4} maxLength={120} required value={feedback.title} onChange={e=>setFeedback(v=>({...v,title:e.target.value}))} placeholder="Resuma sua ideia ou o problema"/><label className="settings-label" htmlFor="feedback-description">Descrição</label><textarea id="feedback-description" className="settings-input" minLength={10} maxLength={3000} required rows={5} value={feedback.description} onChange={e=>setFeedback(v=>({...v,description:e.target.value}))} placeholder="Conte como funciona hoje, o que você gostaria de mudar ou como reproduzir o erro…"/><label className="settings-label" htmlFor="feedback-context">Página ou contexto (opcional)</label><input id="feedback-context" className="settings-input" maxLength={160} value={feedback.context} onChange={e=>setFeedback(v=>({...v,context:e.target.value}))} placeholder="Ex.: Configurações, módulo de aulas…"/>{feedbackNotice&&<p className="member-feedback-notice" role="status">{feedbackNotice}</p>}<button className="settings-primary" type="submit" disabled={feedbackBusy}>{feedbackBusy?"Enviando…":"Enviar sugestão →"}</button></form></section>
      <section className="settings-card"><div className="settings-card-title"><span className="settings-symbol">04</span><div><h2>Instalar aplicativo</h2><p>Tenha o O Clone Digital na tela inicial.</p></div></div><div className="install-card"><div className="install-icon"><img src="/imagens/logo-clone-digital.svg" alt="" /></div><div className="install-copy"><b>O Clone Digital</b><p>Acesso rápido, em uma janela própria.</p><small>{installed?"Aplicativo já instalado neste dispositivo":"Disponível como aplicativo web (PWA)"}</small></div></div><button className="settings-primary" onClick={install} disabled={installed}>{installed?"Aplicativo instalado":"＋  Adicionar à tela inicial"}</button><p className="settings-hint install-hint">iPhone/iPad: no Safari, use Compartilhar → Adicionar à Tela de Início. Se estiver em outro navegador, abra esta página no Safari. Android: use “Instalar app” no menu do navegador.</p></section>
    </div>
    {showInstallHelp&&<div className="install-modal-backdrop" role="presentation" onClick={()=>setShowInstallHelp(false)}><section className="install-modal" role="dialog" aria-modal="true" aria-labelledby="install-modal-title" onClick={e=>e.stopPropagation()}><button className="install-modal-close" onClick={()=>setShowInstallHelp(false)} aria-label="Fechar">×</button><img className="install-modal-logo" src="/imagens/logo-clone-digital.svg" alt="O Clone Digital"/><h2 id="install-modal-title">Adicionar à Tela de Início</h2>{iosDevice?<><p>O iPhone não mostra a instalação automaticamente. Siga estes passos no <b>Safari</b>:</p><ol><li>Toque no botão <b>Compartilhar</b> <span className="share-glyph" aria-label="Compartilhar">↑</span> na barra do Safari.</li><li>Role o menu para baixo e escolha <b>Adicionar à Tela de Início</b>.</li><li>Confirme em <b>Adicionar</b> no canto superior.</li><li>Abra o ícone do O Clone Digital pela tela inicial para usar o aplicativo.</li></ol><p className="install-modal-note">Se essa opção não aparecer, confirme que a página está aberta no Safari, não dentro de outro aplicativo.</p></>:<><p>Para instalar o O Clone Digital, abra o menu do navegador e escolha <b>Instalar app</b> ou <b>Adicionar à tela inicial</b>.</p><p className="install-modal-note">Se estiver usando um navegador que não oferece instalação, tente o Chrome.</p></>}<button className="settings-primary" onClick={()=>setShowInstallHelp(false)}>Entendi</button></section></div>}
    <div className="settings-save-bar"><button className="settings-primary" onClick={saveProfile}>Salvar alterações</button></div>
    <footer className="settings-footer"><span>O CLONE DIGITAL · PREFERÊNCIAS</span><Link href="/painel">Voltar para o painel →</Link></footer>
  </main>;
}
