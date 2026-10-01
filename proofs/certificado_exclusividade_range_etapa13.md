# Certificado espectral de exclusividade de range (Etapa 13)

**Data:** 28/09/2026 · **Executa:** `CONTINUIDADE_ESPECTRO_CONSEQUENCIA_GLOBAL.md` §12 («certificado espectral de exclusividade») · **Registro do ataque:** `02_REVISAO_CRITICA.md` §5.4 · **Trilha:** `07_CONSEQUENCIA_GLOBAL.md` §5 item 3 · **Alvo:** `E_{b₁,b₂}(n)` (`06_GEOMETRIA_CT.md` §9.5).

## Linha de estado (dado observado vs teorema)

- **DADO (nenhum):** nenhuma simulação executada nesta rodada; nenhuma busca por pares `(Φ, r)` rodada; `verifica_espectro.py` intocado.
- **TEOREMA (nível B, sem (P4′), sem (P5)):** Lemas 13.1–13.3 + Teorema 13.4 + Corolário 13.5 — a metade «diferença» da §12 é consequência imediata, e a metade «exclusividade» (`∀v`) reduz-se a uma condição **finita e decidível** sobre `T`.
- **TEOREMA CONDICIONADO (nível C, hipótese visível):** Teorema 13.6 — sob **(P4′)(i)** (esquema vazio) o certificado **existe com dados explícitos**: `E_{r−1,r}(2^{m₀}) ≠ ∅`, i.e. `rng(g_T^[r−1]) ∖ rng(g_T^[r]) ≠ ∅` para um par `(r−1, r)` construído. **A ponte «transição espectral → separação de range» fecha existencialmente.**
- **ABERTO (mantido visível):** **P-4.2 na forma geral** (`A_T > 0 ⟹ rng(g^[b₁]) ≠ rng(g^[b₂])` para *todo* par ativo, incl. `b` variável) segue **proibido** — `cor:atividade`/`cor:atividade-var` continuam cobrindo **só saídas**. Etapas 14–16 (τ) intactas.

---

## 0. Notação e hipóteses

Fixe `c ∈ ℕ` e escreva `g_T^[c] := g_T^[b≡c]` (orçamento **constante** `b(n) ≡ c`; a §12 escreve `g_T^[r−1]`, `g_T^[r]` com esse sentido). Para `|u| = n ≥ 1` com `Form_n(u) = Φ` (`01_ambiente` §5.1–5.2):

```
g_T^[c](u) = w_{J_{T,Φ}(c)}·u₀    se J_{T,Φ}(c) < k_Φ
           = 1^{q(Φ)}·¬u₀         se J_{T,Φ}(c) = k_Φ   (convenção ⊥)
           = 0^{n+1}              se Form_n(u) indefinida
```

**Símbolo selecionado.** `σ_Ψ(c) := w_{J_{T,Ψ}(c)}` se `J_{T,Ψ}(c) < k_Ψ`, e `σ_Ψ(c) := 1^{q(Ψ)}` caso contrário (o marcador `⊥`). Pela D7/Núcleo §2: `W_Φ = {0,1}^{q(Φ)} = {w_0 <_lex ⋯ < w_{k_Φ−1}}`, `q(Φ) = |Φ|+1`, `k_Φ = 2^{q(Φ)}` — logo **`w_0 = 0^{q(Φ)}`**, **`w_{k_Φ−1} = 1^{q(Φ)}`** e, em particular, `σ_Ψ(c) ∈ W_Ψ` sempre (o marcador `⊥` *é* o candidato `w_{k_Ψ−1}`).

`Adm` = fórmulas admissíveis (D4); (P1) + Lema 2.1 = unicidade do prefixo-fórmula; `⌊log⌋ = ⌊log₂⌋` (D5); `Prf_T` decidível (D8/P2), `|π|` finito por `c` (P3).

