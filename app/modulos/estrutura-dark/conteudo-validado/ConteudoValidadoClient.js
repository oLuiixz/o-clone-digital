"use client";

import { useMemo, useState } from "react";

const folders = [
  { title: "Cortes Pablo Marçal", icon: "mic", desc: "Cortes e vídeos para conteúdo de opinião e negócios.", links: [
    ["Vídeos — Pablo Marçal", "https://drive.google.com/drive/folders/1RqNvEhelljZYgSe3VLAvbgv2rCDekD8s"],
    ["Pack 300 Cortes Prontos", "https://drive.google.com/drive/folders/11PaJNc67qqvK-HkIEx2tmORkcGw3SA9Q"],
    ["Mais de 100 cortes", "https://drive.google.com/drive/folders/1TP0Ae-xZNnt3jvQ91pMJ4JU_s9iwb6GQ"],
    ["Biblioteca — 811 vídeos", "https://drive.google.com/drive/folders/1iSHwp0fPW7yF8np_M-lETcuPHblxH2zq"]
  ]},
  { title: "Cortes gringos", icon: "globe", desc: "Clipes internacionais para adaptar ao seu estilo.", links: [["Pasta original — Cortes Gringos", "https://www.dropbox.com/scl/fo/uht1cdevy7p1tz395ap7b/AFzdo3qJSKiglzfkx5FQCsM?rlkey=davagnx2uo9kqrvlye7399u9e&e=1&st=u9y6xele&dl=0"]] },
  { title: "Cortes Ruyter", icon: "briefcase", desc: "Biblioteca de cortes para criar vídeos curtos.", links: [["Pack Cortes Virais", "https://drive.google.com/drive/folders/1-BzVt5a78RyP3q_MaJxGYmLpYxkvA6Rs"]] },
  { title: "Homens de poder", icon: "users", desc: "Conteúdos sobre mentalidade, sucesso e negócios.", links: [["Homens de poder", "https://drive.google.com/drive/folders/1YdNOjmAwmjT2ZXO8UjLpRQexKGFu5Zbe"]] },
  { title: "Podcast Os Sócios", icon: "headphones", desc: "Cortes de podcast para conteúdos de negócios.", links: [["Cortes Podcast Os Sócios", "https://drive.google.com/drive/folders/15h9_iK0dUYkS5Q1bZQ5YiT4Xip1HRS6_?usp=drive_link"]] },
  { title: "Podcast Flow", icon: "mic", desc: "Cortes de conversas e entrevistas.", links: [["Flow Podcast", "https://drive.google.com/drive/folders/1A7Xdtt12mkXKDJWGX-yPYXPJQb92OpHL?usp=sharing"]] },
  { title: "Podcast Podpah", icon: "mic", desc: "Cortes de podcast para ideias e inspiração.", links: [["Podpah", "https://drive.google.com/drive/folders/1Hjf3WKHkh68cfgR6fKU-I6frgiDY6_f0?usp=drive_link"]] },
  { title: "Cortes Podcast Brasil", icon: "flag", desc: "Seleção de cortes de podcasts brasileiros.", links: [["Cortes Virais — Pack Dark All-IN", "https://drive.google.com/drive/folders/1KbH563f1LL9e-XzEsgK4NfKgHvouC45t"], ["Mais de 80 cortes de podcast", "https://drive.google.com/drive/folders/1lzgSenFbnC4WzoHoJq7ZuI9jcPwedgG-"]] },
  { title: "Gringos e diversos", icon: "zap", desc: "Coleção variada para explorar diferentes formatos.", links: [["Mais de 1.500 vídeos virais", "https://drive.google.com/drive/folders/11nHOpjzNHFGOUGdpQ8q-Tk1nNydnEBFy"]] },
  { title: "ASMR", icon: "sparkles", desc: "Vídeos sensoriais e satisfatórios.", links: [["Vídeos virais — Pack 1", "https://drive.google.com/drive/folders/1lkZLuMaXrepi3bMtwk3QxWmYCBlStCiV"], ["Vídeos virais — Pack 2", "https://drive.google.com/drive/folders/1ntVkzpu2NdTp5L7EIijxBh0nSTmps3Cm"]] },
  { title: "Conteúdo dark", icon: "moon", desc: "Clipes com estética dark e visual cinematográfico.", links: [["Rich/Luxury Clips", "https://drive.google.com/drive/folders/12h2S8oNdUP6T9LQ_Q2cKKFNkWxNl74ne"], ["Método Low Dark Videos Reels", "https://drive.google.com/drive/folders/1-NIRBQgT7jsAg2zLb8xYnu9v_OjvaLzE"]] },
  { title: "Primo Rico", icon: "chart", desc: "Conteúdo relacionado a finanças e educação financeira.", links: [["Cortes Primo Rico", "https://drive.google.com/drive/folders/1y7sPwA4OL6Hbr70Qn6fwBb-lhErWZTF0"]] },
  { title: "Alimentos", icon: "utensils", desc: "Vídeos de comida, receitas e imagens satisfatórias.", links: [["Vídeos virais — Pack 3", "https://drive.google.com/drive/folders/1uQ5Q67XkZ2WEEfhYylcNM1RNnr62Ezye"]] },
  { title: "Memes", icon: "smile", desc: "Conteúdo leve e humorístico para testar formatos.", links: [["Biblioteca de memes", "https://drive.google.com/drive/folders/17-lkb-3wZhcmjRYMyxyvVUuPmy-JZM24"]] },
  { title: "Cortes impactantes", icon: "zap", desc: "Momentos marcantes que prendem a atenção.", links: [["Biblioteca de impactantes", "https://drive.google.com/drive/folders/1TITYQcTyELc7hYEdq6kxMXQ-v09fZ3ty"]] },
  { title: "Luxúria e riqueza", icon: "gem", desc: "Estilo de vida, riqueza e estética premium.", links: [["Luxury lifestyle clips", "https://drive.google.com/drive/folders/14e-wpQIfoV2yfesDSzoJ7LKc2esIcbHd"], ["Luxury lifestyle — reuploads", "https://drive.google.com/drive/folders/1tSnYn312iT5BShTPrZjMeoIreL7upDql"], ["Lifestyles variados", "https://drive.google.com/drive/folders/1SqmmBg-7ASRQ1hhwEjsCOIt39ddP9ig1"]] },
  { title: "Lugares de luxo", icon: "map-pin", desc: "Viagens, destinos e cenários de alto padrão.", links: [["Luxury places", "https://drive.google.com/drive/folders/1BVPPZau6wXm5_USsOaItGhZx4_wwmbxF"], ["Jetski luxury", "https://drive.google.com/drive/folders/1SfHwKv4Ri_YmD32Dts_3luBFb2epQ6-7"]] },
  { title: "Relógios e carros", icon: "car", desc: "Automóveis, relógios e lifestyle premium.", links: [["Pack lifestyle milionário", "https://drive.google.com/drive/folders/1HGzOM7miX1TM1-lkt_8XH7mlt0h2rXRL"], ["Sports cars", "https://drive.google.com/drive/folders/1H7LK1FbyfKuM7nDm3DKssogXot9Sf-gA"], ["Clips variados", "https://drive.google.com/drive/folders/1EAlBRwQstPIwzKUtj0P2iUjJ8fp4jBDt"], ["Carros luxuosos", "https://drive.google.com/drive/folders/1QAsKc3icy_NNrSACwwHwX4nDg7rrxmrF"], ["Relógios luxuosos", "https://drive.google.com/drive/folders/12j4SWIQKbsFtbOjL75YHxbNDyKmdscza"]] },
  { title: "Cortes de moto", icon: "bike", desc: "Vídeos de motos e conteúdo automotivo.", links: [["Biblioteca de carros/motos", "https://www.dropbox.com/scl/fo/uht1cdevy7p1tz395ap7b/AF2pIxkMGc8RwdrGDpmVvJE/Cars?dl=0&rlkey=davagnx2uo9kqrvlye7399u9e&subfolder_nav_tracking=1"]] },
  { title: "Cortes edits", icon: "film", desc: "Clipes e materiais para edição e montagem.", links: [["37 clips", "https://drive.google.com/drive/folders/1EAlBRwQstPIwzKUtj0P2iUjJ8fp4jBDt"], ["Clips", "https://drive.google.com/drive/folders/18k7hbfyWK6zBLV2EsDTND-5m26ZKW1nI"], ["42 clips", "https://drive.google.com/drive/folders/1SOGqNNe-m0_OdQ5SUCpuvjxbw1K1LDFc"], ["46 clips", "https://drive.google.com/drive/folders/1vtJnGcQfglYWb3fqG2XV9jnsDMEbmqur"], ["Mais clips", "https://drive.google.com/drive/folders/18ih7pvluI4QzfyZt-2_AyZyFj1fJOrQD"], ["39 clips", "https://drive.google.com/drive/folders/1xAnlOIMmcHOSCzofNZ82DQgIkEWy69Iy"], ["Dinheiro & Money", "https://drive.google.com/drive/folders/14q7RrFEI2DCkzXF4zvjt11Aip-1H9-a7"]] },
  { title: "Academia / shape", icon: "dumbbell", desc: "Motivação fitness e treino.", links: [["Gym Women Motivation", "https://www.dropbox.com/scl/fo/uht1cdevy7p1tz395ap7b/AOwm5BX_5xCoLSjyQx4pMwc/GYM%20Women%20Motivation?dl=0&rlkey=davagnx2uo9kqrvlye7399u9e&subfolder_nav_tracking=1"]] },
  { title: "Cortes bíblicos", icon: "book-open", desc: "Vídeos com temática bíblica e reflexões.", links: [] },
  { title: "Yachts", icon: "ship", desc: "Iates, mar e estilo de vida premium.", links: [] },
  { title: "Motorhome", icon: "van", desc: "Viagens, motorhomes e aventura.", links: [] },
  { title: "Espaço sideral", icon: "orbit", desc: "Universo, espaço e imagens cósmicas.", links: [] }
];


