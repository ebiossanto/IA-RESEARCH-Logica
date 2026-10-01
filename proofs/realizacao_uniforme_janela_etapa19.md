# Cadeia — Etapa 19: construção do teorema de realizabilidade uniforme em janela (Q1-P^adm)

**Data:** 30/09/2026 · **Status:** construção gravada (fase de ataque + construção + lemas estruturais); **pendência 1 de §6 concluída em 30/09-b** (esquema de carga formal, escada real do cilindro, Lema 19.0; achados **A41–A44**); teorema **Nível C** (pendências 2–5 em §6); caso canônico **D** · **Níveis:** A/B/C/D por item.

**Depende de:** `proofs/realizabilidade_apresentacoes_etapa18.md` §9 (escopo Q1-P^adm/Q1-C, Adm.1–Adm.7, A35, alvo §9.5 com pendências (a)–(d) — **esta etapa as executa e corrige parte delas**), `01_ambiente_formal_e_codificacoes.md` (D3 livre de prefixo, D4 admissível = exatamente 1 variável livre `x`, D5 custo = comprimento da string, D8 `Prf` decidível), `01_NUCLEO_DURO.md` §2 (cilindro `Φ^w`, candidatos `q = |Φ|+1` (D7), recordos), `06_GEOMETRIA_CT.md` §9 (recordos, `C_T(L)`, protocolo, G.1–G.10), direção de escopo 29/09 (custos sintáticos reais, T1–T7).

**Não altera:** `paper/main.tex`; proibições P-4; **Q1-C segue ABERTO**; nenhum nível é promovido sem prova.

---

## 1. Fase de ataque (achados A37–A44)

**A37 — o buraco da mínimalidade do atalho (refuta a pendência (b) de etapa18 §9.5 na forma escrita).** Para `ℓ_{P'}(σ) = r` com custo = comprimento **real**, todo certificado bem-formado de `σ` deve ter comprimento ≥ `r`. As três saídas livres são todas ilegítimas:
1. verificador aceita `shortcut(i, τ)` para **qualquer** `τ` de preenchimento ⟹ o certificado **sem** `τ` é bem-formado de comprimento `|i|+c = O(log r)` ⟹ `ℓ ≤ O(log r) < r` (isolação falha);
2. verificador exige `|q| = r` **por regra** ⟹ `r` é **declarado** pela bem-formação, não emerge do conteúdo — viola **Adm.5** (independência do testemunho) e reproduz a crítica de "efeito de codificação";
3. certificado **nomeia** a prova-base (`i` índice) ⟹ o comprimento efetivo é `h₀ + |i| + p(σ)` com `|i|` **não controlado** por σ (depende da enumeração de provas de σ, arbitrário entre `0` e `≈ basecost`) ⟹ o conjunto de valores de janela em `P_esp` fica `≈ [0, K]` — **`N_esp` explode e a separação morre**. (É o esquema do `desenvolvimento nc.md` §5 — **vulnerável**, registrado.)
*Correção:* a pendência (b) de etapa18 (atalho "de comprimento exatamente `r`") estava **mal posta**. Substituída pelo mecanismo de §2 (regra de combustível), que obtém o limite inferior **do conteúdo**, não da regra.

**A38 — `V` × combustível (pendência (a)).** Se o "combustível" do certificado é uma prova-base, o padding fino `V` (potências de 2) força seu comprimento ∈ `V` ⟹ valores densos impossíveis. **Resolução:** os alvos de combustível são sentenças `J_k := (0 = 0) ∧ 0^k` — **sem variável livre**, logo **não-admissíveis (D4)** e **nunca entram em nenhuma escada de `C_T(L)`** — com formato canônico de comprimento **exatamente** `p` (carve-out uniforme e decidível pela forma, B-J abaixo). Poluição das janelas: **nula** por D4.

