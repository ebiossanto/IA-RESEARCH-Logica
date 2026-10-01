# 08 — Etapa 10: modelos finitos, provas falseáveis e vereditos (P-1 / Q1)

**Data:** 27/09/2026 · **Status:** EXECUTADO — 3.764 verificações passando (25 identificadores de teste) · **Nível:** C (dados de modelos; **não** é teorema sobre `S¹₂`/`PA`).

Depende de: `06_GEOMETRIA_CT.md` §9.4 (protocolo executado aqui), `07_CONSEQUENCIA_GLOBAL.md` §5 (trilhas 4 e 6), `paper/main.tex` §5–§6 (teoremas sob teste).
Artefatos: `src/julia/etapa10_modelos.jl` (script) · `results/etapa10_resultados.txt` (saída autoritativa, gerada pelo próprio script).

---

## 10.1 Conformidade com o protocolo (`06` §9.4)

| Registro obrigatório | Onde está |
|---|---|
| (i) definição do modelo | §10.2 abaixo + linhas `[DADO]` da saída |
| (ii) quantidade de objetos enumerados | linhas `[DADO] objetos:` (fórmulas; `2^n` entradas; pares de orçamento; limiares testados) |
| (iii) algoritmo | §10.1.1 + cabeçalho do script |
| (iv) limite de tamanho | `n ≤ 16` (65.536 entradas), `L ≤ 4`, `k_Φ ≤ 32`, orçamentos `c ≤ Rmax+2` |
| (v) resultados reprodutíveis | determinístico; seed `20260927` no modelo aleatório; comando idêntico ⇒ saída idêntica |
| (vi) **dado observado vs teorema, separados por linha** | linhas `[DADO]` e `[TEOREMA]` em seções distintas do arquivo de resultados |
| registro `(limite, ĵ, Φ)` de buscas truncadas | **busca truncada: NENHUMA** — os comprimentos `ℓ` são *dados* do modelo (não há busca de provas); registrado no rodapé da saída, com os limites de enumeração |

*Nota de desvio:* a árvore sugerida (`models/ proof_systems/ experiments/ results/ proofs/`) foi encolhida para as convenções do projeto: modelos + "proof systems" embutidos na seção `MODELOS` do script, `results/` criado de fato; `src/julia/` em vez de `experiments/`.

### 10.1.1 Algoritmo (um passo por frase)

1. **Códigos:** família livre de prefixo por alvorecer canônico; violação de Kraft (Σ `2^{−|Φ|} > 1`) é **erro explícito** (T0b).
2. **`Form_n(u)`:** primeiro código `c` com `|c| ≤ ⌊log₂ n⌋` que prefixa `u` (prefixo-livre ⇒ único); indefinido caso contrário.
3. **`J(c) = min{j < k_Φ : ℓ_j > c}`** com sentinela `k_Φ` (valores `∞` implícitos por `typemax`).
4. **Registros:** posições `j < j*` (`j*` = primeiro `ℓ_j = ∞`) com `ℓ_j > max_{i<j} ℓ_i`; `B_T(Φ)` = seus valores; `ρ` = último deles (`máx ∅ = 0`).
5. **`D_n`:** enumeração direta das `2^n` entradas contando `J_{b₁(n)} ≠ J_{b₂(n)}` — **+ spot-check com strings reais** (`Out = w_J·u₀`, sentinela `⊥` quando `J = k_Φ`): 100% das entradas para `n ∈ {4,8}`, amostra determinística de 4.096 para `n = 16`.
6. **`Γ = Σ 2^{−|Φ|}·1[B_T(Φ) ∩ (b₁(n), b₂(n)] ≠ ∅]`** — fonte independente (registros, não `J`): a igualdade `D_n = Γ` não é circular.

---

## 10.2 Modelos (registro (i))

Sistema abstrato compartilhado (equivale a D7/`def:out`/`eq:J` do núcleo): fórmula `Φ` de comprimento `ℓ` tem `k_Φ = 2^{ℓ+1}` candidatos `w_j ∈ {0,1}^{ℓ+1}`, comprimentos `ℓ_j ∈ ℕ ∪ {∞}`, `Out(u, w_j) = w_j·u₀` (injetiva — `lem:outinj`), `Out(u, ⊥) = ⊥` para `j = k_Φ`.

