# Arsenal de Ferramentas — Instalação, Caminhos e Validação

> **Escopo:** inventário completo das ferramentas de P&D matemático instaladas nesta máquina,
> com caminhos absolutos (o PATH do sistema **não** foi alterado — sessões novas do terminal
> ainda não veem os programas novos), comandos de verificação e armadilhas conhecidas.
>
> Atualizado em: 27/09/2026 · Sistema: Windows (usuário **sem privilégios de admin**)

---

## 1. Núcleo de computação

| Ferramenta | Versão | Caminho / invocação | Status |
|---|---|---|---|
| Python | 3.12.10 | `C:\Users\Euzébio Soares\AppData\Local\Programs\Python\Python312\python.exe` | ✅ validado |
| Julia | 1.13.1 | `C:\Users\Euzébio Soares\AppData\Local\Programs\Julia-1.13.1\bin\julia.exe` | ✅ validado |
| MiKTeX (pdflatex/BibTeX) | 25.12 | `C:\Users\Euzébio Soares\AppData\Local\Programs\MiKTeX\miktex\bin\x64\` | ✅ `main.pdf` compilado |
| Git | 2.55.0 | `C:\Program Files\Git\cmd\git.exe` | ✅ |
| GeoGebra Classic | 6.0.930 | `C:\Users\Euzébio Soares\AppData\Local\GeoGebra_6\app-6.0.9302\` | ✅ instalado |

### Pacotes Python (pip)
`sympy 1.14.0` · `scipy 1.18.1` · `matplotlib 3.11.2` · `z3-solver 5.1.0` · `statsmodels 0.15.0` ·
`pymc 6.3.2` (+ pandas, numba, arviz, xarray) · `wolframclient 1.4.0` ·
**SPICE:** `PySpice 1.5` · `PyLTSpice 6.0.1` (+ `spicelib 1.6.3`) · `pyqspice 2024.5.14` ·
**utilitários:** `py7zr 1.1.3` (extrator 7z)

> ⚠️ O pacote `ngspicepy` **não existe no PyPI** — o par correto é **PySpice + binário ngspice**
> (instalado, ver §2) ou **PyLTSpice + LTspice**.

### Pacotes Julia (Pkg, ambiente v1.13)
Lógica/verificação: `Satisfiability 0.2.0` (+ `z3_jll 4.16.0`) · `Distributions 0.25.x` ·
`StatsBase 0.34.13` · `Turing 0.49.0`
Física/simulação: `QuantumOptics 1.2.10` · `DynamicalSystems 3.7.0`
(+ ChaosTools, StochasticDiffEq, FFTW, DelayEmbeddings, ComplexityMeasures, StateSpaceSets…)

> ✅ **Validado 26/09 (carga completa):** todos os 6 pacotes carregaram — saída
> `JULIA ARSENAL VALIDADO - QuantumOptics, DynamicalSystems, Turing, Satisfiability,
> Distributions, StatsBase: todos carregaram OK` (artifact MKL ~700 MB baixado após o
> contorno `vcruntime140*.dll` de §6.3b; warnings de "stale pidfile" são cosméticos).

---

## 2. Simuladores SPICE (motor de transientes, ruído, Fourier)

| Simulador | Origem | Caminho / status |
|---|---|---|
| **ngspice-47** | SourceForge (bundle 7z) | `C:\Users\Euzébio Soares\tools\ngspice\Spice64\bin\ngspice_con.exe` — ✅ **validado** (transiente RC, 488 linhas, 0,0025 s) |
| **LTspice 26.1.1** | winget `AnalogDevices.LTspice` | ✅ instalado — `C:\Users\Euzébio Soares\AppData\Local\Programs\ADI\LTspice\LTspice.exe` |
| **QSpice** | `https://getqspice.com/InstallQSPICE.exe` | instalador baixado em `Downloads\InstallQSPICE.exe` — requer execução GUI |
| **SimulIDE 1.1.0-SR2** | direto de `simulide.com/p/fls/` (winget falhou, ver §6.9) | `C:\Users\Euzébio Soares\tools\simulide\SimulIDE_1.1.0-SR2_Win64\simulide.exe` — ✅ validado (portátil, FileVersion 1.1.0.0) |
| Falstad CircuitJS | navegador | `https://www.falstad.com/circuit/` (sem instalação) |
| PhET (Colorado) | navegador | `https://phet.colorado.edu/pt_BR/simulations/archive` (sem instalação) |

### ngspice — uso correto
```powershell
# SEMPRE via ngspice_con.exe (o ngspice.exe trava com stdio redirecionado)
& 'C:\Users\Euzébio Soares\tools\ngspice\Spice64\bin\ngspice_con.exe' -b arquivo.cir
```
- Batch mode exige linha **`.print`/`.plot`/`.fourier`** no netlist, senão:
  `no ".plot", ".print"... lines in batch mode; no simulations run!`
- O bundle **não** contém `libngspice.dll` → modo shared do PySpice indisponível;
  usar subprocess (acima) ou PyLTSpice+LTspice.

