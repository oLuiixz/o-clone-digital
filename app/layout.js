import "./globals.css";

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

export default function RootLayout({ children }) {
  return (
    <html lang="pt-BR">
      <body>{children}</body>
    </html>
  );
}
