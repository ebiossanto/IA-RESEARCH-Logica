# 06 — Geometria de `C_T`: invariantes, provas elementares e o que não fecha (Etapas 9–11)

**Data:** 27/09/2026 — mesmo ciclo do Ciclo 2 (`01_ambiente` §7.6) e do Marco 1 (`paper/main.tex`). **Atualizado em 28/09/2026** (absorção da §9.6 no `paper` §6; família `I_L` fixada, §9.6.6).
**Status:** definições fechadas (A); invariantes elementares provados (B); **teoremas-alvo da Etapa 11 fechados no `paper` §6** (27/09/2026 — `thm:cobertura`, `cor:atividade`; ver P-3); **família da conjectura `Γ ≥ ε` fixada (28/09/2026, §9.6.6: `I_L = (L, L+w]`, Conj-F Nível D)**; separações P-1 e leis P-2 seguem abertas (C/D). Nenhum teorema local do núcleo é alterado.
**Depende de:** `01_NUCLEO_DURO.md` §4–§8 (definições canônicas), `01_ambiente_formal_e_codificacoes.md` §5 (estabilização), §7 + §7.6 (gadget, (P4′)/(P7a), L7.1–7.3, Cor 7.4).
**Fonte das intenções:** `logica  organização.md` Partes V–VI (Etapas 9–12); definições aqui **reescritas em forma fiel** e conferidas contra o Núcleo — divergências assinaladas com *Convenção*.
**Editorial:** este documento é o insumo técnico da §5 (stub) do `paper/main.tex`. A "possível contribuição original" restrita ao objeto espectral/geometria de `C_T` é permitida (Etapa 17 fechada 27/09/2026); a comparação Gödel 1936/Parikh/Pudlák/Buss é obrigatória no artigo e já está no Marco 1 §6.

---

## 9.0 Inventário de status (o mapa primeiro)

| Peça | Veredito | Onde |
|---|---|---|
| Definições dos invariantes (`N_T, Δ_T, D_T, A_T, K_T, m_T, Z_L, μ_{T,L}`, atividade, perfil) | **FECHADAS (A)** — com 4 convenções novas explícitas | §9.1 |
| Propriedades elementares (Lemas G.1–G.9) | **FECHADAS (B)** — provas completas | §9.2 |
| Barreira de computabilidade dos invariantes (Lema G.10) | **FECHADA (B)** — limita experimentalismo | §9.2 |
| Separação `R_{T₁} ≍ R_{T₂}` com `N`/`Δ` distintos (alvo publicável da Etapa 9) | **ATAQUE PARCIAL (27/09, Etapa 10)** — testemunho `Env1`/`Env2` na classe de modelos (mesmo `R≡8`); `T₁,T₂` concretos **seguem não-fecháveis** (G.10) | §9.3, P-1; `08` §10.5 |
| `A_T(L;b₁,b₂) ≠ 0` em infinitos `L`; densidade; expoente (Etapa 11, qs. 1–5) | **ABERTAS, exceto a q4** — q4 (desacordo) **FECHADA** 27/09/2026 p/ saídas (`paper` §6, `cor:atividade`) | §9.3, P-2 |
| Limite inferior de `|D_{b₁,b₂}(n)|` via `A_T` (2º teorema-alvo da Etapa 11) | **FECHADO (27/09/2026)** — identidade exata `D_n = Γ_{T,n}` + limite inferior via `A_T` (`paper` §6: `thm:cobertura`, `cor:atividade`) | §9.3, P-3 |
| Leis assintóticas de `Γ_T(L;I_L)` (Regimes A/B/C, conjectura `Γ ≥ ε` i.o.) e alinhamento `b(n)` ↔ `B_b(L)` | **ENUNCIADAS (27/09, §9.6)**: fixo/ninhado/positividade **fechados (B)**, saturante **fechado sob (P4′)**, alinhamento **fechado (B, Q-5 + Cor 3)**; **família da conjectura FIXADA (28/09, §9.6.6: `I_L = (L, L+w]`, Conj-F Nível D)**; classe rica (forma geral) e conteúdo de Conj-F **ABERTOS** (C/D) | §9.6 |
| Pontes: hierarquia `b₁ < b₂ ⟹ ≺`; diferença de `rng(g^[b])`; τ; novidade de `b(n)`; no-majorant; `R_T ≡_T 0'` | **PROIBIDAS** — lista permanente | §9.3, P-4 |
| `Z_L > 0` e `I_{T,Φ}` bem definida sem convenção | **CONDICIONADAS** — (P4′) e convenções D-geo-2/3 | §9.1, G.4, G.8 |

---

## 9.1 Definições (nível A)

### 9.1.1 Recapitulação canônica (Núcleo §4, §8 — sem reposição)

`I_T(Φ) := {j < j*_T(Φ) : ℓ_T(Φ,w_j) > max_{i<j} ℓ_T(Φ,w_i)}` (recorde prefixal; `max_{i<0} := −1`), `B_T(Φ) := {ℓ_T(Φ,w_j) : j ∈ I_T(Φ)}` (escada; estritamente crescente; `ρ_T(Φ) = max B_T(Φ)`, com `ρ_T(Φ) = 0` se `B_T(Φ) = ∅`), `S_T(L) := {ρ_T(Φ) : Φ` admissível, `|Φ| ≤ L}`, `C_T(L) := ⋃_{Φ admissível, |Φ|≤L} B_T(Φ)`, `R_T(L) := max S_T(L) = max C_T(L)` (quando não vazios). `k_Φ := 2^{q(Φ)} = 2^{|Φ|+1}` candidatos (D7: `q(Φ) = |Φ|+1`).

### 9.1.2 Invariantes da geometria (Etapas 9–11)

**Número de transições.** `N_T(L) := |C_T(L)|`.

**Maior lacuna.** Se `C_T(L) = {c₁ < ⋯ < c_m}`: `Δ_T(L) := max_{i<m}(c_{i+1} − c_i)`.

> **Convenção D-geo-1:** para `m ≤ 1` (ou `C_T(L) = ∅`) põe-se `Δ_T(L) := 0`. O documento de organização não fixa isto — fixado aqui para totalidade.

**Densidade truncada.** `D_T(L,R) := |C_T(L) ∩ [0,R]| / (R+1)`.

**Número de degraus por fórmula.** `K_T(Φ) := |B_T(Φ)|`.

**Contagem de limiares.** `A_T(L,r) := |{c ∈ C_T(L) : c ≤ r}|`.

**Multiplicidade.**

`m_T(L,r) := |{ (Φ,j) : Φ admissível, |Φ| ≤ L, ℓ_T(Φ,w_j) = r, j ∈ I_T(Φ) }|`.

> **Convenção D-geo-2 (divergência do original):** a definição de `logica  organização.md` §Etapa 9 não explicita "admissível"; acrescentado, pois `I_T(Φ)` só está definida para fórmulas admissíveis (D4) com `j*` bem definido (D7/D8).

**Massa total e medida espectral.** `Z_L := Σ_{Φ admiss., |Φ|≤L} Σ_{j ∈ I_T(Φ)} 1 = Σ_r m_T(L,r)`; para `Z_L > 0`:

`μ_{T,L} := (1/Z_L) · Σ_{Φ, j ∈ I_T(Φ)} δ_{ℓ_T(Φ,w_j)}`,

ou seja, `μ_{T,L}(r) = m_T(L,r)/Z_L` (δ_r = massa unitária em `r`).

**Atividade espectral de um intervalo de orçamento** (Etapa 11). Para `b₁ ≤ b₂` ponto a ponto e `L`:

`A_T(L; b₁, b₂) := |C_T(L) ∩ (b₁(2^L), b₂(2^L)]|`,

**versão com multiplicidade:** `Ã_T(L; b₁, b₂) := Σ_{r ∈ (b₁(2^L), b₂(2^L)]} m_T(L,r)`.

> **Convenção D-geo-3:** os valores `b_i(2^L)` são inteiros (arredondamento por piso registrado aqui; o documento original não o fixa).

**Perfil de instabilidade por fórmula** (Etapa 12 — preparação). `I_{T,Φ}(c) := min{j : ℓ_T(Φ,w_j) > c}`.