**Hipóteses por seção:** §1–§5 usam só definições Nível A, Lemas 5.1–5.3 (nível B) e (P2)/(P3). §6 (Teorema 13.6) usa **adicionalmente (P4′)(i)** — esquema vazio: `T ⊢ Ψ^{w_0}` para toda `Ψ` admissível (a peça de `06` §9.2/G.4; formalização = **F1**). **Nenhum resultado usa (P5), (P7a), (H-som) ou (T2).**

---

## 1. Lema 13.1 — o salto do seletor é exatamente a transição espectral (nível B)

**Lema.** Seja `Φ` admissível e `r ≥ 1`. Então `J_{T,Φ}(r−1) < J_{T,Φ}(r)` ⟺ `r ∈ B_T(Φ)`.

**Prova.** (⇒) `r ≥ 1` e `ℓ_j > r−1 ⟺ ℓ_j ≥ r` (valores em `ℕ₀ ∪ {∞}`), logo `J(r−1) = min{j : ℓ_j ≥ r}`. Ponha `j₁ := J(r−1)`; então `ℓ_{j₁} ≥ r`. Como `J(r) > j₁`, nenhum `j ≤ j₁` tem `ℓ_j > r`; em particular `ℓ_{j₁} ≤ r`, donde `ℓ_{j₁} = r` (finito). Minimidade de `j₁` dá `ℓ_i < r` para `i < j₁`. Se `j* ≤ j₁`, então `ℓ_{j*} = ∞ > r` e `J(r) ≤ j* ≤ j₁` — contradição; logo `j₁ < j*` e `j₁ ∈ I_T(Φ)`, i.e. `r = ℓ_{j₁} ∈ B_T(Φ)`.
(⇐) Seja `j₁ ∈ I_T(Φ)` com `ℓ_{j₁} = r`. Para `i < j₁`: `ℓ_i < r` (recorde); logo nenhum `j ≤ j₁` tem `ℓ_j > r`, donde `J(r−1) = min{j : ℓ_j ≥ r} = j₁` e `J(r) = min{j : ℓ_j > r} ≥ j₁ + 1 > j₁`. ∎

**Observação.** Para `r = 0` o lado esquerdo é `J(−1)` (indefinido); o lema é enunciado só para `r ≥ 1` — ver canto §6.1.

**R1 (refutação).** `r ∈ B_T(Φ)` com `J(r−1) ≥ J(r)`; ou `J(r−1) < J(r)` com `r ∉ B_T(Φ)` — erro num dos dois argumentos.

---

## 2. Lema 13.2 — a diferença espectral é «grátis» (nível B)

**Lema.** Seja `r ≥ 1` com `r ∈ B_T(Φ)` e `u` com `Form_n(u) = Φ` (`n ≥ 1`). Então `g_T^[r−1](u) ≠ g_T^[r](u)`.

**Prova.** Por 13.1, `j₁ := J(r−1) < J(r) =: j₂`, com `j₁ < j* ≤ k_Φ`; logo `g_T^[r−1](u) = w_{j₁}·u₀`. Se `j₂ < k_Φ`: `g_T^[r](u) = w_{j₂}·u₀` e `w_{j₂} ≠ w_{j₁}` (candidatos distintos, mesma cauda) — Lema 5.3(1). Se `j₂ = k_Φ`: `g_T^[r](u) = 1^{q}·¬u₀ ≠ w_{j₁}·u₀` — Lema 5.3(2). ∎

**Leitura (dado vs conteúdo).** A metade «diferença» da §12 é consequência imediata de 13.1 + Lema 5.3. **O conteúdo exclusivo da Etapa 13 é `∀v: g_T^[r](v) ≠ y`** — tratado em §3–§6.

---

## 3. Lema 13.3 — caracterização de `rng(g_T^[c])`: a condição estrutural pedida pela §12 (nível B)

**Lema.** Sejam `c ∈ ℕ`, `n ≥ 1`, `y ∈ {0,1}^{n+1}`. Então

