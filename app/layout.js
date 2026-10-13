import "./globals.css";

export const metadata = {
  title: "O Clone Digital | Da pesquisa à sua própria oferta",
  description: "Uma jornada educacional organizada para pesquisar referências, analisar ofertas, estruturar um produto próprio e preparar seu primeiro teste."
};

export default function RootLayout({ children }) {
  return (
    <html lang="pt-BR">
      <body>{children}</body>
    </html>
  );
}