**A39 — as apresentações precisam diferir em alguma regra decidível.** Mesma base, mesma `ν`, mesma família ⟹ mesmos `ℓ` ⟹ sem separação. A diferença adotada: **`P_den` exige linha de combustível em toda prova de fórmula com carga; `P_esp` não exige** (predicado decidível pela forma; §2). Família e apresentações são fixadas **uma vez**, independentemente de `n` (T2 ✓).

**A40 — `R` exato é dispensável; a calibração exata também.** P-1/Q1-P^adm pedem `R_esp ≍ R_den` (**com constantes**), não igualdade. Logo a exigência "janela esparso = `{M_n}` exatamente" (etapa18 §9.5, além de falsa por A35) é **fortalecimento desnecessário**: basta `R ≍ K_n` e `N ≍`/`≁`. Isso dissolve os problemas de calibração fina (valores caem em `p + f(c₀ + lb(p)) + C₀` com `f` não-decrescente — monotonia direta; ver Lema 19.0(b)). **Alvos corrigidos:** `S_esp(n) = V ∩ [0,K_n]` (mais fino ainda que `{m²}∪V` — sem nenhum atalho!) e `S_den(n)` = contagem, não lista. Ambos **aninhados** ✓ (A35 satisfeito: `V` fixo, `K_n` crescente).

**Segunda passada (30/09-b — ataque da pendência 1 contra a sintaxe real do cilindro: A41–A44).**

**A41 — três defeitos na própria §2/§3 (corrigidos nesta passada).** (i) A linha "validade ⟹ `Φ_p^{w_j} ∈ Thm(T)` para todo `j`" é **falsa**: pela semântica do cilindro (`01_ambiente` §3: `ℕ ⊨ Φ^w ⟺ {x : Φ(x) ∧ w ⊆_e x}` finita) e o Lema 2.2, para `w` com **primeiro bit 1** esse conjunto é `Cyl(w)` infinito (pois `Φ_p` vale em todo `x`) ⟹ `Φ_p^{w}` **falsa** ⟹ `ℓ = ∞` (`T` sonsora). O que se precisa é **só** `T ⊢ Φ_p^{w_0}` (`w_0 = 0^q`, Lema 2.2(1)). (ii) A "derivação canônica `d(σ) = |σ| + c_D`" está errada na forma: `σ_p = Φ_p^{w_0} = ∃y∀x>y(Φ_p(x) → ¬(w_0 ⊆_e x))` tem linhas contendo o **corpo `Φ_p`** e o bloco `w_0` (comprimento `q = |Φ_p|+1`, D7) ⟹ a lei correta é `d(σ_p) = f(|Φ_p|)` com `f` **não-decrescente** (Lema 19.0) — afim em `|Φ_p|`, **não** em `|σ_p|`. (iii) **Colisão `B-V` × `B-J`:** como escrito, a prova canônica de `J_k` não tem linha de combustível ⟹ cairia sob `B-V` ⟹ comprimento ∈ `V` ✗, destruindo `|w| = k + c_J`. Correção: `B-V` exclui a classe-J (carve-out decidível pela forma; já pressuposto em A38, agora explícito).

**A42 — a escada real da família é singleton.** Candidatos `w_j ∈ {0,1}^q`, `q = |Φ_p|+1` (D7): primeiro bit `0` (índices `j < 2^{q−1} = 2^{|Φ_p|}`) ⟹ cilindro ⊆ `{0}` (Lema 2.2(1)) ⟹ **verdade**; primeiro bit `1` ⟹ **falsa** ⟹ `j* = 2^{|Φ_p|}`. Entre os `j < j*`, o argumento de prova usa só o **primeiro bit** de `w_j` e todos os comprimentos de linha são afins em `|Φ_p|` com `|w_j| = q` fixo ⟹ **todas as `ℓ_j` iguais** ⟹ `B_{P}(Φ_p) = {ℓ_0}` **singleton** (recordo único na posição 0) ⟹ a contagem den é **1-a-1 em `p`** — é o que a §3 supunha sem provar.