> **Convenção D-geo-4:** se nenhum candidato tem `ℓ > c` (todos prováveis e `c ≥ ρ_T(Φ)`), põe-se `I_{T,Φ}(c) := k_Φ` — equivalente a `ℓ_T(Φ,w_{k_Φ}) := ∞` (sentinela "fora dos candidatos") e `j*_T(Φ) := k_Φ` nesse caso. **Conferir contra D8 do Núcleo** se essa já é a convenção de `j*` lá (pendência de leitura).

**Diferença local e de imagem** (Etapas 11 e 13). `D_{b₁,b₂}(n) := {u ∈ {0,1}^n : g_T^[b₁](u) ≠ g_T^[b₂](u)}`; `R_b(n) := rng(g_T^[b]) ∩ {0,1}^{n+1}` e `E_{b₁,b₂}(n) := R_{b₁}(n) △ R_{b₂}(n)`. **Definir não é afirmar relação** — ver P-3/P-4. **Instância provada (28/09/2026, Etapa 13):** sob (P4′)(i), para `r = ℓ₀^{Φ*}` (`Φ*` = argmax de `ℓ₀` sobre as admissíveis de tamanho mínimo `m₀`), vale `E_{r−1,r}(2^{m₀}) ≠ ∅` com testemunha explícita `y` — Teorema 13.6 em `proofs/certificado_exclusividade_range_etapa13.md` (cadeia: Lemas 13.1–13.3, Teorema 13.4, Cor 13.5; achados A11–A17; **sem (P5)/(P7a)**). **A relação geral (P-4.2) segue proibida.**

---

## 9.2 O que se prova já (nível B) — Lemas G.1–G.10

**Lema G.1 (recap).** `S_T(L) ⊆ C_T(L)` e `R_T(L) = max S_T(L) = max C_T(L)`.

*Prova.* `ρ_T(Φ) = max B_T(Φ) ∈ B_T(Φ) ⊆ C_T(L)` para cada `Φ` no domínio; logo `S_T(L) ⊆ C_T(L)` e os máximos coincidem (∅ tratado pelas convenções do Núcleo §8). ∎

**Lema G.2 (monotonicidades — e a que não é).** Para `L ≤ L'`: `C_T(L) ⊆ C_T(L')`; portanto `N_T`, `R_T`, `Z_L`, `A_T(L,·)` e `A_T(L;b₁,b₂)` são **não decrescentes** em `L`. `D_T(L,·)` é não decrescente no segundo argumento. **`Δ_T` não tem monotonicidade garantida** — nem como função de `L`, nem internamente.

*Prova.* A inclusão é a de `C_T(L) = ⋃_{|Φ|≤L}` (unões crescentes); todas as demais consequências são de `|·|`/`max` sobre conjuntos crescentes e de `[0,R] ⊆ [0,R']`. Para `Δ_T`: os fenômenos `↑` e `↓` ao acrescentar um ponto já existem no nível de conjuntos (`{0,10} ↦ {0,5,10}` dá `Δ: 10 ↦ 5`; `{0,10} ↦ {0,10,30}` dá `10 ↦ 20`) — **se** tais cadeias são realizáveis como `C_T(L) ⊆ C_T(L')` é pergunta aberta (realizabilidade, Núcleo §7); logo a afirmação correta é "não garantida", e não "não-monótona para `C_T`". ∎ — *Ataque registrado:* qualquer texto que diga "`Δ_T` é crescente" está errado; qualquer texto que diga "`Δ_T` cai" também (sem exemplo real).

**Lema G.3 (multiplicidade determina o suporte exatamente).** `C_T(L) = {r : m_T(L,r) ≥ 1}`. Em particular `N_T(L) = |{r : m_T(L,r) ≥ 1}| ≤ Z_L`, com igualdade sse toda multiplicidade é `1`.

*Prova.* Por D-geo-2, `m_T(L,r) ≥ 1` ⟺ existe `Φ` admissível com `|Φ| ≤ L` e `j ∈ I_T(Φ)` com `ℓ_T(Φ,w_j) = r` ⟺ `r ∈ ⋃ B_T(Φ) = C_T(L)` (definição). Contagem distinta ≤ soma das massas (soma finita: cada `I_T(Φ)` é finito pois `⊆ {0,…,k_Φ−1}`). ∎

**Lema G.4 (massa total; positividade condicionada).** `Z_L = Σ_{|Φ|≤L} K_T(Φ)`. Além disso, **sob (P4′)** (do Ciclo 2, §7.6), `Z_L ≥ 1` para todo `L ≥ L₀` (menor tamanho admissível), logo `μ_{T,L}` está bem definida.

*Prova.* Primeira igualdade: troca de soma (contagem de pares `(Φ,j)`). Para a positividade: para `w₀ = 0^{q(Φ)}` com `q(Φ) ≥ 2`, `Cyl(w₀) = ∅` (argumento de `C2.2(a)`: `bin(0) = "0"` não tem prefixo de comprimento `≥ 2`), logo `Φ^{w₀}` é **verdadeira** e `T ⊢ Φ^{w₀}` por (P4′)(i) — mesmo raciocínio de C2.2(b), válido para **qualquer** `Φ` admissível. Logo `j*_T(Φ) ≥ 1` e, pela convenção D-geo-4, `0 ∈ I_T(Φ)` (`0` é sempre recorde, Núcleo §4.1), logo `K_T(Φ) ≥ 1` e `Z_L ≥ 1`. ∎ — **Sem (P4′), `Z_L > 0` é hipótese, não teorema** (apontado, P-5).

**Lema G.5 (limites triviais).** Para todo `Φ` admissível: `K_T(Φ) ≤ min(2^{|Φ|+1}, ρ_T(Φ)+1)`. Para todo `L`:

- `N_T(L) ≤ Z_L ≤ Σ_{|Φ|≤L} min(2^{|Φ|+1}, ρ_T(Φ)+1) ≤ min(2^{2L+2}, 𝔞_L·(R_T(L)+1))`, com `𝔞_L` = nº de fórmulas admissíveis de comprimento `≤ L` `≤ 2^{L+1}`;
- `Δ_T(L) ≤ R_T(L)` e `A_T(L,r) ≤ N_T(L) ≤ Z_L`.

*Prova.* `B_T(Φ)` é estritamente crescente e `⊆ ℕ₀` (recordes de valores `ℓ ≥ 0`), logo `|B_T(Φ)| ≤ ρ_T(Φ)+1`; e `I_T(Φ) ⊆ {0,…,k_Φ−1}`, logo `|I_T(Φ)| ≤ k_Φ = 2^{|Φ|+1}`. Soma sobre `|Φ| ≤ L`: `#strings ≤ 2^{L+1}` dá `2^{L+1}·2^{L+1} = 2^{2L+2}`; `ρ_T(Φ) ≤ R_T(L)` dá o outro. `Δ_T ≤ c_m − c₁ ≤ c_m = R_T` (D-geo-1 cobre `m≤1`). Inclusões de conjuntos dão `A_T ≤ N_T`; G.3 dá `N_T ≤ Z_L`. ∎ — **Os limites são triviais de propósito:** servem de sandbox para qualquer "crescimento exponencial" alegado em simulação.

**Lema G.6 (identidades de contagem).** Para `R, r ≥ 0` e `b₁ ≤ b₂` inteiros (D-geo-3):

1. `D_T(L,R) = A_T(L,R)/(R+1)`;
2. `A_T(L; b₁, b₂) = A_T(L, b₂(2^L)) − A_T(L, b₁(2^L))` (com a definição `A_T(L,r) = |C_T ∩ [0,r]|`).

*Prova.* (1) `|C_T ∩ [0,R]| = A_T(L,R)` por definição; divisão. (2) `(b₁(2^L), b₂(2^L)] ∩ C = ([0,b₂(2^L)] \ [0,b₁(2^L)]) ∩ C` para inteiros — subtração de cardinalidades de conjuntos finitos. ∎

**Lema G.7 (atividade, multiplicidade e medida).**

1. `Ã_T(L;b₁,b₂) = Σ_{r ∈ (b₁(2^L), b₂(2^L)]} m_T(L,r)`;
2. `A_T(L;b₁,b₂) ≤ Ã_T(L;b₁,b₂) ≤ Z_L` — a primeira com igualdade sss toda multiplicidade no intervalo é `1`;
3. **`μ_{T,L}((b₁(2^L), b₂(2^L)]) = Ã_T(L;b₁,b₂)/Z_L`** — a atividade normalizada é um intervalo de probabilidade da medida espectral.