`y ∈ rng(g_T^[c])` ⟺ `[ y = 0^{n+1} e existe v ∈ {0,1}^n com Form_n(v) indefinida ]` **ou** `[ existe Ψ ∈ Adm com |Ψ| ≤ ⌊log n⌋ e σ_Ψ(c) = y[1..q(Ψ)] ]`.

**Prova.** (⇒) Seja `v`, `|v| = n`, `g_T^[c](v) = y`. Note `v ≠ ε` pois `|y| = n+1 ≥ 2 > 1 = |g_T^[c](ε)|`. Casos: (i) `Form` indefinida ⟹ `y = 0^{n+1}`; (ii) `Form(v) = Ψ`, `J_{T,Ψ}(c) < k_Ψ` ⟹ `y = w_J·t` com `|w_J| = q(Ψ)`, logo `σ_Ψ(c) = w_J = y[1..q(Ψ)]` e `|Ψ| ≤ ⌊log n⌋` (regra de aceitação de `Form`); (iii) `Form(v) = Ψ`, `J_{T,Ψ}(c) = k_Ψ` ⟹ `y = 1^{q(Ψ)}·¬t`, logo `σ_Ψ(c) = 1^{q(Ψ)} = y[1..q(Ψ)]`.
(⇐) Ramo 2: seja `Ψ ∈ Adm` com `σ_Ψ(c) = y[1..q(Ψ)]` e ponha `t := y[q(Ψ)+1..]` (`|t| = n − |Ψ|`). Se `J_{T,Ψ}(c) < k_Ψ`: `v := Ψ·t` tem `Form_n(v) = Ψ` (prefixo admissível com `|Ψ| ≤ ⌊log n⌋`; unicidade — Lema 2.1), `Tail_n(v) = t`, e `g_T^[c](v) = w_J·t = σ_Ψ(c)·t = y`. Se `J_{T,Ψ}(c) = k_Ψ`: `v := Ψ·¬t` e `g_T^[c](v) = 1^{q}·¬(¬t) = σ_Ψ(c)·t = y`. Ramo 1: `g_T^[c](v) = 0^{n+1} = y`. ∎

**Nota (central).** Esta é exatamente a «condição estrutural verificável sobre `Out`» que a §12 exige: `Out(u, σ) = σ·t` faz do **prefixo da imagem o símbolo selecionado da fórmula da entrada**. A exclusividade de `y` deixa de ser uma afirmação sobre `v` (infinitos) e passa a ser uma afirmação sobre os símbolos `σ_Ψ(c)` (decidíveis — §5).

**R2 (refutação).** Um `y ∈ rng(g_T^[c])` que não satisfaz nenhum dos dois ramos — i.e., uma entrada `v` de comprimento `n` produzindo `y` fora dos três casos da definição de `g_T^[c]` — refuta o lema.

---

## 4. Teorema 13.4 — redução do certificado a uma condição sobre `T` (nível B)

**Teorema.** Seja `Φ` admissível com `|Φ| ≥ 1`, `r ≥ 1` com `J_{T,Φ}(r−1) < J_{T,Φ}(r)` (por 13.1: `r ∈ B_T(Φ)`) e `j₁ := J_{T,Φ}(r−1)`. Escolha

- `n := 2^{|Φ|}` (logo `⌊log n⌋ = |Φ|`),
- cauda `u₀ ∈ {0,1}^{n−|Φ|}` com `u₀ ≠ 0^{n−|Φ|}` (possível: `2^{|Φ|} ≥ |Φ|+1`),
- `u := Φ·u₀` (então `Form_n(u) = Φ`), `y := w_{j₁}·u₀ = g_T^[r−1](u)`.

Então

`y ∈ rng(g_T^[r−1]) ∖ rng(g_T^[r])` ⟺ **(E)** `∀Ψ ∈ Adm com |Ψ| ≤ |Φ|`: `σ_Ψ(r) ≠ w_{j₁}[1..q(Ψ)]`.

