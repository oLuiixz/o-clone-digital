"use client";

import { useEffect, useState } from "react";

const links = [
  ["home", "Início", "#inicio"],
  ["modules", "Módulos e aulas", "#modulos"],
  ["search", "Pesquisa de ofertas", "#atalhos"],
  ["layers", "Ferramentas", "/ferramentas"],
  ["chart", "Clone Awards", "/clone-awards"],
  ["community", "Comunidade", "/comunidade"],
  ["live", "Ao vivo", "/ao-vivo"],
  ["modules", "Afiliados", "/afiliados"],
  ["chart", "Meu progresso", "#progresso"],
  ["settings", "Configurações", "/configuracoes"],
];

function MenuIcon({ name }) {
  const common = { width: 20, height: 20, viewBox: "0 0 24 24", fill: "none", stroke: "currentColor", strokeWidth: 1.7, strokeLinecap: "round", strokeLinejoin: "round", "aria-hidden": true };
  const paths = {
    home: <><path d="m3 10 9-7 9 7" /><path d="M5 9v11h14V9M9 20v-6h6v6" /></>,
    modules: <><rect x="4" y="3" width="16" height="18" rx="2" /><path d="M8 8h8M8 12h8M8 16h5" /></>,
    search: <><circle cx="10.8" cy="10.8" r="6.3" /><path d="m16 16 4.2 4.2" /></>,
    layers: <><path d="m12 3 9 5-9 5-9-5 9-5Z" /><path d="m3 12 9 5 9-5M3 16l9 5 9-5" /></>,
    chart: <><path d="M4 19V5M4 19h16" /><path d="m7 15 4-4 3 2 5-6" /></>,
    community: <><path d="M20 11.5a7.5 7.5 0 0 1-7.5 7.5H5l-2 2v-9.5A7.5 7.5 0 0 1 10.5 4H12a8 8 0 0 1 8 7.5Z" /><path d="M8 11h.01M12 11h.01M16 11h.01" /></>,
    live: <><circle cx="12" cy="12" r="9" /><path d="m10 8 6 4-6 4V8Z" /></>,
    settings: <><circle cx="12" cy="12" r="3" /><path d="M19 13.5v-3l-2-.5-.7-1.7 1-1.8-2.1-2.1-1.8 1L12 4.7l-.5-2h-3l-.5 2-1.7.7-1.8-1-2.1 2.1 1 1.8-.7 1.7-2 .5v3l2 .5.7 1.7-1 1.8 2.1 2.1 1.8-1 1.7.7.5 2h3l.5-2 1.7-.7 1.8 1 2.1-2.1-1-1.8.7-1.7 2-.5Z" /></>,
  };
  return <svg {...common}>{paths[name] || paths.layers}</svg>;
}

export default function MobileMenu({ member }) {
  const [open, setOpen] = useState(false);
  useEffect(() => {
    if (!open) return;
    const onKeyDown = (event) => event.key === "Escape" && setOpen(false);
    document.addEventListener("keydown", onKeyDown);
    document.body.style.overflow = "hidden";
    return () => {
      document.removeEventListener("keydown", onKeyDown);
      document.body.style.overflow = "";
    };
  }, [open]);

  return (
    <div className={`mobile-menu ${open ? "is-open" : ""}`}>
      {open && <button className="mobile-menu-backdrop" type="button" aria-label="Fechar menu" onClick={() => setOpen(false)} />}
      <button className="mobile-menu-trigger" type="button" aria-label={open ? "Fechar menu" : "Abrir menu de navegação"} aria-expanded={open} onClick={() => setOpen((value) => !value)}>
        <span className="mobile-menu-hamburger" aria-hidden="true"><i /><i /><i /></span>
      </button>
      {open && <nav className="mobile-menu-panel" aria-label="Navegação mobile">
        <div className="mobile-menu-heading">
          <img src="/imagens/logo-clone-digital.svg" alt="" />
          <div><strong>O CLONE <span>DIGITAL</span></strong><small>NAVEGAÇÃO</small></div>
          <button className="mobile-menu-close" type="button" aria-label="Fechar menu" onClick={() => setOpen(false)}>×</button>
        </div>
        <div className="mobile-menu-links">
          {links.map(([icon, label, href]) => <a className="mobile-menu-link" href={href} key={label} onClick={() => setOpen(false)}>
            <span className="mobile-nav-icon"><MenuIcon name={icon} /></span><span>{label}</span><span className="mobile-menu-chevron">›</span>
          </a>)}
        </div>
        <div className="mobile-menu-profile">
          <span className="mobile-menu-avatar">{member?.photo_data ? <img src={member.photo_data} alt="" /> : (member?.display_name || "Minha jornada").trim().slice(0, 2).toUpperCase()}</span>
          <span><strong>{member?.display_name || "Minha jornada"}</strong><small>Área do aluno</small></span>
        </div>
      </nav>}
    </div>
  );
}
