import "./globals.css";
import { getCurrentMember } from "../lib/member-auth";
import ThemeSync from "./components/ThemeSync";
import GlobalAnnouncements from "./components/GlobalAnnouncements";
import PushOptInPrompt from "./components/PushOptInPrompt";

export const metadata = {
  metadataBase: new URL("https://oclonedigital.xyz"),
  title: "O Clone Digital | Comece com um plano. Avance com método.",
  description: "Pesquise referências, analise ofertas e estruture seu próprio produto com uma jornada prática e organizada.",
  openGraph: { type: "website", url: "https://oclonedigital.xyz/", siteName: "O Clone Digital", title: "O Clone Digital | Comece com um plano. Avance com método.", description: "Pesquise referências, analise ofertas e estruture seu próprio produto com uma jornada prática e organizada.", images: [{ url: "/imagens/og-clone-digital.svg", width: 1200, height: 630, alt: "O Clone Digital — Comece com um plano. Avance com método." }] },
  twitter: { card: "summary_large_image", title: "O Clone Digital | Comece com um plano. Avance com método.", description: "Pesquise referências, analise ofertas e estruture seu próprio produto com uma jornada prática e organizada.", images: ["/imagens/og-clone-digital.svg"] },
  manifest: "/manifest.webmanifest",
  appleWebApp: { capable: true, statusBarStyle: "black-translucent", title: "O Clone Digital" },
  other: { "mobile-web-app-capable": "yes" },
  icons: {
    icon: [{ url: "/imagens/logo-clone-digital.svg", type: "image/svg+xml", sizes: "any" }],
    shortcut: [{ url: "/imagens/logo-clone-digital.svg", type: "image/svg+xml" }],
    apple: [{ url: "/imagens/logo-clone-digital.svg", type: "image/svg+xml" }]
  }
};

export default async function RootLayout({ children }) {
  const member = await getCurrentMember();
  return (
    <html lang="pt-BR" data-theme={member?.preferred_theme || "dark"} style={{ "--accent": member?.accent_color || "#ff3045", "--accent-dark": member?.accent_color || "#ff3045" }}>
      <body><ThemeSync />{member ? <GlobalAnnouncements /> : null}<PushOptInPrompt />{children}</body>
    </html>
  );
}