**Prova.** `y ∈ rng(g_T^[r−1])` é a construção (`J(r−1) = j₁ < J(r) ≤ k_Φ`, logo saída genuína `w_{j₁}·u₀`). Para `y ∉ rng(g_T^[r])`: aplique 13.3 com `n = 2^{|Φ|}` — o quantificador sobre `Ψ` fica `|Ψ| ≤ ⌊log n⌋ = |Φ|`; como `q(Ψ) = |Ψ|+1 ≤ |Φ|+1 = |w_{j₁}|`, tem-se `y[1..q(Ψ)] = w_{j₁}[1..q(Ψ)]`; e `y ≠ 0^{n+1}` (pois `u₀ ≠ 0^{n−|Φ|}`), então o ramo 1 de 13.3 não se aplica. ∎

**Leitura (achado A14).** `n = 2^{|Φ|}` — a mesma escala da Q3.1 — **elimina todo o lado condicional**: não existem `Ψ` com `|Φ| < |Ψ| ≤ ⌊log n⌋`, e (E) passa a **não depender da cauda**. Resta uma conjunção finita (no máximo `Σ_{i≤|Φ|} 2^i < 2^{|Φ|+1}` fórmulas).

**R3 (refutação).** Par `(Φ, r)` com (E) satisfeita e ainda `y ∈ rng(g_T^[r])` — ex.: `Ψ` com `|Ψ| > |Φ|` entrando mesmo com `n = 2^{|Φ|}`, ou uma «re-partição de cauda» não capturada por 13.3 — refuta 13.4 (e junto 13.3).

---

## 5. Corolário 13.5 — decidibilidade por par; busca semi-decidível; sem barreira G.10 (nível B)

**Corolário.** Para par `(Φ, r)` com `r ≥ 1` fixo:

1. `J_{T,Ψ}(r)` é **decidível**: `ℓ_j > r` ⟺ não existe `π` com `|π| ≤ r` e `Prf_T(π, Ψ^{w_j})` — busca exaustiva **finita** ((P3) limita as `π`; (P2) decide `Prf_T`); o primeiro `j` com `ℓ_j > r` é o seletor (`= k_Ψ` se nenhum).
2. Testar `Ψ ∈ Adm` é decidível (parser de `Form`, (P2)). Logo **(E) é decidível** — custo finito, limitado por `(#Ψ ≤ 2^{|Φ|+1}) × (k_Ψ ≤ 2^{|Φ|+1})` provas de comprimento `≤ r` (não é p-tempo; é **finito**).
3. `P(Φ, r) := [J_{T,Φ}(r−1) < J_{T,Φ}(r)] ∧ (E)(Φ, r)` é decidível; logo **`∃(Φ, r): P(Φ, r)` é semi-decidível** (enumere os pares; pare ao achar).

**Achado A15 (decisivo).** O teste **não** cai em **G.10**: G.10 barra *computar* `B_T(Φ)`/`j*`/`N_T` (informação ilimitada, `Π⁰₁`); aqui `r` é **finito** e tudo se decide por busca limitada a `r` — mesmo esquema do achado A7 (`06` §9.6.6: recordes para `r ≤ K` decidíveis por busca finita). A parte `Σ₁` fica só na busca existencial sobre `Φ` (potencialmente infinita se `P` for falso em todos os pares).

**R4 (refutação).** `Prf_T` não decidível (derruba D8/P2) ou parser de admissibilidade indecidível (derruba `Form`/P2) — derrubariam 13.5 junto com a base do gerador.

---

## 6. Teorema 13.6 — existência do certificado sob (P4′)(i): par explícito (nível C)

**Hipóteses visíveis.**
- **(P4′)(i)** — esquema vazio: `T ⊢ Ψ^{w_0}` para toda `Ψ ∈ Adm` (equivalente operacional: `ℓ₀^Ψ < ∞`; é a peça usada em `06` §9.2/G.4; formalização = **F1**).
- **(SC)** — exigência lateral: `M := max_{Ψ∈S₀} ℓ₀^Ψ ≥ 1` (automática se toda derivação tem comprimento `≥ 1`; ver canto §6.1).

**Teorema.** Sob (P4′)(i) e (SC):

