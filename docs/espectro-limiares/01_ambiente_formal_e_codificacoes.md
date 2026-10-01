# 01 — Ambiente formal e codificações

**Etapa 1 do plano** (`logica  organização.md`). Status: **decisões fixadas (D1–D11)**. Documento normativo da pasta.

**Fonte primária:** J. Krajíček, *A proof complexity conjecture and the Incompleteness theorem*, arXiv:2303.10637v2 (15/09/2023) = *J. Symbolic Logic* 90(3) (2025), 1206–1210, DOI 10.1017/jsl.2023.69 — citado como **[K23]** (texto completo consultado em 26/09/2026 via `arxiv.org/html/2303.10637v2`). **Fontes da linha:** `Núcleo formal mínimo do espectro de limiares de prova.md` (**[NF]**), `desenv. logica kubricek leis.md` (**[DK]**).

**Critério de conclusão da Etapa 1:** as expressões `Φ^w, ℓ_T(Φ,w), ρ_T(Φ), B_T(Φ), C_T(L), R_T(L), g_T^[b]` ficarem sem ambiguidade. Verificação item a item na §9.

Classificação editorial: A = definição/convenção, B = lema elementar provado, C = condicionado, D = conjectura/aberto.

---

## 0. Tabela de decisões

| # | Decisão | Onde |
|---|---|---|
| D1 | Teoria-base `T ⊇ S¹₂`, correta (verdadeira em ℕ), axiomatizável em p-tempo; casos concretos `S¹₂` e `PA` | §1 |
| D2 | Linguagem L = assinatura padrão da aritmética limitada de Buss, interpretação canônica em ℕ | §2.1 |
| D3 | Fórmulas = strings binárias com código **livre de prefixo**; `|Ψ|` = comprimento da string | §2.2 |
| D4 | `Φ` admissível ⟺ fórmula L com **exatamente** a variável livre `x` | §2.2 |
| D5 | Tamanho: `|π|` = comprimento da string-prova; `|w|` = comprimento; `log` = `log₂` com piso | §2.3 |
| D6 | `bin(x)` = representação binária canônica sem zeros à esquerda; `w ⊆_e x` ⟺ `w` prefixa `bin(x)`; `<_lex` usual | §2.4 |
| D7 | **`q(Φ) = |Φ| + 1`** (fecha a abertura de `[NF]` §1.2 e o item de `02` §1.3) | §3 |
| D8 | `Prf_T(π,θ)` decidível em p-tempo; correção de T é hipótese **externa** (H-som), nunca embutida | §2.3, §6 |
| D9 | `Form_n/Tail_n/Out_n` concretas; `g_T^[b]`; convenção do caso `⊥`; lema stretch; igualdade de `F_n`; injetividade de `Out` | §5 |
| D10 | Classe sintática de `Φ`: núcleo **irrestrito**; camada `Σᵇ₁` condicionada (`θ ∈ Πᵇ₁`), questão aberta registrada | §4.3, §8 |
| D11 | Gadget `θ ↦ Φ_θ` **padronizado na versão bloco**; versão "timeout" fica como alternativa com obrigações próprias | §7 |

---

## 1. A teoria-base (D1)

**Definição (D1, nível A).** Fixa-se uma teoria de primeira ordem `T` tal que:

- **(T1)** `T ⊇ S¹₂` (Buss — `[K23]` §2: "We take as our basic theory S¹₂ of Buss, denoting its language simply L");
- **(T2)** `T` é **correta** (sons): `T ⊢ θ ⟹ ℕ ⊨ θ` — denotada **(H-som)**;
- **(T3)** `T` é axiomatizável em tempo polinomial (todo conjunto r.e. tem axiomatização p-tempo — variante de Craig, `[K23]` refs. [3]); daí `Prf_T` decidível em p-tempo **(H-pt)**;
- **(T4)** `T` formaliza sintaxe da lógica de primeira ordem e os fatos elementares de codificação da §2 **(H-cod)**.

Casos concretos do projeto: **`T = S¹₂`** e **`T = PA`**. Os teoremas locais (núcleo §3) **não usam (T2)** — valem mesmo para `T` inconsistente (núcleo §9.4); (T2) entra apenas onde §6/§7 indicam.

**Observação (nível A).** `(H-pt)` permite a busca limitada de provas em `g_T^[b]`; `Thm(T)` é indecidível e **não** precisa ser decidível para o gerador ser computável (núcleo §4).

---

## 2. Linguagem, códigos e tamanhos (D2–D6, D8)

### 2.1 Linguagem (D2)

L é a linguagem finita da aritmética limitada de Buss (assinatura padrão de `[K23]` §2), com interpretação canônica em ℕ. **Nenhum resultado da §9 depende da assinatura exata:** todos usam apenas (i) efetividade (fórmulas e provas são strings decídiros) e (ii) (H-cod). Registrar como obrigação da Etapa 2 a demonstração de invariância sob troca de assinatura efetiva equivalente (§10).

### 2.2 Fórmulas como strings; código livre de prefixo; admissibilidade (D3, D4)

**Convenção (D3, nível A — herdada de `[K23]` §2).** Toda fórmula L é identificada com a string binária que a codifica; `|Ψ|` é o comprimento dessa string. A imagem do código é **livre de prefixo**:

> **(P1)** Nenhuma fórmula é prefixo próprio de outra fórmula. (`[K23]` §2: "We shall assume that no formula is a proper prefix of another formula.")

(P1) é realizável por qualquer código auto-delimitável (ex.: comprimento embutido) e é o que garante:

**Lema 2.1 (unicidade em `Form`, nível B).** Uma string `u` tem no máximo uma prefixo que seja fórmula.
*Prova.* Sejam `Φ₁ ⊆_e u`, `Φ₂ ⊆_e u` fórmulas. Sem perda `|Φ₁| ≤ |Φ₂|`; então `Φ₁` é prefixo de `Φ₂` e (P1) dá `Φ₁ = Φ₂`. ∎ — É a justificativa de `[K23]` passo 1 ("It is unique if it exists").

**Definição (D4, nível A).** `Φ` é **admissível** ⟺ `Φ` é fórmula L com **exatamente** a variável livre `x`. (`[K23]` passo 1: "an L-formula Φ with one free variable x".) Só fórmulas admissíveis entram em `Form`, `S_T, C_T, R_T`.

### 2.3 Provas, `Prf_T` e tamanho (D5, D8)

**Convenções (nível A).** Provas de `T` são strings binárias que codificam derivações no cálculo fixo de `T` (axiomas de `T` + regras). `|π|` = comprimento da string-prova. Qualquer codificação polinomialmente equivalente de provas dá os mesmos resultados até aditivos polinomiais — a invariância é obrigação da Etapa 2 (§10).

**Definição (D8) + exigências.** `Prf_T(π,θ) ⟺ π` codifica uma derivação em `T` da sentença `θ`, com:

- **(P2)** `Prf_T` decidível em tempo polinomial em `|π| + |θ|`;
- **(P3)** para cada `c ∈ ℕ` há finitas strings `π` com `|π| ≤ c` (menos de `2^{c+1}`) — sustenta `ℓ_T(Φ,w) ∈ ℕ ∪ {∞}` e `ℓ_T < ∞ ⟺ T ⊢ θ`.

**Separação obrigatória (D8; advertência mantida de `01_NUCLEO` §5).** `Prf_T` é puramente **sintático**. **(H-som)** é semântica e **não** pode aparecer embutida em `Prf_T`, `ℓ_T` ou nas definições do espectro. Todo uso de (H-som) está listado em §6.

Convenção de `log`: `log` = `log₂`, com piso onde o resultado é inteiro (`⌊log n⌋`), `n ≥ 1`.

### 2.4 Strings, ordem lexicográfica e prefixo `⊆_e` (D6)

**Convenção (D6, nível A).** Para `x ∈ ℕ`: `bin(x)` = representação binária canônica de `x` **sem zeros à esquerda** (`bin(0) = "0"`). Para `u,v ∈ {0,1}*`: `u ⊆_e v` ⟺ `u` é segmento inicial de `v`; `uv` = concatenação; `<_lex` = ordem lexicográfica usual (`0 < 1`). Para `w ∈ {0,1}*` e `x ∈ ℕ`: `w ⊆_e x` ⟺ `w ⊆_e bin(x)`.

`(u ⊆_e v)` e a concatenação são definíveis em `S¹₂` por fórmulas `Σᵇ₁` e `Πᵇ₁` provavelmente equivalentes — `[K23]` §2 declara isso explicitamente. É a base de:

**Lema 2.2 (cilindros, nível B).** Seja `Cyl(w) = {x ∈ ℕ : w ⊆_e x}`. Para `w ≠ ε`:
1. se `w` começa com `0`, então `Cyl(w) ⊆ {0}` — em particular `Cyl(w) ∩ {x : x > y} = ∅` para `y ≥ 0`;
2. se `w` começa com `1`, então `Cyl(w)` é infinita e cofinal: para todo `y` existe `x > y` com `w ⊆_e x`.

*Prova.* (1) `bin(x)` de `x ≥ 1` começa com `1`; logo `bin(x)` não tem `w` (que começa com `0`) como segmento inicial. (2) Seja `k` tal que `x := ⟨w⟩·2^{k} > y` (possível pois `⟨w⟩ ≥ 1`); então `bin(x) = w·0^{k}` começa com `w`. ∎

O Lema 2.2 é o que torna triviais (falsas ou vazias) as fatias `0*` dos candidatos — usado em §7 e já pressuposto em `[DK]` linhas 1344–1352 e 2886–2896.

---

## 3. A sentença `Φ^w` e o comprimento do candidato (D7)

**Definição (nível A, de `[NF]` §0 / `[K23]` eq. (1)).** Para `Φ` admissível e `w ∈ {0,1}*`:

    Φ^w := ∃y ∀x>y ( Φ(x) → ¬(w ⊆_e x) ).

`ℕ ⊨ Φ^w` ⟺ o conjunto `{x : Φ(x) ∧ w ⊆_e x}` é **finito** (lema imediato: se infinito, cofinal, falsifica; se finito, escolher `y` maior que o máximo). Intuição: "só finitamente muitos `Φ`-elementos têm prefixo `w`".

**Candidatos (nível A).** `W_Φ = {0,1}^{q(Φ)} = {w_0 <_lex … < w_{k_Φ−1}}`, `k_Φ = 2^{q(Φ)}` (com `q(Φ) ≥ 1` — exigência de `[NF]` §1.2).

### 3.1 Decisão `q(Φ) = |Φ| + 1` (D7)

**Teorema (D7, nível B — fecha a abertura de `[NF]` §1.2).** A codificação canônica de `[K23]` tem **`q(Φ) = |Φ| + 1`**, isto é, `|w| = |Φ| + 1` para todo candidato `w`.

*Prova (três confirmações independentes + aritmética do stretch).*