**A43 — candidatos adversariais contêm a marca.** `w_j` varre **todos** os blocos de `q` bits — alguns contêm o bloco de marca `μ` e mudariam `Dec`. Correção: `μ` escolhido com **pelo menos um bit 1** (logo nunca ocorre em `w_0 = 0^q` nem colide com o prefixo fixo `∃y∀x>y(`) e `Dec` = **ocorrência mais à esquerda** — o corpo `Φ(x)` aparece **antes** de `w` na string do cilindro ⟹ `Dec(Φ_p^{w_j}) = p` para **todo** `j` ✓.

**A44 — paridade de `|Φ^w|`.** Por D7, `|Φ_p^{w}| = 2|Φ_p| + 1 + c_plant` — só **uma paridade** de comprimento é atingível ⟹ `R_esp ≠ 2^{⌊log₂K_n⌋}` em geral: `R_esp = 2^{m*}` com `⌊log₂K_n⌋ − 1 ≤ m* ≤ ⌊log₂K_n⌋` ⟹ **`R_esp ∈ (K_n/4, K_n]`**. Constante da `≍`: **`c = 1/4`** (não `1/2`) — corrigido no Lema 19.4 e §5(i).

---

## 2. Construção (o sistema)

**Base comum `P₀` de `T`** (uma apresentação; mesma `ν`; dígitos/binário fixados; `h₀`, `c_J`, `s₀` constantes do formato):

- **B-V (preenchimento fino):** toda derivação (linhas verbatim — N-1) de fórmula **não-J** (classe `J_k`, B-J — carve-out decidível pela forma, **A41(iii)**) sem linha de combustível tem comprimento final `nextpow2(max(|derivação|, 2^{|φ|}))`. Consequências: **custos-base ∈ `V := {2^j}`** e **custo-base ≥ `2^{|φ|}`**. Regra **uniforme e familiar-independente** (depende só de `|φ|`) — escopo estrito ✓.
- **B-J (combustível):** para sentenças `J_k` da forma `(0=0) ∧ 0^k` (classe decidível pela forma), existe prova canônica **única** de comprimento **exatamente** `k + c_J` (excluída de B-V). `J_k` é sentença → **não-admissível → fora de `C_T(L)`** (A38).
- **Campo de carga:** toda fórmula pode carregar um campo binário `⟨marca, p⟩` com decodificação decidível; sem campo bem-formado = sem carga.

**Duas apresentações conservativas sobre `P₀`:**

- **`P_esp`** = regras de `P₀` (só B-V). Prova de qualquer fórmula = derivação preenchida. **Sem exigência alguma de combustível.**
- **`P_den`** = regras de `P₀` **+ regra de combustível (CF):** toda prova de fórmula φ **com carga** `p(φ) ≥ s₀` deve conter a linha `w` = prova canônica de `J_{p(φ)}` (logo `|w| = p + c_J`); provas de carga **sem** `w` são rejeitadas; provas **com** `w` **não** recebem o arredondamento B-V (comprimento = `h₀ + |w| + |derivação|`). Provas de fórmulas **sem** carga: B-V como em `P_esp`, e a presença do bloco `w` é **rejeitada** (bloco bem-formado só é admitido em fórmulas com carga) ⟹ toda prova sem carga tem comprimento ∈ `V` ✓ (fecha 19.2(iii) contra bloco acidental).

**Família (uniforme, fixada depois das apresentações):** para cada `p ≥ s₀`, `Φ_p(x) := (x = x) ∨ θ_p` com `θ_p = (0 = t_p)` carregando a carga `p` (C1–C4 de §2.1); `|Φ_p| = c₀ + lb(p)` com `lb(p) := ⌊log₂p⌋ + 1` — admissível (1 variável livre ✓; `θ_p` fechada ✓), **valida** ✓. **Cilindros:** só `Φ_p^{w_0}` precisa ser teorema (E1/OB1); candidatos com **primeiro bit 1 são falsos** (A41(i)) ⟹ `ℓ = ∞` — a escada é analisada em §2.2 (E1–E4) e a lei da derivação em **Lema 19.0**, que **substitui** a afirmação errada `d(σ) = |σ| + c_D` (A41(ii)).