const iconPaths = {
  mic: ["M12 2a3 3 0 0 0-3 3v7a3 3 0 0 0 6 0V5a3 3 0 0 0-3-3Z","M19 10v2a7 7 0 0 1-14 0v-2","M12 19v3","M8 22h8"],
  globe: ["M12 22a10 10 0 1 0 0-20 10 10 0 0 0 0 20Z","M2 12h20","M12 2a15 15 0 0 1 0 20","M12 2a15 15 0 0 0 0 20"],
  briefcase: ["M3 7h18v13H3z","M8 7V4h8v3","M3 12h18"],
  users: ["M16 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2","M10 11a4 4 0 1 0 0-8 4 4 0 0 0 0 8Z","M20 21v-2a4 4 0 0 0-3-3.87"],
  headphones: ["M3 14v-3a9 9 0 0 1 18 0v3","M5 14h2v7H5a2 2 0 0 1-2-2v-3a2 2 0 0 1 2-2Z","M19 14h-2v7h2a2 2 0 0 0 2-2v-3a2 2 0 0 0-2-2Z"],
  flag: ["M4 22V4","M4 4c5-4 8 4 16 0v12c-8 4-11-4-16 0"],
  zap: ["m13 2-3 8h7l-6 12 2-9H6l7-11Z"],
  sparkles: ["m12 3 1.9 5.8L20 11l-6.1 2.2L12 19l-1.9-5.8L4 11l6.1-2.2L12 3Z","m19 14 1.2 2.8L23 18l-2.8 1.2L19 22l-1.2-2.8L15 18l2.8-1.2L19 14Z"],
  moon: ["M20.9 13A9 9 0 0 1 11 3.1 9 9 0 1 0 20.9 13Z"],
  chart: ["M3 3v18h18","m19 9-5 5-4-4-5 5"],
  utensils: ["M3 2v7a4 4 0 0 0 8 0V2","M7 2v20","M21 15V2c-4 3-5 8-5 13h5v7"],
  smile: ["M12 22a10 10 0 1 0 0-20 10 10 0 0 0 0 20Z","M8 14s1.5 2 4 2 4-2 4-2","M9 9h.01","M15 9h.01"],
  gem: ["m6 3-4 6 10 13L22 9l-4-6H6Z","M2 9h20","m6 3 6 19 6-19"],
  "map-pin": ["M20 10c0 5-8 12-8 12S4 15 4 10a8 8 0 1 1 16 0Z","M12 10a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z"],
  car: ["M5 17h14l2-6-2-5H5l-2 5 2 6Z","M5 17v3","M19 17v3","M3 12h18"],
  bike: ["M5 17a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z","M19 17a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z","m5 14 4-7h4l6 7","m9 7 5 7"],
  film: ["M4 4h16v16H4z","M4 8h16","M4 16h16","M8 4v4","M16 16v4"],
  dumbbell: ["m6.5 6.5 11 11","m4 8 4-4","m16 20 4-4","m2 10 6-6","m16 20 6-6"],
  "book-open": ["M2 4.5A2.5 2.5 0 0 1 4.5 2H11v19H4.5A2.5 2.5 0 0 0 2 23V4.5Z","M22 4.5A2.5 2.5 0 0 0 19.5 2H13v19h6.5a2.5 2.5 0 0 1 2.5 2V4.5Z"],
  ship: ["M3 17 12 21l9-4","m5 17 2-9h10l2 9","M12 8V3","M12 3l5 4H7l5-4Z"],
  van: ["M3 6h12v12H3z","M15 10h4l3 4v4h-7","M7 21a2 2 0 1 0 0-4 2 2 0 0 0 0 4Z","M18 21a2 2 0 1 0 0-4 2 2 0 0 0 0 4Z"],
  orbit: ["M12 12m-2 0a2 2 0 1 0 4 0a2 2 0 1 0-4 0","M12 2a10 4 0 1 0 0 20 10 4 0 1 0 0-20Z","M12 2a4 10 0 1 0 0 20 4 10 0 1 0 0-20Z"]
};
function Icon({ name, size = 21, className }) {
  return <svg className={className} width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.7" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true" focusable="false">{(iconPaths[name] || iconPaths.sparkles).map((d, i) => <path key={i} d={d} />)}</svg>;
}