1. **Aritmética do stretch (decisiva).** `[K23]` passo 1 encontra `Φ ⊆_e u` com `|u| = n`; passo 3 define `u = Φu₀` (logo `|u₀| = n − |Φ|`) e afirma `g_T(u) := w₀u₀ ∈ {0,1}^{n+1}`. Logo `|w₀| = (n+1) − |u₀| = |Φ| + 1`. Os casos-vazio `0̄ ∈ {0,1}^{n+1}` (passos 1–2) dão a mesma exigência.
2. **Concordam** `[K23]` Teorema 2.2 (`w ∈ {0,1}^{c+1}` com `c = |Φ|`), §3 (`c := |Φ|`, `w ∈ {0,1}^{c+1}`) e Lema 3.2 (idem): `|w| = |Φ| + 1`.
3. **Concordam os fontes da linha:** `[DK]` linha 1338 ("Os candidatos `w` têm comprimento `|Φ_θ|+1`") e linhas 2872–2876 ("se `c = |Φ_θ|`, os candidatos têm tamanho `c+1`").

**Erratum aparente em `[K23]` (registro; salvo melhor juízo).** O passo 2 da construção diz "Put `c := |Φ|+1`. Going through all `w ∈ {0,1}^{c+1}`", o que daria `|w| = |Φ|+2` e `|w₀u₀| = n+2`, contradizendo (i) a própria asserção do passo 3 (`w₀u₀ ∈ {0,1}^{n+1}`), (ii) o Lema 2.1 ("stretches each input by one bit") e (iii) as três outras ocorrências do paper. A leitura consistente é `|w| = |Φ|+1` (no passo 2, ou `c := |Φ|` ou `w ∈ {0,1}^c` — qualquer uma das duas correções basta).

**Invariância (nível A).** Trocar `q` por `|Φ|+2` altera `k_Φ`, `j*`, `ρ_T` etc. apenas por recodificação dos índices; os teoremas locais (núcleo §3) dependem só do seletor sobre o perfil e continuam válidos. A escolha importa para: (a) o gadget (§7), (b) a comparação `C_T(L)` vs `B_b(L)` — por isso ela estava bloqueando, e está fechada.

---

## 4. O que é `Φ`, e onde (D10)

### 4.1 Versão irrestrita (padrão)

Núcleo do espectro (`S_T, C_T, R_T`, teoremas locais, realização): `Φ` admissível **sem restrição de classe sintática** — `Φ` admissível basta, pois `∃y∀x>y(…)` fecha as variáveis e `Φ^w` é sentença em qualquer classe. Denote-se `R_T` (sem sobrescrito). Nível A.

### 4.2 Versão `Σᵇ₁`

`R_T^Σ(L) := max{ ρ_T(Φ) : Φ admissível, Φ ∈ Σᵇ₁, |Φ| ≤ L }` — é a que aparece em `[DK]` §§8–10 (`R_T^Σ ≡_T Thm(T)`). Só esta versão conversa com tradução proposicional (`[K23]` §3: `Φ ∈ Σᵇ₁` ⟹ `Φ^w` após instanciar `y` é `Πᵇ₁`).

### 4.3 A restrição que o gadget impõe (D10 — questão aberta registrada)

O gadget bloco (§7) põe `¬θ` dentro de `Φ_θ`; logo `Φ_θ ∈ Σᵇ₁` **exige `θ ∈ Πᵇ₁`** (pois `¬θ ∈ Σᵇ₁`). Consequências:

- `Thm(T) ≤_T R_T^Σ` pelo gadget bloco fica sólido para `θ ∈ Πᵇ₁`;
- **Questão aberta (D):** `Thm(T) ∩ Πᵇ₁` ainda é `∅'`-duro para `T ∈ {S¹₂, PA}`? Se sim, a equivalência `R_T^Σ ≡_T Thm(T)` sobrevive inteira; se não, restam (i) enunciar a equivalência para o espectro irrestrito `R_T` e a versão `Σᵇ₁` só parcialmente, ou (ii) usar o gadget timeout (§7.4), cujo `Φ_θ ∈ Δᵇ₁` é **incondicionado em `θ`**, pagando as obrigações de formalização de máquina (§7.4).

Isso é exatamente o item "decidir a classe de `Φ`" da Etapa 1, item 6: **decidido com ressalva registrada** — núcleo irrestrito; `Σᵇ₁` como camada condicionada.

---

## 5. O gerador `g_T^[b]` (D9)

### 5.1 `Form`, `Tail`, `Out` (concretas)

Herda `[K23]` passo 1 e `[NF]` §1.4, que definiam essas funções de forma abstrata. Para `n ≥ 1`, `u ∈ {0,1}^n`:

- **`Form_n(u) := Φ`** se `Φ` é admissível (D4), `Φ ⊆_e u` e `|Φ| ≤ ⌊log n⌋`; **indefinida** caso não exista. Unicidade: Lema 2.1. Busca: testar os prefixos de `u` de comprimento `≤ ⌊log n⌋` — p-tempo por (P2). (`[K23]` passo 1: "find an L-formula Φ ⊆_e u with one free variable x such that |Φ| ≤ log n. (It is unique if it exists.)" + caso-vazio `0̄`.)
- **`Tail_n(u) := u₀`** onde `u = Form_n(u)·u₀` (só se `Form_n(u)` é definida); `|u₀| = n − |Φ|`.
- **`Out_n(u,w) := w·u₀ ∈ {0,1}^{n+1}`** para candidato `w` (`|w| = q(Φ) = |Φ|+1`).
- **Caso `⊥`** (`J = k_Φ`, todos os candidatos "passaram"): `Out_n(u,⊥) := 1^{q(Φ)}·¬u₀` — convenção nossa, **diferente** do `0̄` de `[K23]`; justificada no Lema 5.3.
- **`Form_n(u)` indefinida:** saída padrão `0^{n+1}` (como `[K23]`).

### 5.2 Definição de `g_T^[b]`

Orçamento `b : ℕ → ℕ` (computável; não decrescente e ilimitado para resultados assintóticos — `[NF]` §1.1). Para `u ∈ {0,1}^n`:

    g_T^[b](u) := Out_n(u, w_{J_{T,Φ}(b(n))})   se Form_n(u) = Φ e J_{T,Φ}(b(n)) < k_Φ
                := Out_n(u, ⊥)                  se Form_n(u) = Φ e J_{T,Φ}(b(n)) = k_Φ
                := 0^{n+1}                      se Form_n(u) indefinida
    g_T^[b](ε) := "0"

com `J_{T,Φ}(c) = min{j < k_Φ : ℓ_T(Φ,w_j) > c}` (`= k_Φ` se vazio) — `[NF]` §1.3/§1.4. **`[K23]` é o caso `b(n) = ⌊log n⌋`** (mesmo valor para `|Φ|` e para o tamanho da prova buscada — passo 2: "search for a T-proof of size ≤ log n"). `F_n`, `S^op_T(n)`, `C^op_T(n)` e `B_b(L) = b(2^L)` ficam como no núcleo §2, com `Form_n` agora concreta.

### 5.3 Lemas

**Lema 5.1 (stretch, nível B).** Para todo `u ∈ {0,1}^n`: `|g_T^[b](u)| = n+1`.
*Prova.* Casos: `Form` indefinida → `0^{n+1}`; `Form = Φ`, `J < k` → `|w| + |u₀| = (|Φ|+1) + (n−|Φ|) = n+1`; `J = k_Φ` → `q(Φ) + (n−|Φ|) = n+1`; `u = ε` → `"0"`. ∎ — Reproduz `|g_T(u)| = |u| + 1` de `[K23]` Lema 2.1 com a aritmética que fixa `q` (§3).

**Lema 5.2 (`F_n` — nível B; decide `01_NUCLEO` §7.6).** Para `n ≥ 1`:

    F_n := {Φ : ∃u ∈ {0,1}^n, Form_n(u) = Φ}  =  {Φ admissível : |Φ| ≤ ⌊log n⌋}.

*Prova.* (⊆) é a regra de aceitação de `Form`. (⊇) Seja `|Φ| = m ≤ ⌊log n⌋ ≤ n`; ponha `u := Φ·0^{n−m}`. Então `Φ ⊆_e u`, `Φ` admissível e `|Φ| ≤ ⌊log n⌋`, logo `Form_n(u) = Φ` (unicidade, Lema 2.1). ∎ — **A igualdade vale** (o núcleo §7.6 registrava só a inclusão, pendente de fixar a codificação).

**Lema 5.3 (injetividade de `Out` no argumento candidato — nível B).** Seja `u` com `Form_n(u) = Φ`. Então:
1. `w ≠ w'` candidatos ⟹ `Out_n(u,w) ≠ Out_n(u,w')`;
2. com a convenção `Out_n(u,⊥) := 1^{q}·¬u₀`: `Out_n(u,⊥) ≠ Out_n(u,w)` para **todo** candidato `w`;
3. a convenção de `[K23]` (`Out_n(u,⊥) := 0^{n+1}`) **pode colidir**: se `u₀ = 0^{n−|Φ|}` e `w = 0^{q(Φ)}`, então `w·u₀ = 0^{n+1}`.

*Prova.* (1) mesma cauda `u₀`, prefixos de mesmo comprimento distintos. (2) toda saída genuína termina com `u₀`; a saída `⊥` termina com `¬u₀ ≠ u₀`. (3) cálculo direto. ∎

**Decisão registrada.** A convenção `⊥` nova **descarrega a hipótese "injetividade de `Out`" dos Corolários 7.1–7.3** (núcleo §3) para todo `u`, sem restrição aos `J < k` de ambos os lados. Não altera o Lema 5.1 nem o argumento de contagem de `[K23]` Lema 2.1 (complemento do intervalo infinito: `2^n` entradas contra `2^{n+1}` saídas). Se a Etapa 2 exigir fidelidade literal a `[K23]`, a alternativa é manter `0̄` e restringir Cor 7.1 a `J(b₁), J(b₂) < k_Φ` — registrada em §10.

### 5.4 Custo polinomial de `g_T^[b]` (Etapa 2 — provado em 27/09/2026)

**Teorema 5.4 (p-tempo de `g_T^[b]` — nível B).** Vale `(P2)` e `(P3)`, `b` é computável em p-tempo e `b(n) = O(log n)`. Então `g_T^[b]` é computável em tempo polinomial no comprimento `n` da entrada: existem constantes `C, d > 0` e `n₀` tais que, para todo `n ≥ n₀` e toda `u ∈ {0,1}^n`, o custo é `≤ C·n^d`.

*Ataque prévio (o que a prova precisa separar — misturar essas quatro grandezas é o erro clássico):*

