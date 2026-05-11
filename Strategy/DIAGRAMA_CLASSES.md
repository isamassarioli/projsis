# Diagrama de Classes - Padrão Strategy (Avaliação Acadêmica)

## 📊 Estrutura de Classes

```
┌─────────────────────────────────────────────────────────────┐
│                                                               │
│  <<interface>>                                                │
│  AvaliacaoStrategy                                            │
│  ─────────────────────────────────────────────────────────   │
│  + calcularNotaFinal(notas: double[], pesos: double[]): double
│                                                               │
└────────────────────┬────────────────────────────────────────┘
                     │
                     │ implements
        ┌────────────┴────────────┐
        │                         │
        ▼                         ▼
┌──────────────────┐    ┌──────────────────┐
│ MediaAritmetica  │    │ MediaPonderada   │
├──────────────────┤    ├──────────────────┤
│+ calcularNotaFinal()│   │+ calcularNotaFinal()
└──────────────────┘    └──────────────────┘
        ▲                         ▲
        │                         │
        │       Utilizado por     │
        └───────────┬─────────────┘
                    │
            ┌───────▼─────────┐
            │ AvaliacaoContext│
            ├─────────────────┤
            │- estrategia:    │
            │  AvaliacaoStrategy
            ├─────────────────┤
            │+ AvaliacaoContext()
            │+ setEstrategia()│
            │+ calcular()     │
            └─────────────────┘
                    ▲
                    │ Utilizado por
                    │
            ┌───────────────────┐
            │ AvaliacaoDemo     │
            ├───────────────────┤
            │+ main(String[])   │
            └───────────────────┘
```

## 🔍 Detalhamento das Classes

### 1. **AvaliacaoStrategy** (Interface)
   - **Tipo**: Interface (Strategy)
   - **Responsabilidade**: Define o contrato para calcular a nota final
   - **Métodos**:
     - `calcularNotaFinal(double[] notas, double[] pesos): double`
   
### 2. **MediaAritmetica** (Concrete Strategy 1)
   - **Tipo**: Classe Concreta
   - **Implementa**: AvaliacaoStrategy
   - **Responsabilidade**: Calcula a média aritmética simples
   - **Fórmula**: (nota1 + nota2 + ... + notaN) / N
   - **Algoritmo**: 
     - Soma todas as notas
     - Divide pela quantidade de notas

### 3. **MediaPonderada** (Concrete Strategy 2)
   - **Tipo**: Classe Concreta
   - **Implementa**: AvaliacaoStrategy
   - **Responsabilidade**: Calcula a média ponderada com fallback
   - **Fórmula**: (nota1×peso1 + nota2×peso2 + ... + notaN×pesoN) / (peso1 + peso2 + ... + pesoN)
   - **Algoritmo**:
     - Se não houver pesos, faz fallback para média aritmética
     - Caso contrário, calcula a média ponderada

### 4. **AvaliacaoContext** (Context)
   - **Tipo**: Classe Concreta
   - **Responsabilidade**: Encapsula uma estratégia e delega o cálculo
   - **Atributos**:
     - `estrategia: AvaliacaoStrategy` (composição)
   - **Métodos**:
     - `AvaliacaoContext(estrategia)`: Construtor
     - `setEstrategia(estrategia)`: Altera a estratégia em tempo de execução
     - `calcular(notas, pesos)`: Delega ao strategy

### 5. **AvaliacaoDemo** (Cliente)
   - **Tipo**: Classe Concreta
   - **Responsabilidade**: Demonstra o uso do padrão Strategy
   - **Métodos**:
     - `main(String[])`: Método de entrada

## 🔗 Relações entre Classes

| Tipo de Relação | De | Para | Descrição |
|---|---|---|---|
| **Implements** | MediaAritmetica | AvaliacaoStrategy | Implementa a interface Strategy |
| **Implements** | MediaPonderada | AvaliacaoStrategy | Implementa a interface Strategy |
| **Composition** | AvaliacaoContext | AvaliacaoStrategy | Contém uma referência ao Strategy |
| **Uses** | AvaliacaoDemo | AvaliacaoContext | Cria e utiliza o Context |
| **Uses** | AvaliacaoDemo | MediaAritmetica | Instancia o Strategy 1 |
| **Uses** | AvaliacaoDemo | MediaPonderada | Instancia o Strategy 2 |

## 📋 Fluxo de Execução

```
1. AvaliacaoDemo.main()
   ├─> cria AvaliacaoContext com MediaAritmetica
   ├─> chama contexto.calcular(notas, pesos)
   │   └─> MediaAritmetica.calcularNotaFinal()
   │       └─> retorna 71.67
   │
   ├─> troca para MediaPonderada via setEstrategia()
   ├─> chama contexto.calcular(notas, pesos)
   │   └─> MediaPonderada.calcularNotaFinal()
   │       └─> retorna 75.0
   │
   └─> troca para MediaPonderada sem pesos
       └─> MediaPonderada faz fallback para aritmética
           └─> retorna 80.0
```

## 💡 Vantagens do Padrão Strategy

✅ **Flexibilidade**: Trocar algoritmos em tempo de execução  
✅ **Extensibilidade**: Adicionar novas estratégias sem modificar código existente  
✅ **Encapsulamento**: Cada algoritmo está isolado em sua própria classe  
✅ **Testabilidade**: Fácil testar cada estratégia isoladamente  

## 🎯 Exemplo de Uso

```java
// Criar context com estratégia padrão
AvaliacaoContext contexto = new AvaliacaoContext(new MediaAritmetica());

// Calcular com primeira estratégia
double nota1 = contexto.calcular(notas, pesos);

// Trocar estratégia em tempo de execução
contexto.setEstrategia(new MediaPonderada());

// Calcular com segunda estratégia
double nota2 = contexto.calcular(notas, pesos);
```

## 📐 Padrão de Design

**Nome**: Strategy (Estratégia)  
**Categoria**: Comportamental  
**Propósito**: Definir uma família de algoritmos, encapsulá-los e torná-los intercambiáveis
