import "./globals.css";

export const metadata = {
  title: "O Clone Digital | Da pesquisa à sua própria oferta",
  description: "Uma jornada educacional organizada para pesquisar referências, analisar ofertas, estruturar um produto próprio e preparar seu primeiro teste.",
  manifest: "/manifest.webmanifest",
  appleWebApp: { capable: true, statusBarStyle: "black-translucent", title: "Clone Digital" },
  icons: {
    icon: [{ url: "/imagens/E900F1F7-AFCC-42AA-AA22-F92B83E84AF8.png", type: "image/png" }],
    shortcut: "/imagens/E900F1F7-AFCC-42AA-AA22-F92B83E84AF8.png",
    apple: "/imagens/E900F1F7-AFCC-42AA-AA22-F92B83E84AF8.png"
  }
};

export default function RootLayout({ children }) {
  return (
    <html lang="pt-BR">
      <body>{children}</body>
    </html>
  );
}