1. `m₀ := min{|Ψ| : Ψ ∈ Adm}` está bem definido (`Adm ≠ ∅`; `m₀ ≥ 1` pois toda `Φ` admissível contém `x`) e `S₀ := {Ψ ∈ Adm : |Ψ| = m₀}` é **finita e não vazia** (`|S₀| ≤ 2^{m₀}`).
2. `ℓ₀^Ψ := ℓ_T(Ψ, w_0) < ∞` para todo `Ψ ∈ S₀` ((P4′)(i)); logo existe `Φ* ∈ S₀` com **`ℓ₀^{Φ*} = max_{Ψ∈S₀} ℓ₀^Ψ =: M`**, encontrável por **algoritmo terminante** (parse por tamanho crescente até achar `m₀`; para cada `Ψ ∈ S₀`, busca de prova de `Ψ^{w_0}` — termina por (P4′)(i); máximo sobre conjunto finito).
3. Com `r := M = ℓ₀^{Φ*}` ( `≥ 1` por (SC)), `n := 2^{m₀}`, `u₀ := 1·0^{n−m₀−1}`, `u := Φ*·u₀`, `y := 0^{q(Φ*)}·u₀`:

**`y = g_T^[r−1](u) ∈ rng(g_T^[r−1]) ∖ rng(g_T^[r])`**, i.e. **`E_{r−1,r}(n) ≠ ∅`** e `rng(g_T^[r−1]) ≠ rng(g_T^[r])`.

**Prova.**
*(1)* `Adm ≠ ∅` (a linguagem tem fórmulas com exatamente a variável livre `x`); `m₀ ≥ 1` (contém `x`); finitude trivial (≤ `2^{m₀}` strings de comprimento `m₀`).
*(2)* (P4′)(i) para a finitude (o argumento `Cyl(w₀) = ∅ ⇒ Φ^{w_0}` verdadeira, `06` §9.2/C2.2(b), vale para **qualquer** `Φ` admissível); finitude de `S₀`.
*(3)*
- **`r ∈ B_T(Φ*)`:** `ℓ₀^{Φ*} = M < ∞` ⟹ `0 < j*_T(Φ*)` e `0` é sempre recorde (`ℓ_0 > max_∅ = −1`), logo `0 ∈ I_T(Φ*)` e `r = ℓ₀^{Φ*} ∈ B_T(Φ*)`; `r ≥ 1` por (SC). Note ainda `J_{Φ*}(r−1) = min{j : ℓ_j ≥ r} = 0` (pois `ℓ_0 = r`), logo `j₁ = 0`, `w_{j₁} = w_0 = 0^{q(Φ*)}` e `g_T^[r−1](u) = 0^{q}·u₀ = y`.
- **Diferença:** Lema 13.2 (ou direto: `J_{Φ*}(r) = min{j : ℓ_j > r} ≥ 1`, pois `ℓ_0 = r ≯ r`; logo `g_T^[r](u) ≠ 0^{q}·u₀`).
- **Exclusividade via Teorema 13.4:** os concorrentes são exatamente `Ψ ∈ S₀` (todo `Ψ ∈ Adm` com `|Ψ| ≤ |Φ*| = m₀` tem `|Ψ| = m₀` por minimalidade) e `q(Ψ) = q(Φ*)`, logo (E) pede `σ_Ψ(r) ≠ 0^{q(Φ*)}`. Se `J_Ψ(r) < k_Ψ`: `J_Ψ(r) = 0 ⟺ ℓ₀^Ψ > r = M` — **impossível** (`M` é o máximo de `ℓ₀` sobre `S₀`), logo `J_Ψ(r) ≥ 1` e `σ_Ψ(r) = w_{J_Ψ(r)} ≠ w_0`. Se `J_Ψ(r) = k_Ψ`: `σ_Ψ(r) = 1^{q} ≠ 0^{q}`. Portanto (E) vale. E `y ≠ 0^{n+1}` (a cauda começa com `1`; `n − m₀ = 2^{m₀} − m₀ ≥ 1`). ∎

