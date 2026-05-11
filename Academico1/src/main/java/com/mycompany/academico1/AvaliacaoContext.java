package academico;

/**
 * Context that holds a strategy for calculating a final grade.
 */
public class AvaliacaoContext {
    private AvaliacaoStrategy estrategia;

    public AvaliacaoContext(AvaliacaoStrategy estrategia) {
        this.estrategia = estrategia;
    }

    public void setEstrategia(AvaliacaoStrategy estrategia) {
        this.estrategia = estrategia;
    }

    public double calcular(double[] notas, double[] pesos) {
        return estrategia.calcularNotaFinal(notas, pesos);
    }
}
