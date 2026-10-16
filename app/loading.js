export default function Loading() {
  const letters = "Carregando".split("");

  return (
    <main className="loading-screen" role="status" aria-live="polite" aria-label="Carregando O Clone Digital">
      <div className="loading-content">
        <img className="loading-logo" src="/imagens/logo-clone-digital.svg" alt="O Clone Digital" />
        <div className="loading-loader-wrapper" aria-hidden="true">
          {letters.map((letter, index) => (
            <span className="loading-letter" key={index}>{letter}</span>
          ))}
          <div className="loading-scan" />
        </div>
        <div className="loading-caption">Preparando sua jornada</div>
      </div>
    </main>
  );
}
