# Cadeia da Etapa 12 (parcial) — perfil de instabilidade `𝔍_{T,L,c}` e a dependência `c = c(n)`

**Data:** 28/09/2026 · **Níveis:** B (teoremas) + C/D (abertos) · **Protocolo:** fase de ataque antes do enunciado; dado observado ≠ teorema por linha; critério de refutação por lema.

**Alvo:** item 18 de `03_PRONTOS_E_A_FAZER.md` e §5.4 de `02_REVISAO_CRITICA.md` — "`rem:perfil-global` cobre só `c` fixo; o perfil completo `𝔍_{T,L,c}` (dependência em `c` variando com `n`) segue aberto" — mais a preparação `I_{T,Φ}(c)` de `06_GEOMETRIA_CT.md` §9.1.2 (D-geo-4, Lema G.8).

**Nenhuma simulação foi executada nesta rodada** (loop de simulação parado; qualquer script novo só sob pedido).

---

## 0. Notação (e uma colisão de nomes a evitar)

- `J_{T,Φ}(c) := min{j < k_Φ : ℓ_T(Φ,w_j) > c}` (= `k_Φ` se vazio) — `01_NUCLEO_DURO` §2 (`eq:J`), `paper` §3. **`06` §9.1.2 chama este objeto de `I_{T,Φ}(c)`** (Etapa 12 — preparação; convenção D-geo-4). Nesta cadeia usa-se só `J_{T,Φ}`.
- `j*(Φ) := min{j : ℓ_j = ∞}` (= `k_Φ` se vazio); `ρ_T(Φ) := max{ℓ_j : j < j*}` (= 0 se vazio); `B_T(Φ) := {ℓ_j : j ∈ 𝓘_T(Φ)}` — conjunto **finito** de recordes, com `max B_T(Φ) ∈ B_T(Φ)`; `C_T(L) = ⋃_{|Φ|≤L} B_T(Φ)`; `R_T(L) = max C_T(L)` (Lema G.1: `R_T(L) = max_Φ ρ_T(Φ)`).
- `L_n = ⌊log₂ n⌋`; `𝔉_n = {Φ admissível : |Φ| ≤ L_n}` (`lem:cilindros-n`(i)); `κ_T(L) := Σ_{|Φ|≤L} 2^{−|Φ|} ≤ 1` (Kraft — `lem:cilindros-n`(iii)).
- `H_T(L,c) := Σ_{|Φ|≤L} 2^{−|Φ|} 1_{ρ_T(Φ) > c}` (`CONTINUIDADE_...GLOBAL.md` §8; `paper` `rem:perfil-global`).
- **Perfil de instabilidade (Etapa 12 — `logica organização.md` §Etapa 12):**
  - versão **contada** (definição literal do fonte): `𝔍_{T,L,c}(j) := |{Φ : |Φ| ≤ L, J_{T,Φ}(c) = j}| / |{Φ : |Φ| ≤ L}|` sobre as admissíveis, com `|𝔉_L| > 0`;
  - versão **ponderada**: `𝔍^w_{T,L,c}(j) := Σ_{Φ : |Φ|≤L, J(c)=j} 2^{−|Φ|}` (soma total `κ_T(L)`).
- `D_n(b₁,b₂)` = densidade de desacordo (`eq:Dn`); `thm:cobertura`: `D_n(b₁,b₂) = Γ_{T,n}((b₁(n), b₂(n)])` para **quaisquer** funções de orçamento `b₁ ≤ b₂`.
- `def:gen`: para `F_n(u) = Φ`, `g_T^{[b]}(u) = Out(u, w_{J_{T,Φ}(b(n))})`.

---

## 1. Fase de ataque (achados A18–A22)

**A18 — o rótulo da monotonicidade no Lema G.8 estava invertido.** `06` §9.2 G.8 dizia "`I_{T,Φ}` ... é **não crescente** em `c`". A verdade é **não decrescente**: `c ≤ c' ⇒ {j : ℓ_j > c'} ⊆ {j : ℓ_j > c} ⇒ J(c) ≤ J(c')` — a própria prova de G.8 já concluía isto ("o mínimo sobre o segundo é ≤"), e o `paper` `lem:monotonicidade` enuncia `c₁ ≤ c₂ ⇒ J(c₁) ≤ J(c₂)`. Contraexemplo numérico ao rótulo antigo: tabela `ℓ = (2,5,∞)` dá `J(0) = 0 < J(3) = 1 < J(6) = 2`. **Corrigido em `06_GEOMETRIA_CT.md` (28/09/2026)**, com o iff do `thm:limiar-exato` acrescentado. — *Refutação:* `c ≤ c'` com `J(c) > J(c')` em qualquer tabela ℓ admissível (impossível: o conjunto de qualificadores só encolhe).

