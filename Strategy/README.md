# Strategy Pattern

Este projeto mostra o padrao Strategy em Java com dois exemplos:

1. O exemplo original, em `src/strategy`, calcula imposto de funcionario com estrategias diferentes por cargo.
2. O exemplo academico, em `src/academico`, calcula a nota final de um aluno trocando a estrategia de avaliacao.

## O que e o Strategy

O Strategy separa o algoritmo do restante da aplicacao. Em vez de deixar a regra fixa dentro de uma classe, o contexto recebe uma estrategia e delega a execucao para ela. Assim, e possivel trocar o comportamento sem alterar o codigo principal.

## Exemplo academico

No exemplo academico, a ideia e calcular a nota final usando estrategias diferentes:

- `AvaliacaoStrategy` define o contrato.
- `MediaAritmetica` calcula a media simples.
- `MediaPonderada` calcula a media ponderada e, se nao houver pesos validos, usa a media simples como fallback.
- `AvaliacaoContext` recebe a estrategia e faz a chamada.
- `AvaliacaoDemo` mostra o uso em um `main`.

Fluxo de uso:

1. O contexto e criado com uma estrategia.
2. A estrategia pode ser trocada em tempo de execucao.
3. O contexto apenas delega o calculo, sem conhecer a regra interna.

## Exemplo original

O exemplo em `src/strategy` usa a mesma ideia para imposto de funcionario:

- `Funcionario` escolhe a estrategia de calculo conforme o cargo.
- `CalculaImposto` define o contrato.
- `CalculoImpostoQuinzeOuDez` e `CalculoImpostoVinteOuQuinze` sao estrategias concretas.
- `Strategy` e a classe com `main` que executa a demonstracao.

## Estrutura

```text
src/
	academico/
		AvaliacaoContext.java
		AvaliacaoDemo.java
		AvaliacaoStrategy.java
		MediaAritmetica.java
		MediaPonderada.java
	strategy/
		CalculaImposto.java
		CalculoImpostoQuinzeOuDez.java
		CalculoImpostoVinteOuQuinze.java
		Funcionario.java
		Strategy.java
```

## Como executar

No Windows, com `javac` e `java` disponiveis no PATH:

```powershell
javac -d build/classes src\strategy\*.java src\academico\*.java
java -cp build/classes academico.AvaliacaoDemo
```

Se quiser executar o exemplo original, troque a classe final por:

```powershell
java -cp build/classes strategy.Strategy
```

## Resumo

O ponto principal do Strategy e manter a regra variavel isolada em classes diferentes. Isso facilita manutencao, testes e extensao, porque novas regras podem ser adicionadas sem modificar o contexto.
