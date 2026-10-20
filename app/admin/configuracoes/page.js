"use client";
import {useEffect,useState} from "react";
import "../admin.css";

export default function AdminConfiguracoesPage(){
 const [settings,setSettings]=useState(null);
 const [busy,setBusy]=useState(true);
 const [error,setError]=useState("");
 async function load(){
  setBusy(true);setError("");
  try{
   const session=await fetch("/api/admin/session",{cache:"no-store"}).then(r=>r.json());
   if(!session.authenticated){window.location.replace("/admin");return;}
   const r=await fetch("/api/admin/settings",{cache:"no-store"});
   const j=await r.json();
   if(!r.ok)throw Error(j.error||"Falha ao carregar configurações");
   setSettings(j);
  }catch(e){setError(e.message||"Não foi possível carregar as configurações.");}
  finally{setBusy(false);}
 }
 useEffect(()=>{load();},[]);
 async function logout(){await fetch("/api/admin/session",{method:"DELETE"});window.location.replace("/admin");}
 return <main className="admin-page admin-settings-route">
  <aside className="admin-sidebar">
   <a className="admin-sidebar-brand" href="/admin"><span className="admin-logo-mark">OC</span><span>O CLONE <b>DIGITAL</b><small>PAINEL ADMINISTRATIVO</small></span></a>
   <nav className="admin-sidebar-nav" aria-label="Navegação administrativa">
    <a href="/admin">Dashboard</a><a href="/admin#compras">Pagamentos</a><a href="/admin#acesso-gratuito">Acesso gratuito</a><a href="/admin#historico">Histórico</a><a href="/admin#avisos-globais">Anúncios</a><a href="/admin/feedback">Feedbacks</a><a href="/admin/ferramentas">Ferramentas</a><a className="is-active" href="/admin/configuracoes" aria-current="page">Configurações</a>
   </nav><div className="admin-sidebar-bottom"><span className="admin-sidebar-status"><i/> SISTEMA OPERACIONAL</span><p>O Clone Digital<br/><small>Evolução constante.</small></p></div>
  </aside>
  <div className="admin-shell">
   <header className="admin-top"><div><p className="admin-eyebrow">ADMINISTRAÇÃO / SISTEMA</p><h1 className="admin-route-title">Configurações</h1></div><div className="admin-top-actions"><a className="secondary" href="/admin">Voltar ao dashboard</a><button className="secondary" onClick={logout}>Sair</button></div></header>
   <section className="admin-heading"><div><p className="admin-eyebrow">SISTEMA E INTEGRAÇÕES</p><h2>Configurações da plataforma</h2><p>Consulte o estado das integrações e acesse as variáveis de ambiente com segurança.</p></div></section>
   {error&&<p className="admin-error">{error}</p>}
   <section className="admin-section settings-section">
    <div className="section-title"><div className="section-heading"><span className="section-kicker"><i/> DIAGNÓSTICO</span><h2>Status do sistema <span className="heading-count">ADMIN</span></h2><p>As chaves e senhas não são exibidas nesta tela.</p></div><button className="secondary" disabled={busy} onClick={load}>{busy?"Verificando…":"Verificar sistema"}</button></div>
    <div className="settings-grid">{[{key:"appUrl",title:"URL pública",desc:"NEXT_PUBLIC_APP_URL"},{key:"database",title:"Banco de dados",desc:"Conexão Neon / DATABASE_URL"},{key:"resend",title:"Envio de e-mail",desc:"RESEND_API_KEY + RESEND_FROM_EMAIL"},{key:"adminPassword",title:"Senha administrativa",desc:"ADMIN_PANEL_PASSWORD"}].map(item=><div className="settings-card" key={item.key}><div className="settings-card-top"><b>{item.title}</b><span className={"settings-status "+(settings?.checks?.[item.key]?"ok":"missing")}>{busy?"Consultando…":settings?.checks?.[item.key]?"Configurado":"Verificar"}</span></div><p>{item.desc}</p></div>)}</div>
    {settings?.warning&&<p className="settings-warning">{settings.warning}</p>}
    <div className="settings-products"><h3>Produtos cadastrados</h3>{settings?.products?.length?settings.products.map(p=><div className="settings-product" key={p.id}><span><b>{p.name}</b><small>/{p.slug}</small></span><span className={"settings-status "+(p.is_active?"ok":"missing")}>{p.is_active?"Ativo":"Inativo"}</span></div>):<p className="empty">{busy?"Consultando banco…":"Nenhum produto retornado ou banco indisponível."}</p>}</div>
    <div className="settings-footer"><p>Para alterar as variáveis de ambiente, abra as configurações do projeto na Vercel.</p><button onClick={()=>window.open("https://vercel.com/luixzs-projects/o-clone-digital/settings/environment-variables","_blank","noopener,noreferrer")}>Abrir variáveis na Vercel ↗</button></div>
   </section>
  </div>
 </main>;
}