| Grandeza | Papel | Cota |
|---|---|---|
| `n` | tamanho da entrada = **unidade de tempo** | `n` |
| `|Φ|` | tamanho da fórmula acessível (Lema 5.2) | `≤ ⌊log n⌋` |
| `q(Φ) = |Φ|+1 = |w|` | tamanho do candidato (D7) | `≤ ⌊log n⌋+1`; logo **nº de candidatos** `k_Φ = 2^{q(Φ)} ≤ 2^{⌊log n⌋+1} ≤ 2n` — **linear em `n`, não `2^{b(n)}`** |
| `c = b(n)` | orçamento de prova | `≤ A·log₂ n + B` (para `n ≥ n₀`); controla **só** a enumeração de provas |

Duas armadilhas explicitadas na prova: **(a)** a hipótese "`b` computável" sozinha não dá custo total p-tempo (o valor `b(n)` pode levar tempo arbitrário para ser calculado) — a hipótese é **fortalecida aqui para `b` p-tempo-computável**; **(b)** para `n < n₀` (finitos) vale tabela de consulta finita. Nota: `b(n) = O(log n) ⟺ 2^{O(b(n))} = n^{O(1)}`, então a hipótese pode ser enunciada em qualquer das duas formas.

*Prova.* Seja `u ∈ {0,1}^n` e `c := b(n)`.

1. **`Form_n(u)`** (§5.1): testar os prefixos de `u` de comprimento `1 … ⌊log n⌋` (`⌊log n⌋` candidatos; no máximo um é fórmula admissível, por unicidade — Lema 2.1). Cada teste (parse/admissibilidade D4 e `Φ ⊆_e u`) roda em p-tempo no comprimento do prefixo `≤ ⌊log n⌋` por `(P2)`. Custo: `(log n)^{O(1)}`.
2. **`Form_n(u)` indefinida:** devolver `0^{n+1}` — `O(n)`. (`u = ε`: saída `"0"`, tempo constante.)
3. **`b(n)` e `Φ^{w_j}`:** calcular `c = b(n)` em p-tempo (hipótese (a)); para cada candidato, `(Φ,w) ↦ Φ^{w}` em p-tempo de `|Φ|+|w_j| ≤ 2⌊log n⌋+1` por `(P2)` — em particular `|Φ^{w_j}| ≤ (log n)^{O(1)}` (um algoritmo p-tempo não produz saída maior que a leitura).
4. **Testar `ℓ_T(Φ,w_j) > c`** (equivalentemente: nenhum `π` com `|π| ≤ c` e `Prf_T(π, Φ^{w_j})`): enumerar todos os `π` com `|π| ≤ c` — no máximo `|Σ|^{c+1} = |Σ|^{B+1}·n^{A·log₂|Σ|} = n^{O(1)}` — avaliando `Prf_T` em p-tempo de `|π|+|Φ^{w_j}| = (log n)^{O(1)}` por `(P2)`. Custo por candidato: `n^{O(1)}`.
5. **Percorrer `j = 0 … k_Φ`** até o primeiro `ℓ_j > c` (definição de `J`; convenção `k_Φ`): `k_Φ ≤ 2n` iterações — **linear**.
6. **`Out_n`** (§5.1: concatenação, `¬u₀` ou convenção `⊥`): `O(n)`.

Somando: `(log n)^{O(1)} + O(n) + 2n · n^{O(1)} · (log n)^{O(1)} + O(n) = n^{O(1)}`. Para `n < n₀`: tabela finita (`∑_{n<n₀} 2^n` entradas, tempo `O(1)` por consulta). ∎

**Corolário 5.5 (caso `[K23]`).** Em particular, `b(n) = ⌊log n⌋` é p-tempo; o mesmo vale para toda escolha `b(n) = O(log n)` p-tempo-computável (ex.: `⌊log n⌋`, `⌊log₂ log₂ n⌋`, `log* n`).

**Observações (limites da prova).**
1. *(Sem `(P5)`)* — a busca é finita e sintática; `Thm(T)` não precisa ser decidível e nenhuma correção de `T` entra. O teorema vale inclusive para `T` inconsistente.
2. *(Sem classe `Σ^b_1`)* — nada da §8 é usado.
3. *(Cota é otimal na forma)* — para `b` superlogarítmico, o passo 4 custa `2^{O(b(n))}` e **não se alega p-tempo**; a hipótese `b(n) = O(log n)` (≡ `2^{O(b(n))} = n^{O(1)}`) é exatamente o que o passo 4 exige.
4. *(Status)* — nível B, condicionado **apenas** a `(P2)(P3)` + `b` p-tempo (estes são os primitivos assumidos em D5/D9 e na tabela §6); é o que `01_NUCLEO_DURO` §4 chamava de linha "tempo polinomial" e §7.6 listava como pendente.

---

## 6. Propriedades exigidas da codificação (P1–P8) e mapa de dependências

| Prop. | Enunciado | Onde entra |
|---|---|---|
| (P1) | código de fórmulas livre de prefixo | Lema 2.1; `Form` |
| (P2) | `Prf_T, Form, Tail, Out, (Φ,w) ↦ Φ^w` computáveis em p-tempo | gerador computável; Etapa 2 |
| (P3) | finitas provas de tamanho `≤ c` | `ℓ_T ∈ ℕ∪{∞}`; `k_Φ < ∞` |
| (P4) | `⊆_e` e concatenação definíveis em `S¹₂` (`Σᵇ₁`/`Πᵇ₁` provavelmente equivalentes) — `[K23]` §2 | Lema 2.2; formalização; camada `Σᵇ₁` |
| (P5) | **(H-som)** correção de `T` | **só**: Lema 7.3 (blocos 11), direção "T ⊬ θ ⟹ T ⊬ Φ^{w*}" do procedimento de decisão, Cor 7.4 |
| (P6) | verdades de cilindro vazio/vazio-trivial têm prova `≤ a(|θ|+q)+c` em `T` | Lema 7.1; `ρ` pequeno quando `T ⊬ θ` |
| (P7) | equivalências do gadget com custo linear (`T ⊢ (Φ_θ^w ↔ θ)`, custo `a(|θ|+q)+c`) | Lema 7.2; transferência `ρ ≈ s_T(θ)` |
| (P8) | linearidade do gadget: `|Φ_θ| ≤ a|θ| + b` | escala `M_T(m) ≤ R_T^Σ(a·m+b)+c` |

**Mapa de dependências (o que usa o quê):**

| Resultado | Hipóteses |
|---|---|
| Definições (`Φ^w, ℓ, J, j*, ρ, B_T, S_T, C_T, R_T`) | D1–D8 + (P1)(P3) — **sem (P5)** |
| Teoremas locais (5.1, 6.1–6.3, T4.1, cor. 7.1–7.3) | idem + Lema 5.3 — **sem (P5)** |
| `g_T^[b]` total e computável | (P2)(P3) + §5 |
| `g_T^[b]` p-tempo p/ `b(n) = O(log n)` | (P2)(P3) + `b` p-tempo-computável + enumeração `2^{O(b(n))}` — **Teorema 5.4 (§5.4), Etapa 2 concluída (27/09/2026)** |
| Semântica do gadget (`j*`; `s_T(θ) ± poly ≈ ρ`) | (P5)(P6)(P7)(P8) + D11 |
| `R_T ≡_T Thm(T)` / `R_T^Σ ≡_T Thm(T)` | D11 + (P5) + §4.3 (questão aberta para `Σ`) |
| Invariância sob troca de codificação | **pendente** — §10 |

---

## 7. O gadget `θ ↦ Φ_θ` (D11 — Nível C)

Status: **padronizado (versão bloco); esboço de prova completo; obrigações 2–7 não formalizadas linha a linha** (auditoria da Etapa 7). Nada desta seção é teorema fechado — é a auditoria que `03` B3 e `02` §3.1 exigem.

### 7.1 Construção padrão — versão bloco

Para sentença `θ`:

    Φ_θ(x) := (11 ⊆_e x)  ∨  ( ¬θ ∧ (10 ⊆_e x) )
    w*     := 10^{|Φ_θ|}        (primeira palavra de comprimento q(Φ_θ) = |Φ_θ|+1 que começa por 1;
                                 primeiro candidato do bloco 10)

- `|Φ_θ| ≤ a|θ| + b` **imediatamente** (o código de `¬θ` tem comprimento `|θ|+O(1)`; os cilindros são constantes) — (P8) trivial nesta versão, **ao contrário** da timeout;
- não há circularidade `|Φ_θ|` vs `|w|`: o candidato não é embutido em `Φ_θ` (`[DK]` linha 1332);
- `q(Φ_θ) = |Φ_θ| + 1` é a decisão D7 — a nota "depende de fixar q" do `01_NUCLEO` §5 antiga está resolvida.

Esta é a construção de `[DK]` §3 (linha 1330, "a descoberta decisiva") — **não** a "timeout" de `[DK]` §2–6, que `01_NUCLEO` §5 misturava com a análise de blocos (correção registrada em §10).

### 7.2 Análise dos quatro blocos

Os candidatos de comprimento `q = |Φ_θ| + 1` particionam-se pelos dois primeiros bits: `00…, 01…, 10…, 11…`.

**Lema 7.1 (blocos 00/01 — nível B, condicionado a (P4)(P6)).** Se `w` começa por `00` ou `01`: `ℕ ⊨ Φ_θ^w` e `T ⊢ Φ_θ^w` com prova `≤ a(|θ|+q)+c`.
*Prova.* `Φ_θ(x) → (10 ⊆_e x ∨ 11 ⊆_e x) → bin(x)` começa por `1`; por Lema 2.2(1) nenhum `x ≥ 1` está em `Cyl(w)`. Logo o corpo de `Φ^w` é válido trivialmente (`Φ_θ(x) → ¬(w ⊆_e x)` é lógica proposicional sobre o primeiro bit + (P4)). ∎

**Lema 7.2 (bloco 10 — nível C, é o coração: (P4)(P7)).** Se `w` começa por `10`: em `Cyl(w)` vale `¬(11 ⊆_e x)` e `(10 ⊆_e x)`, logo `Φ_θ(x) ⟺ ¬θ` **constante no cilindro**. Portanto:

1. `ℕ ⊨ Φ_θ^w ⟺ ℕ ⊨ θ` (se `θ`: nenhum elemento no cilindro; se `¬θ`: o cilindro é infinito e cofinal — Lema 2.2(2) — e todo grande `x` dele satisfaz `Φ_θ`);
2. `T ⊢ (Φ_θ^w ↔ θ)` com prova `≤ a(|θ|+q)+c`: direção `θ → Φ_θ^w` (hipótese `θ` mata o corpo); direção `¬θ → ¬Φ_θ^w` (para cada `y`, exibir `x > y` no cilindro — aritmética elementar via (P4) — com `Φ_θ(x)` usando a hipótese `¬θ`).

Em particular **`T ⊢ Φ_θ^{w*} → θ` e `T ⊢ θ → Φ_θ^{w*}` são puramente sintáticas** — nenhuma correção entra aqui.