**A19 — `H_T` é uma instância de `Γ_T` na janela-raio `(c,∞)`.** Vale a identidade `H_T(L,c) = Γ_T(L; (c,∞))`, pois `B_T(Φ) ∩ (c,∞) ≠ ∅ ⟺ max B_T(Φ) > c ⟺ ρ_T(Φ) > c` (max pertence ao conjunto finito; `B = ∅ ⇒ ρ = 0` e ambos os lados são falsos para `c ≥ 0`). *Consequências:* (i) o protocolo A5/G.10 ("nunca reportar `Γ = 0`") aplica-se a `H` **sem nova prova**; (ii) `H` herda a semi-decidibilidade Σ₁ da Q-4; (iii) `H` é **não crescente em `c`** e **não decrescente em `L`** (termos somados só crescem com `L`) — as duas monotonicias são as únicas gerais.

**A20 — a marginal `𝔍_{T,L,c}` não determina `H_T(L,c)` (nem `D_n`).** Exemplo com tabelas ℓ admissíveis pelas definições (`k_Φ = 4` ⟺ `q(Φ) = 2` ⟺ `|Φ| = 1`, pesos iguais a ½): `Φ₁: ℓ = (2,5,3,4)` (todos prováveis; `j* = k = 4`, recordos `{2,5}`, `ρ = 5`) e `Φ₂: ℓ = (2,∞,∞,∞)` (`j* = 1`, `ρ = 2`). Em `c = 3`: `J(3) = 1` para as duas. Sistema `S = {Φ₁, Φ₂}`: `𝔍_{1,3} = δ₁` e `H_T(1,3) = ½·1 + ½·0 = ½`. Sistema `S' = {Φ₁, Φ₃}` com `Φ₃` de tabela idêntica à de `Φ₁` (nada proíbe tabelas repetidas): **mesma marginal `𝔍_{1,3} = δ₁`**, mas `H_T(1,3) = 1`. Logo os invariantes são **distintos**: `𝔍` guarda a *posição do candidato selecionado*; `H` guarda *provabilidade acima do orçamento* (Lema 12.1). O que ligaria os dois é a **lei conjunta** de `(J(c), j*(Φ))` ponderada — e `j*`/`ρ` são Π₁ (G.10). — *Refutação de qualquer texto que afirme "o perfil `𝔍` dá `H` (ou `D_n`)":* os sistemas `S`/`S'` acima.

**A21 — o índice `j` não é comparável entre fórmulas.** `w_j` é palavra de comprimento `q(Φ) = |Φ|+1` **dependente de `Φ`** (`def:candidatos`): a marginal sobre `j` soma posições de palavras de comprimentos diferentes. Para o gerador o objeto certo é o par por cilindro `(Φ, J_{T,Φ}(c))` (é o que `def:gen` usa: `g = Out(u, w_J)`); `𝔍` é invariante **contábil**, não uma lei sobre palavras. — *Registro de redação:* nunca escrever "a saída é `w_j`" sem nomear o cilindro. **Colisão de nomes relacionada:** `06` §9.1.1 usa `I_T(Φ)` para o conjunto de recorde (`𝓘_T` do `paper`) e §9.1.2 usa `I_{T,Φ}(c)` para o seletor (`J` do `paper`) — objetos diferentes; evitar o `I` nesta cadeia.

