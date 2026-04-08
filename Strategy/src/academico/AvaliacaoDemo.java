package academico;

/**
 * Simple demo to show Strategy usage in an academic context.
 */
public class AvaliacaoDemo {
    public static void main(String[] args) {
        double[] notas = { 7.5, 8.0, 6.0 };
        double[] pesos = { 2.0, 3.0, 1.0 };

        AvaliacaoContext contexto = new AvaliacaoContext(new MediaAritmetica());
        double notaAritmetica = contexto.calcular(notas, pesos);
        System.out.println("Nota final (aritmética): " + notaAritmetica);

        contexto.setEstrategia(new MediaPonderada());
        double notaPonderada = contexto.calcular(notas, pesos);
        System.out.println("Nota final (ponderada): " + notaPonderada);

        // If there are no weights, the weighted strategy falls back to arithmetic mean
        contexto.setEstrategia(new MediaPonderada());
        double notaSemPesos = contexto.calcular(new double[] { 9.0, 7.0 }, null);
        System.out.println("Nota final (ponderada, sem pesos -> fallback aritmética): " + notaSemPesos);
    }
}
