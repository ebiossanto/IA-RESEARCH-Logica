# `assets/geogebra` — visualização geométrica dinâmica (Pilar 2C)

Arquivos `.ggb` e scripts de comandos para modelar geometricamente objetos do projeto.

## Convenções

1. Preferir **sequências de comandos nativas da Barra de Entrada** do GeoGebra, para copiar/colar direto no software, ex.:

```
P_1 = (0, 0)
Sequência[(2^n, n), n, 1, 10]
```

2. Salvar o arquivo como `assets/geogebra/<objeto>.ggb`.
3. Exportar figuras para `paper/figures/` em formato vetorial (`.pdf`/`.eps`, dpi=300).

## Candidatos a visualização

- **Escadas realizáveis** `B_T` (ex.: exemplo documentado `(2, 10, 7, ∞)` → `ρ = 10`): degraus do seletor `J(c)` como função de `c`.
- **Perfil de comprimentos mínimos** `L_T(Φ) = (ℓ(w_0), …, ℓ(w_{k-1}))` em escala logarítmica.
- **Espectro `S_T(L)`** e envelope `R_T(L)` para modelos finitos (linear, quadrático, exponencial).