**A22 — o diagonal `(L_n, c(n))` não tem monotonia em n.** Com `L = L_n` e `c = c(n)` crescem dois efeitos opostos: (i) o universo `𝔉_n` cresce (`L_n` pula de 1 em 1; as tabelas ℓ das fórmulas novas não têm restrição relativa às antigas); (ii) `c(n)` desloca todas as posições para a direita (A18). Exemplo finito (tabelas ℓ admissíveis; `c ≡ 1` constante — caso legítimo do diagonal; `𝔍` abreviada como `𝔍_{L,c}`, `T` suprimido): `Φ₁: ℓ = (1,5,·,·)` em `L = 1` ⇒ `𝔍_{1,1} = δ₁` e cauda `Pr[J ≥ 1] = 1`; acrescentando `Φ₂: ℓ = (3,∞,·,…)` em `L = 2` ⇒ `𝔍_{2,1} = ½δ₀ + ½δ₁` e a cai para `½`. *Caveat de realizabilidade **como em G.2:* o exemplo é de tabelas ℓ admissíveis **pelas definições**; a realizabilidade por `T` concreto é pergunta separada (Etapa 10). — *Qualquer texto que afirme "o perfil cresce com n", "é monótono em n" ou "converge" sem hipóteses sobre `T` está refutado.*

---

## 2. Lemas e teoremas

**Lema 12.1 (sondagem — o limiar é uma única consulta Σ₁).** Para toda `Φ` admissível e todo `c ∈ ℕ`, com `î := J_{T,Φ}(c)`:

`ρ_T(Φ) > c ⟺ î < j*(Φ) ⟺ T ⊢ Φ^{w_î}`

(o último predicado é **falso** por convenção quando `î = k_Φ`, sentinela D-geo-4).

*Prova.* Primeiro, **`î ≤ j*` sempre**: se `j* < k_Φ`, então `ℓ_{j*} = ∞ > c` qualifica `j*` no mínimo que define `î`, donde `î ≤ j*`; se `j* = k_Φ`, ou o conjunto `{j : ℓ_j > c}` é vazio (`î = k_Φ` pela convenção D-geo-4) ou seu mínimo também é `≤ k_Φ = j*`. Restam duas e só duas situações:

(i) `î < j*`: então `ℓ_î < ∞` por definição de `j*`, logo `T ⊢ Φ^{w_î}`; e `ℓ_î > c` por definição de `î`, com `î < j*` (logo `j* ≥ 1`, o conjunto `{ℓ_j : j < j*}` é não vazio e contém `ℓ_î`), donde `ρ ≥ ℓ_î > c`.

(ii) `î ≥ j*` (com `î ≤ j*`: ou seja `î = j*`, sentinela inclusa): por minimidade de `î`, `ℓ_j ≤ c` para todo `j < î`, em particular para todo `j < j*`, donde `ρ ≤ c`; e `w_î` não é demonstrável (`î = j* < k_Φ ⇒ ℓ_{j*} = ∞`; `î = j* = k_Φ` sentinela — falso por convenção).

Em (i) valem **os dois** lados do ⟺; em (ii) valem **nenhum** dos dois. Logo `ρ > c ⟺ î < j* ⟺ T ⊢ Φ^{w_î}`. ∎

*Nível:* **B** (raciocínio finito sobre as definições; usa `lem:monotonicidade`/`thm:limiar-exato` do `paper`).
*Critério de refutação:* tabela ℓ admissível com `ρ > c` e `T ⊬ Φ^{w_{J(c)}}`, ou `ρ ≤ c` e `T ⊢ Φ^{w_{J(c)}}` — um contraexemplo numérico basta.

**Lema 12.2 (a posição é decidível; a massa não — divisória de computabilidade).** Para `L, c` fixos:

(a) `J_{T,Φ}(c)` é **computável** para cada `Φ`: testar `ℓ_j > c` para `j = 0, …, k_Φ−1` em ordem, onde "`ℓ_j > c`" = "não existe `π` com `|π| ≤ c` e `Prf_T(π, Φ^{w_j})`" — busca **finita** (`(P3)`: `≤ 2^{c+1}` strings; `Prf_T` decidível, D8/P2);
(b) portanto `𝔍_{T,L,c}` **e** `𝔍^w_{T,L,c}` são **decidíveis** para `(L,c)` fixos (soma finita sobre `𝔉_L`, `|𝔉_L| ≤ 2^{L+1}` — G.5);
(c) **custo:** `≤ |𝔉_L| · k_Φ · 2^{c+1}` verificações de `Prf_T`; para `L = L_n` e `c = c(n) = O(log n)` o custo é **polinomial em `n`** (`|𝔉_n| ≤ 2^{L_n+1} ≤ 2n`, `k_Φ ≤ 2^{L_n+1} ≤ 2n` — mesmo esquema do passo 4 de `01_ambiente` §5.4);
(d) em contraste, pelo Lema 12.1 cada indicador de `H_T(L,c)` é uma consulta **Σ₁** ("`T ⊢ …`"): `H_T` é semi-decidível **por baixo** (enumeração de provas converge de baixo) e `H_T(L,c) = 0` é **Π₁**. **Protocolo obrigatório (herdado de A5, vale por A19):** simulação só reporta `H ≥ 2^{−|Φ|}` com testemunha `(Φ, prova)` — **nunca `H = 0`**.