*Prova.* (1) definição. (2) `m ≥ 1` no suporte (G.3) logo soma ≥ nº de valores distintos; e a soma total é `Z_L` (D-geo-2). (3) definição de `μ` sobre o suporte; soma de massas = soma de `m/Z_L`. ∎ — *Ataque:* a igualdade de (2) **não** vale se algum `r` do intervalo tiver multiplicidade `> 1`; por isso o "sss". Nenhuma desigualdade `Ã ≥ A` pode ser trocada por igualdade em texto.

**Lema G.8 (perfil de instabilidade: estabiliza em `j*`).** Com D-geo-4: `I_{T,Φ}` está sempre definida, é **não decrescente** em `c` (**rótulo corrigido em 28/09/2026 — achado A18**, `proofs/perfil_instabilidade_etapa12.md` §1: a prova abaixo e o `lem:monotonicidade` do `paper` dão `c ≤ c' ⇒ I(c) ≤ I(c')`; o enunciado antigo dizia "não crescente") e, na verdade, vale o **iff** do `thm:limiar-exato` do `paper`:

`I_{T,Φ}(c) = j*_T(Φ) ⟺ c ≥ ρ_T(Φ)`.

*Prova.* Definida: ou existe `j` com `ℓ_j > c` (min sobre conjunto finito não vazio) ou cai na convenção. Não decrescente: `c ≤ c'` ⇒ `{j : ℓ_j > c'} ⊆ {j : ℓ_j > c}` ⇒ o mínimo sobre o conjunto **maior** é `≤` que o mínimo sobre o menor, isto é `I(c) ≤ I(c')`. Sentido (`⇐`) do iff: para `c ≥ ρ_T(Φ)` (prova abaixo). Contrapositiva (`⇒`): se `c < ρ_T(Φ)`, então `ρ > 0` e existe recorde `j₁ < j*` com `ℓ_{j₁} = ρ > c`, logo `I(c) ≤ j₁ < j*`. Estabilização: para `j < j*`, `ℓ_j < ∞` e `ℓ_j ≤ ρ_T(Φ) ≤ c` (ρ é o máximo dos `ℓ_j` com `j < j*`), logo nenhum `j < j*` qualifica; para `j ≥ j*` (ou a sentinela `k_Φ`), `ℓ_j = ∞ > c`; o primeiro que qualifica é `j*` (ou `k_Φ`). ∎ — É exatamente "escada completamente determinada pelos recordes" do documento de organização, agora **provado**.

**Lema G.9 (`μ_{T,L}` é probabilidade sobre `C_T(L)`).** Sob D-geo-2 e `Z_L > 0`: `μ_{T,L}` é medida de probabilidade finita com `supp(μ_{T,L}) = C_T(L)`.

*Prova.* Não negatividade ✓; soma `Σ_r m_T(L,r)/Z_L = Z_L/Z_L = 1` ✓ (somas finitas: `C_T(L)` finito pois subconjunto de `⋃_{|Φ|≤L} {0,…,ρ_T(Φ)}`); suporte: `μ(r) > 0 ⟺ m_T(L,r) ≥ 1 ⟺ r ∈ C_T(L)` (G.3). ∎

**Lema G.10 (barreira: os invariantes não são todos computáveis).** Para `T ∈ {S¹₂, PA}` (ou qualquer `T` r.e. suficientemente forte):

1. a relação "`r ∈ C_T(L)`" é **Σ₁** (enumerável): `r ∈ C_T(L)` ⟺ `∃Φ ≤ L ∃j < k_Φ [ (∀i ≤ j: T ⊢ Φ^{w_i}) ∧ ℓ_j = r ∧ recordos ]` — a parte `∀i ≤ j` é conjunção finita de Σ₁, e as partes de tamanho são decidíveis **dadas** as provas (busca limitada);
2. calcular **exatamente** `N_T(L)`, `m_T(L,r)`, `Δ_T(L)` ou `μ_{T,L}` exige decidir afirmações da forma `T ⊬ φ` (não-decidível: complemento do problema de provabilidade, Σ₁-completo para `T` r.e. consistente estendendo aritmética o bastante);
3. **consequência metodológica (Etapas 10–11):** simulação algébrica nenhuma produz `j*_T(Φ)` — só `ĵ = J_{T,Φ}(c)` = "primeiro candidato com prova **acima** do limite `c` de busca" — e o sentido é o **inverso** da redação anterior (correção de 27/09/2026): `ĵ ≤ j*` sempre (por `lem:monotonicidade`/`thm:estabilizacao` de `paper/main.tex`), com igualdade **ss** `c ≥ ρ_T(Φ)`; quando a busca falha (`ĉ < ρ`) fica-se estritamente abaixo de `j*`. Todo experimento deve registrar `(limite, ĵ, Φ)`, e **dado observado ≠ teorema** (critério de validade do documento de organização, Etapa 10).

*Prova.* (1) como esboçado: dado `Φ` e `j`, as provas de `Φ^{w_i}` (`i ≤ j`) enumeram-se; existindo-as todas com comprimento `≤ r`, a verificação de `ℓ_j = r` e de "recorde" (`ℓ_j > ℓ_i` para `i < j`) é busca limitada sobre provas de comprimento `< r` (cada `ℓ_i` fica limitado acima pelas provas encontradas) — logo o conjunto dos pares `(Φ,j)` válidos é enumerável e `C_T(L)` é sua imagem por `ℓ`. (2) `N_T(L) = |{r : m_T ≥ 1}|` exige classificar, para cada `(Φ,j)` candidato a recorde, `j < j*` — i.e. `T ⊢ Φ^{w_i}` para `i ≤ j` **e** `T ⊬ Φ^{w_{j'}}` para algum `j' > j` — a segunda metade é Π₁; decidir `T ⊬ φ` arbitrário é não-decidível (para `T` consistente Σ₁-completo, `φ` ↦ `T ⊬ ¬φ`... formalmente: se um algoritmo decidisse `T ⊬ φ` decidiria `Thm(T)`, não-decidível por completude Σ₁ clássica de `Thm(PA)`/`Thm(S¹₂)`). (3) consequência direta de (2). ∎ — *Nível do argumento:* a não-decidabilidade usada é o clássico "o conjunto dos teoremas é Σ₁-completo"; **nada aqui alega grau algum de `R_T`** (proibição P-4 preservada).

---

## 9.3 O que não fecha (níveis C/D) — apontado, não certificado

**P-1 (Etapa 9 — o alvo publicável).** Demonstrar `T₁, T₂` com `R_{T₁}(L) ≍ R_{T₂}(L)` mas `N_{T₁}(L) ≁ N_{T₂}(L)` ou `Δ_{T_i}(L)` radicalmente distintos. **Não fechável aqui** por dois motivos independentes: (i) exige dois sistemas **concretos** com suas escadas calculadas — é o produto da Etapa 10; (ii) para as teorias canônicas (`S¹₂` vs `PA`) nenhum dos invariantes é sequer computável (G.10), então a prova seria um teorema sobre provabilidade, não uma simulação. *Caminho registrado:* modelos finitos estruturados (Etapa 10) para (i); se (i) só produzir "dado observado", o alvo permanece aberto e **não** pode ser anunciado como resultado. Convenção de `≍`: `f ≍ g` ⟺ `∃c,C > 0 ∀L ≥ L₀: c·f(L) ≤ g(L) ≤ C·f(L)` — registrar sempre a constante.
  ***Resultado parcial (27/09/2026, Etapa 10 — `08_ETAPA10_MODELOS.md` §10.5):*** o item (i) **entregou o testemunho**: par `Env1`/`Env2` com `R_T(L) ≡ 8` (`L = 1..4`) e geometrias distintas — `N(4)`: 1 vs 8 (fator 8), `Δ(4)`: 0 vs 1, trajetória de `N`: `(1,1,1,1)` vs `(1,2,3,8)` — verificado por enumeração (3.764 verificações, `results/etapa10_resultados.txt`). É **dado observado sobre modelos** (construídos para separar), **não** resultado sobre teorias; o item (ii) permanece **ABERTO** (G.10) e P-1 **não** pode ser anunciado como fechado.

