import { redirect } from "next/navigation";
import { getCurrentMember, hasActiveAccess, getDatabase } from "../../lib/member-auth";

function getYoutubeId(value) {
  const raw = String(value || "").trim();
  if (/^[a-zA-Z0-9_-]{11}$/.test(raw)) return raw;
  try {
    const url = new URL(raw);
    if (url.hostname === "youtu.be") {
      const id = url.pathname.split("/").filter(Boolean)[0];
      return /^[a-zA-Z0-9_-]{11}$/.test(id || "") ? id : "";
    }
    if (url.hostname.endsWith("youtube.com")) {
      const fromQuery = url.searchParams.get("v");
      if (/^[a-zA-Z0-9_-]{11}$/.test(fromQuery || "")) return fromQuery;
      const parts = url.pathname.split("/").filter(Boolean);
      const marker = parts.findIndex((part) => ["live", "embed", "shorts"].includes(part));
      const id = marker >= 0 ? parts[marker + 1] : "";
      return /^[a-zA-Z0-9_-]{11}$/.test(id || "") ? id : "";
    }
  } catch {}
  return "";
}

export default async function AoVivoPage({ searchParams }) {
  const member = await getCurrentMember();
  if (!member) redirect("/login?next=%2Fao-vivo");
  if (!(await hasActiveAccess(member.email))) redirect("/login?next=%2Fao-vivo");

  const params = await searchParams;
  const queryId = getYoutubeId(params?.video);
  let configuredValue = process.env.NEXT_PUBLIC_YOUTUBE_LIVE_ID || "";
  try {
    const sql = getDatabase();
    const settings = await sql`SELECT video_url FROM live_stream_settings WHERE id = true LIMIT 1`;
    if (settings[0]?.video_url) configuredValue = settings[0].video_url;
  } catch (error) {
    console.error("Live page settings unavailable", error instanceof Error ? error.message : "unknown_error");
  }
  const configuredId = getYoutubeId(configuredValue);
  const videoId = queryId || configuredId;
  const embedUrl = videoId ? `https://www.youtube-nocookie.com/embed/${videoId}?autoplay=0&rel=0` : "";

  return (
    <main style={{ minHeight: "100vh", padding: "clamp(20px, 4vw, 48px)", background: "var(--background, #0b0b0f)", color: "var(--foreground, #f4f4f5)" }}>
      <div style={{ maxWidth: 1080, margin: "0 auto" }}>
        <a href="/painel" style={{ color: "var(--accent, #ff5364)", textDecoration: "none" }}>← Voltar ao painel</a>
        <div style={{ marginTop: 32, display: "flex", alignItems: "center", gap: 10, flexWrap: "wrap" }}>
          <span style={{ display: "inline-flex", alignItems: "center", gap: 8, border: "1px solid #ef4444", borderRadius: 999, padding: "6px 12px", fontSize: 12, fontWeight: 700 }}>
            <span style={{ width: 8, height: 8, borderRadius: 99, background: videoId ? "#ef4444" : "#a1a1aa" }} />
            {videoId ? "TRANSMISSÃO" : "ÁREA AO VIVO"}
          </span>
          <span style={{ opacity: 0.7, fontSize: 13 }}>O Clone Digital</span>
        </div>
        <h1 style={{ fontSize: "clamp(32px, 5vw, 52px)", lineHeight: 1.08, margin: "18px 0 12px" }}>O Clone Ao Vivo</h1>
        <p style={{ maxWidth: 700, lineHeight: 1.7, opacity: 0.78, marginBottom: 28 }}>
          Acompanhe aulas, demonstrações e encontros ao vivo sem sair da plataforma.
        </p>
        {videoId ? (
          <section style={{ overflow: "hidden", border: "1px solid var(--border, #27272a)", borderRadius: 18, background: "#000" }}>
            <div style={{ aspectRatio: "16 / 9", width: "100%" }}>
              <iframe src={embedUrl} title="Transmissão ao vivo do O Clone Digital" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerPolicy="strict-origin-when-cross-origin" allowFullScreen style={{ width: "100%", height: "100%", border: 0 }} />
            </div>
            <div style={{ padding: 18 }}>
              <h2 style={{ margin: "0 0 8px", fontSize: 20 }}>Assista dentro da plataforma</h2>
              <p style={{ margin: 0, lineHeight: 1.6, opacity: 0.75, fontSize: 14 }}>Se a transmissão não estiver ao vivo, confira a programação do canal. A disponibilidade e a gravação dependem das configurações do YouTube.</p>
              <a href={`https://www.youtube.com/watch?v=${videoId}`} target="_blank" rel="noreferrer" style={{ display: "inline-block", marginTop: 14, color: "var(--accent, #ff5364)" }}>Abrir no YouTube ↗</a>
            </div>
          </section>
        ) : (
          <section style={{ border: "1px solid var(--border, #27272a)", borderRadius: 18, padding: "clamp(22px, 4vw, 36px)", background: "var(--card, #121216)" }}>
            <h2 style={{ marginTop: 0, fontSize: 22 }}>Próximas transmissões</h2>
            <p style={{ lineHeight: 1.7, opacity: 0.78 }}>Estamos preparando a programação das lives. O player aparecerá aqui quando a transmissão do YouTube estiver configurada.</p>
            <p style={{ fontSize: 13, opacity: 0.65, lineHeight: 1.6 }}>A administração pode configurar o link da transmissão em /admin/ao-vivo. Também é possível abrir uma transmissão específica acrescentando ?video=ID à URL.</p>
          </section>
        )}
        <div style={{ marginTop: 24, border: "1px solid var(--border, #27272a)", borderRadius: 14, padding: 18 }}>
          <h2 style={{ fontSize: 18, margin: "0 0 8px" }}>Avisos sobre a live</h2>
          <p style={{ margin: 0, lineHeight: 1.65, opacity: 0.75, fontSize: 14 }}>O chat do YouTube ainda não está incorporado nesta primeira etapa. O acesso à página é restrito a membros autenticados com acesso ativo.</p>
        </div>
      </div>
    </main>
  );
}