**Corolário 13.6a (a ponte, por escrito).** Sob (P4′)(i)+(SC): **`E_{r−1,r}(2^{m₀}) ≠ ∅`** para `r = ℓ₀^{Φ*}` — existe par de **orçamentos constantes consecutivos** com ranges distintos e testemunha explícita `y`. A direção `transição espectral → rng distinto` da §12 **fecha** para esse par (`E` conforme `06` §9.5: `R_b(n) = rng(g^[b]) ∩ {0,1}^{n+1}`, `E_{b₁,b₂} = R_{b₁} △ R_{b₂}`).

**Canto 6.1 — exigência (SC).** Se `M = 0` (prova de comprimento zero — só factível se `Prf_T(ε, θ)` for possível; (P3) não exclui explicitamente), o par `(r−1, r)` com `r = 0` não existe (orçamento `−1 ∉ ℕ`). Verificar em D8 que derivações têm `|π| ≥ 1`; se falso, 13.6 vale apenas para `M ≥ 1`.

**R5 (refutação).**
(a) `Ψ ∈ Adm` com `|Ψ| < m₀` (derruba a minimalidade);
(b) `Ψ ∈ S₀` com `ℓ₀^Ψ > M` (derruba o argmax — erro de (2));
(c) `y ∈ rng(g_T^[r])` apesar de (E) (derruba 13.6 via 13.4/13.3);
(d) `M = 0` sem (SC) (canto §6.1);
(e) `Ψ ∈ Adm` com `T ⊬ Ψ^{w_0}` (derruba **(P4′)(i)** — refuta a hipótese F1, não o lema).

---

## 7. Achados de ataque (o que a §12 não via)

**A11 — a versão ingênua do certificado é FALSA (ambiguidade de divisão de `Out`).**
A §12 quantifica `∀v`, mas o perigo implícito é só `Ψ` do mesmo tamanho. Falso: `Out(u, σ) = σ·t` permite que `Ψ` de tamanho **menor** produza o mesmo `y` com a cauda **re-partida**. Forma do contraexemplo: `|Φ| = 2` (`q₀ = 3`), `w_{j₁} = "010"`; `Ψ` com `|Ψ| = 1` (`q = 2`) e `σ_Ψ(r) = "01"` — então `v := Ψ·("0"·u₀)` tem `Form(v) = Ψ`, cauda `"0"·u₀` e `g_T^[r](v) = "01"·"0u₀" = "010·u₀" = y`. **Um certificado que só testa `|Ψ| = |Φ|` é inválido.** Correção: quantificar `|Ψ| ≤ |Φ|` e fixar `n = 2^{|Φ|}` (Teorema 13.4).

**A12 — o caso `⊥` colide explicitamente.**
Se `w_{j₁} = 1^{q}` (i.e. `j₁ = k_Φ−1`) e `J_Φ(r) = k_Φ` (todos os candidatos provados `≤ r`), então `v := Φ·¬u₀` dá `g_T^[r](v) = 1^{q}·¬(¬u₀) = 1^{q}·u₀ = y`. É a instância `Ψ = Φ` de (E) no ramo `⊥` (em 13.3: `σ_Φ(r) = 1^q = y[1..q]`). — **mata (Φ, r) só nesse caso** (para `Ψ = Φ`, `J_Φ(r) > j₁` garante `σ ≠ w_{j₁}` fora do `⊥`: ver A16).

**A13 — cauda toda nula.**
`w_{j₁} = 0^{q} ∧ u₀ = 0^{n−|Φ|} ⟹ y = 0^{n+1}` — a saída padrão de `Form` indefinida; se existir `v` com `Form` indefinida, `y ∈ rng(g_T^[r])` automaticamente. **Dodge obrigatório:** cauda com um `1` (sempre possível pois `n − |Φ| ≥ 1`) — tornado automático pela escolha `n = 2^{|Φ|}` (Teorema 13.4).

