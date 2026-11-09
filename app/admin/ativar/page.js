"use client";
import {useEffect,useState} from "react";
import Link from "next/link";
import "../admin.css";
export default function AdminActivationPage(){
 const [token,setToken]=useState("");
 const [password,setPassword]=useState("");
 const [confirm,setConfirm]=useState("");
 const [code,setCode]=useState("");
 const [secret,setSecret]=useState("");
 const [otpauth,setOtpauth]=useState("");
 const [recovery,setRecovery]=useState([]);
 const [step,setStep]=useState("password");
 const [busy,setBusy]=useState(false);
 const [error,setError]=useState("");
 const [copied,setCopied]=useState(false);
 useEffect(()=>{setToken(new URLSearchParams(window.location.search).get("token")||"");},[]);
 async function submitPassword(e){
  e.preventDefault();setError("");
  if(password!==confirm){setError("As senhas não coincidem.");return;}
  setBusy(true);
  try{
   const r=await fetch("/api/admin/activate",{method:"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify({token,password})});
   const j=await r.json();if(!r.ok)throw Error(j.error||"Não foi possível continuar.");
   setSecret(j.secret);setOtpauth(j.otpauthUrl);setStep("totp");
  }catch(e){setError(e.message);}finally{setBusy(false);}
 }
 async function verifyCode(e){
  e.preventDefault();setError("");setBusy(true);
  try{
   const r=await fetch("/api/admin/activate",{method:"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify({token,password,totpCode:code})});
   const j=await r.json();if(!r.ok)throw Error(j.error||"Código inválido.");
   setRecovery(j.recoveryCodes||[]);setStep("recovery");
  }catch(e){setError(e.message);}finally{setBusy(false);}
 }
 async function copyCodes(){
  try{await navigator.clipboard.writeText(recovery.join("\n"));setCopied(true);}catch{setError("Não foi possível copiar. Selecione e copie os códigos manualmente.");}
 }
 return <main className="admin-page"><section className="admin-login" style={{maxWidth:520}}>
  <div className="admin-brand">O CLONE <b>DIGITAL</b><small>SEGURANÇA ADMINISTRATIVA</small></div>
  <p className="admin-eyebrow">CONFIGURAÇÃO DA CONTA OWNER</p>
  {step==="password"&&<><h1>Crie sua senha individual</h1><p>Defina uma senha forte com pelo menos 12 caracteres. Em seguida, vamos vincular seu autenticador.</p>
   <form onSubmit={submitPassword}><label>Nova senha<input type="password" autoComplete="new-password" minLength={12} value={password} onChange={e=>setPassword(e.target.value)} required/></label><label>Confirmar senha<input type="password" autoComplete="new-password" minLength={12} value={confirm} onChange={e=>setConfirm(e.target.value)} required/></label>{error&&<p className="admin-error">{error}</p>}<button disabled={busy||!token}>{busy?"Salvando…":"Continuar para o 2FA"}</button></form></>}
  {step==="totp"&&<><h1>Ative a verificação em duas etapas</h1><p>Abra Google Authenticator, Microsoft Authenticator ou 1Password e adicione uma conta usando a chave abaixo.</p><div className="link-box"><b>Chave secreta do autenticador</b><code style={{display:"block",wordBreak:"break-all",padding:"12px 0"}}>{secret}</code><button type="button" onClick={()=>navigator.clipboard.writeText(secret)}>Copiar chave</button></div><p>URI de configuração: <code style={{wordBreak:"break-all"}}>{otpauth}</code></p><form onSubmit={verifyCode}><label>Código de 6 dígitos<input inputMode="numeric" autoComplete="one-time-code" maxLength={6} value={code} onChange={e=>setCode(e.target.value.replace(/\D/g,"").slice(0,6))} required/></label>{error&&<p className="admin-error">{error}</p>}<button disabled={busy||code.length!==6}>{busy?"Verificando…":"Ativar 2FA"}</button></form></>}
  {step==="recovery"&&<><h1>Guarde seus códigos de recuperação</h1><p>Salve estes códigos em um local seguro. Cada código pode ser usado uma única vez para entrar se perder acesso ao autenticador. Eles não serão exibidos novamente.</p><div className="link-box"><code style={{display:"block",whiteSpace:"pre-wrap",lineHeight:2}}>{recovery.join("\n")}</code><button type="button" onClick={copyCodes}>{copied?"Códigos copiados":"Copiar todos os códigos"}</button></div><p>Depois de guardar os códigos, entre usando seu e-mail, senha e autenticador.</p><Link className="secondary" href="/admin">Ir para o login</Link></>}
  {error&&step==="password"&&<p className="admin-error">{error}</p>}
 </section></main>;
}