**Uniformidade (T2):** um único par `(P_esp, P_den)` e uma única família `{Φ_p}_{p≥s₀}` para **todo** `n` — nada depende de `n`; `n` só aparece em `L_n, K_n`.

### 2.1 Esquema de carga (formalização — fecha a pendência 1)

**Definição (carga).** Fixado um bloco `μ ⊆ {0,1}*` com **pelo menos um bit 1** (A43), a *carga* de uma fórmula é um segmento `bin(p)` autocancelável (delimitadores fixos contendo `μ`) dentro de `θ_p`. Existe função total `Dec` (**decodificação**) com:

- **(C1)** `Dec(Φ_p) = p` e `Dec(Φ_p^{w_j}) = p` para todo `j` — pela **ocorrência mais à esquerda**: em `∃y∀x>y(Φ(x) → ¬(w ⊆_e x))` o corpo `Φ(x)` precede `w` (A43);
- **(C2)** `Dec` roda em tempo linear no comprimento da string ⟹ a classe "fórmula com carga" e `p(φ)` são decidíveis em p-tempo (Adm.2 ✓);
- **(C3)** tamanho exato: `|Φ_p| = c₀ + lb(p)` com `lb(p) := ⌊log₂p⌋ + 1` (`p ≥ 1`) — campo de exatamente `lb(p)` bits, `c₀` = comprimento do esqueleto; note `lb` **satura todos os inteiros ≥ 1** (a família cobre todo tamanho `≥ c₀+1` ✓);
- **(C4)** condições de projeto, decidíveis **por instância**: `θ_p = (0 = t_p)` com `t_p` termo não-degenerado (nunca colapsa em `0`) carregando `bin(p)`; `σ_p := Φ_p^{w_0}` **não** é instância de esquema de axioma de `T`; e toda rota de derivação de `σ_p` com comprimento `≤` a rota canônica usa **só** a estrutura de conectivos/quantificadores, os átomos `w ⊆_e x` e o **primeiro bit** de `w` — o conteúdo de `t_p` é opaco (está sob a premissa descarregada e nunca é derivado).

**Constantes do formato.** `s₀ := max(1, k_min)` = patamar do CF (todo `p ≥ s₀` tem `J_p` bem-formado com `k := p ≥ 1`; a linha canônica tem `|w| = p + c_J`); `h₀` = sobrecusto fixo das marcações de linha (tabela de constantes do cálculo — mesma em `P_esp` e `P_den`).

**Obrigação OB1 (esboço visível).** `T = S¹₂` prova `Φ_p^{w_0}` para todo `p`: testemunha `y := 0` e, para `x > 0`, `¬(w_0 ⊆_e bin(x))` segue pois `bin(x)` começa com `1` enquanto `w_0 = 0^q` — fato `Σᵇ₀` sobre `bin`/prefixo (formalização do Lema 2.2(1)) ✓ mesmo esquema para todo `p`.

### 2.2 Estrutura da escada da família (sintaxe real do cilindro)

Para `σ_p^{(j)} := Φ_p^{w_j}` com `w_j ∈ {0,1}^{q}`, `q = |Φ_p|+1` (D7):

- **(E1)** `w_0 = 0^q` ⟹ `Cyl(w_0) ⊆ {0}` (Lema 2.2(1)) ⟹ `Φ_p^{w_0}` vale em `ℕ` ⟹ **OB1**: `T ⊢ Φ_p^{w_0}`;
- **(E2)** primeiro bit de `w_j` = `1` ⟹ `Φ_p` vale em todo `x` ⟹ `{x : Φ_p(x) ∧ w_j ⊆ x} = Cyl(w_j)` infinito (Lema 2.2(2)) ⟹ `Φ_p^{w_j}` **falsa** ⟹ `ℓ = ∞` (`T` sonsora + Adm.1) ⟹ `j* = 2^{|Φ_p|}` (A41(i), A42);
- **(E3)** para `j < j*`: argumento de prova usa só o primeiro bit de `w_j` e `|w_j| = q` fixo ⟹ **todas as `ℓ_j` iguais** ⟹ `B_{P_esp}(Φ_p) = B_{P_den}(Φ_p) = {ℓ_0}` (recordo único na posição 0 — `08` M.1) ⟹ **um valor por `p`**, contagem 1-a-1 (A42);
- **(E4)** `Dec(σ_p^{(j)}) = p` para todo `j` (C1/A43) ⟹ a regra CF vale em todas as posições de `P_den`.

