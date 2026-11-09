"use client";

import { useEffect, useState } from "react";

export default function ModuleCompletion({ slug, visible = false }) {
  const [completed, setCompleted] = useState(false);
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState("");

  useEffect(() => {
    let active = true;
    fetch("/api/member/progress", { cache: "no-store" })
      .then(async (response) => {
        const data = await response.json().catch(() => ({}));
        if (!response.ok) throw new Error(data.error || "Não foi possível carregar seu progresso.");
        return data;
      })
      .then((data) => {
        if (active) setCompleted(Array.isArray(data.completed) && data.completed.includes(slug));
      })
      .catch((cause) => { if (active) setError(cause.message || "Não foi possível consultar seu progresso."); })
      .finally(() => { if (active) setLoading(false); });
    return () => { active = false; };
  }, [slug]);

  async function toggleCompletion() {
    if (saving || loading || !visible) return;
    setSaving(true);
    setError("");
    try {
      const currentResponse = await fetch("/api/member/progress", { cache: "no-store" });
      const currentData = await currentResponse.json().catch(() => ({}));
      if (!currentResponse.ok) throw new Error(currentData.error || "Não foi possível consultar seu progresso.");
      const current = Array.isArray(currentData.completed) ? currentData.completed : [];
      const next = current.includes(slug) ? current : [...current, slug];
      const saveResponse = await fetch("/api/member/progress", {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ completed: next }),
      });
      const savedData = await saveResponse.json().catch(() => ({}));
      if (!saveResponse.ok || savedData.ok !== true) throw new Error(savedData.error || "O servidor não confirmou o salvamento.");
      setCompleted(Array.isArray(savedData.completed) && savedData.completed.includes(slug));
    } catch (cause) {
      setError(cause.message || "Não foi possível salvar. Tente novamente.");
    } finally {
      setSaving(false);
    }
  }

  if (!visible) return null;

  return (
    <section className="module-completion-card" aria-live="polite">
      <style>{`
        .module-completion-card{margin:28px 0;padding:clamp(18px,3vw,26px);border:1px solid color-mix(in srgb,var(--accent,#9bdc55) 32%,var(--line,rgba(255,255,255,.12)));border-radius:18px;background:linear-gradient(135deg,color-mix(in srgb,var(--accent,#9bdc55) 9%,var(--surface,#111)),var(--card,rgba(255,255,255,.03)));box-shadow:0 12px 34px rgba(0,0,0,.08)}
        .module-completion-top{display:flex;align-items:center;gap:14px;margin-bottom:18px}
        .module-completion-icon{display:grid;place-items:center;flex:0 0 44px;width:44px;height:44px;border-radius:14px;background:color-mix(in srgb,var(--accent,#9bdc55) 16%,transparent);color:var(--accent);font-size:21px}
        .module-completion-copy{min-width:0}.module-completion-copy strong{display:block;font-size:15px;letter-spacing:-.02em}.module-completion-copy span{display:block;margin-top:4px;color:var(--muted);font-size:12px;line-height:1.55}
        .module-completion-button{display:flex;align-items:center;justify-content:center;gap:10px;width:100%;min-height:50px;padding:13px 18px;border:1px solid var(--accent);border-radius:12px;background:var(--accent);color:#101510;font-size:13px;font-weight:800;letter-spacing:-.01em;cursor:pointer;transition:transform .18s ease,filter .18s ease,box-shadow .18s ease}
        .module-completion-button:hover:not(:disabled){transform:translateY(-1px);filter:brightness(1.04);box-shadow:0 8px 22px color-mix(in srgb,var(--accent) 25%,transparent)}
        .module-completion-button:focus-visible{outline:3px solid color-mix(in srgb,var(--accent) 48%,white);outline-offset:3px}
        .module-completion-button:disabled{opacity:.62;cursor:wait}
        .module-completion-error{margin:12px 0 0;color:#e46f6f;font-size:12px}
        @media(min-width:640px){.module-completion-button{width:auto;min-width:250px}}
      `}</style>
      <div className="module-completion-top">
        <span className="module-completion-icon" aria-hidden="true">✓</span>
        <div className="module-completion-copy">
          <strong>{completed ? "Etapa concluída" : "Você concluiu todas as aulas!"}</strong>
          <span>{completed ? "Esta etapa já está registrada no seu painel." : "Confirme a conclusão para atualizar seu progresso no painel."}</span>
        </div>
      </div>
      <button className="module-completion-button" type="button" onClick={toggleCompletion} disabled={loading || saving || completed} aria-pressed={completed}>
        {loading ? "Verificando..." : saving ? "Registrando conclusão..." : completed ? "✓ Conclusão registrada" : "Concluir módulo e atualizar painel"}
      </button>
      {error && <p className="module-completion-error" role="alert">{error}</p>}
    </section>
  );
}
