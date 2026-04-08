package academico;

/**
 * Concrete Strategy that calculates a simple arithmetic mean.
 */
public class MediaAritmetica implements AvaliacaoStrategy {

    @Override
    public double calcularNotaFinal(double[] notas, double[] pesos) {
        if (notas == null || notas.length == 0) return 0.0;
        double soma = 0.0;
        for (double n : notas) soma += n;
        return soma / notas.length;
    }
}