*Nível:* (a)–(c) **B** (decidibilidade finita; não usam G.10); (d) **herança C/D de G.10(2)/A5** — não se prova não-computabilidade nova aqui, aplica-se a barreira já registrada.
*Critério de refutação:* (a) um `π` com `|π| ≤ c` para o qual `Prf_T` não decide (derruba P2/D8); (d) não é refutável por simulação (é a barreira).

**Teorema 12.3 (os invariantes `𝔍` e `H` são distintos; forma fechada da passagem).** Para todo `T, L, c`:

`H_T(L,c) = κ_T(L) − Σ_{|Φ|≤L} 2^{−|Φ|} 1_{J_{T,Φ}(c) = j*(Φ)}`,

e **não** existe função `F` com `H_T(L,c) = F(𝔍_{T,L,c})` para todos os sistemas (A20).

*Prova da identidade.* `1_{ρ > c} = 1_{J(c) ≠ j*}` (Lema 12.1), logo `H = Σ 2^{−|Φ|}(1 − 1_{J(c)=j*}) = κ_T(L) − Σ 2^{−|Φ|}1_{J(c)=j*}`. ∎
*Não-determinação:* os sistemas `S`/`S'` de A20 têm a mesma `𝔍` e valores distintos de `H`. A passagem exige a **lei conjunta** de `(J(c), j*(Φ))` ponderada por `2^{−|Φ|}` — e `j*` é Π₁ (G.10(2)).
*Nível:* **B** (identidade) + **B** (não-determinação, por contraexemplo explícito).
*Critério de refutação:* identidade falsa em tabela ℓ; ou sistema onde `𝔍` idêntica implique `H` idêntica para todo `(L,c)` (refutaria o contraexemplo de A20).

**Teorema 12.4 (forma geral do perfil `H`/`D` com `c = c(n)` — fecha a pendência).** Sejam `b₁ ≤ b₂` funções de orçamento arbitrárias. Para todo `n ≥ 1`:

1. **Sanducho:** `H_T(L_n, b₁(n)) − H_T(L_n, b₂(n)) ≤ D_n(b₁,b₂) ≤ H_T(L_n, b₁(n))`.
2. **Saturação exata:** as **duas** desigualdades são igualdades **sse** `b₂(n) ≥ max_{Φ ∈ 𝔉_n} ρ_T(Φ) = R_T(L_n)` (convenções do Núcleo §8 no caso degenerado).
3. **Corolário (a pendência da Etapa 12):** para `b₂(n) ≥ R_T(L_n)` e `b₁ = c(n)` **arbitrária** (não precisa ser constante):

`D_n(c(n), b₂(n)) = H_T(L_n, c(n))`.

A hipótese "c fixo" de `rem:perfil-global` **nunca foi usada** na prova — só `b₂(n) ≥ R_T(L_n)`.

*Prova.* Por `thm:cobertura`, `D_n(b₁,b₂) = Σ_{Φ ∈ 𝔉_n} 2^{−|Φ|} 1_{B_T(Φ) ∩ (b₁(n), b₂(n)] ≠ ∅}`. Todos os recordes de todas as `Φ ∈ 𝔉_n` estão em `C_T(L_n) ⊆ [0, R_T(L_n)]` (G.1), logo `B_T(Φ) ∩ (b₁(n), b₂(n)] = B_T(Φ) ∩ (b₁(n), ∞)` quando `b₂(n) ≥ R_T(L_n)`, que é não vazio `⟺ ρ_T(Φ) > b₁(n)` (max pertence a `B`; `B = ∅ ⇒ ρ = 0 > b₁(n)` é falso pois `b₁(n) ≥ 0`). Isso dá o item 3; e, na mesma hipótese, `H_T(L_n, b₂(n)) = 0` (pois `ρ ≤ R_T(L_n) ≤ b₂(n)`), de modo que as duas pontas do sanducho do item 1 colapsam na mesma igualdade — **suficiência** do item 2.

