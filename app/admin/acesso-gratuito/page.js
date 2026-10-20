"use client";

import { useEffect } from "react";

export default function AcessoGratuitoPage() {
  useEffect(() => {
    window.location.replace("/admin#acesso-gratuito");
  }, []);
  return <main style={{minHeight:"100vh",display:"grid",placeItems:"center",background:"#f4f6fa",color:"#17202c",fontFamily:"Arial,sans-serif",padding:24}}><p>Abrindo gerenciamento de acesso gratuito…</p></main>;
}