**P-2 (Etapa 11, perguntas 1–5).** "`A_T(L;b₁,b₂) ≠ 0` para infinitos `L`?"; "densidade positiva?"; "crescimento exponencial no nº de fórmulas?"; "multiplicidade mais relevante que presença?" — **qs. 1, 2, 3 e 5 ABERTAS**. A pergunta 4 ("`A_T > 0` implica entradas distintas dos dois geradores?") foi **FECHADA afirmativamente em 27/09/2026 para saídas** (`paper` §6 `cor:atividade`, via `thm:cobertura`); para **imagens** permanece proibida (P-4.2). Só a pergunta 3 tem sandbox parcial: qualquer simulação que reporte `A_T > 2^{2L+2}` (G.5) está errada.

**P-3 (Etapa 11, teoremas-alvo) — FECHADO em 27/09/2026 (no `paper`, §6 `sec:consequencia`).** (a) Caraterização: `g_T^[b₁](u) ≠ g_T^[b₂](u)` ⟺ `B_T(Φ) ∩ (b₁(n), b₂(n)] ≠ ∅` — era o `eq:71b` local, agora somado sobre **todos** os cilindros (`thm:cobertura`); (b) identidade exata `D_n(b₁,b₂) = Γ_{T,n}((b₁(n), b₂(n)])` (`thm:cobertura`) e, para orçamentos constantes, o limite inferior `D_n ≥ A_T(L_n; b₁, b₂)/((β₂−β₁)·2^{L_n})` (`cor:atividade`), sustentado por `F_n = {Φ : |Φ| ≤ ⌊log n⌋}` **provado** (`lem:cilindros-n`). *Nota de precisão (atualizada 27/09/2026):* a forma em função de `A_T` fecha-se exatamente p/ orçamentos **constantes** e — pelo **lema Q-5, Cor 1 da §9.6.4** — p/ toda a escala log `b(n) = β(⌊log n⌋)` (incl. `[K23]` `b(n) = ⌊log n⌋`); p/ `b` genérico vale o sanducho `B_b(L_n) ≤ b(n) ≤ B_b(L_n+1)` e a forma correta usa `A^var` na janela verdadeira (§9.6.4, Cor 3). **A pendência de alinhamento está FECHADA neste documento** e **absorvida no `paper` em 28/09/2026** (`lem:transporte` + `cor:escala-log` em §5, junto de `def:geometria`; `cor:atividade-var` em §6, junto de `cor:atividade` — §9.5, item 6 riscado).

**P-4 (lista de proibições permanente).** Neste documento, no artigo e em qualquer derivado **não se afirma**:

1. hierarquia `b₁ < b₂ ⟹ ≺` (ordem de orçamentos não é ordem espectral provada);
2. diferença de `rng(g^[b])` a partir de diferença de saídas (Etapa 13 é a ponte, aberta);
3. ponte com `τ` (fórmulas τ / pseudo-surjetividade — fora do núcleo fechado);
4. novidade de `b(n)`;
5. qualquer "no-majorant"/maiorante ausente;
6. `R_T ≡_T 0'` (qualquer grau de `R_T` só sob hipóteses visíveis e nível C, como em `01_ambiente` §7.6 C2.6);
7. `A_T > 0 ⟹ imagens distintas` (`rng(g^[b₁]) ≠ rng(g^[b₂])`) — **segue proibida**. A parte de **saídas** foi **levantada em 27/09/2026** (`paper` §6: `cor:atividade` dá `A_T(L_n; b₁, b₂) > 0 ⟺ D_n > 0` p/ orçamentos constantes; p/ quaisquer `b₁ ≤ b₂`, `thm:cobertura` identifica `D_n > 0` com o cruzamento de intervalo).

**P-5 (condições assinaladas, não teoremas).** `Z_L > 0` ⟸ (P4′) (G.4); `I_{T,Φ}` total ⟸ D-geo-4; `Δ_T` total ⟸ D-geo-1; `m_T` bem definida ⟸ D-geo-2. Cada uma delas, se cair, derruba `μ_{T,L}` ou o perfil — **não** os teoremas locais do núcleo (§5–§7 do Núcleo permanecem intactos).

---

## 9.4 Protocolo das Etapas 10–11 (metodologia; nível C — não é teorema)

**Modelos candidatos (Etapa 10).** Sistemas em cadeia com `R(L) ∈ {L, L², 2^L}`; árvores de derivação; atalhos de prova; históricos de computação; dois sistemas com mesmo envelope e distribuições internas diferentes; speed-up controlado. Para cada um: `B_T(Φ)`, `C_T(L)`, `R_T(L)`, `N_T(L)`, `Δ_T(L)`, `D_T(L,R)` — **e** `m_T`, `Z_L`, `μ_{T,L}` (gratuitos a partir das escadas).

**Critério de validade (obrigatório, por experimento).** (i) definição do modelo; (ii) quantidade de objetos enumerados; (iii) algoritmo; (iv) limite de tamanho; (v) resultados reprodutíveis (script versionado); (vi) **dado observado vs teorema, separados por linha** — e, por G.10(iii), o registro `(limite, ĵ, Φ)` de toda busca truncada. Saída esperada: repositório `models/ proof_systems/ experiments/ results/ proofs/` (conforme documento de organização).

**Limite duro de qualquer simulação.** `N_T ≤ 2^{2L+2}` (G.5); `μ` só para `Z_L > 0` (G.4); `Δ_T` reportado **com** a cadeia de conjuntos que o produziu (senão a leitura "monotonia" é ilusória, G.2).

**Ponte com o artigo.** O que é teorema aqui (G.1–G.10) **entrou no `paper` §5** (27/09/2026: `def:geometria`, `lem:lattice`, `lem:mult-suporte`, `lem:massa`, `prop:limites`, `lem:identidades`, `lem:atividade`, `lem:barreira`, `rem:abertas-geom`); a consequência global dos geradores (desacordo, regimes, estabilização) entrou na **§6 `sec:consequencia`** (`thm:cobertura`, `cor:suporte-dinamico`, `cor:atividade`, `thm:estab-global`, `thm:regimes`). P-1 e P-2 (qs. 1–3, 5) entram como **questões abertas** com as proibições visíveis; P-3 saiu daqui para a §6. Revisão de `02_REVISAO_CRITICA.md` §5 deve espelhar este inventário.

**Execução (27/09/2026) — Etapa 10.** O protocolo acima foi executado integralmente: `src/julia/etapa10_modelos.jl` (8 modelos — cadeias `R ∈ {L, L², 2^L}`, derivação com atalho/speed-up, par de mesmo envelope `Env1`/`Env2`, bordas `j*=0`/`ρ=0`/`ℓ` não-monótono/`j*=k`, aleatório cego com seed 20260927), saída `results/etapa10_resultados.txt` com `(i)–(vi)` e busca truncada = nenhuma. Bateria: **3.764 verificações passando**, cobrindo `lem:cilindros-n`, `thm:cobertura` (+ spot-check de strings), `cor:intensidade`, `cor:suporte-dinamico`, `thm:estab-global`, `thm:regimes` (com refutação da versão sem o indicador `r ≥ 1`), `prop:limites`, `lem:mult-suporte`, `lem:identidades`, `lem:atividade`, `rem:trajetoria`, `rem:perfil-global`. Alvos: P-1 e Q1 **atacados parcialmente** (veredito em `08_ETAPA10_MODELOS.md` §10.5); desvio registrado: árvore `models/ experiments/` encolhida para as convenções do projeto (script + `results/`).

---

## 9.5 Pendências abertas por este documento