---

## 3. Lemas (por item: 19.0 = **Nível C** condicionado a OB1–OB2; 19.1 = B; 19.2–19.4 = B dados 19.0)

**Lema 19.0 (calibração exata — fecha a pendência 1; Nível C, condicionado a OB1–OB2).**
Sejam `P₀`/`P_den` com as regras de §2 (carga C1–C4), família §2, escada E1–E4 e `d(σ_p)` = comprimento mínimo da derivação **pura** (sem combustível) de `σ_p = Φ_p^{w_0}`. Então:
- **(a) (lei da derivação; OB2)** existe função **não-decrescente** `f : ℕ → ℕ` com `d(σ_p) = f(|Φ_p|)` para todo `p ≥ s₀`, e `d(σ_p) ≤ a₁|Φ_p| + b` com inteiros fixos `a₁ ≥ 1, b ≥ 0`.
- **(b) (valores den, monotonia):** `ℓ_{P_den}(σ_p) = h₀ + (p + c_J) + f(c₀ + lb(p)) = p + f(c₀ + lb(p)) + C₀` com `C₀ := h₀ + c_J`, **estritamente crescente** em `p` (soma `1` em `p` + termo não-decrescente) ⟹ valores **distintos** por `p` distintos; com (E3), recordo único na posição 0 ⟹ injunção `p ↦ ℓ(σ_p)`.
- **(c) (contagem explícita):** com `K_n = n²`, `lb(K_n) = 2log₂n + 1`: para `p ≤ p_n := K_n − a₁(c₀ + lb(K_n)) − b − C₀` o valor `≤ K_n`, logo
  `N_den(L_n; K_n) ≥ K_n − a₁(c₀ + 2log₂n + 1) − b − C₀ − s₀ + 1 ≥ K_n/2 = n²/2`
  para `n ≥ n₀ := max(2^{c₀+1}, n₀₂)`, onde `n₀₂` = menor `n` com `n² ≥ 2a₁(c₀ + 2log₂n + 1) + 2(b + C₀ + s₀ − 1)` (ambas as condições **escritas** ✓).
- **(d) (família dentro da janela de tamanho):** `|Φ_p| = c₀ + lb(p) ≤ c₀ + 2log₂n + 1 ≤ L_n = ⌈3log₂n⌉` para `n ≥ 2^{c₀+1}` ✓ (C3; `lb` satura todos os tamanhos ≥ 1).

*Prova.* **(a)** (⊇) rota canônica: testemunha `y := 0`, →I com premissa `Φ_p(x)` (linha `|Φ_p|+c`), átomos `w_0 ⊆_e x` payload-livres, bloco `0^q` com `q = |Φ_p|+1` ⟹ cada linha é afim em `|Φ_p|` com coeficientes fixos ⟹ `≤ a₁|Φ_p| + b`. **(⊆)** por (C4): toda rota de comprimento `≤` essa cota é payload-independente (o conteúdo de `t_p` nunca é derivado; `σ_p` fora dos esquemas de axioma; só conectivos/quantificadores/primeiro-bit de `w` decidem regras) ⟹ o conjunto de rotas é finito e cada rota tem comprimento `a_r·|Φ_p| + b_r` com `a_r ≥ 0` ⟹ `f := min_r (a_r· + b_r)` é não-decrecente e é o mínimo para **todo** `p` de tamanho `|Φ_p|` ⟹ `d(σ_p) = f(|Φ_p|)`. **(b)** substituição + monotonia (`lb` não-decrescente ⟹ `f∘(c₀+lb)` não-decrescente ⟹ `p ↦ p + … + C₀` estritamente crescente). **(c)** de (b) e `f(m) ≤ a₁m + b` com `m ≤ c₀ + lb(K_n)`; o resto é aritmética das duas desigualdades escritas. **(d)** C3 + `lb(p) ≤ lb(K_n)`. ∎
*Refutação:* instância `p` com rota payload-específica mais curta que `a₁|Φ_p|+b` (busca **finita**, decidível); `p ≠ p'` com valores iguais; `n < n₀` violando (c)/(d).