Para o item 1, ponto a ponto em `Φ`:
- **Superior:** se `B_T(Φ) ∩ (b₁(n), b₂(n)] ≠ ∅`, algum recorde está `> b₁(n)`, logo `ρ > b₁(n)` — o indicador de `H(b₁(n))` vale 1.
- **Inferior:** se `b₁(n) < ρ ≤ b₂(n)`, então `ρ ∈ B_T(Φ) ∩ (b₁(n), b₂(n)]` (o máximo de um conjunto finito de naturais pertence a ele), logo o indicador da `D` vale 1.
Somando com pesos `2^{−|Φ|}` (Kraft) obtém-se o sanducho.

Para o item 2, resta mostrar que `ρ ≤ b₂(n)` para toda `Φ ∈ 𝔉_n` é **necessário**. Suponha `ρ₀ > b₂(n)` para alguma `Φ₀`. Duas possibilidades: (α) `B(Φ₀) ∩ (b₁(n), b₂(n)] ≠ ∅` — então o indicador da `D` vale 1 e o de `H(b₁(n)) − H(b₂(n))` vale 0 (`ρ₀ > b₂(n)`), logo a **inferior** é estrita; (β) `B(Φ₀) ∩ (b₁(n), b₂(n)] = ∅` — então o indicador da `D` vale 0 e o de `H(b₁(n))` vale 1 (`b₁(n) ≤ b₂(n) < ρ₀`), logo a **superior** é estrita. Em ambos os casos, pelo menos uma das pontas é estrita. E `ρ ≤ b₂(n)` para toda `Φ` é exatamente `b₂(n) ≥ R_T(L_n)` (G.1). ∎

*Nível:* **B** (`thm:cobertura` + G.1 + aritmética finita de conjuntos; nenhuma hipótese sobre `T`, nenhuma barreira).
*Critérios de refutação:* (i) par `b₁ ≤ b₂` com `b₂(n) ≥ R_T(L_n)` e `D_n ≠ H(b₁(n))` numérico; (ii) `b₂(n) ≥ R_T(L_n)` com uma das pontas estrita; (iii) `b₂(n) < R_T(L_n)` com **as duas** pontas em igualdade (refutaria a necessidade). Cada um é testável em modelo finito (Etapa 10) — **sob pedido**.

**Propriedade 12.5 (leis do perfil `𝔍`, `L` fixo).** Com `𝔉_L ≠ ∅`:

1. **Partição:** `Σ_j 𝔍_{T,L,c}(j) = 1` e `Σ_j 𝔍^w_{T,L,c}(j) = κ_T(L)` (finitas).
2. **Monotonia estocástica em `c`:** para `c ≤ c'` e todo limiar `t`: `Σ_{j ≥ t} 𝔍_{T,L,c}(j) ≥ Σ_{j ≥ t} 𝔍_{T,L,c'}(j)` — mesmo acoplamento (a mesma `Φ`), usando `J(c) ≤ J(c')` (A18/`lem:monotonicidade`).
3. **Valor terminal:** para `c ≥ R_T(L)`: `J_{T,Φ}(c) = j*(Φ)` para toda `Φ` (`thm:limiar-exato` + `ρ(Φ) ≤ R_T(L)`), logo `𝔍_{T,L,c}` é **constante** em todo `c ≥ R_T(L)` (é `𝔍_{T,L,∞}`, concentrada em `{j*(Φ)}`). É o análogo exato de `thm:estab-global` no nível do perfil.
4. **Lei probabilística exata (só a versão ponderada):** para `U` uniforme em `{0,1}^n` com `L = L_n`: `Pr[F_n(U) = Φ] = |U_n(Φ)|/2^n = 2^{−|Φ|}` (`lem:cilindros-n`(ii)); condicionada a `F_n(U)` definida, o **índice** selecionado tem lei `𝔍^w_{T,L_n,c}(j)/κ_T(L_n)`. A versão **contada** (`𝔍`) **não** é esta lei (A21) — é contagem de fórmulas, na mesma família de `Z_L`/`Ã_T` (P-2 q3/q5), com sandbox G.5.
5. **Em `L`:** `H_T(L,c)` é não decrescente em `L` (A19); equivalentemente, a massa não estabilizada só cresce ao acrescentar fórmulas.

