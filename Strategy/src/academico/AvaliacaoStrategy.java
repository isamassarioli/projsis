package academico;

/**
 * Strategy interface for calculating the final grade of a student.
 */
public interface AvaliacaoStrategy {
    /**
     * Calculate the final grade from an array of grades and optional weights.
     * If weights is null or empty, implementations should ignore it or treat all weights equal.
     *
     * @param notas  array of grades (values between 0 and 100)
     * @param pesos  optional array of weights, same length as notas
     * @return final grade as double
     */
    double calcularNotaFinal(double[] notas, double[] pesos);
}