**Lema 7.3 (bloco 11 — nível C via (P5)).** Se `w` começa por `11`: `ℕ ⊭ Φ_θ^w`; logo, se `T` é correta, `T ⊬ Φ_θ^w`.
*Prova.* `Cyl(w)` infinito e cofinal (Lema 2.2(2)) e `(11 ⊆_e x)` satisfaz `Φ_θ(x)` em todo ele; logo para todo `y` há `x > y` com `Φ_θ(x) ∧ w ⊆_e x` — `Φ_θ^w` falsa. (H-som) por contrapositiva. ∎ — **Aqui, e só aqui, entra correção de `T` nesta seção.**

**Corolário 7.4 (localização de `j*` e cotas de `ρ` — Nível C; obrigações 1–7).** Supondo `T` correta e (P4)–(P8):

1. **`T ⊢ θ`:** blocos 00/01 prováveis (L7.1), bloco 10 provável (L7.2), bloco 11 não-provável (L7.3). Logo
   `j*_T(Φ_θ) = índice de 11·0^{|Φ_θ|−1}` (primeiro candidato do bloco 11) e `j*_T(Φ_θ) = 3·2^{q−2}`,
   `ρ_T(Φ_θ) = max{ℓ_T(Φ_θ,w) : w ∈ blocos 00/01/10}`, com
   `s_T(θ) − a(|θ|+q) − c  ≤  ρ_T(Φ_θ)  ≤  s_T(θ) + a(|θ|+q) + c`.
   (Superior: cada coordenada é ou trivial (`≤ a(|θ|+q)+c`) ou `≤ s_T(θ) + a(|θ|+q)+c` (prova de `θ` + equivalência, L7.2). Inferior: `ℓ_T(Φ_θ,w*) ≥ s_T(θ) − a(|θ|+q) − c`, pois de uma prova de `Φ_θ^{w*}` extrai-se uma de `θ` concatenando com `Φ_θ^{w*} → θ`.)
2. **`T ⊬ θ`:** bloco 10 **não-provável por sintaxe** — de `T ⊢ (Φ_θ^w ↔ θ)` (L7.2) e `T ⊬ θ` segue `T ⊬ Φ_θ^w` para todo `w` do bloco 10 (caso contrário `T ⊢ θ`). **CORREÇÃO DE ATAQUE (27/09/2026):** a redação anterior ("bloco 10 falso (L7.2) → não-provável por (H-som)") pressupunha `ℕ ⊭ θ`, o que **não é justificado** por `T ⊬ θ` (θ pode ser verdadeiro-não-provável, ex.: `θ = Con(T)`); o caminho sintático dispensa (H-som) aqui e dá a mesma conclusão. Logo `j*_T(Φ_θ) = índice de w* = 10^{|Φ_θ|}` (primeiro candidato do bloco 10) e `ρ_T(Φ_θ) ≤ a(|θ|+q)+c` (só entram os blocos 00/01, que são prováveis com prova curta).

**Procedimento de decisão (sustenta `Thm(T) ≤_T R_T`; Nível C).** Dada `θ`: calcular `Φ_θ`, `L := |Φ_θ|`; pedir `R_T(L)` (ou `R_T^Σ(L)` — §8); buscar prova de `Φ_θ^{w*}` de tamanho `≤ R_T(L)`. Se `T ⊢ θ`: `T ⊢ Φ_θ^{w*}` (L7.2) logo `índice(w*) < j*_T(Φ_θ)` e `ℓ_T(Φ_θ,w*) ≤ ρ_T(Φ_θ) ≤ R_T(L)` (a localização exata de `j*` **não** é necessária aqui — basta `w*` ser provável) → acha. Se `T ⊬ θ`: de `T ⊢ (Φ_θ^{w*} → θ)` (L7.2) e `T ⊬ θ` segue `T ⊬ Φ_θ^{w*}` — **caminho sintático, sem (H-som)** (**CORREÇÃO DE ATAQUE 27/09/2026**: a redação anterior via "falsidade de `Φ_θ^{w*}` + (H-som)" pressupunha `ℕ ⊭ θ`, injustificado; ver §7.6, achado 4). Busca finita + `θ ↦ Φ_θ` computável ⟹ `Thm(T) ≤_T R_T` (**Proposição C2.6 mostra que esta redução não usa (P5) nem linearidade de (P7)**). A direção `R_T ≤_T Thm(T)` é enumeração finita com oráculo (núcleo §6(ii), nível B). **Consequência (Nível C):** `R_T ≡_T Thm(T) ≡_T ∅'` para `T ∈ {S¹₂, PA}` — com (P5) visível **apenas** em `∅' ≤_T Thm(T)` (completude Σ₁) e em L7.3; ver isolamento em §7.6.

### 7.3 Obrigações da Etapa 7 (lista fechada)

Status do Ciclo 2 (27/09/2026): cada item recebe veredito em **§7.6** (ataque + provas).

1. `|Φ_θ| ≤ a|θ|+b` — **já imediata** na versão bloco (D11); formalizada na Proposição C2.1 — **FECHADA (B)**;
2. uniformidade de `(θ,w) ↦ Φ_θ^w` em p-tempo, com `|Φ_θ^w| ≤ a'|Φ_θ| + |w| + b'` ((P2)/(P7)) — **FECHADA (B) sob a nova hipótese explícita (P7a)** (Proposição C2.1);
3. Lema 7.1 formalizado (provas triviais curtas) — **(P6)** — **CONDICIONADA a (P4′)** (Proposição C2.2);
4. Lema 7.2 formalizado com custo linear — **(P7)** — núcleo da transferência — **PARCIAL: semântica FECHADA (B), sintática CONDICIONADA a (P7)/(P4′)** (Proposições C2.3 e C2.4);
5. Lema 7.3 formalizado, com o uso de **(H-som)** isolado e citado — **FECHADA (C)** (Proposição C2.5);
6. classe sintática: `Φ_θ ∈ Σᵇ₁ ⟺ θ ∈ Πᵇ₁` (§4.3, §8) — **PARCIAL: direção `θ ∈ Πᵇ₁ ⇒ Φ_θ ∈ Σᵇ₁` FECHADA (B); uso com `θ` arbitrário = questão aberta D (§4.3), NÃO FECHÁVEL aqui** (Proposição C2.7);
7. combinar 1–6 nas desigualdades do Corolário 7.4 e no procedimento de decisão; então `M_T(m) ≤ R_T^Σ(a·m+b)+c` — **FECHADA com duas correções de escopo** (Proposições C2.6 e C2.8): (i) o caso `T ⊬ θ` é sintático (corrigido em §7.2); (ii) a escala com `R_T^Σ` vale **só para `θ ∈ Πᵇ₁`**; a versão irrestrita usa `R_T` (ver §7.6, achado 7);
8. **Q3 — equivalência de intervalo (`θ ∈ A ⟺ B_T(Φ_θ) ∩ I_θ ≠ ∅`) e versão `Σ₁ᵇ`** (obrigação citada em `rem:disagree` (i) e no trabalho futuro do `paper` §8): — **ENUNCIADA em §7.7 (27/09/2026)** — Teorema Q3.C fechado **na banda** sob (P4′)/(P7a)/(P5) com constantes explícitas; Q3.1/Q3.2 seguem **ABERTAS** fora da banda (redução `x ↦ θ_x` na banda, `b₂` uniforme — F5/F6, questão D).

### 7.4 Alternativa registrada: gadget "timeout" (não padrão)

`Φ_θ(x) := (1 ⊆_e x) ∧ NH_θ(x)`, com `NH_θ(x)` = "o processo de busca `Search_T(θ)` não parou após `|x|` passos" (`Δᵇ₁` uniformemente em `θ`; `[DK]` linhas 2700–2740).

- **Vantagem única:** `Φ_θ ∈ Δᵇ₁ ⊆ Σᵇ₁` para **todo** `θ` (`θ` não aparece sintaticamente) — dispensa a restrição `θ ∈ Πᵇ₁` da §4.3;
- **Obrigação extra que a versão bloco não tem:** formalizar em `T` que (i) o busca para em `t₀` dado o testemunho `p₀` com prova `poly(|p₀|)` (indução `Σᵇ₁` sobre o laço, custo `poly(log t₀)`), e (ii) a extração `s_T(θ) ≤ ℓ_T(Φ^{w*}) + poly` a partir de `Φ^{w*}` — ambas exigem o custo da simulação de máquina, **não** fornecido por lógica proposicional pura. `[DK]` linha 2858 afirma a verificação "desse cálculo finito" sem dar o custo — é a obrigação em aberto.
- **Análise de blocos correta da timeout** (serve de correção): `0*` triviais ✓; **todos** os candidatos que começam com `1` satisfazem `Φ_θ^w ↔ θ` (não só o bloco 10). Logo se `T ⊢ θ`: `j* = k_Φ` (nenhum candidato não-provável — o bloco 11 **não** é falso aqui!); se `T ⊬ θ`: `j* = índice de w*`. A conclusão "`j*` = primeira palavra do bloco 11" do `01_NUCLEO` §5 (linha 123 antiga) era **falsa para timeout** e é verdadeira para bloco — a inconsistência que motivou D11 (log em §10).

### 7.5 Polaridade e o projeto Gödel (mantido, ajustado)

O gadget "padding" do projeto Gödel, `Φ_T(x) = ∃p,z[Prf_T(p,⊥) ∧ x = pad(w*,p,z)]`, satisfaz `Φ_T^{w*} ↔ T ⊬ θ` (polaridade **invertida**); o caso `θ = ⊥` é o Lema 3 (`Φ_T^{w*} ↔ Con(T)`), provado em Lean (`Gödel\lean4\Gothic_Generators\Core.lean`, `lemma3_con`). O espectro usa polaridade **positiva** (`ρ` grande ↔ `T ⊢ θ`). Ver `04_CONTINUIDADE.md` §2.

### 7.6 Ciclo 2: ataque e fechamento parcial das obrigações 2–7 (27/09/2026)

Protocolo seguido: **fase de ataque antes das provas** (8 achados), depois as proposições. Vereditos: **FECHADA** = prova completa sob as hipóteses nomeadas; **CONDICIONADA** = falta uma hipótese explícita que se isolou; **PARCIAL** = uma direção fechada, outra não; **NÃO FECHÁVEL aqui** = exige trabalho fora do alcance desta auditoria (apontado, não certificado).

**Achados do ataque (8):**

