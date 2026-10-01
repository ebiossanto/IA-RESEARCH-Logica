# `src/julia` — simulações de alta performance (Pilar 2B)

Scripts `.jl` para simulações pesadas e otimização numérica do projeto.

## Convenções

1. **Tipagem estrita** — anotar assinaturas (`f(x::Float64)::Float64`); evitar `Any` em laços quentes.
2. Ecossistemas permitidos: `DifferentialEquations.jl`, `LinearAlgebra`, `Statistics`, `Plots`.
3. **Exportar dados** em `*.csv` (ou `.jld2`) para validação cruzada com os scripts de `src\python\`.
4. Nenhum script deste diretório altera os teoremas locais —
   a verificação canônica continua em Python (`src\python\verifica_espectro.py`);
   os modelos da Etapa 10 verificam consequências do `paper` §5/§6 (ver abaixo).

## Scripts

| Script | Função |
|---|---|
| `etapa10_modelos.jl` | **Etapa 10 (executada em 27/09/2026).** 8 modelos finitos (cadeias `R ∈ {L, L², 2^L}`, derivação com atalho, par de mesmo envelope `Env1`/`Env2`, bordas `j*=0`/`ρ=0`/`ℓ` não-monótono/`j*=k`, aleatório cego seed 20260927) × bateria falseável de 25 testes cobrindo `lem:cilindros-n`, `thm:cobertura`, `cor:intensidade`, `cor:suporte-dinamico`, `thm:estab-global`, `thm:regimes`, `prop:limites`, `lem:mult-suporte`, `lem:identidades`, `lem:atividade`, `rem:trajetoria`, `rem:perfil-global`. Saída autoritativa em `../../results/etapa10_resultados.txt` (linhas `[DADO]`/`[TEOREMA]` separadas); exit 1 se qualquer teste falhar. Ver `docs\espectro-limiares\08_ETAPA10_MODELOS.md`. |

```powershell
& "$env:LOCALAPPDATA\Programs\Julia-1.13.1\bin\julia.exe" src\julia\etapa10_modelos.jl
```

## Candidatos a implementação (herdados de `03_PRONTOS_E_A_FAZER.md`)

- Enumeração de perfis para valores de `k` maiores que os do script Python (6, 8 → 10+).
- ~~Modelos finitos do espectro (Etapa 10): buscar dois sistemas com mesmo `R_T` e geometrias distintas.~~ — **executado** (`etapa10_modelos.jl`; testemunho `Env1`/`Env2`).
- Varredura da atividade espectral `A_T(L; b1, b2)` (Etapa 11).
