package academico;

/**
 * Concrete Strategy that calculates a weighted mean. If weights are missing or wrong size,
 * it falls back to arithmetic mean.
 */
public class MediaPonderada implements AvaliacaoStrategy {

    @Override
    public double calcularNotaFinal(double[] notas, double[] pesos) {
        if (notas == null || notas.length == 0) return 0.0;
        if (pesos == null || pesos.length != notas.length) {
            // fallback to arithmetic mean
            double soma = 0.0;
            for (double n : notas) soma += n;
            return soma / notas.length;
        }
        double somaPonderada = 0.0;
        double somaPesos = 0.0;
        for (int i = 0; i < notas.length; i++) {
            somaPonderada += notas[i] * pesos[i];
            somaPesos += pesos[i];
        }
        if (somaPesos == 0) return 0.0;
        return somaPonderada / somaPesos;
    }
}