1. ~~Conferir D-geo-4/D-geo-2~~ — **RESOLVIDA (27/09/2026)**: D-geo-4 é exatamente a convenção de `eq:J` do núcleo (registrado no `paper` §5, `def:geometria`); D-geo-2 mantida como convenção explícita.
2. ~~Enunciar o teorema-alvo (a) da Etapa 11 (P-3)~~ — **FECHADO**: `eq:71b` + `thm:cobertura` no `paper` §6 (ver P-3 acima).
3. ~~Executar Etapa 10 (modelos)~~ — **EXECUTADA (27/09/2026)**: `src/julia/etapa10_modelos.jl` + `results/etapa10_resultados.txt` (3.764 verificações) + veredito em `08_ETAPA10_MODELOS.md`. P-1/Q1 **parcialmente** atacados (testemunhos `Env1`/`Env2`; para teorias concretas seguem abertos — G.10).
4. ~~Preencher o stub do `paper/main.tex` §5~~ — **FECHADO (27/09/2026)**: §5 escrita + §6 (`sec:consequencia`) adicionada; PDF compilando (17 pp à época; **18 pp desde 28/09/2026**, após a absorção da §9.6).
5. ~~Atualizar `02_REVISAO_CRITICA.md` §5 (itens 15–17 de `03_PRONTOS_E_A_FAZER.md` já atualizados); registrar §12 do `CONTINUIDADE_...GLOBAL.md` (certificado de exclusividade de range) como ataque da Etapa 13.~~ — **CONCLUÍDA (27/09/2026)**: `02` ganhou §3.4 (mapa pós-Ciclo 2), §3.5 (veredito das §§5–§7 do artigo), §5.0 (espelho do inventário da §9.0 deste documento) e o registro da §12 como ataque da Etapa 13 na §5.4 (com P-4.2 mantida até a ponte fechar — **ponte fechada existencialmente em 28/09/2026**, Teorema 13.6 Nível C; **P-4.2 forma geral segue mantida**); checklist §5.1–§5.4 sincronizada.
6. ~~**Absorver a §9.6 no `paper` §6** — Cor 3 (extensão de `cor:atividade` a orçamentos variáveis via `A^var`) + Lema Q-5/Cor 1 (alinamento `b(n)` ↔ `B_b(L)`, exatidão em escala log) e, depois, o enunciado Q-Asy em `rem:assintoticos`~~ — **CONCLUÍDA (28/09/2026)**: no `paper`, `lem:transporte` + `cor:escala-log` logo após `def:geometria` (§5; `eq:transporte` = sanducho `B_b(L_n) ≤ b(n) ≤ B_b(L_n+1)`, `eq:escala-log` = exatidão em escala log), `cor:atividade-var` logo após `cor:atividade` (§6; `eq:atividade-var`/`eq:atividade-var-limite` com `A^var` na janela verdadeira e largura visível `w_n ≥ 1`, + nota (a) janela verdadeira/oitava direita com o contraexemplo `b₁=n, b₂=2n, n=5` e nota (b) permissão P-4) e `rem:assintoticos` reescrito (Q-Asy: hierarquia P1/P2/P3 com só-⇒, casos (a)–(e) fechados, advertências A1/família `I_L` e A2/Kraft ⇒ regime "crescimento" vazio para `Γ`, barreira `lem:barreira` ⇒ nunca `Γ=0`). Recompilado em 28/09/2026: **18 pp** (era 17), 0 `LaTeX Warning`, 0 erro. Resta desta linha ~~**só a escolha da família `I_L`** da conjectura (`desenv..md` §22) — pré-requisito para qualquer versão falseável (§9.6.2 A1, §9.6.5)~~ — **RESOLVIDA (28/09/2026)**: família fixada em **§9.6.6** (`I_L = (L, L+w]`, `w ≥ 1`; achados de ataque A7–A10; classe rica verificada; Conj-F Nível D com critérios de refutação) e nomeada no `paper` `rem:assintoticos` item (i).
7. ~~Perfil de instabilidade `(C_T(L), 𝔍_{T,L,c})` — Etapa 12 (dependência `c = c(n)`)~~ — **PARCIALMENTE FECHADA (28/09/2026)**; cadeia completa em `proofs/perfil_instabilidade_etapa12.md` (achados **A18–A22**, Lemas 12.1–12.2, Teoremas 12.3–12.4, Propriedade 12.5). (a) **A hipótese "c fixo" nunca foi usada**: para **quaisquer** funções de orçamento `b₁ ≤ b₂` com `b₂(n) ≥ R_T(L_n)`, `D_n(b₁,b₂) = H_T(L_n, b₁(n))` (`thm:cobertura` + recordes `⊆ [0,R_T(L_n)]`, G.1) — com `b₁ = c(n)` **arbitrária**; forma geral **sem** saturação: sanducho `H_T(L_n, b₁(n)) − H_T(L_n, b₂(n)) ≤ D_n(b₁,b₂) ≤ H_T(L_n, b₁(n))`, com igualdade **nas duas** pontas **sse** `b₂(n) ≥ R_T(L_n)` (**Teorema 12.4**, nível B; `rem:perfil-global` é o caso especial `b₁ ≡ c`, `b₂ ≡ c*`). (b) Identidade `H_T(L,c) = Γ_T(L; (c,∞))` (A19) ⇒ o protocolo A5/G.10 ("nunca `H = 0`"; só cota com testemunha `(Φ, prova)`) vale para o perfil **sem nova prova**. (c) Perfil `𝔍` **definido nas duas normalizações** — contada (doc de organização) e ponderada `2^{−|Φ|}` (que é, condicionada a `F_n(U)` definida, a lei exata do índice selecionado — `lem:cilindros-n`(ii)) — com leis provadas (nível B): particão, **monotonia estocástica em `c`** (L fixo), **valor terminal para `c ≥ R_T(L)`**, e **decidibilidade** em `(L,c)` fixos (busca limitada; polinomial em `n` para `c = O(log n)`, Lema 12.2) — em contraste, `H_T` só é **Σ₁** (sondagem: `ρ > c ⟺ T ⊢ Φ^{w_{J(c)}}`, Lema 12.1). (d) **Achados:** A18 (rótulo da monotonicidade em G.8 estava invertido — **corrigido neste documento**, §9.2); A19 (identidade com `Γ` na janela-raio); A20 (**`𝔍` não determina `H`/`D_n`** — invariantes distintos, Teorema 12.3); A21 (índice `j` não é comparável entre fórmulas: `w_j` depende de `Φ`); A22 (**diagonal `(L_n, c(n))` sem monotonia em `n`** — exemplo de tabelas ℓ, caveat de realizabilidade G.2). **Segue aberto (C/D):** lei assintótica do diagonal `𝔍_{T,L_n,c(n)}` (a mesma pergunta de Q-Asy/Conj-F, §9.6); comparação entre sistemas (P-1). **Absorção no `paper` (`rem:perfil-global` estendido) e verificação computacional de `𝔍`: só sob pedido** (`paper` intocado nesta rodada).

## 9.6 Leis assintóticas de `Γ_T` e alinhamento `b(n)` ↔ `B_b(L)` (27/09/2026)

**Fontes da pergunta:** `paper` §6 `rem:assintoticos` (= `desenv..md` §8: Regimes A/B/C) e `desenv..md` §22 (conjectura `Γ ≥ ε` i.o.); confronto obrigatório com P-2 (§9.3). Protocolo: **fase de ataque antes do enunciado** (6 achados), depois os sub-casos fechados (Q-1…Q-4), depois o alinhamento (Q-5 + corolários) e o enunciado do que resta (Q-Asy); **segundo ciclo de ataque (28/09) sobre a escolha da família — 4 achados, A7–A10 — e a fixação em §9.6.6.**

### 9.6.1 Notação e hierarquia qualitativa

`Γ_T(L;I) := Σ_{Φ admissível, |Φ|≤L} 2^{−|Φ|}·1_{B_T(Φ)∩I≠∅}` (definição do `rem:assintoticos`; `0 ≤ Γ ≤ 1` por **Kraft** — código livre de prefixo, D3). Caso operacional: `L = L_n := ⌊log n⌋` e `I = (b₁(n), b₂(n)]` — aí o somatório é sobre `F_n` e `Γ_T(L_n; (b₁(n), b₂(n)]) = Γ_{T,n}` de `thm:cobertura` (`lem:cilindros-n` iguala os domínios). Famílias: `L ↦ I_L ⊆ ℕ₀` (ex.: `(b₁(L), b₂(L)]` com transporte; `(b₁(n), b₂(n)]` com `n = 2^L` ou `L = L_n`).

Três predicados qualitativos — **distintos**, hierarquia só num sentido:

- **P1:** `Γ_T(L;I_L) > 0` para infinitos `L` (positividade i.o.);
- **P2:** `limsup_L Γ_T(L;I_L) > 0`;
- **P3:** `liminf_L Γ_T(L;I_L) > 0`.

`P3 ⇒ P2 ⇒ P1`; **conversas abertas** (são parte da pergunta, não teorema). Regime B do `desenv..md` = P2; Regime A (`→ 0`) é o complemento de P2 e **compatível com P1** (A6).

### 9.6.2 Fase de ataque (6 achados)

