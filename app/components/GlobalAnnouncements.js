"use client";
import {useEffect,useState} from "react";
import "./global-announcements.css";
export default function GlobalAnnouncements(){
 const [items,setItems]=useState([]),[index,setIndex]=useState(0),[busy,setBusy]=useState(false);
 useEffect(()=>{let live=true;fetch("/api/announcements",{cache:"no-store"}).then(r=>r.json()).then(d=>{if(live&&Array.isArray(d.announcements))setItems(d.announcements)}).catch(()=>{});return()=>{live=false}},[]);
 async function dismiss(){const item=items[index];if(!item)return;setBusy(true);try{await fetch("/api/announcements",{method:"POST",headers:{"content-type":"application/json"},body:JSON.stringify({id:item.id})});setItems(current=>current.filter(x=>x.id!==item.id));setIndex(0)}finally{setBusy(false)}}
 if(!items.length)return null;const item=items[index];
 return <div className="ocd-announcement-backdrop" role="presentation"><section className="ocd-announcement-card" role="dialog" aria-modal="true" aria-labelledby="ocd-announcement-title"><div className="ocd-announcement-brand"><span className="ocd-announcement-icon">✦</span><span>O CLONE DIGITAL</span><span className="ocd-announcement-new">NOVIDADE</span></div><h2 id="ocd-announcement-title">{item.title}</h2><p>{item.message}</p><div className="ocd-announcement-actions">{item.target_url&&<a href={item.target_url} onClick={dismiss}>Conferir novidade <span>↗</span></a>}<button disabled={busy} onClick={dismiss}>{busy?"Salvando…":"Entendi, continuar"}</button></div>{items.length>1&&<small>{index+1} de {items.length} avisos</small>}</section></div>
}