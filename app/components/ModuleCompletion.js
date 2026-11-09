"use client";

import { useEffect, useState } from "react";

export default function ModuleCompletion({ slug }) {
  const [completed, setCompleted] = useState(false);
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState("");

  useEffect(() => {
    let active = true;
    fetch("/api/member/progress", { cache: "no-store" })
      .then(async (response) => {
        if (!response.ok) throw new Error("Não foi possível carregar seu progresso.");
        return response.json();
      })
      .then((data) => {
        if (active) setCompleted(Array.isArray(data.completed) && data.completed.includes(slug));
      })
      .catch(() => { if (active) setError("Não foi possível consultar seu progresso. Atualize a página."); })
      .finally(() => { if (active) setLoading(false); });
    return () => { active = false; };
  }, [slug]);

  async function toggleCompletion() {
    if (saving || loading) return;
    setSaving(true);
    setError("");
    try {
      const currentResponse = await fetch("/api/member/progress", { cache: "no-store" });
      if (!currentResponse.ok) throw new Error();
      const currentData = await currentResponse.json();
      const current = Array.isArray(currentData.completed) ? currentData.completed : [];
      const next = current.includes(slug)
        ? current.filter((item) => item !== slug)
        : [...current, slug];
      const saveResponse = await fetch("/api/member/progress", {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ completed: next }),
      });
      if (!saveResponse.ok) throw new Error();
      setCompleted(next.includes(slug));
    } catch {
      setError("Não foi possível salvar. Tente novamente.");
    } finally {
      setSaving(false);
    }
  }

  return (
    <section style={{ margin: "28px 0", padding: "22px", border: "1px solid var(--border, rgba(255,255,255,.12))", borderRadius: "16px", background: "var(--card, rgba(255,255,255,.03))" }}>
      <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", gap: "16px", flexWrap: "wrap" }}>
        <div>
          <strong style={{ display: "block", marginBottom: "5px" }}>Progresso deste módulo</strong>
          <span style={{ fontSize: "13px", opacity: .7 }}>{completed ? "Este módulo já está marcado como concluído." : "Marque quando terminar o conteúdo deste módulo."}</span>
        </div>
        <button
          type="button"
          onClick={toggleCompletion}
          disabled={loading || saving}
          aria-pressed={completed}
          style={{ border: 0, borderRadius: "10px", padding: "12px 18px", fontWeight: 700, cursor: loading || saving ? "wait" : "pointer", opacity: loading || saving ? .65 : 1, color: completed ? "var(--foreground, #fff)" : "#101010", background: completed ? "rgba(255,255,255,.12)" : "var(--accent, #c6ff5e)" }}
        >
          {loading ? "Carregando..." : saving ? "Salvando..." : completed ? "✓ Concluído · Desmarcar" : "Marcar como concluído"}
        </button>
      </div>
      {error && <p role="alert" style={{ color: "#ff7777", fontSize: "13px", margin: "12px 0 0" }}>{error}</p>}
    </section>
  );
}
