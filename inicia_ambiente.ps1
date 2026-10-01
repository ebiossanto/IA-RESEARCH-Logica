# inicia_ambiente.ps1 - adiciona o arsenal ao PATH da SESSAO ATUAL (sem admin, sem setx).
# ASCII-only (sem acentos) + caminhos via $env:USERPROFILE -> imune ao bug de codepage
# (PowerShell le .ps1 sem BOM como ANSI; rotas com "e" acentuado quebrariam).
# Uso:  powershell -ExecutionPolicy Bypass -File inicia_ambiente.ps1

$raiz = $env:USERPROFILE

$dirs = @(
    (Join-Path $raiz 'tools\ngspice\Spice64\bin'),
    (Join-Path $raiz 'AppData\Local\Programs\Python\Python312'),
    (Join-Path $raiz 'AppData\Local\Programs\Python\Python312\Scripts'),
    (Join-Path $raiz 'AppData\Local\Programs\Julia-1.13.1\bin'),
    (Join-Path $raiz 'AppData\Local\Programs\MiKTeX\miktex\bin\x64'),
    'C:\Program Files\Git\cmd'
)

foreach ($d in $dirs) {
    if (Test-Path $d) {
        if ($env:PATH -notlike "*$d*") { $env:PATH = "$d;$env:PATH" }
        Write-Output "PATH OK: $d"
    } else {
        Write-Output "AUSENTE: $d"
    }
}

Write-Output ''
Write-Output '--- verificacao rapida ---'
$checagens = @(
    @('python', 'python --version'),
    @('julia',  'julia --version'),
    @('git',    'git --version'),
    @('pdflatex', 'pdflatex --version'),
    @('ngspice', 'ngspice_con --version')
)
foreach ($c in $checagens) {
    $nome = $c[0]; $cmd = $c[1]
    try {
        $saida = (Invoke-Expression $cmd 2>&1 | Select-Object -First 1)
        Write-Output ("{0,-10} -> {1}" -f $nome, $saida)
    } catch {
        Write-Output ("{0,-10} -> FALHOU" -f $nome)
    }
}