### LTspice — uso validado (PyLTSpice 6.0.1 / spicelib 1.6.3)
```python
from PyLTSpice.sim.sim_runner import SimRunner
runner = SimRunner(output_folder=r"...")          # auto-detecta ...\ADI\LTspice\LTspice.exe
runner.run("circuito.cir"); runner.wait_completion()   # método é wait_completion (sem _for_)
from spicelib.raw.raw_read import RawRead         # NÃO é rawread (underscore)
rr = RawRead("circuito.raw"); rr.get_trace_names(); rr.get_trace("V(out)").get_wave()
```
- **Validado em 26/09/2026:** LTspice `-b -Run` → rc=0, `.raw` 30.878 B + `.log`;
  SimRunner → `wait_completion()=True`; RawRead → 6 traces, 1073 pontos.
- LTspice é instalação **por-usuário**: `C:\Users\Euzébio Soares\AppData\Local\Programs\ADI\LTspice\LTspice.exe`.
- spicelib também expõe `simulators.ngspice_simulator` e `simulators.qspice_simulator`
  (prontos quando o QSpice for instalado).

---

## 3. Mecânica, campos, PDE e análise de vídeo

| Ferramenta | Origem | Status |
|---|---|---|
| **Tracker 6.3.4** (análise de vídeo) | winget `OpenSourcePhysics.Tracker` | ✅ instalado — `C:\Program Files\Tracker\` |
| **FreeFEM 4.15** (elementos finitos, PDE) | winget `FreeFem.FreeFem` | ✅ **validado** — `C:\Program Files (x86)\FreeFem++\FreeFem++.exe` |
| **OpenModelica 1.26.3** (multi-físicos / Modelica) | winget `OpenModelica.OpenModelica.Official` | ⏳ baixando (winget, §5) |

### FreeFEM — uso validado (26/09/2026)
```powershell
# Mini-teste (edp ASCII; -nw = sem janela gráfica)
& 'C:\Program Files (x86)\FreeFem++\FreeFem++.exe' -nw teste_ff.edp
# → "FREEFEM OK: 200 triangulos" + "Ok: Normal End" (compile 0.069s, exec 0.015s)
```

---

## 4. Wolfram

- **Wolfram Engine 15.0** (licença de desenvolvedor gratuita): **1º download winget morreu**
  na madrugada (processo sumiu, cache `%LOCALAPPDATA%\Temp\WinGet` limpo, nada instalado) —
  **retry pendente**, disparar após o download do OpenModelica terminar (não saturar a rede):
  `winget install --id WolframResearch.WolframEngine --exact --silent --disable-interactivity --accept-package-agreements`
- **Ativação exige Wolfram ID** (conta gratuita em wolfram.com) — passo manual do usuário.
- **Wolfram|Alpha API** (AppID gratuito ~2000 consultas/mês não-comercial): registrar em
  `developer.wolfram.com` → obter AppID → `wolframclient` já instalado.
- Uso via Python: `from wolframclient.evaluation import WolframLanguageSession`

---

## 5. Comandos de verificação

```powershell
# Arsenais Python/Julia
& 'C:\Users\Euzébio Soares\AppData\Local\Programs\Python\Python312\python.exe' -m pip list
& 'C:\Users\Euzébio Soares\AppData\Local\Programs\Julia-1.13.1\bin\julia.exe' -e 'using Pkg; Pkg.status()'

# SPICE (transiente RC de regressão)
& 'C:\Users\Euzébio Soares\tools\ngspice\Spice64\bin\ngspice_con.exe' -b <netlist.cir>

# Paper (Pilar 4) — ciclo completo, na pasta paper/ — saída esperada:
# "Output written on main.pdf (18 pages, ...)" (17 pp até 28/09/2026) + 0 LaTeX Warning
# (restam 6 Overfull \hbox preexistentes em texto antigo; 3 "a verificar" no .bib)
Set-Location 'C:\Users\Euzébio Soares\Desktop\Lógica\paper'
& 'C:\Users\Euzébio Soares\AppData\Local\Programs\MiKTeX\miktex\bin\x64\pdflatex.exe' -interaction=nonstopmode main.tex | Out-Null
& 'C:\Users\Euzébio Soares\AppData\Local\Programs\MiKTeX\miktex\bin\x64\bibtex.exe' main
& 'C:\Users\Euzébio Soares\AppData\Local\Programs\MiKTeX\miktex\bin\x64\pdflatex.exe' -interaction=nonstopmode main.tex | Out-Null
& 'C:\Users\Euzébio Soares\AppData\Local\Programs\MiKTeX\miktex\bin\x64\pdflatex.exe' -interaction=nonstopmode main.tex | Select-String 'Output written'
Set-Location 'C:\Users\Euzébio Soares\Desktop\Lógica'   # volta à raiz — os 2 comandos abaixo usam caminhos relativos