1. **(ob. 2) A linearidade de `|Φ_θ^w|` não é automática.** Com a assinatura `{0,S,+,·,<}` e numerais unários, embutir `w` em `Φ^w` custa `Θ(2^{|w|})` (o valor `⟨w⟩` tem numeral de comprimento exponencial) e o limite `a'|Φ_θ|+|w|+b'` **falha**. O que salva é um dispositivo de embutimento linear: na assinatura de Buss (D2), os termos `t_w := ((1#b₀)#b₁)#…#b_{q−1}` (um `#` por bit) têm tamanho `O(|w|)` e `bin(t_w) = w`. Registrado como **(P7a)** — nova hipótese explícita; nota bibliográfica: conferir em `[K23]` §2 a presença de `#`.
2. **(ob. 3–4) `(P4)` não implica `(P7)`.** `(P4)` declara *definibilidade* de `⊆_e` em `S¹₂`; as obrigações exigem *tamanhos de prova* `O(|θ|+|w|)` em `T`. Definibilidade sem cota de tamanho não fecha nada. Reforço registrado: **(P4′)** abaixo. Sem formalização assistida por máquina, (P4′) não se fecha aqui — **pendência apontada** (infraestrutura Lean do projeto Gödel é reaproveitável).
3. **(ob. 5) `(H-som)` tem exatamente uma ocorrência na §7** (verificada linha a linha): a contrapositiva `ℕ ⊭ φ ⇒ T ⊬ φ` em L7.3(b) (e o que dela deriva: Cor 7.4, caso A). Nenhuma outra: L7.1 (proposicional), L7.2 (semântica ordinária + (P4′)), caso B e procedimento são sintáticos (achado 4).
4. **(ob. 7) Erro real no caso `T ⊬ θ`** — corrigido em §7.2. A premissa "bloco 10 falso" não decorre de `T ⊬ θ` (θ pode ser verdadeiro-não-provável, ex.: `Con(T)`); o caminho sintático (`T ⊢ (Φ^w ↔ θ)` + `T ⊬ θ` ⇒ `T ⊬ Φ^w`) dá a mesma conclusão e **dispensa (H-som)**.
5. **(ob. 7) `Thm(T) ≤_T R_T` não usa `(P5)` nem linearidade de `(P7)`** (Proposição C2.6): completude usa só existência de `T ⊢ (θ → Φ^{w*})` + `ρ ∈ S_T(L)`; soundness é sintática. `(P5)` fica para L7.3 e para `∅' ≤_T Thm(T)` (completude Σ₁).
6. **(ob. 6) "Pertencimento de classe" é convenção-livre.** Para `θ` limitado, os dois lados do `⟺` colapsam (padding `Δ₀` trivializa qualquer lado). Para `θ` arbitrário, o lado operativo é literal: `R_T^Σ` exige `Φ_θ ∈ Σᵇ₁` **literal** (pois `ρ_T` é calculado sobre a fórmula literal — fórmulas equivalentes têm comprimentos de prova diferentes). O `⟺` se sustenta só "até equivalência em `S¹₂`" (Proposição C2.7(b)); o uso com `θ` arbitrário reduz-se à questão aberta D (§4.3) — **NÃO FECHÁVEL aqui**.
7. **(ob. 7) Escopo `R_T^Σ` na escala.** `M_T(m) := max{s_T(θ) : T ⊢ θ, |θ| ≤ m}` é **irrestrito** (01_NUCLEO §exemplos), mas `ρ_T(Φ_θ) ≤ R_T^Σ(|Φ_θ|)` exige `Φ_θ ∈ Σᵇ₁` ← `θ ∈ Πᵇ₁`. Logo `M_T(m) ≤ R_T^Σ(a·m+b)+c` (como em 03 item 12 e §7.3 item 7) só vale **restrito a `θ ∈ Πᵇ₁`**; a versão irrestrita usa `R_T`. As duas estão em C2.8.
8. **(ob. 7) A forma anunciada da escala tem slack linear.** A derivação real dá `M_T(m) ≤ R_T(a·m+b) + c₁·m + c₂` — o termo linear vem do custo da equivalência `Φ^{w*} ↔ θ` na extração `s_T(θ) ≤ ρ + a(|θ|+q)+c`. Absorver `c₁·m` no argumento de `R_T` exigiria `R_T(L) ≥ Ω(L)`, **não estabelecido**. A forma `R_T(a·m+b)+c` só vale sob essa hipótese extra. Registrada a divergência com `03` item 12 e `01_NUCLEO` §exemplos.

**Hipóteses novas explicitadas (as lacunas nomeadas):**

> **(P4′)** (reforço de (P4), para ob. 3–4): em `T`, as instâncias seguintes têm provas de tamanho `O(|w|+|θ|+1)`: (i) `w ⊆_e x` com `w` começando por `0` e `|w| ≥ 2` ⇒ `¬(w ⊆_e x)` para todo `x`; (ii) `w ⊆_e x` com `w = 10v` ⇒ `10 ⊆_e x ∧ ¬(11 ⊆_e x)`; (iii) cofinalidade: `∀y ∃x>y (w ⊆_e x)` para `w` começando por `1`. (Sem cota de tamanho, `(P4)` é só definibilidade e as obrigações 3–4 ficam condicionadas.)
>
> **(P7a)** (novo, para ob. 2): a assinatura (D2) contém dispositivo de embutimento linear de `w` — ex.: `#` de Buss com os termos `t_w` acima — de modo que `(θ,w) ↦ Φ_θ^w` é linear em `|θ|+|w|`.

**Proposições.**

**Proposição C2.1 (uniformidade, admissibilidade e linearidade — nível B, sob (P7a); obrigações 1–2 + implícita).**
(i) `θ ↦ Φ_θ` é computável em tempo `O(|θ|)` com `|Φ_θ| ≤ |θ| + κ₀` (κ₀ = tamanho do template de D11) — **obrigação 1 formalizada**: `a = 1`, `b = κ₀`.
(ii) `Φ_θ` é **admissível** (D4): `θ` é sentença, `x` é a única variável livre (a `y` de `∃y` está presa); e `q(Φ_θ) = |Φ_θ|+1 ≥ 2` (pois `|Φ_θ| ≥ 1`) — daí os blocos `00/10/11` existirem. **Obrigação implícita, antes não listada.**
(iii) `(θ,w) ↦ Φ_θ^w` é computável em `O(|θ|+|w|)` com `|Φ_θ^w| ≤ |Φ_θ| + c₁|w| + κ₁` (`c₁` = custo por bit do `t_w` + átomos fixos).
(iv) Para as instâncias do gadget (`|w| = q(Φ_θ)`), vale a forma exata pedida: `|Φ_θ^w| ≤ a'|Φ_θ| + |w| + b'` com `a' = c₁` e `b' = c₁ + κ₁ − 1`.

*Prova.* (i) `Φ_θ` é o template fixo `(11 ⊆_e x) ∨ (¬θ ∧ (10 ⊆_e x))` com `θ` copiado literalmente após o símbolo `¬`; logo `|Φ_θ| = |θ| + κ₀` para a constante `κ₀` do template (em particular `≤ |θ| + κ₀`), e o tempo é o da cópia + concatenação: `O(|θ|)`. (ii) Variáveis livres em `Φ_θ(x)`: `θ` é sentença (sem livres), os `x` dos átomos são a única ocorrência livre de `x` — **exatamente** `x` ✓ (D4). `|Φ_θ| ≥ 1` pois toda string de fórmula é não vazia ✓, logo `q = |Φ_θ|+1 ≥ 2` ✓. (iii) com (P7a): `Φ_θ^w` é o template com `Pre(t_w, x)` embutido; `|t_w| ≤ c₁|w|` (um `#` por bit); os demais símbolos são `O(|Φ_θ|+1)`; o tempo é o da concatenação de strings: `O(|θ|+|w|)`. (iv) substituição de `|w| = |Φ_θ|+1`: `|Φ_θ| + c₁(|Φ_θ|+1) + κ₁ = (1+c₁)|Φ_θ| + (c₁+κ₁)`; comparando com a forma pedida `(a'+1)|Φ_θ| + 1 + b'`, toma-se `a' = c₁` e `b' = c₁+κ₁−1`. ∎ — **Sem (P7a), (iii) falha** (achado 1).

**Proposição C2.2 (Lema 7.1 formalizado — semântica FECHADA (B); sintática CONDICIONADA a (P4′); obrigação 3).** Para `w` começando por `00` ou `01` (com `|w| = q ≥ 2`): (a) `ℕ ⊨ Φ_θ^w` **[FECHADO]**; (b) `T ⊢ Φ_θ^w` com prova `≤ a(|θ|+q)+c` **[CONDICIONADO a (P4′)(i)]**.

*Prova.* (a) Para `|w| ≥ 2` começando com `0`: `bin(x)` tem comprimento 1 só para `x = 0` e `bin(0) = "0"` não tem `w` como prefixo; logo `Cyl(w) = ∅` e `∀x ¬(w ⊆_e x)` vale — daí `Φ_θ^w` com `y = 0` ✓ (nota: melhor que "Cyl(w) ⊆ {0}" do Lema 2.2(1): aqui `= ∅`). (b) Em `T`: por (P4′)(i), `T ⊢ ∀x ¬(w ⊆_e x)` com prova `O(q)`; daí `T ⊢ ∀x(Φ_θ(x) → ¬(w ⊆_e x))` (implicação fraca, lógica proposicional) e `T ⊢ ∃y∀x>y(…)` por `y := 0`; tamanho `O(q) ≤ a(|θ|+q)+c` ✓. ∎

**Proposição C2.3 (Lema 7.2 — direção semântica; nível B; obrigação 4a).** Para `w = 10v` (`|w| = q ≥ 2`): `ℕ ⊨ Φ_θ^w ⟺ ℕ ⊨ θ`.

*Prova.* Em `Cyl(w)` valem `10 ⊆_e x` e `¬(11 ⊆_e x)` (prefixos distintos de mesmo início), logo `Φ_θ(x) ↔ ¬θ` é **constante no cilindro**.
(⇐ com θ verdadeiro) Para qualquer `y` e qualquer `x > y`: se `w ⊆_e x` então `Φ_θ(x) ↔ ¬θ = falso`, logo o corpo `Φ_θ(x) → ¬(w ⊆_e x)` vale; `ℕ ⊨ Φ_θ^w` ✓.
(⇒ com ¬θ verdadeiro) Dado `y`, pelo Lema 2.2(2) existe `x > y` com `w ⊆_e x`; nesse `x`: `10 ⊆_e x` ✓ e `¬θ` ✓ logo `Φ_θ(x)` ✓; logo `∀y∃x>y(Φ_θ(x) ∧ w ⊆_e x)`, que é `¬Φ_θ^w`; logo `ℕ ⊭ Φ_θ^w` ✓. ∎ — Só usa aritmética ordinária + Lema 2.2(2); **nenhuma hipótese de `T`**.

**Proposição C2.4 ((P4′) ⟹ (P7) — estrutura da direção sintática; CONDICIONADA a (P4′); obrigação 4b).** Sob (P4′), para `w = 10v`: `T ⊢ (Φ_θ^w ↔ θ)` com prova `≤ a(|θ|+q)+c`, em ambas as direções.

