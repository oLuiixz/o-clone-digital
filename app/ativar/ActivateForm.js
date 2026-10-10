"use client";

import { useState } from "react";
import Link from "next/link";

export default function ActivateForm({ token }) {
  const [password, setPassword] = useState("");
  const [confirm, setConfirm] = useState("");
  const [error, setError] = useState("");
  const [busy, setBusy] = useState(false);

  async function submit(event) {
    event.preventDefault(); setError("");
    if (password !== confirm) { setError("As senhas não coincidem."); return; }
    setBusy(true);
    try {
      const response = await fetch("/api/auth/activate", { method: "POST", headers: { "Content-Type": "application/json" }, body: JSON.stringify({ token, password }) });
      const data = await response.json();
      if (!response.ok) throw new Error(data.error || "Não foi possível ativar a conta.");
      window.location.assign(data.redirect || "/");
    } catch (err) { setError(err.message || "Tente novamente."); }
    finally { setBusy(false); }
  }

  return <main className="auth-page"><section className="auth-card">
    <Link className="auth-brand" href="/">O CLONE <b>DIGITAL</b></Link>
    <div className="auth-eyebrow">ATIVAÇÃO SEGURA</div><h1>Crie sua senha.</h1>
    <p className="auth-description">Use uma senha exclusiva com pelo menos 10 caracteres.</p>
    <form onSubmit={submit} className="auth-form">
      <label htmlFor="password">Nova senha</label><input id="password" type="password" autoComplete="new-password" minLength={10} maxLength={128} required value={password} onChange={e => setPassword(e.target.value)} />
      <label htmlFor="confirm">Confirme a senha</label><input id="confirm" type="password" autoComplete="new-password" minLength={10} maxLength={128} required value={confirm} onChange={e => setConfirm(e.target.value)} />
      {error && <p className="auth-error" role="alert">{error}</p>}
      <button className="auth-submit" disabled={busy || !token}>{busy ? "Ativando..." : "Criar senha e entrar"}</button>
    </form>
    {!token && <p className="auth-error">Link de ativação ausente. Solicite um novo na tela de login.</p>}
    <p className="auth-footnote"><Link href="/login">Voltar ao login</Link></p>
  </section></main>;
}