| Modelo | Perfil `a=(a₁..a₄)` | Regra (resumo) | Nota |
|---|---|---|---|
| `CadeiaL` | (1,1,1,2) | `B(Φ_L) = {L}`, fórmulas 4a/4b dividem o limiar 4 | cadeia `R_T(L)=L`; `m(4)=2` |
| `CadeiaL2` | (1,1,1,2) | limiares 1, 4, {6,9}, {16}/{12,16} | `R_T ≍ L²` (`1,4,9,16`); `Δ(4)=4` |
| `CadeiaExp` | (1,1,1,2) | limiares 2, 4, 8, 16 (×2) | `R_T ≍ 2^L`; `m(16)=2` |
| `Derivacao` | (1,1,1,2) | `ρ(Φ₃)=12 > ρ(Φ₄a)=2, ρ(Φ₄b)=4` | atalho/speed-up: fórmula maior estabiliza antes |
| `Env1` = `C₁` | (1,1,1,1) | toda fórmula: `B = {8}` | envelope `R_T(L)=8` ∀L; `N=1` |
| `Env2` = `C₂` | (1,1,1,1) | `B`: `{8}, {7}, {5}, {1,2,3,4,6}` | **mesmo** envelope `8`; `C_T(4)={1..8}` |
| `Bordas` | (1,1,1,2) | `j*=0` (B=∅); `B={0}` (ρ=0); `ℓ=(2,9,4,∞…)`; `j*=k` | bordas de `02` §2; **viola (P4′)** no Φ de tamanho 1 |
| `Aleatorio` | (1,1,1,2) | `j* ~ U{0..k}`, `ℓ ~ U{0..20}`, seed 20260927 | estresse cego da bateria |

---

## 10.3 Teoremas de modelo — prova construtiva + critério de falsificação

> **Regra:** cada `M.i` abaixo é *prova por construção* (nível C: dado de modelo, não teorema de provabilidade). O **critério de falsificação** diz exata e exclusivamente qual observação o derruba; todos estão codificados como IDs no script e no arquivo de resultados.

### M.1 (realização de escadas)
**Afirmação.** Toda sequência estritamente crescente finita `v₁ < … < v_s` com `s ≤ k_Φ` é `B_T(Φ)` de algum modelo.
**Prova.** Tome `ℓ = (v₁, v₂, …, v_s, v_s, …, v_s)` (`k_Φ` entradas). Posição 0 é registro (`v₁ > −1`); posição `i < s` é registro pois `v_{i+1} > max(v₁..v_i) = v_i`; posição `s`: `v_s > v_s` é falso ⇒ não-recordo, e o mesmo para as demais. Logo `B_T(Φ) = {v₁,…,v_s}`. ∎
**Falsificação.** dump `[DADO]` de qualquer modelo divergir da sequência pretendida (ex.: `CadeiaL2` `C(4)` deve ser `{1,4,6,9,12,16}` — conferido à mão e na saída).

### M.2 (par de mesmo envelope — ataque P-1 na classe de modelos)
**Afirmação.** `Env1` e `Env2` têm `R_T(L) = 8` para `L = 1..4` (iguais) mas geometrias distintas: `N(4)`: `1` vs `8` (fator 8); `Δ(4)`: `0` vs `1`; trajetória de `N`: `(1,1,1,1)` vs `(1,2,3,8)`; `Z`: `4` vs `8`.
**Prova.** Por listagem (M.1): `Env1`: `B(Φ)={8}` em toda fórmula ⇒ `C_T(L)={8}` ∀L ⇒ `N=1`, `Δ=0` (convenção D-geo-1, m=1). `Env2`: união `{8} ∪ {7} ∪ {5} ∪ {1,2,3,4,6} = {1..8}` ⇒ `N=8`, `Δ=1` (folgas todas 1). Envelope `max` = 8 nos quatro `L` em ambos. ∎
**Falsificação.** `T11-env`: se `R_T(L)` diferisse em algum `L` (5 verificações) ou se `N`/`Δ` de `L=4` coincidissem (sem separação ⇒ ataque falha).