*Prova (estrutura — o único insumo externo é (P4′)).*
`θ → Φ_θ^w`: hipótese `θ`; para `x` qualquer, se `w ⊆_e x` então por (P4′)(ii) `¬(11 ⊆_e x)`, e com `θ` o segundo disjuntivo de `Φ_θ` é falso; logo `Φ_θ(x) → ¬(w ⊆_e x)` ✓; generalize e introduza `∃y` ✓. Tamanho `O(q) + O(1)`.
`¬θ → ¬Φ_θ^w`: `¬Φ_θ^w` é `∀y∃x>y(Φ_θ(x) ∧ w ⊆_e x)`; dado `y`, por (P4′)(iii) existe `x > y` com `w ⊆_e x`; para esse `x` vale `10 ⊆_e x` (ii) e `¬θ` (hipótese), logo `Φ_θ(x)` ✓. Tamanho `O(q) + O(1)`.
Ambos `≤ a(|θ|+q)+c` ✓. ∎ — **(P7) é derivável de (P4′) por esta derivação; o que falta é (P4′) em si** (cotas de prova em `T` para três esquemas — formalização pendente, apontada no achado 2).

**Proposição C2.5 (Lema 7.3 + isolamento de (H-som) — nível C; obrigação 5).** Para `w` começando por `11`: (a) `ℕ ⊭ Φ_θ^w` **[FECHADO (B)]**; (b) se `T` é correta ((P5) = (H-som)), `T ⊬ Φ_θ^w` **[contrapositiva única de (H-som)]**; (c) **isolamento**: nas linhas de §7.1–§7.5 e no Cor 7.4, `(H-som)` ocorre exatamente em (b) — L7.1, L7.2 (= C2.2–C2.4), caso B e procedimento são semântica ordinária ou sintaxe pura.

*Prova.* (a) Por `y` qualquer, Lema 2.2(2) dá `x > y` com `w ⊆_e x`; então `11 ⊆_e x` e o primeiro disjuntivo de `Φ_θ(x)` vale logo `Φ_θ(x) ∧ w ⊆_e x`; logo `ℕ ⊭ Φ_θ^w` ✓. (b) (H-som): `T ⊢ φ ⇒ ℕ ⊨ φ`; contrapositiva com (a) ✓. (c) verificação de ocorrência: L7.1 usa tautologia + (P4′); L7.2 semântica = C2.3 (matemática ordinária) e sintática = C2.4 ((P4′)); caso B de Cor 7.4 é sintático (§7.2 corrigido); o procedimento de decisão é sintático (C2.6); a localização `j* = 3·2^{q−2}` do caso A usa (b) ✓ — **esta é a ocorrência**. Fora da §7: `∅' ≤_T Thm(T)` (completude Σ₁) também usa (H-som) — registrado. ∎

**Proposição C2.6 (procedimento de decisão: `Thm(T) ≤_T R_T` sem (P5) e sem linearidade — nível C; obrigação 7, parte 1).** Redução: `θ ↦ (Φ_θ, L := |Φ_θ|)` em p-tempo (C2.1, com `L ≤ a₈|θ|+b₈` por (P8)); consulta `R_T(L)`; enumeração de todas as provas `π` com `|π| ≤ R_T(L)` buscando `Prf_T(π, Φ_θ^{w*})`; resposta "sim" sse achar. Esta redução é total e correta **usando apenas**: `Φ_θ` admissível (C2.1(ii)), existência de `T ⊢ (θ → Φ_θ^{w*})` e de `T ⊢ (Φ_θ^{w*} → θ)` (família (P7), qualquer tamanho) e `ρ_T(Φ_θ) ∈ S_T(|Φ_θ|)`. **(P5) e linearidade não são usados.**

*Prova.* Terminação: busca finita ✓. Completude: `T ⊢ θ` ⇒ `T ⊢ Φ_θ^{w*}` ⇒ `índice(w*) < j*_T(Φ_θ)` ⇒ `ℓ_T(Φ_θ,w*) ≤ ρ_T(Φ_θ) ≤ R_T(|Φ_θ|)` ⇒ acha ✓. Soundness: `T ⊬ θ` ⇒ `T ⊬ Φ_θ^{w*}` (pois `T ⊢ (Φ_θ^{w*} → θ)`; caso contrário `T ⊢ θ`) ⇒ não existe `π` algum, logo não acha ✓. ∎ — Complementos (níveis): `R_T ≤_T Thm(T)` por enumeração com oráculo (núcleo §6(ii)); `Thm(T) ≤_T ∅'` (r.e.); `∅' ≤_T Thm(T)` pela completude Σ₁ **com (P5)** (θ falso provável destruiria a redução). **`R_T ≡_T ∅'` para `T ∈ {S¹₂,PA}` fica Nível C com (P5) visível só neste passo.**

**Proposição C2.7 (classe sintática do gadget — obrigação 6; PARCIAL).**
(a) **[FECHADO (B)]** Se `θ = ∀z≤t β(z)` com `β ∈ Δ₀` (`θ ∈ Σᵇ₁` na forma literal), então `Φ_θ ∈ Σᵇ₁` literal, com
`Φ_θ(x) ↔ ∃z ≤ t⁺ [ (z = t⁺ ∧ A(x)) ∨ (z ≤ t ∧ ¬β(z) ∧ B(x)) ]`,
com `t⁺ := t+1`, `A(x) := "11 ⊆_e x"`, `B(x) := "10 ⊆_e x"` — `A, B ∈ Δ₀` (testes de dígitos de `bin(x)` em posições fixas 0,1; casamento sobre `x mod 4 < 4`, limitado ✓).
(b) **[FECHADO (B) sob convenção de representabilidade]** Sob pertencimento "até equivalência em `S¹₂`": `Φ_θ ∈ Σᵇ₁ ⟺ θ ∈ Πᵇ₁` (ambos representáveis).
(c) **[NÃO FECHÁVEL aqui — questão aberta D, §4.3]** Para `θ` arbitrário e uso em `R_T^Σ`, o pertencimento é **literal** (`ρ_T` depende da fórmula literal); a transferência `Thm(T) ≤_T R_T^Σ` fica sólida para `θ ∈ Πᵇ₁` e o caso geral é `Thm(T) ∩ Πᵇ₁` ser `∅'`-duro — aritmética limitada profunda, fora desta auditoria; saída registrada: gadget timeout (§7.4).

*Prova.* (a) caso split `z = t⁺` / `z ≤ t` é proposicional: com `z = t⁺` o primeiro disjuntivo recupera `A(x)`; com `z ≤ t` e `¬β(z)` (equivalente a `¬θ` por negação de `∀` limitado) recupera o segundo. Limites polinomiais ✓. (b) (⟸) = (a) mais substituição de constante (preserva `Δ₀`); (⇒) fixar `x₀ := ⟨10⟩ = 2`: `10 ⊆_e 2` ✓, `¬(11 ⊆_e 2)` ✓, logo `Φ_θ(2) ↔ ¬θ` — `¬θ` é `Σᵇ₁`-representável (substituição em `Φ_θ ∈ Σᵇ₁`) ⟺ `θ ∈ Πᵇ₁`-representável ✓. ∎ — Colapso do padding (achado 6): para `θ ∈ Δ₀`, `∃z≤0(θ ∧ z=z)` pertence a ambas as classes literalmente — daí a convenção.

**Proposição C2.8 (combinação: Cor 7.4 + escala — nível C com (P5)–(P8); obrigação 7, parte 2; com as correções de escopo 7–8).** Sob (P5)–(P8), D11 e C2.1:
**(A) `T ⊢ θ`:** `j*_T(Φ_θ) = 3·2^{q−2}` (primeira palavra do bloco 11) e `s_T(θ) − a₇(|θ|+q) − c₇ ≤ ρ_T(Φ_θ) ≤ s_T(θ) + a₇(|θ|+q) + c₇`.
**(B) `T ⊬ θ`:** `j*_T(Φ_θ) = índice(w*) = 2^{q−1}` e `ρ_T(Φ_θ) ≤ a₇(|θ|+q) + c₇` — **caminho sintático (correção do achado 4)**.
**(C) Escala (forma derivada, com slack — achado 8):** com `M_T(m) := max{s_T(θ) : T ⊢ θ, |θ| ≤ m}`, `(P8): |Φ_θ| ≤ a₈|θ|+b₈`:
- **irrestrita:** `M_T(m) ≤ R_T(a₈·m + b₈) + a₇(1+a₈)·m + [a₇(b₈+1) + c₇]`;
- **restrita `θ ∈ Πᵇ₁`:** o mesmo com `R_T^Σ` no lugar de `R_T` (por C2.7(a), `Φ_θ ∈ Σᵇ₁`).
A forma `M_T(m) ≤ R_T(a·m+b)+c` (sem slack) vale **só** sob `R_T(L) ≥ Ω(L)` — não estabelecido.

*Prova.* (A) Blocos `00/01` prováveis (C2.2), `10` prováveis (`T ⊢ θ` + `θ → Φ^w`, C2.4), `11` não-prováveis (C2.5(b)) ⇒ o primeiro não-provável é a primeira palavra `11·0^{q−2}`, de índice binário `3·2^{q−2}` ✓. Superior: cada coordenada de bloco `00/01` tem prova `≤ a₇(|θ|+q)+c₇` (C2.2); de bloco `10`, `≤ s_T(θ) + a₇(|θ|+q)+c₇` (prova de `θ` + `θ → Φ^w`) ⇒ máximo ≤ `s_T(θ)+a₇(|θ|+q)+c₇` ✓. Inferior: `w*` é provável logo `índice(w*) < j*` logo `ρ ≥ ℓ_T(Φ_θ,w*)`; de uma prova de `Φ_θ^{w*}` extrai-se uma de `θ` concatenando com a prova de `Φ_θ^{w*} → θ` (C2.4) ⇒ `s_T(θ) ≤ ℓ_T(Φ_θ,w*) + a₇(|θ|+q)+c₇` ⇒ `ℓ ≥ s_T − a₇ − c₇` ✓. (B) `T ⊬ θ` ⇒ `T ⊬ Φ_θ^w` para todo `w` do bloco 10 (C2.6 soundness, mesmo argumento) ⇒ primeiro não-provável é `w*` (índice `2^{q-1}`), pois `00/01` seguem prováveis; `ρ` só alcança `00/01` ⇒ `ρ ≤ a₇(|θ|+q)+c₇` ✓. (C) Dado `T ⊢ θ`, `|θ| ≤ m`: por (A), `s_T(θ) ≤ ρ_T(Φ_θ) + a₇(|θ|+q)+c₇`; `ρ_T(Φ_θ) ≤ R_T(|Φ_θ|) ≤ R_T(a₈m+b₈)` (`R_T` não decrescente por definição); `q = |Φ_θ|+1 ≤ a₈m+b₈+1`; substituindo: `s_T(θ) ≤ R_T(a₈m+b₈) + a₇(m + a₈m+b₈+1) + c₇ = R_T(a₈m+b₈) + a₇(1+a₈)m + a₇(b₈+1)+c₇` — **uniforme em `θ`**, e o conjunto `{θ : T ⊢ θ, |θ| ≤ m}` é finito, logo vale para o máximo ✓. Versão `Σᵇ₁`: para `θ ∈ Πᵇ₁`, `Φ_θ ∈ Σᵇ₁` (C2.7(a)) logo `ρ_T(Φ_θ) ∈ S_T^Σ(|Φ_θ|) ≤ R_T^Σ(...)` ✓. ∎

