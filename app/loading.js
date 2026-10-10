export default function Loading() {
  const letters = "Carregando".split("");

  return (
    <main className="loading-screen" role="status" aria-live="polite" aria-label="Carregando O Clone Digital">
      <div className="loading-content">
        <div className="loading-brand-mark" aria-hidden="true">C<span>.</span></div>
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