**A1 — a família estava livre na conjectura (RESOLVIDA em §9.6.6).** `desenv..md` §22 conjectura `Γ_T(L;I_L) ≥ ε > 0` i.o. **sem fixar `I_L`**: para `I_L = ∅` é falsa trivialmente; para janela saturante é verdadeira sob (P4′) (Q-3). Sem a família, a conjectura **não é falseável** — fixá-la era obrigação prévia: **cumprida em 28/09/2026 (`I_L = (L, L+w]`, §9.6.6)**; candidatas originais em §9.6.5.

**A2 — o Regime C ("crescimento controlado") é vazio para `Γ`.** Kraft dá `Γ ≤ 1` sempre: `Γ` só converge, não "cresce". Qualquer "lei de sensibilidade" deve ser formulada sobre as versões **contadas e ilimitadas** — `A_T`, `Ã_T`, `Z_L` (sandbox G.5: `A_T ≤ N_T ≤ 2^{2L+2}`) — nunca sobre `Γ` normalizado.

**A3 — a classe de janela determina a pergunta.** Famílias **ninhadas**: `Γ_T(L;I_L)` não decrescente (mais fórmulas; indicadores só ligam) ⇒ converge e os três regimes colapsam (Q-2). Família errante com `I_L = ∅` ou sem nenhum inteiro: `Γ ≡ 0` trivial. Sem declarar a classe, "classificar `liminf/limsup`" é ambíguo.

**A4 — descasamento de janelas: transporte `B_b` vs janela verdadeira.** A definição `A_T(L;b₁,b₂)` usa `(B_{b₁}(L), B_{b₂}(L)]` (D-geo-3); `thm:cobertura` usa a **janela verdadeira** `(b₁(n), b₂(n)]`. Fora da escala log as duas famílias **não se contêm uma à outra**: com `b₁(n) = n`, `b₂(n) = 2n`, `n = 5` (`L_5 = 2`): transporte `(4,8]` vs verdadeira `(5,10]` — `5` só no transporte, `9,10` só na verdadeira. Consequência: **P-2 q1 (via `A_T` transportado) e "Γ na janela verdadeira > 0 i.o." são predicados distintos** fora da escala log; coincidem exatamente lá (Cor 1). Se as pontas divergem sobre `C_T(L_n)` **real** é pergunta de realizabilidade — mas sem alinhamento **não se pode afirmar equivalência**. A redação deve escolher a janela (a de `thm:cobertura` é a operacional).

**A5 — `Γ` herda a barreira G.10.** Por Q-4, `Γ_T(L;I) > 0 ⟺ C_T(L) ∩ I ≠ ∅` é **semi-decidível** (Σ₁, G.10(1)); valor exato ou `Γ = 0` exige `T ⊬ φ` (Π₁, G.10(2)) — para `T ∈ {S¹₂, PA}`, não-computável. Protocolo obrigatório: simulação só reporta `Γ ≥` cota com testemunho `(Φ, j, prova)`; **nunca "Γ = 0"** (espelho do critério `(limite, ĵ, Φ)` da §9.4).

**A6 — P1 é estrito a P2; "Regime A" ≠ "`A_T` eventualmente nulo".** `Γ → 0` com `Γ > 0` i.o. é logicamente possível (massa de cruzamentos em `2^{−|Φ|}` decrescente com suporte infinito). Logo os Regimes A/B do `desenv..md` **não** são as perguntas de P-2 — mapeamento em §9.6.5.

### 9.6.3 Sub-casos fechados (Q-1…Q-4)

**Q-1 (janela fixa — B).** `I` fixo: `Γ_T(L;I)` não decrescente em `L` e `≤ 1` ⇒ converge; o limite é `> 0` **sse** existe `Φ` admissível com `B_T(Φ) ∩ I ≠ ∅`.
*Prova.* `L ≤ L'`: termos antigos inalterados, novos `≥ 0`; Kraft `≤ 1`. Se `Φ₀` cruza `I`, todo `L ≥ |Φ₀|` dá `Γ ≥ 2^{−|Φ₀|} > 0`; se nenhum cruza, todo indicador `= 0`. ∎ — **Refutação:** `Φ₀` qualificado ausente da soma para `L ≥ |Φ₀|` (domínio errado — conferir admissibilidade/`F_n`) ou soma positiva sem nenhum `Φ` cruzando.

**Q-2 (janelas ninhadas — B; colapso dos regimes).** Se `I_L ⊆ I_{L'}` para `L ≤ L'`: `Γ_T(L;I_L)` não decrescente ⇒ converge, e **Regime A (`→ 0`) ⇔ `Γ_T(L;I_L) ≡ 0` ⇔ nenhuma escada cruza a família**: `∀Φ admissível: B_T(Φ) ∩ (⋃_{L ≥ |Φ|} I_L) = ∅`. Em qualquer outro caso o limite é `≥ 2^{−|Φ₀|} > 0` para algum `Φ₀`.
*Prova.* Monotonia: indicadores só ligam (ninhamento) e somas novas `≥ 0`; sequência não negativa não decrescente `→ 0` força todos os termos `= 0`. ∎ — **Refutação:** janela ninhada com `Γ` caindo em algum passo, ou `Γ ≡ 0` com `Φ₀` cruzando `⋃ I_L`.

**Q-3 (janelas saturantes — CONDICIONADA (C) a (P4′)).** Se `I_L ⊇ C_T(L)` para `L` grande (ex.: `I_L ⊇ [0, R_T(L)]`): `Γ_T(L;I_L) = κ_T(L) := Σ_{|Φ|≤L} 2^{−|Φ|} → κ_T ∈ (0,1]`. **Regime A é refutado** para esta classe sob (P4′).
*Prova.* Sob (P4′), toda `Φ` admissível tem `B_T(Φ) ≠ ∅` (G.4: `|Φ| ≥ 1` pois `Φ` contém `x` logo `q(Φ) ≥ 2`; cilindro de `w₀ = 0^{q}` vazio ⇒ `T ⊢ Φ^{w₀}` ⇒ `j* ≥ 1` ⇒ `0 ∈ I_T(Φ)` ⇒ `K_T(Φ) ≥ 1`). Com saturação, `B_T(Φ) ⊆ C_T(L) ⊆ I_L` ⇒ todo indicador `= 1` ⇒ `Γ = κ_T(L)`; Kraft dá `κ_T ≤ 1`; `κ_T > 0` pois existe `Φ` admissível. ∎ — **Refutação:** `Φ` admissível com `B_T(Φ) = ∅` sob (P4′) (derruba G.4) ou `r ∈ B_T(Φ) ∖ I_L` apesar do saturamento. **Sem (P4′):** `Γ = σ_T(L) := Σ_{Φ: B_T(Φ)≠∅} 2^{−|Φ|}` e o limite é `σ_T > 0` sse alguma escada troca — pergunta aberta (P-5).

**Q-4 (positividade exata — B; não depende de alinhamento).** `Γ_T(L;I) > 0 ⟺ C_T(L) ∩ I ≠ ∅`.
*Prova.* `⇒` soma de termos `≥ 0` positiva ⇒ existe indicador `= 1` ⇒ `B_T(Φ) ∩ I ≠ ∅ ⊆ C_T(L)`; `⇐` `r ∈ C_T(L) ∩ I` ⇒ `r ∈ B_T(Φ)` para algum `Φ` (`C_T(L) = ⋃ B_T(Φ)`, §9.1.1) ⇒ termo `≥ 2^{−|Φ|} > 0`. ∎ — **Refutação:** soma positiva com `C_T(L) ∩ I = ∅` (ou recíproco) — refuta a igualdade `C_T = ⋃B_T` ou a não-negatividade dos termos.

### 9.6.4 Alinhamento `b(n)` ↔ `B_b(L)` (fecha a pendência da P-3; nível B)

**Lema Q-5 (sanducho).** `b : ℕ → ℕ` não decrescente, `L_n := ⌊log₂ n⌋`, `B_b(L) := b(2^L)` (transporte, D-geo-3): então, para todo `n ≥ 1`,

`B_b(L_n) ≤ b(n) ≤ B_b(L_n + 1)`.

*Prova.* `2^{L_n} ≤ n < 2^{L_n+1}` (piso) + monotonia de `b`. ∎ — **Refutação:** `n` e `b` não decrescente violando qualquer desigualdade (aritmética elementar; a refutação é sobre a execução dos passos, não sobre hipóteses ocultas — `b` não decrescente é a única hipótese, visível).