### M.3 (mesmo `R_T`, distinta atividade — ataque Q1 na classe de modelos)
**Afirmação.** Com `R_T ≡ 8`: `λ_Env1(8) = 15/16` (todas as 4 fórmulas contêm 8: `½+¼+⅛+1/16`) e `λ` nula demais; `λ_Env2(8)=½, λ(7)=¼, λ(5)=⅛, λ(1,2,3,4,6)=1/16` cada. E `D₁₆(0,3)`: `0` vs `1/16` (`Env2`: só `Φ₄` com `B ∩ (0,3] ≠ ∅`, peso `2^{−4}`).
**Prova.** Soma direta de `λ(r) = Σ 2^{−|Φ|}·1[r ∈ B(Φ)]`; `Γ((0,3])` idem com existência. ∎
**Falsificação.** `T12-lambda` (vetores `λ` iguais ⇒ ataque falha) e `T12-D03` (`D₁₆(0,3)` idêntico ⇒ ataque falha).

### M.4 (indicador do Teorema E — refutação da versão antiga)
**Afirmação.** No modelo `Bordas`, `0 ∈ C_T(L)` ∀`L ≥ 2` e `|𝒢_n| = |C_T(L_n)∖{0}| + 1` vale (`1, 3, 5` para `n = 4, 8, 16`), enquanto a versão **não corrigida** `|𝒢_n| = |C_T| + 1` daria `2, 4, 6` e está **refutada pelos dados**.
**Prova.** `V(c) = (J_Φ(c))_Φ` é não decrescente (`lem:monotonicidade`), logo não revisitante: cada `r ∈ C`, `r ≥ 1`, troca `V` exatamente uma vez (`thm:transicoes`); `r = 0` não gera regime (não há `c = −1`). Assim `|𝒢| = 1 + |C∖{0}|`. ∎
**Falsificação.** `T6-equiv` (1.676 pares: `g^c = g^{c'} ⟺ V(c) = V(c')` com saídas strings completas) e `T6-regimes` (24 contagens).

### M.5 (bateria — 3.764 verificações)
Cada teste Txx cobre um teorema do `paper` §5/§6 com critério de refutação próprio (tabela integral em `[TEOREMA]` do arquivo de resultados). Destaques:
`T2` cobertura `D_n = Γ` (192 config: 8 modelos × 3 `n` × 8 pares, incl. orçamentos variáveis `⌊n/8⌋, ⌊n/2⌋, n`) · `T3/T4` intensidade e suporte (`r ≥ 1`, 273 cada) · `T5` estabilização exata `R^glob_n = R_T(L_n)` · `T13` atividade (positividade + limite inferior) · `T7` sandbox (`N ≤ 2^{2L+2}`, `Δ ≤ R_T`, `K ≤ min(2^{|Φ|+1}, ρ+1)`; convenção `Δ=0 ⟺ m≤1`) · `T8` `supp(μ)=C`, `N ≤ Z`, `A ≤ Ã ≤ Z`, telescópio com orçamento **variável** · `T9/T10` trajetória e perfil · `T1` cilindros (`F_enum = {|Φ| ≤ ⌊log n⌋}`, `|U| = 2^{n−|Φ|}`, Kraft).
**Falsificação.** Qualquer linha `FAIL` no stdout/exit 1 — o critério exato de cada uma está impresso ao lado do ID.

---

## 10.4 Resultados (dado observado × teorema, separados)

**[DADO] — separação P-1 (par `Env1`/`Env2`, execução de 27/09/2026 19:44):**

| L | `C(Env1)` | `R` | `N` | `Δ` | `C(Env2)` | `R` | `N` | `Δ` |
|---|---|---|---|---|---|---|---|---|
| 1 | `{8}` | 8 | 1 | 0 | `{8}` | 8 | 1 | 0 |
| 2 | `{8}` | 8 | 1 | 0 | `{7,8}` | 8 | 2 | 1 |
| 3 | `{8}` | 8 | 1 | 0 | `{5,7,8}` | 8 | 3 | 2 |
| 4 | `{8}` | 8 | 1 | 0 | `{1,…,8}` | 8 | **8** | 1 |