**Lema 19.1 (esp — blindagem estrutural; resolve a pendência (c) por construção).**
Em `P_esp` a única forma de prova é B-V ⟹ todo `ℓ` de qualquer fórmula, admissível ou não, pertence a `V`. Logo `C_{P_esp}(L) ∩ [0,K] ⊆ V ∩ [0,K]` e
`N_esp(L;K) ≤ ⌊log₂ K⌋ + 1`.
*Prova:* uma linha (regra única). *Refutação:* achar qualquer prova de comprimento não-potência-de-2 em `P_esp`.

**Lema 19.2 (den — limite inferior e valores; resolve (b)).**
Em `P_den`: (i) se φ tem carga `p ≥ s₀`, toda prova bem-formada contém `w` com `|w| = p + c_J` ⟹ `ℓ(φ) ≥ h₀ + p + c_J + |φ|` (combustível é conteúdo real, na string — Adm.6 ✓; nenhum comprimento é declarado — Adm.5 ✓); (ii) para a família canônica, pelo **Lema 19.0(b)** `ℓ(Φ_p^{w_0}) = p + f(c₀ + lb(p)) + C₀`, **estritamente crescente** em `p` (soma `1` no `p` + termo não-decrescente) ⟹ valores **distintos** por `p` distintos, sem colisões; (iii) sem carga, `ℓ ∈ V` (B-V; o bloco `w` é bem-formado só em fórmulas com carga — regra de §2 —, logo não há fuga por bloco acidental).
*Refutação:* prova de carga sem linha `w`; instância violando Lema 19.0(a) (rota payload-específica mais curta); ou `p ≠ p'` com valores iguais.

**Lema 19.3 (den — contagem/realização; contagem EXPLÍCITA).**
Com `K_n = n²`, `L_n = ⌈3log₂ n⌉`, `lb(p) = ⌊log₂p⌋+1`: para todo `p ∈ [s₀, p_n]` com `p_n := K_n − a₁(c₀ + lb(K_n)) − b − C₀` (Lema 19.0(c)) temos `|Φ_p| = c₀ + lb(p) ≤ L_n` (para `n ≥ 2^{c₀+1}` ✓), valor `≤ K_n` e valores **distintos** (19.0(b)); a posição 0 é recordo quando finita (`08` M.1) ⟹
`N_den(L_n; K_n) ≥ K_n − a₁(c₀ + 2log₂n + 1) − b − C₀ − s₀ + 1 ≥ n²/2` para `n ≥ n₀ := max(2^{c₀+1}, n₀₂)` (desigualdades escritas no Lema 19.0(c)).
Folga de contagem de fórmulas: `#admissíveis ≤ L_n ≈ 2^{L_n} = n³ ≥ n²` ✓. Alvos aninhados em `n` ✓ (A35 ✓: `C(L_n) ∩ [0,K_n]` só **cresce** com `n`, pois `L_n` e `K_n` crescem).