**Cor 1 (exatidão na escala logarítmica).** Se `b(n) = β(⌊log n⌋)` com `β` não decrescente — casos: `b ≡ k` constante; `b(n) = ⌊log n⌋` de `[K23]`; `b(n) = ⌊log n⌋ + k` — então `b(n) = B_b(L_n)` para todo `n`: transporte **exato** e `A_T(L_n; b₁, b₂) = |C_T(L_n) ∩ (b₁(n), b₂(n)]|` — a janela de `def:geometria` coincide com a de `thm:cobertura` (é o caso em que P-2 q1 e "Γ verdadeiro > 0" são o mesmo predicado, cf. A4).
*Prova.* `B_b(L_n) = β(⌊log 2^{L_n}⌋) = β(L_n) = b(n)`; constantes: `B_b ≡ β = b(n)`. ∎

**Cor 2 (transporte de janela com uma oitava).** `(b₁(n), b₂(n)] ⊆ (B_{b₁}(L_n), B_{b₂}(L_n+1)]` (Q-5 componente a componente) ⇒ `Γ_T(L_n; (b₁(n), b₂(n)]) ≤ Γ_T(L_n; (B_{b₁}(L_n), B_{b₂}(L_n+1)])` (indicadores só ligam com janela maior). **Majorantes via `A_T` transportado valem com a oitava direita; minorantes exigem a janela verdadeira (Cor 3).**

**Cor 3 (`cor:atividade` para orçamentos variáveis — fecha a pendência da P-3).** Para `b₁ ≤ b₂` ponto a ponto com largura `w_n := b₂(n) − b₁(n) ≥ 1` (hipótese visível), com `D_n(b₁,b₂) := |D_{b₁,b₂}(n)|/2^n` (densidade) e `A^var_T(L; b₁, b₂) := |C_T(L) ∩ (b₁(n), b₂(n)]|` (avaliação na **janela verdadeira**):

`D_n(b₁,b₂) = Γ_T(L_n; (b₁(n), b₂(n)]) ≥ A^var_T(L_n; b₁, b₂) / (w_n · 2^{L_n})`.

Para constantes `β₁ < β₂` — e, por Cor 1, para toda escala log — `A^var = A_T(L_n; b₁, b₂)`: é **exatamente** a forma do `cor:atividade`; para `b` genérico, `A^var` é a reavaliação correta (o transporte doc. fica limitado por Cor 2).
*Prova.* Igualdade: `thm:cobertura`. Seja `S := {Φ ∈ F_n : B_T(Φ) ∩ (b₁(n), b₂(n)] ≠ ∅}`; então `Γ = Σ_{Φ∈S} 2^{−|Φ|} ≥ |S|·2^{−L_n}` (cada `|Φ| ≤ L_n`). E `A^var = |⋃_{Φ∈S} (B_T(Φ) ∩ W)| ≤ Σ_{Φ∈S} |B_T(Φ) ∩ W| ≤ |S|·w_n`, pois `W = (b₁(n), b₂(n)]` contém no máximo `w_n` inteiros e toda `r ∈ C_T(L_n) ∩ W` pertence a algum `Φ ∈ S`. Logo `|S| ≥ A^var/w_n` e `Γ ≥ A^var/(w_n·2^{L_n})`. ∎ — **Refutação:** exemplo numérico com `D_n < A^var/(w_n·2^{L_n})`; `w_n = 0` torna a forma inaplicável (não usar).

**Cor 4 (nota de permissão).** Nada aqui afirma hierarquia `b₁ < b₂ ⟹ ≺` (**P-4.1 intacta**): usa-se só monotonia de `b` como função `ℕ → ℕ` (hipótese visível de Q-5) e `thm:cobertura`; `A^var` é um **dado**, não ordem espectral.

### 9.6.5 Q-Asy: o que resta enunciado (níveis C/D)

**Enunciado (a pergunta).** Fixada uma classe de janelas **rica** — não ninhada (senão Q-2), não saturante (senão Q-3), com `I_L ≠ ∅` e largura `w_L` controlada (senão A3) — classificar `liminf/limsup_L Γ_T(L;I_L)` (Regimes A/B do `desenv..md` §8), e formular as "leis de sensibilidade" **só** sobre `A_T`/`Ã_T`/`Z_L` (A2). Buscar condições sobre `T` e `I_L` que separem os regimes; sandbox de modelos: `Env1`/`Env2` com `L ≤ 4` (extensão assintótica registrada como construção **não executada**, `08` §10.3) — qualquer computação nova só sob pedido.

**Confronto com P-2 (§9.3).**
- q1 (`A_T ≠ 0` em infinitos `L`) ↔ **P1**; exatamente "`Γ > 0` i.o." pela Q-4 **se** a janela for a verdadeira ou a família for de escala log (Cor 1) — fora disso, ver A4;
- q2 ("densidade positiva") é **mais forte** que P2 (densidade de `L` vs `limsup > 0`) — não confundir; ambas abertas;
- q3/q5 são sobre versões **contadas** (`Ã`, nº de fórmulas) — sandbox G.5 (`≤ 2^{2L+2}`) permanece o teste, e ficam fora de `Γ` (A2).

**Conjectura registrada (`desenv..md` §22) — família OBRIGATÓRIA (A1).** `Γ_T(L;I_L) ≥ ε > 0` i.o. **Família FIXADA em 28/09/2026 (§9.6.6): `I_L = (L, L+w]`, `w ≥ 1`** — fecha as candidatas (i) (`c_L = L`) e (ii) (oitava de largura `w` na escala log: `b₁ = ⌊log n⌋`, `b₂ = ⌊log n⌋ + w`; transporte = verdadeira por Cor 1); a conjectura concreta chama-se **Conj-F** (Nível D, §9.6.6, com achados A7–A10 e critérios de refutação). Candidata (iii) topo `(R_T(L) − w, R_T(L)]` **rejeitada** como fixa (A8: positividade trivial por Q-4 + `R_T` não computável, G.10) e registrada como variante C/D; âncoras `c_L` com `c_L/L → ∞` dão conteúdo mais forte (A9). Saturante já é Q-3 (teorema condicionado). As implicações do desenv (§§22–23: `Γ grande ⟹ dureza?`; `gerador difícil ⟹ Γ não trivial?`; `espectro → densidade de desacordo`) entram como **perguntas C/D**, nenhuma afirmada — a consequência §22 ("desacordo em fração não desprezível") é **teorema** por `thm:cobertura` (igualdade), o aberto é a antecedente.

**Mapa/níveis.** Fechados (B): **Q-1, Q-2, Q-4, Q-5 + Cors 1–4**; **família da conjectura FIXADA (28/09/2026, §9.6.6: `I_L = (L, L+w]`, classe rica verificada, A7–A10)**. Fechado condicionado (C a (P4′)): **Q-3** (+ não-saturação da família fixa, A10). **Abertas:** Q-Asy na classe rica (forma geral); **conteúdo de Conj-F** (Nível D — `Γ ≥ ε` i.o. para a família fixa; implica `R_T(L) ≥ L+1` i.o., A7); P-2 q2/q3/q5. Não-computabilidade de `Γ` (A5) herdada de G.10. P-4 intacta (Cor 4). **Absorção no `paper` §6: CONCLUÍDA (28/09/2026)** — o Cor 3 virou `cor:atividade-var` (§6, junto de `cor:atividade`, com `A^var` na janela verdadeira) e Q-5/Cor 1 viraram `lem:transporte`/`cor:escala-log` (§5, junto de `def:geometria`, alinhando `def:geometria` a `thm:cobertura`); Q-Asy enunciado em `rem:assintoticos` (§9.5, item 6 riscado; PDF 18 pp) e a família nomeada lá em 28/09. **Nada disto altera os teoremas locais — o núcleo permanece intacto.**

### 9.6.6 Família fixada da conjectura: `I_L = (L, L+w]` (fecha A1; 28/09/2026)

**Fase de ataque à escolha (4 achados novos, A7–A10)** — executada **antes** de fixar qualquer família, no mesmo protocolo da §9.6.2.