**A14 — `n = 2^{|Φ|}` descarta o lado condicional.**
Para `n` maior, `Ψ` com `|Φ| < |Ψ| ≤ ⌊log n⌋` entram com restrições que **dependem da cauda** (cada `Ψ` com `σ_Ψ(r)` começando por `w_{j₁}` proíbe um prefixo de `u₀`; as proibições podem se acumular e até saturar a cauda). Com `n = 2^{|Φ|}` essas restrições não existem e (E) fica **independente de `u₀`**.

**A15 — o teste é decidível, a busca é semi-decidível, G.10 não barra.**
(Corolário 13.5.) Contraste com Q-4/Conj-F: lá a antecedente envolve `C_T(L)` (informação ilimitada); aqui `r` é finito ⟹ busca limitada (mesmo esquema de A7).

**A16 — `Ψ = Φ` quase nunca mata.**
Para `Ψ = Φ`: `J_Φ(r) > j₁` ⟹ `σ_Φ(r) = w_{J_Φ(r)} ≠ w_{j₁}`; o único caso de colisão é o `⊥` de A12. Os concorrentes perigosos são as **outras** fórmulas de tamanho `≤ |Φ|` — no tamanho mínimo elas são poucas (`S₀` finita) e todas domadas pelo argmax do Teorema 13.6.

**A17 — escolha de `r` com `j₁ = 0` é a mais frágil *e* a mais útil.**
Com `r = ℓ₀^Φ` tem-se `j₁ = 0`, `w_{j₁} = 0^{q}`; aí qualquer `Ψ` com `ℓ₀^Ψ > r` mata (E). Por isso o argumento de 13.6 precisa do **argmax** (`r = max ℓ₀` entre os concorrentes mínimos) — escolher o `Φ*` *mínimo em `ℓ₀`* (a tentação ingênua) daria `j₁ = 0` contra `ℓ₀^Ψ > r` em todo concorrente maior e **falharia**.

---

## 8. O que NÃO fecha (mantido visível)

- **P-4.2 na forma geral segue PROIBIDA.** O Teorema 13.6 separa **um** par explícito `(r−1, r)` (`r = ℓ₀^{Φ*}`). Para um par ativo **arbitrário** `(r−1, r)` (inclusive `b` variável) a condição (E) pode falhar: é decidível por par (Cor 13.5) e **não foi avaliada** para pares genéricos. `cor:atividade`/`cor:atividade-var` continuam cobrindo **só saídas**. **Critério global R5f:** todo par `(Φ, r)` com `r ∈ B_T(Φ)` violando (E) — para a forma geral — não refuta 13.6; refuta só a extensão de P-4.2.
- **Nenhuma simulação.** A busca por pares genéricos (sem (P4′)(i)) não rodou — seria `src/julia/etapa13_certificado.jl` sobre perfis no formato `08` M.2 (`k_Φ`, `ℓ_j`, `Out`) — **não criado; só sob pedido**.
- **(P4′)(i) não está formalizada:** F1–F6 seguem bloqueados por formalização assistida (Lean) — é por isso que 13.6 é Nível C, não B.
- **τ / resultantes / pseudo-surjetividade (Etapas 14–16)** intactas; nenhuma pretensão sobre elas.
- **`E_{b₁,b₂}`**: definida (`06` §9.5; `paper` `eq:E`), agora com **uma** instância não-trivial provada; leis assintóticas/limites de `E` não tocados.

---

## 9. Sincronias desta rodada

- `02_REVISAO_CRITICA.md` §5.4 (item Etapa 13) e §3 (linha «range/τ»).
- `07_CONSEQUENCIA_GLOBAL.md` §5 item 3 (trilha executada, com ponteiro).
- `03_PRONTOS_E_A_FAZER.md` item 19.
- `06_GEOMETRIA_CT.md` §9.5 (instância de `E_{b₁,b₂}`).
- `CONTINUIDADE_ESPECTRO_CONSEQUENCIA_GLOBAL.md` §12 (nota de resultado).