**Lema 19.4 (separação, com constantes).**
`R_esp = 2^{m*}` com `⌊log₂K_n⌋ − 1 ≤ m* ≤ ⌊log₂K_n⌋` — paridade de `|Φ^w| = 2|Φ| + 1 + c_plant` (**A44**; a família cobre todo tamanho `≥ c₀+1` por C3 e `2^{m*} ≤ K_n` ⟹ `|Φ| ≤ L_n` para `n` grande) ⟹ **`R_esp ∈ (K_n/4, K_n]`**; `R_den ≥ K_n − a₁(c₀ + 2log₂n + 1) − b − C₀ ≥ K_n/2` para `n ≥ n₀₂` (Lema 19.0(c)) ⟹ **`R_esp ≍ R_den`** com **`c = 1/4`, `C = 2`** (registrados: `R_esp ≥ K_n/4 ≥ (1/4)·R_den`; `R_esp ≤ K_n ≤ 2·R_den` para `n ≥ n₀₂`; `n₀` explícito). Para `N`: suponha `N_den ≤ C·N_esp` para `n ≥ n₀`; então `n² − a₁(c₀+2log₂n+1) − b − C₀ − s₀ + 1 ≤ C(⌊log₂K_n⌋ + 1)`, i.e. `n² ≤ C(2log₂n + 1) + a₁(c₀+2log₂n+1) + b + C₀ + s₀` — **falso para `n ≥ n₀(C)` explícito** (critério: `n²/2 > C(2log₂n+1) + a₁(c₀+2log₂n+1) + b + C₀ + s₀`) ⟹ **`N_esp ≁ N_den`** com `c, C, n₀` escritos.
*Refutação:* qualquer valor de janela esp ∉ `V`; qualquer contagem den < `c·K_n`; qualquer `≍` sem constante.

---

## 4. Conformidade (Adm.1–Adm.7, `ν`, G.10)

| Item | Verificação |
|---|---|
| Adm.1 `Thm = Thm(T)` | derivações preservam conclusão; combustível é só formato (a linha `w` prova sentença extra, não muda `φ`); `J_k`, `Φ_p`, `Φ_p^{w_0}` ∈ `Thm(T)` (validades; E1/OB1 — **só `w_0` precisa ser teorema**, E2/A41(i)); recíproco: `σ ∈ Thm(T)` com carga `p ≥ s₀` tem prova aceita = derivação canônica + linha `J_p` (pois `T ⊢ J_p` por validade) ⟹ `Thm(P_esp) = Thm(P_den) = Thm(T)` |
| Adm.2 `Prf` decidível | checar derivação (D8) + `Dec` (C2, linear) + presença/validade de `w` (forma de `J`, comprimento exato) — p-tempo ✓ |
| Adm.3 expansão efetiva | `E`: remover `w` e o preenchimento ⟹ derivação; comum aos dois ⟹ `P_esp, P_den ↘ P₀` ✓ |
| Adm.4 uniformidade | regras fixas, sem tabelas; família `{Φ_p}` enumerável uniforme ✓ (A32 respeitado: um único par para todo `n` ✓) |
| Adm.5 sem testemunho declarado | nenhum comprimento é exigido como rótulo: `p` é propriedade da fórmula (carga), `ℓ` emerge do conteúdo (Lema 19.2) ✓ |
| Adm.6 contabilidade | `w` e derivação **na string**; sem nomes de prova, sem `τ` vazio (A37) ✓ |
| Adm.7 não-degenerescência | nenhuma regra `π̄ / Thm(T)` ✓ (= A27) |
| `ν` comum | mesmo alfabeto (incl. campo de carga e preenchimento) — A23 ✓ |
| G.10 | nada aqui computa `Thm(T)`: toda verificação é por instância, decidível (mesmo esquema de A7) ✓ |

**Honestidade (nível do resultado):** a diferença `P_esp`/`P_den` é diferença de **formato de prova** (exigir ou não uma linha de combustível real) — legítima por Adm, mas ainda **engenharia de apresentação**: a crítica de "efeito de codificação" só afrouxa nas etapas **T4–T6** (internalização + rob.1/rob.2). Não anunciar mais que isso.

---

## 5. Teorema (Nível C — enunciado único; construção apresentada; pendências 2–5 de §6 visíveis)