# Verificação exaustiva do espectro (raiz do projeto) — 19/19 testes;
# NÃO cobre os Teoremas A–F (§16 da fonte): reprodução disso SÓ SOB PEDIDO —
# ver docs\espectro-limiares\07_CONSEQUENCIA_GLOBAL.md §3 (item 7)
& 'C:\Users\Euzébio Soares\AppData\Local\Programs\Python\Python312\python.exe' 'src\python\verifica_espectro.py'

# Etapa 10 — modelos finitos (raiz do projeto; exit 1 se algum teste falhar;
# saída: results\etapa10_resultados.txt — ver docs\espectro-limiares\08_ETAPA10_MODELOS.md)
& 'C:\Users\Euzébio Soares\AppData\Local\Programs\Julia-1.13.1\bin\julia.exe' 'src\julia\etapa10_modelos.jl'
```

> **O que esses comandos sustentam no artigo:** os teoremas computacionais da **§5 (`sec:geometria`) e §6 (`sec:consequencia`)** — `thm:cobertura`, `thm:regimes`, `thm:estab-global`, `cor:intensidade`, `cor:suporte-dinamico`, `cor:atividade` — são submetidos à enumeração da Etapa 10 (3.764 verificações; dado que corrobora, não substitui as provas). As **correções obrigatórias** que a §6 deve manter (Teorema E com indicador `|C∖{0}|+1`, `F_n` provado, leitura probabilística, `r ≥ 1`, §16 não adotada, NP-dureza recusada) estão em `docs\espectro-limiares\07_CONSEQUENCIA_GLOBAL.md` §3 — qualquer redação futura do artigo deve revalidar contra essa lista.

Instalações ainda pendentes via winget:
```powershell
winget install --id OpenModelica.OpenModelica.Official --exact --silent --disable-interactivity
# Wolfram Engine (retry — o 1º morreu; só depois do OpenModelica, rede):
winget install --id WolframResearch.WolframEngine --exact --silent --disable-interactivity --accept-package-agreements
```
Concluídas (não repetir): `AnalogDevices.LTspice` ✅ · `OpenSourcePhysics.Tracker` ✅ ·
`FreeFem.FreeFem` ✅ · `SimulIDE.SimulIDE` ❌ → feito manualmente (§6.9).

---

## 6. Armadilhas conhecidas desta máquina (leia antes de automatizar)

1. **PATH não atualizado** — sessões abertas antes das instalações não enxergam as ferramentas
   novas; usar **caminhos absolutos** ou abrir terminal novo.
2. **Shell PowerShell remove `$`** — comandos inline com `$_` ou `$var` quebram; escrever
   arquivos `.ps1`/`.py`/`.jl` quando houver variáveis.
3. **`.bat`/`.ps1` sem BOM quebram com acentos (CP850/ANSI)** — `C:\Users\Euzébio...` vira lixo
   ao ser lido pelo cmd/PowerShell; soluções: (a) comandos **inline** no `-Command` funcionam
   (argumento Unicode), (b) em arquivos, usar rotas **ASCII** via `$env:USERPROFILE`
   (ver `inicia_ambiente.ps1` na raiz do projeto), (c) `.jl`/`.py` são UTF-8 e não têm o problema.
3b. **VC++ Redistributable ausente no System32** (`vcruntime140/msvcp140` AUSENTE nesta máquina) —
   `MKL_jll`/`IntelOpenMP_jll` (exigidos por FFTW/LinearSolve ← StochasticDiffEq ← QuantumOptics)
   falham com erro 126. **Contorno aplicado:** `vcruntime140.dll` + `vcruntime140_1.dll` copiados de
   `...\Python312\` para `...\Julia-1.13.1\bin\` (o loader busca dependentes no diretório da
   aplicação). Se aparecer erro semelhante em outra ferramenta, repetir o contorno ou instalar o
   `Microsoft.VCRedist.2015+.x64` via winget (exige clique no UAC).
4. **`ngspice.exe` trava** com stdout/stdin redirecionado → usar **`ngspice_con.exe`**.
5. **`fsutil volume diskfree`** exige admin → `Get-PSDrive C` para espaço em disco.
6. **winget concorrente**: buscas podem falhar em "atualizar origem" quando outro winget está
   instalando — usar índice cacheado (funciona) ou serializar.
7. **Julia Pkg** pode falhar em clone GitHub com DNS transitório (rede saturada) → reexecutar
   o script; o Pkg retoma do ponto parado.
8. **PySpice shared mode** indisponível sem `libngspice.dll` (§2) → subprocess ou PyLTSpice.
9. **`launchpad.net` inacessível desta rede** — winget falha no SimulIDE com
   `InternetOpenUrl() failed 0x80072efd` e `curl` estoura timeout (2× + 4×); SourceForge do
   projeto só tem versões antigas (0.3.10). **Contorno:** baixar direto do site oficial —
   o JS usa `basePath = https://simulide.com/p/fls/` + nome do arquivo, ex.:
   `curl.exe -L -o SimulIDE.zip "https://simulide.com/p/fls/SimulIDE_1.1.0-SR2_Win64.zip"`
   e extrair (`Expand-Archive`) em `tools\simulide\` (portátil, sem instalador).
