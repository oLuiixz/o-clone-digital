"use client";

import { useState } from "react";
import Link from "next/link";
import { startAuthentication } from "@simplewebauthn/browser";

export default function LoginPage() {
  const [mode, setMode] = useState("login");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [message, setMessage] = useState("");
  const [error, setError] = useState("");
  const [busy, setBusy] = useState(false);
  const [passkeyBusy, setPasskeyBusy] = useState(false);

  async function signInWithPasskey() {
    setPasskeyBusy(true); setMessage(""); setError("");
    try {
      if (!email.trim()) throw new Error("Informe seu e-mail para localizar suas chaves de acesso.");
      const optionsResponse = await fetch("/api/auth/passkeys/options", { method: "POST", headers: { "Content-Type": "application/json" }, body: JSON.stringify({ email: email.trim() }) });
      const options = await optionsResponse.json();
      if (!optionsResponse.ok) throw new Error(options.error || "Não foi possível iniciar o acesso por chave.");
      const credential = await startAuthentication({ optionsJSON: options });
      const verifyResponse = await fetch("/api/auth/passkeys/verify", { method: "POST", headers: { "Content-Type": "application/json" }, body: JSON.stringify({ email: email.trim(), response: credential }) });
      const result = await verifyResponse.json();
      if (!verifyResponse.ok) throw new Error(result.error || "Não foi possível validar a chave de acesso.");
      window.location.assign(result.redirect || "/painel");
    } catch (err) {
      if (err?.name === "NotAllowedError") setError("A autenticação foi cancelada ou não foi concluída. Tente novamente ou entre com sua senha.");
      else setError(err.message || "Não foi possível entrar com a chave de acesso.");
    } finally { setPasskeyBusy(false); }
  }

  async function submit(event) {
    event.preventDefault();
    setBusy(true); setMessage(""); setError("");
    try {
      const endpoint = mode === "login" ? "/api/auth/login" : mode === "activate" ? "/api/auth/request-activation" : "/api/auth/request-password-reset";
      const payload = mode === "login" ? { email, password } : { email };
      const response = await fetch(endpoint, { method: "POST", headers: { "Content-Type": "application/json" }, body: JSON.stringify(payload) });
      const data = await response.json();
      if (!response.ok) throw new Error(data.error || "Não foi possível concluir a solicitação.");
      if (mode === "login") window.location.assign(data.redirect || "/painel");
      else setMessage(data.message || "Confira seu e-mail.");
    } catch (err) { setError(err.message || "Tente novamente."); }
    finally { setBusy(false); }
  }

  return <main className="auth-page">
    <section className="auth-card">
      <Link className="auth-brand" href="/">O CLONE <b>DIGITAL</b></Link>
      <div className="auth-eyebrow">ÁREA DO ALUNO</div>
      <h1>{mode === "login" ? "Bom ter você de volta." : mode === "activate" ? "Ative seu acesso." : "Recupere sua senha."}</h1>
      <p className="auth-description">{mode === "login" ? "Entre com o mesmo e-mail usado na compra." : mode === "activate" ? "Informe o e-mail da compra aprovada. Enviaremos um link seguro para você criar sua senha." : "Informe o e-mail da sua conta. Enviaremos um link seguro para redefinir sua senha."}</p>
      <form onSubmit={submit} className="auth-form">
        <label htmlFor="email">E-mail da compra</label>
        <input id="email" type="email" autoComplete="email" required value={email} onChange={e => setEmail(e.target.value)} placeholder="voce@exemplo.com" />
        {mode === "login" && <><label htmlFor="password">Senha</label><input id="password" type="password" autoComplete="current-password" required value={password} onChange={e => setPassword(e.target.value)} placeholder="Sua senha" /></>}
        {error && <p className="auth-error" role="alert">{error}</p>}
        {message && <p className="auth-success" role="status">{message}</p>}
        <button className="auth-submit" disabled={busy}>{busy ? "Aguarde..." : mode === "login" ? "Entrar na plataforma" : mode === "activate" ? "Enviar link de ativação" : "Enviar link de recuperação"}</button>
      </form>
      {mode === "login" && <button type="button" className="auth-switch" disabled={busy || passkeyBusy} onClick={signInWithPasskey}>{passkeyBusy ? "Aguardando autenticação..." : "Entrar com chave de acesso / biometria"}</button>}
      <button className="auth-switch" onClick={() => { setMode(mode === "login" ? "activate" : "login"); setMessage(""); setError(""); }}>{mode === "login" ? "Primeiro acesso? Ative sua conta" : "Voltar ao login"}</button>
      {mode === "login" && <button type="button" className="auth-switch" onClick={() => { setMode("recover"); setMessage(""); setError(""); }}>Esqueci minha senha</button>}
      {mode === "recover" && <button type="button" className="auth-switch" onClick={() => { setMode("activate"); setMessage(""); setError(""); }}>Preciso ativar minha conta</button>}
      <p className="auth-footnote">O acesso é vinculado ao e-mail da compra aprovada.</p>
    </section>
  </main>;
}