*Nível:* **B** (partição, acoplamento, `thm:limiar-exato`, `lem:cilindros-n`).
*Critérios de refutação:* (1) `Φ` contada duas vezes ou nenhuma; (2) `c ≤ c'` com cauda em `t` maior em `c'` (impossível por A18 — refutaria a monotonicidade de `J`); (3) `c ≥ R_T(L)` com `J(c) ≠ j*` para alguma `Φ` (refuta `thm:limiar-exato`); (4) `Pr[F_n(U)=Φ] ≠ 2^{−|Φ|}` (refuta `lem:cilindros-n`(ii)).

---

## 3. O diagonal `(L_n, c(n))`: o que vale e o que não vale

**Vale (B):**

- **Identidade saturada ponto a ponto:** para `c*(n) ≥ R_T(L_n)` e `c(n)` **arbitrária**, `D_n(c(n), c*(n)) = H_T(L_n, c(n)) = Γ_{T,n}((c(n), ∞))` (Teorema 12.4 + A19) — é exatamente a pendência do item 18, fechada.
- **Estabilização terminal:** para todo `n` com `c(n) ≥ R_T(L_n)`: `𝔍_{T,L_n,c(n)} = 𝔍_{T,L_n,∞}` e `g_T^{[c(n)]} = g_T^{[R_T(L_n)]}` (`thm:estab-global`). **Caveat de verificabilidade:** a condição `c(n) ≥ R_T(L_n)` **não é testável** para `T` da classe de G.10 (`R_T` não computável — mesmo motivo de A8/A9); o regime terminal é assintótico, não observável por simulação.
- **Decidibilidade por `n`:** `𝔍_{T,L_n,c(n)}` é computável para cada `n` (Lema 12.2), em tempo polinomial em `n` quando `c(n) = O(log n)`.

**Não vale (C/D — sem hipóteses sobre `T`):**

- **Monotonia em `n` do diagonal** — refutada por A22 (tabelas ℓ; caveat de realizabilidade G.2).
- **Convergência/limsup de `𝔍_{T,L_n,c(n)}` ou `H_T(L_n, c(n))`** — não é teorema; para `H` é a pergunta Q-Asy/Conj-F já enunciada (§9.6), com a mesma barreira A5.
- **Recuperar `H`/`D_n` a partir de `𝔍`** — refutado por A20/Teorema 12.3.
- **Comparar `𝔍` entre sistemas** — cai em P-1 (só modelos, G.10).

---

## 4. Mapa de níveis e o que permanece aberto

| Item | Nível | Estado |
|---|---|---|
| Lema 12.1 (sondagem) | B | **fechado** |
| Lema 12.2 (decidibilidade de `𝔍`; custo) | B (+ herança C/D de A5 em (d)) | **fechado** |
| Teorema 12.3 (`𝔍` ≠ `H`) | B | **fechado** |
| Teorema 12.4 (sanducho + saturação + `c = c(n)`) | B | **fechado — fecha a pendência do item 18 na parte `H`/`D`** |
| Propriedade 12.5 (leis de `𝔍`, `L` fixo) | B | **fechado** |
| Diagonal: monotonia/convergência em `n` | C/D | **aberto** (A22 refuta sem hipóteses) |
| Absorção no `paper` (`rem:perfil-global` estendido) | — | **sob pedido** (paper intocado nesta rodada) |
| Verificação computacional de `𝔍` (script) | — | **sob pedido** (loop parado) |

**Proibições preservadas:** nada aqui afirma hierarquia `b₁ < b₂ ⟹ ≺` (P-4.1 — o sanducho do Teorema 12.4 é aritmética de conjuntos sobre `thm:cobertura`, sem ordem espectral); nada sobre `rng` (P-4.2 intacta); `H = 0`/`Γ = 0` nunca afirmados (A5); nenhuma alegação de grau de `R_T` (G.10).

---

## 5. Sincronias desta rodada

- `06_GEOMETRIA_CT.md`: Lema G.8 (rótulo corrigido — A18) + §9.5 item 7 (resultado).
- `03_PRONTOS_E_A_FAZER.md`: item 18.
- `02_REVISAO_CRITICA.md`: §5.4, item Etapa 12.
- `README.md` (painel): status + tabela "Estado por resultado".
- `paper/main.tex`: **intocado** (não compilar nesta rodada; absorção de `rem:perfil-global` só sob pedido).
