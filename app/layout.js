import "./globals.css";
import { getCurrentMember } from "../lib/member-auth";
import ThemeSync from "./components/ThemeSync";
import GlobalAnnouncements from "./components/GlobalAnnouncements";
import PushOptInPrompt from "./components/PushOptInPrompt";

export const metadata = {
  title: "O Clone Digital | Da pesquisa à sua própria oferta",
  description: "Uma jornada educacional organizada para pesquisar referências, analisar ofertas, estruturar um produto próprio e preparar seu primeiro teste.",
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
