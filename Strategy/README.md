# Strategy pattern — exemplo acadêmico

Este projeto contém um exemplo do padrão Strategy em Java. Além do exemplo original (cálculo de imposto sobre salário), incluí um exemplo relacionado ao domínio acadêmico, conforme solicitado.

Arquivos adicionados (exemplo acadêmico):

- `src/strategy/academico/AvaliacaoStrategy.java` — interface Strategy
- `src/strategy/academico/MediaAritmetica.java` — implementação (média simples)
- `src/strategy/academico/MediaPonderada.java` — implementação (média ponderada; faz fallback para média simples se pesos faltarem)
- `src/strategy/academico/AvaliacaoContext.java` — contexto que utiliza a estratégia
- `src/strategy/academico/AvaliacaoDemo.java` — demo (classe com main)

Como rodar (Windows / PowerShell):

1. Compilar todos os fontes Java (certifique-se que `javac` está no PATH):

```powershell
javac -d build/classes src\strategy\*.java src\strategy\academico\*.java
```

2. Executar a demo acadêmica:

```powershell
java -cp build/classes strategy.academico.AvaliacaoDemo
```

Geração do ZIP para entrega:

Inclua no ZIP: todo o diretório `src`, `README.md` e o arquivo `build.xml` (se desejar). O arquivo de apresentação (slides) não foi criado aqui — adicione o arquivo da apresentação ao ZIP antes de enviar.

Observação: Se quiser, posso criar um modelo de slides (ex.: Markdown ou PowerPoint) com 4-6 slides explicando o padrão Strategy aplicado ao sistema acadêmico. Quer que eu gere isso também?