function slug(value) { return value.toLowerCase().normalize("NFD").replace(/[\u0300-\u036f]/g, "").replace(/[^a-z0-9]+/g, "-"); }

export default function ConteudoValidadoClient() {
  const [query, setQuery] = useState("");
  const [selected, setSelected] = useState(null);
  const [theme, setTheme] = useState("dark");
  const filtered = useMemo(() => folders.filter(folder => (folder.title + " " + folder.desc + " " + folder.links.map(link => link[0]).join(" ")).toLowerCase().includes(query.toLowerCase())), [query]);
  const totalLinks = folders.reduce((sum, folder) => sum + folder.links.length, 0);
  function toggleTheme() { const next = theme === "dark" ? "light" : "dark"; setTheme(next); document.documentElement.dataset.tema = next; document.documentElement.style.colorScheme = next; }

  return <main className="cv-page">
    <style>{`
      :root{--cv-bg:#0b0b0c;--cv-panel:#141416;--cv-panel2:#1b1b1e;--cv-text:#f5f5f5;--cv-muted:#a1a1aa;--cv-line:#2a2a30;--cv-accent:#8b5cf6;--cv-accent2:#c4b5fd}
      html[data-tema="light"]{--cv-bg:#f7f7fa;--cv-panel:#fff;--cv-panel2:#f1f1f5;--cv-text:#202024;--cv-muted:#666673;--cv-line:#e2e2ea}
      .cv-page{min-height:100vh;background:radial-gradient(circle at 85% 0%,rgba(139,92,246,.17),transparent 30%),var(--cv-bg);color:var(--cv-text);padding:18px 22px 70px;font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Arial,sans-serif}
      .cv-shell{max-width:1120px;margin:auto}.cv-header{display:flex;align-items:center;gap:14px;padding:12px 14px;border:1px solid var(--cv-line);border-radius:16px;background:var(--cv-panel);box-shadow:0 12px 35px rgba(0,0,0,.18)}.cv-brand{display:flex;align-items:center;gap:10px;min-width:max-content}.cv-logo{width:40px;height:40px;display:grid;place-items:center;border-radius:12px;background:linear-gradient(135deg,#8b5cf6,#4c1d95);font-size:12px;font-weight:900;color:white}.cv-brand strong{display:block;font-size:14px}.cv-brand small{display:block;font-size:11px;color:var(--cv-muted)}.cv-nav{display:flex;gap:16px;margin-right:auto}.cv-nav a{font-size:13px;color:var(--cv-muted);text-decoration:none}.cv-actions{display:flex;align-items:center;gap:8px;min-width:0}.cv-search{display:flex;gap:8px;align-items:center;width:245px;border:1px solid var(--cv-line);border-radius:999px;padding:0 13px;background:var(--cv-panel2)}.cv-search input{width:100%;min-width:0;border:0;outline:0;background:transparent;color:var(--cv-text);padding:10px 0;font-size:13px}.cv-btn{display:inline-flex;align-items:center;justify-content:center;border:1px solid var(--cv-line);border-radius:999px;padding:9px 13px;background:var(--cv-panel);color:var(--cv-text);text-decoration:none;font-size:12px;font-weight:750;cursor:pointer;white-space:nowrap}.cv-btn:hover{border-color:var(--cv-accent2)}.cv-back{display:inline-flex;margin-top:18px;color:var(--cv-muted);text-decoration:none;border:1px solid var(--cv-line);border-radius:999px;padding:8px 12px;font-size:12px;font-weight:700}
      .cv-hero{margin-top:25px;padding:42px 38px;border:1px solid rgba(139,92,246,.34);border-radius:24px;background:radial-gradient(circle at 83% 15%,rgba(139,92,246,.28),transparent 28%),linear-gradient(135deg,rgba(139,92,246,.12),var(--cv-panel));box-shadow:0 24px 70px rgba(0,0,0,.22)}.cv-kicker{display:inline-flex;border:1px solid rgba(196,181,253,.35);border-radius:999px;padding:7px 11px;color:var(--cv-accent2);font-size:10px;font-weight:900;letter-spacing:1.6px}.cv-hero h1{font-size:clamp(36px,5vw,64px);line-height:1.02;letter-spacing:-2.5px;margin:17px 0 12px}.cv-hero p{max-width:720px;color:var(--cv-muted);line-height:1.7;margin:0}.cv-stats{display:flex;flex-wrap:wrap;gap:10px;margin-top:24px}.cv-stat{border:1px solid var(--cv-line);border-radius:12px;background:var(--cv-panel);padding:12px 15px;min-width:130px}.cv-stat strong{display:block;font-size:19px}.cv-stat span{font-size:11px;color:var(--cv-muted)}.cv-tip{margin-top:20px;padding:15px 17px;border-radius:13px;background:var(--cv-panel2);border:1px solid var(--cv-line);color:var(--cv-muted);font-size:13px;line-height:1.65}
      .cv-section{margin-top:38px}.cv-section-head{display:flex;align-items:end;justify-content:space-between;gap:12px;margin-bottom:15px}.cv-section-head h2{font-size:22px;margin:0}.cv-section-head span{font-size:12px;color:var(--cv-muted)}.cv-grid{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:12px}.cv-card{border:1px solid var(--cv-line);border-radius:16px;background:linear-gradient(145deg,var(--cv-panel),var(--cv-panel2));padding:18px;text-align:left;color:inherit;cursor:pointer;min-width:0;min-height:168px;transition:transform .2s,border-color .2s}.cv-card:hover{transform:translateY(-3px);border-color:rgba(196,181,253,.5)}.cv-card-top{display:flex;align-items:center;justify-content:space-between;gap:10px}.cv-card-icon{width:42px;height:42px;display:grid;place-items:center;border-radius:12px;background:rgba(139,92,246,.15);color:var(--cv-accent2);border:1px solid rgba(139,92,246,.18)}.cv-card{width:100%;min-height:174px;box-sizing:border-box;font:inherit;display:flex;flex-direction:column;align-items:stretch;text-decoration:none;text-align:left;color:inherit;appearance:none;border:1px solid var(--cv-line);background:linear-gradient(145deg,var(--cv-panel),var(--cv-panel2));padding:18px;border-radius:16px}.cv-card:disabled{cursor:default;opacity:1}.cv-card:disabled:hover{transform:none;border-color:var(--cv-line)}.cv-card:focus-visible{outline:2px solid var(--cv-accent2);outline-offset:3px}.cv-card-icon svg{display:block}.cv-card small{color:var(--cv-accent2);font-size:10px;font-weight:850;letter-spacing:.7px}.cv-card h3{font-size:15px;margin:15px 0 7px}.cv-card p{font-size:12px;line-height:1.6;color:var(--cv-muted);margin:0}.cv-card-foot{display:flex;justify-content:flex-end;align-items:center;gap:8px;margin-top:auto;padding-top:16px;font-size:11px;color:var(--cv-muted)}.cv-card-foot strong{color:var(--cv-accent2)}
      .cv-detail{margin-top:24px;padding:26px;border:1px solid var(--cv-line);border-radius:18px;background:var(--cv-panel)}.cv-detail-head{display:flex;align-items:flex-start;justify-content:space-between;gap:12px}.cv-detail h2{margin:0;font-size:25px}.cv-detail p{color:var(--cv-muted);line-height:1.7}.cv-links{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:10px;margin-top:18px}.cv-link{display:flex;align-items:center;justify-content:space-between;gap:12px;padding:15px;border:1px solid var(--cv-line);border-radius:12px;background:var(--cv-panel2);text-decoration:none;color:var(--cv-text);font-size:13px;font-weight:700}.cv-link:hover{border-color:var(--cv-accent2)}.cv-link span:last-child{color:var(--cv-accent2)}.cv-empty{padding:18px;border:1px dashed var(--cv-line);border-radius:12px;color:var(--cv-muted);font-size:13px;line-height:1.65}.cv-guide{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:12px}.cv-guide article{border:1px solid var(--cv-line);border-radius:14px;padding:17px;background:var(--cv-panel)}.cv-guide b{display:block;margin-bottom:7px}.cv-guide p{margin:0;color:var(--cv-muted);font-size:13px;line-height:1.65}
      @media(max-width:900px){.cv-nav{display:none}.cv-search{width:min(240px,35vw)}.cv-grid{grid-template-columns:repeat(2,minmax(0,1fr))}.cv-guide{grid-template-columns:1fr}}@media(max-width:600px){.cv-page{padding:10px 11px 45px}.cv-header{flex-wrap:wrap;gap:10px}.cv-brand{min-width:0;flex:1}.cv-actions{width:100%}.cv-search{flex:1;width:auto}.cv-grid,.cv-links{grid-template-columns:1fr}.cv-hero{padding:29px 22px;border-radius:19px}.cv-hero h1{font-size:40px}.cv-detail{padding:19px}.cv-detail h2{font-size:22px}.cv-section-head{align-items:flex-start;flex-direction:column}}
    `}</style>
    <div className="cv-shell">
      <header className="cv-header">
        <div className="cv-brand"><span className="cv-logo">CV</span><div><strong>Conteúdo Validado</strong><small>Bônus gratuito • Área exclusiva</small></div></div>
        <nav className="cv-nav"><a href="#inicio">Início</a><a href="#biblioteca">Biblioteca</a><a href="#guia">Como usar</a></nav>
        <div className="cv-actions"><div className="cv-search"><Icon name="globe" size={16} /><input value={query} onChange={event => setQuery(event.target.value)} placeholder="Buscar categoria..." aria-label="Buscar categoria" /></div><button className="cv-btn" onClick={toggleTheme} aria-label="Alternar tema">{theme === "dark" ? "Tema claro" : "Tema escuro"}</button></div>
      </header>
      <a className="cv-back" href="/app">← Voltar para o Método Dark Motion</a>
      <section className="cv-hero" id="inicio">
        <span className="cv-kicker">BÔNUS EXCLUSIVO • BIBLIOTECA DE CLIPES</span>
        <h1>50 mil<br/>cortes virais.</h1>
        <p>Uma biblioteca organizada para você explorar referências, encontrar clipes e planejar conteúdos curtos. Escolha uma categoria e abra as pastas disponíveis.</p>
        <div className="cv-stats"><div className="cv-stat"><strong>{folders.length}</strong><span>Categorias</span></div><div className="cv-stat"><strong>{totalLinks}+</strong><span>Pastas vinculadas</span></div><div className="cv-stat"><strong>Gratuito</strong><span>Incluído no Método</span></div></div>
        <div className="cv-tip"><Icon name="sparkles" size={16} className="cv-tip-icon" /> <strong>Use com responsabilidade:</strong> confira permissões, direitos autorais e regras de cada plataforma antes de republicar conteúdo de terceiros. Sempre que possível, transforme a referência com edição, contexto e contribuição original.</div>
      </section>
      <section className="cv-section" id="biblioteca">
        <div className="cv-section-head"><h2>Biblioteca de conteúdo</h2><span>{filtered.length} de {folders.length} categorias</span></div>
        <div className="cv-grid">{filtered.map(folder => {
          const cardContent = <>
            <div className="cv-card-top"><span className="cv-card-icon"><Icon name={folder.icon} size={21} /></span><small>{folder.links.length ? "PASTAS DISPONÍVEIS" : "EM BREVE"}</small></div>
            <h3>{folder.title}</h3><p>{folder.desc}</p><div className="cv-card-foot">{folder.links.length > 0 && <strong>{folder.links.length === 1 ? "Abrir →" : "Ver links →"}</strong>}</div>
          </>;
          if (folder.links.length === 1) return <a className="cv-card" key={folder.title} href={folder.links[0][1]} target="_blank" rel="noreferrer" aria-label={"Abrir " + folder.title + " em nova aba"}>{cardContent}</a>;
          return <button className="cv-card" key={folder.title} onClick={() => { setSelected(folder); window.setTimeout(() => document.getElementById("detalhe")?.scrollIntoView({ behavior: "smooth", block: "start" }), 0); }} disabled={!folder.links.length}>{cardContent}</button>;
        })}</div>
        {selected && <div className="cv-detail" id="detalhe">
          <div className="cv-detail-head"><div><h2>{selected.title}</h2></div><button className="cv-btn" onClick={() => setSelected(null)}>Fechar ×</button></div>
          <p>{selected.desc}</p>
          {selected.links.length ? <div className="cv-links">{selected.links.map(([label,url]) => <a className="cv-link" key={url} href={url} target="_blank" rel="noreferrer"><span>{label}</span><Icon name="globe" size={16} /></a>)}</div> : <div className="cv-empty">Em breve.</div>}
        </div>}
      </section>
      <section className="cv-section" id="guia">
        <div className="cv-section-head"><h2>Como aproveitar melhor</h2><span>Fluxo recomendado</span></div>
        <div className="cv-guide"><article><b>01 · Escolha um nicho</b><p>Selecione categorias coerentes com o perfil e com o público que você quer alcançar.</p></article><article><b>02 · Crie uma versão própria</b><p>Adicione narração, análise, contexto, edição e identidade visual; não dependa apenas de reposts idênticos.</p></article><article><b>03 · Teste e acompanhe</b><p>Compare retenção, compartilhamentos, salvamentos e comentários para descobrir quais formatos funcionam melhor.</p></article></div>
      </section>
    </div>
  </main>;
}