> **Teorema (realização uniforme em janela, Q1-P^adm, rob.0).** Existem uma teoria `T`, uma família efetiva única `{Φ_p}_{p ≥ s₀}` e duas apresentações `P_esp, P_den ∈ A(T)` (Adm.1–Adm.7; `ν` comum; ambos com expansão efetiva para a apresentação-base `P₀`), tais que, com `L_n = ⌈3log₂ n⌉`, `K_n = n²` e **um único par** de apresentações para todo `n`:
> (i) `C_{P_esp}(L_n) ∩ [0,K_n] ⊆ V ∩ [0,K_n]`, logo `N_esp(L_n;K_n) ≤ 2log₂ n + 1` e `R_esp(L_n;K_n) = 2^{m*} ∈ (n²/4, n²]` (paridade, A44);
> (ii) `N_den(L_n;K_n) ≥ n²/2` para `n ≥ n₀` (Lema 19.0(c), `n₀` escrito) e `R_den(L_n;K_n) ∈ [n² − a₁(c₀+2log₂n+1) − b − C₀, n²]`;
> (iii) portanto `R_esp ≍ R_den` (com `c = 1/4`, `C = 2`) e `N_esp ≁ N_den` (com `n₀` explícito, Lema 19.4) — **com constantes escritas**.
>
> *Refutação:* Lemas 19.0–19.4 violados por instância (busca limitada: rota payload-específica, valor colidindo, contagem fora da cota); alvo não aninhado (A35); `ν` distinto (A23); `Prf` indecidível (Adm.2); `Thm ≠ Thm(T)` (Adm.1).

**Onde isto fica na escada de maturidade (etapa18 §9.6):** realização abstrata ✓ → **realização em janela ✓ (C, uniforme T2 ✓)** → apresentação conservativa ✓ → **apresentação admissível ✓ (rob.0)** → apresentação p-equivalente (**rob.2 — D, T5/T6**) → ambiente canônico (**Q1-C — D**) → espectro global (**D**, T7/A29).

---

## 6. Pendências (o que ainda não é teorema; item 1 **concluído** em 30/09-b)

1. **CONCLUÍDA (30/09-b).** Esquema de carga formal (`Dec`, C1–C4, `s₀`, `h₀`) em §2.1; escada real E1–E4 em §2.2; **Lema 19.0** fecha a calibração (`d(σ_p) = f(|Φ_p|)` não-decrecente condicionada a **OB1–OB2**, valores den estritamente crescentes, contagem explícita `N_den ≥ n²/2` para `n ≥ n₀` escrito). Restam **OB1** (`S¹₂ ⊢ Φ_p^{w_0}` — esboço Σᵇ₀ dado) e **OB2** (leis da rota — decidíveis por instância, busca finita na cota `a₁|Φ_p|+b`) como obrigações **visíveis do enunciado**.
2. **(C)** Decidir, com o usuário, se `P_esp`/`P_den` são "não artificialmente ponderadas" suficientes para publicar em rob.0, ou se o texto salta direto para T5/T6 (rob.1/rob.2) — **decisão editorial**.
3. **(D)** T5/T6: tradução `P_{esp/den} → P_T` com sobrecusto e **estabilidade da separação** (A36 — exige prova com polinômios concretos).
4. **(D)** Q1-C: cotas **inferiores** uniformes `ℓ_T(σ_{n,i}) ≥ A(n,i)` com `U(n,i) < A(n,i+1)`; controle de cauda (T7 = A29); ambiente canônico `𝔠_T` fixo.
5. Correções registradas: etapa18 §9.5 pendência (b) **supersedida** (A37) e alvos de §9.5 **refinados** (A40: `S_esp = V∩[0,K_n]`, sem atalhos; `S_den` por contagem).

---

## 7. Proibições preservadas

P-4.1–7 intactas; P-4.2 mantida (forma geral); **P-1/Q1 e Q1-P^adm/Q1-C nunca anunciados como fechados** (o teorema de §5 é "Nível C, construção apresentada"); nenhum grau de `R_T`; nunca `Γ=0`/`H=0`/`N=k` sem prova; `≍` sempre com constante; `MathSciNet` não consultado; dado observado vs teorema por linha (neste documento: **tudo é teorema/enunciado — nenhum dado executado**; nenhuma simulação foi rodada).

**Fim do documento.**