**Onde isso fica (mapa final do Ciclo 2).** Fechadas (B): ob. 1, admissibilidade, semântica de L7.1/L7.2/L7.3, isolamento estrutural de (H-som), direção `θ ∈ Πᵇ₁ ⇒ Φ_θ ∈ Σᵇ₁`. Condicionaladas com hipótese nomeada: ob. 3–4 sintática ⟵ **(P4′)**; ob. 2 ⟵ **(P7a)**. Não fechável aqui (apontado): (P4′) em si (formalização assistida por máquina — reaproveitar Lean do projeto Gödel) e a questão aberta D (§4.3) para `R_T^Σ` com `θ` arbitrário. Correções aplicadas: caso `T ⊬ θ` (§7.2), procedimento (§7.2), escopo da escala e sua forma (achados 7–8). **Nada disto altera os teoremas locais da §5 — o núcleo permanece intacto.**

### 7.7 Q3: equivalência de intervalo e versão `Σᵇ₁` — enunciado, ataque e plano de formalização (27/09/2026)

**Registro do rótulo.** `Q3` ocorre uma única vez no projeto (`07_CONSEQUENCIA_GLOBAL.md` §6.3 — "enunciar Q3/formalização de (P4′)") **sem definição em qualquer fonte** (varredura `Q\d` no diretório inteiro: só `Q1`, definido no `paper` §6/§8, e esta ocorrência). Registra-se aqui: **Q3 := a pergunta do gadget em duas faces** — (Q3.1) a *equivalência de intervalo* `θ ∈ A ⟺ B_T(Φ_θ) ∩ I_θ ≠ ∅` (condição (i) de `rem:disagree`, `paper` §6; item (4) do trabalho futuro, `paper` §8) e (Q3.2) a sua versão `Σᵇ₁` operacional (`rem:abertas-global` (iv); `07` §5.7). **Não existe `Q2` no projeto** — se a enumeração `Q1/Q2/Q3` for reativada, `Q2` designaria a separação `T₁,T₂` (P-1); registro para não recriar rótulo órfão.

Protocolo: **fase de ataque antes do enunciado** (6 achados), depois os lemas fechados e o plano de formalização. Vereditos: **FECHADA (B)** / **CONDICIONADA (C)** / **ABERTA**.

**Notação.** `c_θ := a₇(|θ|+q(Φ_θ))+c₇` (constantes de C2.8); `n := 2^{|Φ_θ|}`; `u_θ := Φ_θ·0^{n−|Φ_θ|}`; `β₁(n) := a₇(2⌊log n⌋+κ₀+1)+c₇` com `κ₀` do template (D11) — então `c_θ ≤ β₁(n)` pois `|Φ_θ| = |θ|+κ₀ ≥ |θ|`. **Banda:** `2β₁(n) < s_T(θ) ≤ b₂(n) − β₁(n)`.

**Enunciados (ABERTOS).**

- **Q3.1.** Para um problema `A` e família de instâncias `x ↦ θ_x`: projetar `b₁, b₂ : ℕ → ℕ` computáveis, explícitos e `b₁ < b₂` tal que, para `n = 2^{|Φ_{θ_x}|}` e `u_x := Φ_{θ_x}·0^{n−|Φ_{θ_x}|}`: `x ∈ A ⟺ B_T(Φ_{θ_x}) ∩ (b₁(n), b₂(n)] ≠ ∅ ⟺ u_x ∈ DISAGREE_{b₁,b₂}`, com `θ_x` na banda. A conclusão pretendida é `A ≤_m DISAGREE_{b₁,b₂}` (redução m, **Nível C**, condicionada a (P4′)/(P7a)).
- **Q3.2.** A mesma equivalência com `θ ∈ Πᵇ₁` **literal** e `Φ_θ ∈ Σᵇ₁` (C2.7(a)) — leitura na camada `Σᵇ₁`, compatível com `S_T^Σ`/`R_T^Σ` (C2.8(C)). Para `θ` arbitrário: questão aberta D (§4.3).

**Fase de ataque — 6 achados (antes de enunciar as provas):**

1. **A1 — sem banda, a bicondicional não fecha.** C2.8 dá só desigualdades: `T ⊬ θ ⇒ ρ ≤ c_θ` (sem falsos positivos) e `T ⊢ θ ⇒ s_T(θ) − c_θ ≤ ρ ≤ s_T(θ) + c_θ`. Contraexemplo de método: um `θ` **provável** com provas baratas de `Φ_θ^w` (todos os registros `≤ c_θ`) é **indistinguível** de `T ⊬ θ` pela janela — falso negativo. A janela `(β₁(n), b₂(n)]` separa os dois casos **só** na banda acima.
2. **A2 — `b₂` não é uniforme: não há cota recursiva de prova curta.** Se existisse função recursiva `f` com `s_T(θ) ≤ f(|θ|)` para todo `θ` provável, decidir-se-ia `Thm(T)` enumerando todas as provas `≤ f(|θ|)` — contradiz a indecidibilidade de `Thm(S¹₂)`/`Thm(PA)`. Logo nenhum `b₂` recursivo cobre **todas** as instâncias: ou restringir a instâncias com verificador de tamanho controlado (F5), ou resolver a bomba de banda (F6). Separadamente, as constantes `a₇, c₇` de `β₁` são **existenciais** — a redução exige versões **explícitas** (saída obrigatória da formalização, F1–F4).
3. **A3 — cilindro (resolvido).** A leitura intervalar vale só com `Form_n(u)` definida (senão `g` devolve `0^{n+1}` em ambos os orçamentos e `u ∉ DISAGREE` sempre). Escolha explícita: `n := 2^{|Φ_θ|}` dá `|Φ_θ| = ⌊log n⌋` ✓, `Φ_θ ⊆_e u_θ` (prefixo) ✓, admissibilidade (C2.1(ii)) ✓, unicidade por código livre de prefixo (Lema 2.1) ⇒ `Form_n(u_θ) = Φ_θ` ✓.
4. **A4 — o gadget codifica só provabilidade.** `θ ↦ Φ_θ` não distingue `A` de `Thm(T)`: o lado esquerdo de Q3.1 exige uma redução `x ↦ θ_x` com `x ∈ A ⟺ θ_x` provável **na banda**; o gadget fornece só a segunda metade. Decomposição registrada: **Q3.1 = (redução para a banda) + (Teorema Q3.C abaixo)**.
5. **A5 — pay-off barrado para NP (já no paper).** Para `b(n) = O(log n)`, `DISAGREE` é decidível em p-tempo (Etapa 2) ⇒ `A` NP-completa exigiria `P = NP`; o alvo legítimo é *proof complexity* (`rem:disagree` (ii)). Mantido.
6. **A6 — o testemunho `u_θ` é exponencial em `|θ|`.** `n = 2^{|Φ_θ|}` ⇒ `|u_θ| = 2^{|θ|+O(1)}`: a redução `x ↦ u_x` é **computável** (m-redução no sentido recursão-teórico ✓) mas **não** polinomial — qualquer leitura de dureza em tempo polinomial cai por A5 e aqui também por tamanho de testemunho.

**Lemas fechados aqui (falseáveis).**

**Lema Q3.A (sem falsos positivos — CONDICIONADA (C) a (P4′) e (P7a), com constantes explícitas; sem (P5)).** Se `T ⊬ θ`, então `B_T(Φ_θ) ∩ (β₁(n), ∞) = ∅`; em particular `u_θ ∉ DISAGREE_{b₁,b₂}` para qualquer `b₂ > b₁ = β₁`.
*Prova.* `T ⊢ Φ_θ^{10v} ⇒ T ⊢ θ` (C2.4, direção sintática, sem (P5)) logo, por `T ⊬ θ`, toda palavra do bloco `10` é não-provável e `j* = 2^{q−1}` (índice da primeira palavra `10`); as palavras `j < j*` são `0*`, todas prováveis com `ℓ ≤ a₇(|θ|+q)+c₇ = c_θ ≤ β₁(n)` (C2.2(b) via (P4′)(i)). Os registros são valores `ℓ_j` com `j < j*`, logo todos `≤ β₁(n)`. ∎ — **Critério de refutação:** instância com `T ⊬ θ` e registro `> β₁(n)` refuta C2.8(B)/C2.4/C2.2, i.e. `(P4′)`.

**Lema Q3.B (lado positivo na banda — CONDICIONADA (C) a (P4′)/(P7a); a janela finita exige (P5)).** Seja `T ⊢ θ` na banda. Então: (a) existe registro `> β₁(n)`: `índice(w*) < j*` (pois `w*` é provável) logo `ρ ≥ ℓ_T(Φ_θ,w*) ≥ s_T(θ) − c_θ > 2β₁(n) − c_θ ≥ β₁(n)` (extração de C2.8(A)); (b) com `s_T(θ) ≤ b₂(n) − β₁(n)` **e (P5)**: `ρ ≤ s_T(θ) + c_θ ≤ b₂(n)` — as palavras `0*` têm `ℓ ≤ c_θ` (C2.2), as do bloco `10` `ℓ ≤ s_T + c_θ` (prova de `θ` + `θ → Φ^w`, C2.4) e as do bloco `11` não contribuem por (P5) (C2.5(b)). Logo `B_T(Φ_θ) ∩ (β₁(n), b₂(n)] ≠ ∅`, i.e. `u_θ ∈ DISAGREE_{b₁,b₂}` (Cor 7.1 + injectividade de `Out`, Lema 5.3). ∎ — **Critério de refutação:** instância na banda sem registro na janela refuta C2.8(A), i.e. (P4′)(ii)(iii)/(P5).

**Teorema Q3.C (equivalência de intervalo na banda — fechada sob hipóteses visíveis).** Com `b₁(n) := β₁(n)` (computável e não decrescente **dadas constantes explícitas** de F1–F4) e `b₂` qualquer com `b₂(n) > 2β₁(n)`: (i) `T ⊬ θ ⇒ B_T(Φ_θ) ∩ (b₁(n), b₂(n)] = ∅` (Q3.A); (ii) `T ⊢ θ` e `θ` na banda `⇒ B_T(Φ_θ) ∩ (b₁(n), b₂(n)] ≠ ∅` (Q3.B). Logo **restringindo o domínio da redução à banda**: `θ ∈ Thm(T)` ⟺ `u_θ ∈ DISAGREE_{b₁,b₂}` — **Q3.1 fechada na banda (Nível C, (P4′)/(P7a)/(P5) visíveis); ABERTA fora dela** (A1/A2/A4: redução `x ↦ θ_x` na banda, `b₂` uniforme, bomba de banda).

