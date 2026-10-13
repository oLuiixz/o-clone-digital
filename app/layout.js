import "./globals.css";
import { getCurrentMember } from "../lib/member-auth";

export const metadata = {
  title: "O Clone Digital | Da pesquisa à sua própria oferta",
  description: "Uma jornada educacional organizada para pesquisar referências, analisar ofertas, estruturar um produto próprio e preparar seu primeiro teste.",
  manifest: "/manifest.webmanifest",
  appleWebApp: { capable: true, statusBarStyle: "black-translucent", title: "Clone Digital" },
  icons: {
    icon: [{ url: "/imagens/logo-clone-digital.svg", type: "image/png" }],
    shortcut: "/imagens/logo-clone-digital.svg",
    apple: "/imagens/logo-clone-digital.svg"
  }
};

export default async function RootLayout({ children }) {
  const member = await getCurrentMember();
  return (
    <html lang="pt-BR" data-theme={member?.preferred_theme || "dark"} style={{ "--accent": member?.accent_color || "#ff3045", "--accent-dark": member?.accent_color || "#ff3045" }}>
      <body>{children}</body>
    </html>
  );
}
