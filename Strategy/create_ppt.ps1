# Create a PowerPoint presentation with slides describing the Strategy pattern
# Save as Presentation_Strategy.pptx in project root

$pp = New-Object -ComObject PowerPoint.Application
$pp.Visible = $true
$pres = $pp.Presentations.Add()

# Slide 1 - Title
$slide1 = $pres.Slides.Add(1, 1) # ppLayoutTitle
$slide1.Shapes[1].TextFrame.TextRange.Text = "Padrão Strategy - Exemplo Academico"
$slide1.Shapes[2].TextFrame.TextRange.Text = "Sistema Academico - Programacao Orientada a Objetos II`nGrupo: (coloque nomes do grupo aqui)`nEntrega: 06/05/2026"

# Slide 2 - Problema
$slide2 = $pres.Slides.Add(2, 2) # ppLayoutText
$slide2.Shapes[1].TextFrame.TextRange.Text = "Problema"
$slide2.Shapes[2].TextFrame.TextRange.Text = "No sistema academico precisamos calcular notas ou avaliacoes de formas diferentes (media aritmetica, media ponderada, regras especificas) sem alterar classes de alto nivel." 

# Slide 3 - Solucao (Strategy)
$slide3 = $pres.Slides.Add(3, 2)
$slide3.Shapes[1].TextFrame.TextRange.Text = "Solucao: Strategy"
$slide3.Shapes[2].TextFrame.TextRange.Text = "Definir uma interface (contrato) para o calculo de notas e implementar diferentes estrategias. O contexto delega o calculo a estrategia selecionada em tempo de execucao." 

# Slide 4 - Mapeamento para o sistema
$slide4 = $pres.Slides.Add(4, 2)
$slide4.Shapes[1].TextFrame.TextRange.Text = "Mapeamento no codigo"
$slide4.Shapes[2].TextFrame.TextRange.Text = "Interface: AvaliacaoStrategy`nEstrategias: MediaAritmetica, MediaPonderada`nContexto: AvaliacaoContext`nDemo: AvaliacaoDemo" 

# Slide 5 - Demonstracao e resultados
$slide5 = $pres.Slides.Add(5, 2)
$slide5.Shapes[1].TextFrame.TextRange.Text = "Demonstracao"
$slide5.Shapes[2].TextFrame.TextRange.Text = "Saida da demo:`n- Nota final (aritmetica): 7.1667`n- Nota final (ponderada): 7.5`n- Nota final (fallback): 8.0`n`nObservacoes: A estrategia pode ser trocada em tempo de execucao sem modificar o contexto." 

# Save and close
$dest = Join-Path -Path (Get-Location) -ChildPath "Presentation_Strategy.pptx"
try {
    $pres.SaveAs($dest)
    Write-Host "Saved presentation to: $dest"
} catch {
    Write-Host "Failed to save presentation: $_"
}

$pres.Close()
$pp.Quit()

# Release COM objects
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($slide1) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($slide2) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($slide3) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($slide4) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($slide5) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($pres) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($pp) | Out-Null
[GC]::Collect()
[GC]::WaitForPendingFinalizers()