**A7 — `R_T` não limitada é teorema (via G.10), mas o conteúdo da família é mais forte.** Para `T` na classe de G.10: se existisse `K` com `C_T(L) ⊆ [0,K]` para todo `L`, então `N_T(L)` seria computável para todo `L`. Decidir o predicado "`j` é recorde com `ℓ_T(Φ,w_j) = r`" para `r ≤ K`, `|Φ| ≤ L`, `j < k_Φ`: para cada `i ≤ j`, a busca de provas de `Φ^{w_i}` com comprimento `≤ K` é **finita** (`Prf_T` decidível) e devolve `ℓ_i` exato se `ℓ_i ≤ K`, ou nada se `ℓ_i > K`. Se algum `i ≤ j` não achou prova: `ℓ_i > K ≥ r` torna `ℓ_j = r` não-recorde (`i < j`) ou `ℓ_j ≠ r` (`i = j`) — falso; se todos acharam: `ℓ_0,…,ℓ_j` são conhecidos, `ℓ_j = r` e `ℓ_j > max_{i<j} ℓ_i` são decisíveis, e `j < j*` fica **automático** (todos os `ℓ_i`, `i ≤ j`, finitos). Logo `C_T(L) ⊆ [0,K]` ⟹ `N_T(L)` computável para todo `L` — contra **G.10(2)**. Portanto `R_T(L) → ∞` (não decrescente, G.2). **Mas:** por Q-4, positividade da família escolhida em `L` exige `C_T(L) ∩ (L, L+w] ≠ ∅`, i.e. `R_T(L) ≥ L+1` — **Conj-F afirma crescimento linear i.o. de `R_T`**, não apenas não-limitação (nível B: só a segunda está provada). — **Refutação:** `T` da classe de G.10 com envelope limitado (derruba G.10(2) ou a computação acima); ou demonstração de `R_T(L) ≤ L` para `L` grande (derruba Conj-F).

**A8 — topo (candidata (iii)) rejeitado.** `I_L = (R_T(L) − w, R_T(L)]` com `C_T(L) ≠ ∅` contém `R_T(L) ∈ C_T(L)` ⇒ positividade **sempre** (Q-4) — só restaria o `≥ ε` uniforme; e `I_L` depende de `R_T(L)`, **não computável** (G.10): a família não é testável nem falseável por simulação (nem para localizar a janela). **Rejeitada como fixa; registrada como variante C/D.** — **Refutação:** computar `R_T(L)` para `T` da classe de G.10 (derruba G.10).

**A9 — escolha da âncora `c_L`: o conteúdo de crescimento de `R_T`.** Para `I_L = (c_L, c_L+w]` com `c_L → ∞`, toda positividade exige `R_T(L) > c_L` i.o. (Q-4): `c_L = 2^L` implicaria `R_T(L) ≥ 2^L` i.o. — aposta exponencial sem lastro e sem sandbox; `c_L = ⌊√L⌋` (dizível `b(n) = ⌊√(log n)⌋`, Cor 1 vale) daria conjectura mais fraca e menos informativa. Ancoragem escolhida: **`c_L = L`** — é o orçamento `[K23]` `b(n) = ⌊log n⌋` já canônico no projeto (Etapa 2, `cor:atividade`, `thm:cobertura`), e o conteúdo fica `R_T(L) ≥ L+1` i.o. (A7). — **Refutação:** âncora com `c_L/L → ∞` fixa conteúdo estritamente mais forte; e a aposta concreta `R_T(L) ≥ L+1` i.o. (A7) é necessária para Conj-F.

**A10 — sob (P4′) a família escolhida não satura: a saída trivial Q-3 fecha.** Fixe `Φ₀` admissível (D4) e `r₀ := min B_T(Φ₀)` (`≠ ∅` por G.4 sob (P4′)). Para `L ≥ max(|Φ₀|, r₀)`: `r₀ ∈ B_T(Φ₀) ⊆ C_T(L)` e `r₀ ≤ L` ⇒ `r₀ ∉ (L, L+w]` ⇒ `C_T(L) ⊄ I_L` — **não saturante para `L` grande**; e `I_L ∋ L+1` fecha a saída `I_L = ∅` de A1. — **Refutação:** `B_T(Φ₀) = ∅` sob (P4′) (derruba G.4) ou `r₀ > L` para `L` grande (`r₀` fixo — aritmética).

**A escolha.** Para inteiro fixo **`w ≥ 1`** (hipótese visível; `w = 0` dá `(L, L] = ∅`, fora):

`I_L := (L, L + w]`.

Leitura em orçamentos: `b₁(n) := ⌊log n⌋` (escala `[K23]`) e `b₂(n) := ⌊log n⌋ + w`; para `L = L_n` tem-se `I_{L_n} = (b₁(n), b₂(n)]` e, por Cor 1 (escala log), `B_{b_i}(L_n) = b_i(n)` — **transporte = janela verdadeira**, sem o descasamento de A4. Fecha de uma vez as candidatas (i) (com `c_L = L`) e (ii) (oitava de largura `w` na escala log) da §9.6.5; (iii) fica rejeitada (A8).

**Classe rica (Q-Asy): duas provadas, duas por construção.**
- **Não ninhada (B).** Para `L < L'`: `L + 1 ∈ I_L` (`w ≥ 1`) e `L + 1 ≤ L'` ⇒ `L + 1 ∉ I_{L'}` ⇒ `I_L ⊄ I_{L'}`; simetricamente `L' + w ∈ I_{L'} ∖ I_L`. **Q-2 não colapsa a pergunta** para esta família. — *Refutação:* `L < L'` com `I_L ⊆ I_{L'}`.
- **Não saturante (B, sob (P4′)).** A10. — *Refutação:* como em A10.
- **`I_L ≠ ∅` (B):** `L + 1 ∈ I_L` para `w ≥ 1`.
- **Largura controlada (B):** `w_L ≡ w` constante (A3).

**Conjectura Conj-F (Nível D — enunciada; NÃO é teorema).** Para `T` r.e. suficientemente forte (classe de G.10; em particular `S¹₂`, `PA`) e `w ≥ 1` fixo, existe `ε = ε(T,w) > 0` tal que, para **infinitos** `L`:

`Γ_T(L; (L, L+w]) ≥ ε`.

Equivalente no caso operacional (`L = L_n`; `lem:cilindros-n` + `thm:cobertura` + Cor 1): **os regimes `b₁(n) = ⌊log n⌋` e `b₂(n) = ⌊log n⌋ + w` desacordam em fração `≥ ε` das entradas para infinitos `n`** — `D_n(b₁,b₂) = Γ_T(L_n; I_{L_n}) ≥ ε`. A frase do `desenv..md` §22 ("implica desacordo em fração não desprezível") é **teorema** (identidade exata de `thm:cobertura`); **o aberto é só a antecedente**. Pela cadeia de A7, a positividade de Conj-F força `R_T(L) ≥ L+1` i.o. — dado **não conhecido** (não decorre de `R_T → ∞`).

**O que Conj-F NÃO afirma.** Hierarquia `b₁ < b₂ ⟹ ≺` (**P-4.1 intacta** — só contagem de desacordo); `Γ grande ⟹ dureza` e `gerador difícil ⟹ Γ não trivial` (`desenv..md` §§22–23 — **perguntas C/D**); P-2 q2/q3/q5 (q2 é mais forte que P2, §9.6.5); `ε` dependente de `L` (só `ε > 0` constante); Regime C (vazio, A2).

**Critérios de refutação de Conj-F.** (1) Provar `Γ_T(L; (L, L+w]) → 0` (Regime A) — aí não vale `∃ε` fixo; subcasos: (a) `C_T(L) ∩ (L, L+w] = ∅` para `L` grande (positividade falha; via A7, `R_T(L) ≤ L` eventualmente é suficiente — derruba até P1); (b) positividade i.o. com massa `→ 0` (A6: P1 sem P2). (2) Erro em lema usado (Q-4, `thm:cobertura`, Cor 1). **Nenhuma refutação vem de simulação:** por A5/G.10, simulação só reporta `Γ ≥` cota com testemunho `(Φ, j, prova)` — **nunca `Γ = 0`** (protocolo §9.4).

**Mapa da família.** Fixada (28/09/2026): `I_L = (L, L+w]` — Conj-F, Nível D. Variantes C/D registradas: topo (A8, não computável), âncoras `c_L ≠ L` (A9, conteúdo mais forte), janela constante (caso Q-1, trivial). Sandbox `Env1`/`Env2` (`L ≤ 4`) **não** testa Conj-F (construção assintótica não executada, `08` §10.3).

**Fim do documento.**