**Plano de formalização (F1–F6) — (P4′), (P7a) e a banda:**

- **F1 (P4′)(i):** para todo `w` com primeiro dígito `0` e `|w| ≥ 2`: existe prova `p` em `T` de `∀x ¬(w ⊆_e x)` com `|p| ≤ K₁(|w|+1)`. Construção esperada: casamento sobre `bin(x)` nas posições fixas de `w` (mesma forma dos átomos `A, B` de C2.7(a)).
- **F2 (P4′)(ii):** `w = 10v` ⇒ provas `≤ K₂(|w|+1)` de `10 ⊆_e x ∧ ¬(11 ⊆_e x)` (prefixos de mesmo início).
- **F3 (P4′)(iii):** cofinalidade `∀y ∃x>y (w ⊆_e x)` para `w` começando por `1`, com prova `≤ K₃(|w|+1)` — **a não-trivial**: construção `x := ext(w,k)` iterada `k ≈ |w|` passos; provável em `S¹₂` com indução `Σᵇ₁` de comprimento `O(|w|)` (prova linear) — obrigação a ser **exibida**, não assumida.
- **F4 (P7a):** explícito e construtivo: `t_w := ((1#b₀)#b₁)#…`, provar `bin(t_w) = w` e `|t_w| ≤ c·|w|`. Nota bibliográfica pendente (achado 1): conferir `#` em `[K23]` §2.
- **F5 (instâncias com verificador):** para `θ_x` = "o verificador aceita `(x,w)`", provar em `S¹₂` provas de tamanho `poly(|θ_x| + tempo de verificação)` — é o que permite `b₂(n) := (⌊log n⌋)^{k}` e resolve a face superior de A2 **para essa classe de instâncias**.
- **F6 (bomba de banda — ABERTA):** empurrar `s_T(θ') > 2β₁(n)` por padding: candidato `θ' := θ ∧ τ_k` com `τ_k` linear (`0+…+0 = 0`, `k` ocorrências) exigindo provas `Ω(k)` em provas-árvore; **não provado** (depende do sistema de prova fixado) — é o resto exato de Q3.1 fora de F1–F5.
- **Infraestrutura e critério comum:** reaproveitar `Gödel\lean4\Gothic_Generators\Core.lean` (formalização de `Prf`; `lemma3_con`); **saída obrigatória: constantes explícitas `K₁, K₂, K₃, c, a₇, c₇`** (é o que torna `b₁` computável e fecha A2 no lado inferior). **Critério de refutação de F1–F3:** qualquer limitação inferior superlinear para a família `{esquemas}` refuta `(P4′)` — e com ela C2.2, C2.4, Q3.A–C (todo o Nível C condicionado do gadget).

**Q3.2 (versão `Σᵇ₁`).** *Fecha aqui:* `θ ∈ Πᵇ₁ ⇒ Φ_θ ∈ Σᵇ₁` **literal** (C2.7(a)) e escala com `R_T^Σ` restrita (C2.8(C)) — os lemas Q3.A–C valem na camada `Σᵇ₁` substituindo `S_T/R_T` por `S_T^Σ/R_T^Σ` (o `Φ_θ` do gadget é admissível e, para `θ ∈ Πᵇ₁`, pertence a `Σᵇ₁` literal). *Não fecha:* `θ` **arbitrário** (questão D, §4.3 — `ρ_T` é calculado sobre a fórmula literal, não troca por equivalência) e o `b₂` uniforme (A2 ⟵ F5/F6). Saída registrada: gadget **timeout** (§7.4) dispensa a restrição `θ ∈ Πᵇ₁` pagando as obrigações de formalização de máquina.

**Mapa final (Q3).** Q3.1 e Q3.2 **ABERTAS**; fechados: lemas Teorema Q3.C (sob (P4′)/(P7a)/(P5) e constantes explícitas, com critérios de refutação), escolha do cilindro (A3), decomposição (A4) e plano F1–F6. Condicionamentos visíveis: **(P4′)** e **(P7a)** — não fecháveis aqui (formalização assistida por máquina; reaproveitável); **(P5)** só na janela finita de Q3.B. Níveis: **C condicionado / D no resto**. Barreiras mantidas: A5 (NP) e P-4 (imagens/range) intactas — Q3 não produz nenhuma das proibições. **Nada disto altera os teoremas locais — o núcleo permanece intacto.**

---

## 8. Camada `Σᵇ₁`: obrigações de classe (núcleo §9.6 detalhado)

Para `R_T^Σ` e a eventual tradução proposicional (Etapa 14):

1. **`w ⊆_e x` definível em `Σᵇ₁` e `Πᵇ₁`, provavelmente equivalentes em `S¹₂`** — **cumprido como declaração de fonte**: `[K23]` §2 afirma explicitamente para `⊆_e` e concatenação. Formalizar: obrigação menor da Etapa 7.
2. **`(Φ,w) ↦ Φ^w` preserva o que é preciso** — para `R_T^Σ` só se exige `Φ ∈ Σᵇ₁` (a fórmula geradora); `Φ^w` precisa ser sentença, nada mais. A complexidade de `Φ^w` (`∃y∀x>y`…) importa só para a tradução proposicional: `[K23]` §3 mostra que, instanciando `y` por `1^{(n)}`, a tradução de `Φ^w` (com `Φ ∈ Σᵇ₁`) é `Πᵇ₁`. Obrigação **pendente** para Etapa 14, não bloqueia 1–8.
3. **gadget:** `Φ_θ ∈ Σᵇ₁ ⟺ θ ∈ Πᵇ₁` (D10, §4.3) — status e a **face Q3.2** (leitura de intervalo na camada `Σᵇ₁`) em §7.7; alternativa timeout dispensa a hipótese (§7.4).
4. **limites de tamanho uniformes em `θ`** — acompanham (P7)/(P8).

---

## 9. Critério de conclusão da Etapa 1 — verificação

Toda expressão exigida pelo plano tem agora definição inequívoca, apontando para a linha exata:

| Expressão | Definição fechada em |
|---|---|
| `Φ^w` | §3 (definição) + D6 (`⊆_e`) |
| `q(Φ)`, `W_Φ`, `k_Φ` | §3 + **D7 = `|Φ|+1`** (Teorema §3.1) |
| `ℓ_T(Φ,w)` | núcleo §2, com D5 (`|π|`) e D8 (`Prf_T`, (P2)(P3)) |
| `j*_T(Φ)`, `J_{T,Φ}(c)` | núcleo §2 (inambíguos dado `W_Φ`) |
| `ρ_T(Φ)`, `I_T(Φ)`, `B_T(Φ)` | núcleo §2 (só dependem do perfil) |
| `S_T(L)`, `C_T(L)`, `R_T(L)` | núcleo §2 + **"admissível" = D4** + classe = **D10** |
| `F_n` | §5.1 + **Lema 5.2 (igualdade)** |
| `B_b(L)` | núcleo §2 (`= b(2^L)`) + `log = log₂` (D5) |
| `g_T^[b]` | **§5.2** (`Form/Tail/Out/⊥` concretas, D9) + Lema 5.1 |
| `gadget θ ↦ Φ_θ` | **§7.1 (padrão bloco, D11)** + §7.3/§7.4 |

**Etapa 1 concluída** no que diz respeito ao critério do plano. As pendências restantes são das Etapas 2 e 7 (§10), não bloqueiam a redação do texto único do núcleo (Ciclo 1).

---

## 10. Log de decisões, correções aplicadas e pendências

### 10.1 Correções aplicadas nesta sessão (nos outros documentos)

1. **`q(Φ)` fechado** em `|Φ|+1` (D7, §3.1, com erratum aparente de `[K23]` registrado): `01_NUCLEO_DURO.md` §2, `02_REVISAO_CRITICA.md` §1.3 e §5.1, `03_PRONTOS_E_A_FAZER.md` B1.1 atualizados.
2. **Gadget padronizado na versão bloco (D11):** `01_NUCLEO_DURO.md` §5 reconstruído — a versão antiga misturava a construção "timeout" (linhas 113–115) com a análise de blocos (linha 123), cuja conclusão "`j*` = primeira palavra do bloco 11" é falsa para timeout (§7.4). A nota "`w* := 10^{|Φ_θ|}` — depende de fixar q" está resolvida (D7).
3. **`F_n`:** `01_NUCLEO_DURO.md` §7.6 — a igualdade vale (Lema 5.2); o custo de `Form` está provado no Teorema 5.4 (§5.4, Etapa 2 concluída 27/09/2026).
4. **Injetividade de `Out`:** convenção `Out(u,⊥) := 1^{q}·¬u₀` (§5.1, Lema 5.3) descarrega a hipótese dos Corolários 7.1–7.3 — atualizar `02` §5.2 e `03` B2.6 quando da redação do texto único.
5. **Documento produzido:** `01_ambiente_formal_e_codificacoes.md` — itens de `02` §5.1 ("fixar ambiente formal", "produzir `01_ambiente`") marcados; `03` B1.1–B1.2 marcados; `04` §5 passo 1 concluído.

### 10.2 Pendências transferidas (o que este documento NÃO fecha)

- **Etapa 2:** tempo polinomial de `g_T^[b]` para `b(n) = O(log n)` sob (P2); convenção `⊥` literal de `[K23]` como alternativa; invariância formal sob troca de codificação (o "risco principal" da Etapa 1 — parcialmente mapeada no §6);
- **Etapa 7:** obrigações 2–7 do gadget (§7.3); separar, em cada direção, consistência/correção/Σ₁-correção/reflexão externa; **Q3 (equivalência de intervalo + versão `Σ₁ᵇ`) enunciada em §7.7 (27/09/2026)** — fora da banda seguem abertos: redução `x ↦ θ_x` na banda (A4), `b₂` uniforme (A2 ⟵ F5) e bomba de banda (F6); formalização de `(P4′)`/`(P7a)` = F1–F4 (Lean reaproveitável);
- **Questão aberta (D):** `Thm(T) ∩ Πᵇ₁` é `∅'`-duro? (§4.3) — decide o alcance de `R_T^Σ ≡_T Thm(T)`;
- **Etapa 14:** complexidade de `Φ^w` para tradução proposicional (§8.2);
- **B1.3:** limpeza dos fontes (ecos, duplicações, links mortos) — não afeta este documento;
- **B1.4:** colisão de notação `ρ_T` (aqui) vs `ρ_b` (projeto Gödel) — `04_CONTINUIDADE.md` §2.

### 10.3 Regras de uso deste documento

- Conflito entre este documento e qualquer outro da pasta: **vale este** (é a base normativa da Etapa 1).
- Alterar `D1–D11` exige reescrever §9 e reexecutar `src/python/verifica_espectro.py` (regra de versionamento de `05_DESENVOLVIMENTO.md` §6).
- Citações de `[K23]` foram conferidas contra o texto completo (v2) em 26/09/2026; qualquer nova citação do paper deve ser reconferida na mesma versão.
