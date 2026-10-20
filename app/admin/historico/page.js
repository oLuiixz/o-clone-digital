"use client";

import { useEffect } from "react";

export default function HistoricoPage() {
  useEffect(() => {
    window.location.replace("/admin#historico");
  }, []);
  return <main style={{minHeight:"100vh",display:"grid",placeItems:"center",background:"#f4f6fa",color:"#17202c",fontFamily:"Arial,sans-serif",padding:24}}><p>Abrindo histórico administrativo…</p></main>;
}
