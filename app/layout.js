import "./globals.css";

export const metadata = {
  title: "O Clone Digital",
  description: "Encontre. Analise. Estruture. Teste.",
};

export default function RootLayout({ children }) {
  return (
    <html lang="pt-BR">
      <body>{children}</body>
    </html>
  );
}