**[DADO] — mesmo envelope, distinta atividade (Q1):** `λ(0..8)` `Env1` = `0,0,0,0,0,0,0,0,0.9375`; `Env2` = `0,0.0625,0.0625,0.0625,0.0625,0.125,0.0625,0.25,0.5`. `D₁₆(0,3)` = `0` vs `0.0625`. (Ambos os valores conferidos à mão antes da execução.)

**[DADO] — indicador (0 ∈ `C_T`, modelo `Bordas`):** `n=4`: `|𝒢|=1` vs versão antiga `2` · `n=8`: `3` vs `4` · `n=16`: `5` vs `6` — a versão antiga do Teorema E **seria refutada em todas as três execuções**.

**[DADO] — borda registrada:** `Bordas` `L=1` tem `C = ∅` (`R = −1` é sentinela do script): fórmula com `j*=0` viola a não-vacuidade de `eq:R`/(P4′) — legítima como borda das *definições* (caso `B=∅` de `02` §2), sinalizada na própria saída.

**[TEOREMA] — bateria:** 25 identificadores, **3.764/3.764 PASS** (inclusive o modelo aleatório cego, seed registrada). Nenhuma busca truncada. Reprodução: comando único no rodapé.

---

## 10.5 Vereditos

1. **P-1: atacado, PARCIAL.** A separação "mesmo envelope, geometria distinta" **existe e foi computada** na classe de modelos (`Env1`/`Env2`: `N` difere por fator 8; `Δ` e a trajetória de `N` distintos). Honestidade do que isso é: os modelos foram *construídos* para separar — o conteúdo aqui é (a) a pipeline inteira (`D_n`, `Γ`, `λ`, regimes, estabilização) calcula coerentemente esse testemunho, (b) o teste de sand box não deixou passar erro, (c) os invariantes quantificam o quanto o envelope descarta. Para **teorias concretas** (`S¹₂` vs `PA`) P-1 permanece **ABERTO** — G.10: nenhum dos invariantes é computável ali; seria teorema de provabilidade, não simulação. **Não** anunciar P-1 como fechado.
2. **Q1: atacado, PARCIAL.** "Existem `C₁ = {R}` e `C₂ = {1..R}` com mesmo `R_T`, `λ/Γ` distintos" — **sim, realizáveis como `C_T` de modelos** (M.3, com `λ` e `D` exatos). A pergunta de Q1 sobre **teorias concretas** permanece **ABERTA** — e é justamente ela que decide se `R_T` é ou não suficiente "em geral". O par `Env1/Env2` é o testemunho canônico para quando a questão for atacada formalmente (trilha 5 do `07`: objeto enriquecido `𝔖_T`).
3. **Extensão assintótica:** o recorte executado é `L ≤ 4`; a extensão do par para todo `L` é construção trivial (repetir as fórmulas em tamanhos maiores mantendo `B ⊆ {1..8}`), mas **não foi executada** — registrada como construção, não como verificação.
4. **Proibições preservadas:** nada sobre `PA`/`S¹₂`; sem hierarquia `b₁ < b₂ ⟹ ≺` (os pares de orçamento são testados como *dados*, sem ordenar modelos); sem `rng(g^[b])`; sem `τ`; sem novidade de `b(n)`; sem `R_T ≡_T 0'`.
5. **Correção do Teorema E confirmada por refutação:** a versão sem o indicador `r ≥ 1` morre nos dados (M.4) — evidência falsável de que a correção de 27/09 era necessária, não cosmética.

## 10.6 Pendências desta linha

1. **Q1 forte / P-1 forte** (realização por teorias concretas) — abertos; não acessíveis por simulação (G.10).
2. Varredura maior (opcional): `n ∈ {17..31}` (mesmo `L=4`, mais entradas), perfis `a` maiores, `k ≥ 10` — herda `03` item "enumeração de perfis para `k` maiores".
3. ~~`02_REVISAO_CRITICA.md` §3.1/§5 espelhar este veredito (pendência `06` §9.5.5).~~ — **CONCLUÍDO (27/09/2026)**: espelho em `02` §5.0 + vereditos em §3.4/§3.5; pendência 5 da `06` §9.5 riscada.
4. `ARSENAL_FERRAMENTAS.md`: apontar `08`/`etapa10_modelos.jl`/`results/etapa10_resultados.txt`.

**Fim do documento.**
