# Cadeia — Etapa 18: realizabilidade espectral por apresentações (P-1^pres / Q1^pres)

**Data:** 29/09/2026 · **Status:** cadeia gravada (fase de ataque + consolidação + correções); **rodada b**: escopo Q1-P^adm/Q1-C, classe `A(T)` = Adm.1–Adm.7, robustez rob.0–2, **A35/A36** e teorema-alvo corrigido (§9) · **Níveis:** A/B/C/D por item.

**Insumos (lidos antes de redigir, na ordem pedida):** (1) `revisão.md` (revisão externa de 29/09 sobre `09_P1_Q1_TEORIAS_CONCRETAS.md`); (2) `desenvolvimento nc.md` (desenvolvimento rigoroso do programa da revisão: janela, isolamento, blindagem, teorema da janela exata, versão assintótica).

**Depende de:** `09_P1_Q1_TEORIAS_CONCRETAS.md` (correções 1–6 da revisão aplicadas na mesma rodada), `06_GEOMETRIA_CT.md` §9.2/§9.6.6 (G.1–G.10, A7), `01_ambiente_formal_e_codificacoes.md` (D3/D5/D8, (P4′), (P5)), `08_ETAPA10_MODELOS.md` (M.1 — convenção "posição 0 é recordo"), `proofs/certificado_exclusividade_range_etapa13.md` (A15/Cor 13.5), `proofs/perfil_instabilidade_etapa12.md` (A18–A22).

**Não altera:** teoremas locais do `paper`; proibições P-4 intactas; **caso canônico `S¹₂`/`PA` segue ABERTO** (a revisão §11.7 e o `desenvolvimento` §15 exigem isso explicitamente).

---

## 1. Fixação dos componentes (Nível A — revisão §2, §11 item 1)

O que se mede é `ℓ` de uma **apresentação**, não de uma teoria:

| Símbolo | Papel |
|---|---|
| `T` | teoria (conjunto de teoremas / esquema de axiomas) |
| axiomatização | escolha concreta dos axiomas de `T` |
| `P` | sistema/cálculo de provas (`Prf_P` decidível — D8) |
| `ν` | codificação de fórmulas e provas (D3: livre de prefixo) |
| `cost_P(p) = |p|_ν` | medida de tamanho (D5: comprimento da string-prova; **custo ≥ 1**) |

`ℓ_{T,P,ν}(φ) := min{cost_P(p) : Prf_P(p,φ)}`, `∞` se não houver prova. `C_{T,P,ν}(L)`, `R`, `N` herdam os três índices; escrever `C_T(L)` **só** após fixar `(P₀, ν₀)` (Interpretação B).

**Interpretações (revisão §2):** **A** — invariantes da apresentação (variar `P`/`ν` com mesmo `Thm`); **B** — apresentação canônica fixada `C_T := C_{T,P₀,ν₀}`; **C** — ínfio sobre todas as apresentações (degenera: axiomatizar `φ` — rejeitada, salvo classe restrita de traduções).
**Decisão:** problema canônico (`S¹₂`/`PA`) = **B**; realizabilidade auxiliar = **A com `ν` comum** às duas apresentações (por A23).

**Convenções load-bearing:**
- **N-1 (medição verbatim):** toda linha de prova aparece inteira no código (sem macro/referência/compartilhamento) ⟹ `|p| ≥ |linha|`. Sem N-1 o isolamento (§3) é **falso** (uma "prova" `p = use q` codificada em `O(1)` símbolos teria `|p| < r`).
- **N-2 (famílias do projeto):** `C_T(L)` só recoje recordos das escadas `(Φ^{w_j})_j` de `Φ` **admissível** com `|Φ| ≤ L` (não tuplas arbitrárias — ver A34). Convenção do projeto: **posição 0 é recordo** quando `ℓ_0 < ∞` (`08` M.1).
- **Conservatividade ≠ comprimentos:** `Thm(P') = Thm(P)` não preserva `ℓ` (macros/atalhos comprimem sem acrescentar teoremas — `desenvolvimento` §4). É exatamente a brecha por onde P-1^pres entra.

---

## 2. Fase de ataque — achados A23–A36 (A35–A36: rodada 29/09-b, §9)

**A23 — `ν` trivializa P-1^pres.** Codificação com padding (arredondar todo custo de prova para a potência de 2 seguinte) mantém `Prf` decidível e `R ≍` (constante 2), mas colapsa os recordos num conjunto fino (`N` cai de `~M` para `~log M`). Separação assim obtida é **vazia**. *Correção:* P-1^pres exige **`ν` comum** às duas apresentações (Interp. B para `ν`; variar só `P`). *Refutação:* apresentação com `ν` distinto "resolve" P-1 → versão sem conteúdo.

**A24 — atalho por regra derivada não é cobrado pela medida.** Aplicar uma regra não embute no código uma string de custo `r`; só **atalhos axiomáticos/certificados com linha verbatim** (sob N-1) garante `|p| ≥ r` ao usá-los. A revisão §6 admitiu "nova prova **ou regra**" — **restringido**; o `desenvolvimento` §5 já usa certificados (`shortcut(i,τ)`) ✓. *Refutação:* regra com premissas baratas dá `ℓ < r`.

**A25 — interferência fora da família projetada.** Adicionar atalhos (i) dimina `ℓ` finito de fórmulas fora da família e (ii) torna provável o que era `∞` (muda `j*`, cria recordos novos, em valores **arbitrariamente grandes**). Como `C_T(L)` é sobre **todas** as `Φ ≤ L`, o controle uniforme em `n` é o trabalho difícil; por instância a janela é decidível (Prop 3.1), a uniformidade não.

**A26 — `R` não é monotono sob adição de atalhos.** Pode subir (recordos novos de fórmulas antes `∞`) **e** descer (`ℓ` diminui). O desenho "máximos iguais `= M(L)`" precisa de hipótese explícita — no projeto: janela com **`K = M`** (A31).

**A27 — cota uniforme total é impossível (confirma e restringe a revisão §3.2).** Se `K(L)` computável cobrisse toda fórmula provável `≤ L`: enumerar fórmulas `≤ L`, enumerar provas `≤ K(L)`, verificar ⟹ `Thm(T)` decidível. Logo **só cotas por família projetada** (C1′). **Não colide com A7/Prop 3.1:** a janela trata "prova `> K`" e "sem prova" **igualmente** (rejeita o candidato), por isso não decide `Thm(T)`.

**A28 — exatidão nunca vem de cota superior sozinha.** Cota superior dá `ℓ ≤ U`; o valor exato exige (i) **busca finita** sobre todo `p` com `cost < U` (quando existe prova testemunha) e (ii), para `ℓ = ∞`, **controle semântico** (correção/(P5)). O `desenvolvimento` §10 usa exatamente essa divisão ✓.

**A29 — janela ≠ global (o motivo de a cauda ser Π₁).** `C(L) ∩ [0,K] = S` **não** implica `C(L) = S` nem `R(L) = max S`: a **presença** de recordo `> K` é Σ₁ (semi-decidível — a busca acha), a **ausência** é Π₁ (não certificável por busca finita, mesmo por instância). Promoções suficientes (=`desenvolvimento` §14): `R(L) ≤ K` / cauda falsa + correção / irrelevância estrutural da cauda. *Refutação:* registro `(limite, ĵ, Φ)` de toda busca; nunca `R = M` sem uma das três.

**A30 — Def 8.1 (blindagem de COMPRIMENTO) é falsa; a correta é J2 (de RECORDOS).** "`ℓ(ψ) ≤ K ⟹ ℓ(ψ) ∈ S` para toda `ψ` visível" **falha para qualquer extensão `P ⊆ P'` de base não trivial**: provas-base de fórmulas fáceis persistem com custo pequeno ≠ `M` (lado esparso). A condição certa é **J2** — todo **recordo** `≤ K` pertence a `S` —, que é (a) a que o **Teorema 9.1** realmente usa, (b) certificável por instância (Prop 3.1: recordo `≤ K` decidível por busca limitada) e (c) já o que a §10 do `desenvolvimento` faz ("pertence a `S` **ou não produz recordo**"). **§8 e §10 do `desenvolvimento` estão inconsistentes: manter §10, reescrever Def 8.1 no nível de recordos.** *Refutação:* um `ψ` base com prova curta `≠ M` viola Def 8.1 sem violar J2.

**A31 — instâncias: `K = M` resolve o denso; o esparso exige base cara.** Com `K = M` e custo mínimo ≥ 1, J2 no lado **denso** (`S = {r₁ < … < r_t = M}`) é **trivial** (todo recordo `≤ M` jaz em `[1, M] ⊇ S`... é preciso `S = [1,M]` na forma total, ou `S ∋` todos os valores visíveis — ver nota abaixo). O lado **esparso** `S = {M}` exige que **toda** prova-base de cilindro `≤ L` tenha custo em `{M} ∪ (K, ∞)` — satisfáível por instância **elevando custos** (padding para **cima**, nunca para baixo) com `K = M`. *Refutação:* cilindro `≤ L` com prova-base `≤ K`, `≠ M`.

**A32 — a uniformidade esparso `{M_n}` do `desenvolvimento` §13 é IMPOSSÍVEL.** Para **uma única** apresentação `P_esp` e `M_n → ∞`: fixe `Φ*` admissível com `Φ*^{w_0}` provável em `T` (ex.: `Φ*` válida; se `T` não provasse nenhum cilindro, `Z_L = 0` violaria `(P4′)`) e `c := ℓ_{P_esp}(Φ*^{w_0}) < ∞`. `c` é recordo (posição 0 — N-2) e `c ≤ K_n` para `n` grande (`K_n ≥ M_n → ∞`), logo `c ∈ C_esp(L_n) ∩ [0,K_n] = {M_n}` ⟹ `c = M_n` para **todo** `n` grande ⟹ contradição com `M_n → ∞`. **Refuta** a hipótese "construções uniformes em `n` com `C_esp ∩ [0,K_n] = {M_n}`" — não o Teorema 9.1 (que é por instância). *Refutação de A32:* achar a falha no argumento (o que exigiria ou `Φ*^{w_0}` improvável — contra `(P4′)` — ou `K_n` limitado — contra `M_n → ∞`).

**A33 — conserto (a separação sobrevive).** Base com **custos finos**: padding (só para cima) de **toda** prova-base para um conjunto fino `V` (ex.: próxima potência de 2) — transformação **sintática**, `Prf` continua decidível e **nada se decide sobre `Thm(T)`** ( vale para `T` r.e. indecidível). Consequências: (i) janela esparso `= V_n ∪ {M_n}` com `|V_n ∩ [0,M_n]| ≤ log₂ M_n + 1`; (ii) denso cobre `≈ [s₀, M_n]` (`s₀` = sobre-custo mínimo do certificado — `r_i ≥ s₀`, A-nota: valores abaixo do custo do certificado são inatingíveis); (iii) `R_esp(L_n; M_n) = R_den(L_n; M_n) = M_n` (`K_n = M_n`; `V_n ⊆ [1, M_n]`, `M_n` no lado esparso pelo atalho); (iv) `N_den / N_esp ≍ M_n / (log₂ M_n + 1) → ∞` ⟹ **`N_esp ≁ N_den` com constantes visíveis**. *Condicionado:* "não artificialmente ponderada" (o `desenvolvimento` §15 já lista).

**A34 — tradução ao projeto (famílias ≠ tuplas).** O `desenvolvimento` abstrai "família" como tupla arbitrária `(φ₀,…,φ_m)`; no projeto só entram em `C_T(L)` os recordos das **escadas de um único `Φ` admissível** `(Φ^{w_j})_j`. Tradução: posicionar cada valor `r_i` desejado como **`ℓ_0` de uma fórmula própria `Φ_{r_i}`** (posição 0 é recordo se finita — N-2; `|Φ_{r_i}| ≤ L` por construção) — **mais fácil** que a família única do `desenvolvimento` §11.2: cada valor usa uma fórmula, sem exigir recordos crescentes dentro da mesma escada.

*Nota de verificação (D8 + §10 do `desenvolvimento`):* recordo `r ≤ K` é decidível por busca limitada — se algum predecessor não tem prova `≤ K`, então `ℓ_i > K ≥ r` e o candidato cai; se todos têm, comparamos valores exatos. Consistente com A7/A25.

---

## 3. Resultados herdados verificados (Nível B — provas conferidas)

1. **Prop. janela decidível** (= forma de A7; `desenvolvimento` §3): `C_P(L;K)` computável a partir de `(P, L, K)` sob `F_L` finita/enumerável, `Prf` decidível e custo `≤ K` enumerável. *Prova conferida:* trata "prova `> K`" e "sem prova" igual (A27).
2. **Lema de isolamento** (`desenvolvimento` Lema 6.1; = o "Lema de isolamento da revisão §6" corrigido): sob I1 (testemunha de custo `r`), I2 (toda prova `P'` de custo `< r` expande para prova `P` de custo `< r`) e I3 (nenhuma prova-base de custo `< r`): `ℓ_{P'}(σ) = r`. *Prova por contradição conferida.* Nota: **I2 ∧ I3 ≡ "nenhuma prova curta de σ em `P'`"** — I2 é a condição estrutural que reduz `P'` a `P`; **conservatividade sozinha não dá I2** (observação correta do `desenvolvimento` §6); sob N-1, I2 é **automático** para atalhos axiomáticos. *Caso `r` finito:* I3 e a verificação de I2 são **busca finita** (decidível por instância — mesmo esquema de A7/A15); o trabalho difícil é o **uniforme** (família `(σ_i, r_i)` — Lema 7.1, aplicação finita ✓).
3. **Teorema da janela exata** (`desenvolvimento` Teorema 9.1): J1 (realização: cada `r_i ∈ S` é recordo de alguma família `≤ L`) + J2 (blindagem de **recordos**) ⟹ `C_{P_S}(L) ∩ [0,K] = S`. *Prova conferida* (⊆/⊇); **condicional em J2 corrigida por A30**.
4. **Certificado finito** (`desenvolvimento` §10): parte positiva (família, índice, prova, custo exato, ausência de prova menor = busca finita, recordo) + parte de exclusão **no nível de recordos** ✓ (= versão correta de A30). Por quê não viola G.10: a ausência certificada é só de provas `≤ K`.
5. **Promoção a global** (`desenvolvimento` §14): só sob cota global / cauda falsa + correção / irrelevância estrutural (= A29).
6. **Aritmética das constantes** (`desenvolvimento` §9, §12, §13): `R ≍` com `c = C = 1` na janela; `N_1 = 1`, `N_2 = k_n → ∞` ⟹ `N_1 ≁ N₂` **com `c, C, n₀` escritos**. *Correção:* a premissa uniforme esparso cai por **A32** — usar **A33**.

---

## 4. Alvos (níveis + critérios de refutação)

**Teorema-janela (sequência obrigatória da revisão §8):**
- **Versão A — inclusão** `S_n ⊆ C_{T,P_S}(L_n)`: só testemunhas positivas (Σ₁). *Nível C* (exige construção). *Refutação:* `s ∈ S_n` sem testemunha.
- **Versão B — janela exata** `C_{T,P_S}(L_n) ∩ [0,K_n] = S_n`: J1 + J2 (recordos, A30); membership decidível por instância. *Nível C* (a construção uniforme é a pendência). *Refutação:* recordo visível fora de `S_n` (busca limitada acha).
- **Versão C — global** `C = S_n`: **D** — volta a G.10 sem cauda (A29: só com cota global/cauda falsa+correção/irrelevância estrutural).

**P-1^pres / Q1^pres (enunciados; Nível D — não são teoremas):**
> Duas apresentações `P_esp`, `P_den` do **mesmo** `T` com **`ν` comum** (A23), conservativas (`Thm` iguais; ℓ livre), tais que, com `K_n = M_n`, `M_n → ∞`: `R_esp(L_n;K_n) = R_den(L_n;K_n) = M_n` (constantes `c = C = 1`) mas `N_esp(L_n;K_n) ≍ log₂ M_n` e `N_den(L_n;K_n) ≍ M_n` ⟹ `N_esp ≁ N_den` (prova das constantes: se `N_den ≤ C·N_esp` para `n ≥ n₀`, então `M_n ≤ C(log₂ M_n + 1)` para `n ≥ n₀` — falso para `n` grande).
> Realização: base com custos finos (A33) + atalhos `r_i ∈ [s₀, M_n]` nas primeiras posições de cilindros `Φ_{r_i}` (A34, j = 0) + isolamento (§3.2). *Refutação:* qualquer passo que exija computar ladder de `T` indecidível (volta a G.10); `ν` distinto (A23); atalho por regra (A24); `R` sem uma das três hipóteses de cauda (A29).

**Decisão de escopo (revisão §10.6):** P-1^pres/Q1^pres são **resultado intermediário** — **não** resolvem o canônico `S¹₂`/`PA`. Este abre só com cotas superiores **e** inferiores uniformes (C4 do `09`).

---

## 5. Estatuto final (espelha o §15 do `desenvolvimento`, com A30–A33)

**Teorema abstrato (B):** isolamento local e simultâneo; decidibilidade da janela; `realização + blindagem-de-recordos ⟹ janela exata`; certificado finito; promoção a global só sob (i)/(ii)/(iii).
**Construtivo, pendente (C):** apresentações **naturais** com isolamento/blindagem uniformes; construção explícita de `P_esp`/`P_den` (versão A→B); `s₀` do certificado; "não artificialmente ponderada".
**Refutado nesta rodada (A32):** uniformidade esparso `{M_n}` numa única apresentação — conserto registrado em A33 (**D** até construído).
**Aberto (D):** conteúdo global; realização nas apresentações canônicas de `S¹₂`/`PA`; invariança diante de codificações polinomialmente equivalentes (só ν comum por enquanto, A23).

**Conclusão rigorosa (mantida, com o alvo certo):** *o envelope limitado `R_P(L;K)` não determina a geometria espectral limitada, mesmo entre apresentações conservativas do mesmo `T`* — **enunciado-alvo com lemas base provados; construção pendente (C)**. **Não** se afirma: `R_T(L)` não determina `N_T(L)` nas apresentações canônicas de `S¹₂`/`PA` — **segue ABERTO**.

---

## 6. Mapa das correções da revisão (§10) → onde ficaram

| # | Correção (revisão §10) | Onde |
|---|---|---|
| 1 | `C_T` → `C_{T,P,ν}` na fundamentação | este doc §1; `09` nova §1 |
| 2 | C1 → cotas só de **família projetada** | `09` C1′ (A27) |
| 3 | separar teoria/axiomatização/`P`/`ν`/medida | este doc §1 (tabela) |
| 4 | nunca cota superior sozinha ⇒ exatidão | A28; `09` C1′ |
| 5 | lema de isolamento | §3.2 (I1–I3, corrigido) |
| 6 | apresentações = intermediário, não solução do canônico | §4 decisão de escopo; `09` C7 |

Sequência da revisão §11: (1) fixação ✓ §1 · (2) isolamento ✓ §3.2 · (3) janela = **alvo B** · (4) realização esparsa/densa = **A33/A34** · (5) P-1^pres/Q1^pres enunciados (§4) · (6) internalização (`S¹₂`, `S¹₂+RFN`, `PA`) = futuro **D** · (7) canônico **ABERTO** ✓.

---

## 7. Proibições preservadas

P-4.1–7 intactas; **P-4.2 mantida** (forma geral); P-1/Q1 e P-1^pres/Q1^pres **nunca anunciados como fechados** (só "enunciado-alvo / condicionado"); nenhum grau de `R_T`; nunca `Γ = 0`/`H = 0`/`N = k` sem prova; `≍` sempre com constantes; `MathSciNet` não consultado (bloqueio mantido); dado observado vs teorema por linha.

## 8. Próximos passos

1. **Construção (C):** executar o teorema-alvo **corrigido** de §9.5 — base `V`-padding uniforme, fórmulas `Φ_r` com atalho de comprimento real `r`, verificação de `S ⊇`/`S ⊆` para **todas** as fórmulas `≤ L_n` (pendências (a)–(d) de §9.5). A fase de ataque (A23–A36) já está feita; agora o desenho concreto.
2. ~~Decisão de escopo~~ — **DECIDIDA (rodada 29/09-b, §9.1):** `Q1` = canônico (principal); `Q1-P^adm` = intermediário (= C7). `09` §8 item 8 sincronizado.
3. Absorção no `paper`/`09` e simulações: **sob pedido**.

---

## 9. Rodada 29/09-b: escopo adotado (Q1-P^adm / Q1-C), classe admissível, robustez e correção do próximo teorema

**Insumo:** direção externa de escopo recebida em 29/09 (decisão sobre o item pendente do `09` §8 e da revisão §11.7), integrada à fase de ataque.

### 9.1 Decisão de escopo (oficial)

- **Q1 = problema canônico (principal):** ambientes canônicos explicitamente fixados `𝔠_T = (L_T, A_T, P_T, ν_T, μ_T)` (linguagem, axiomatização, cálculo de provas, codificação, medida), preferencialmente `S¹₂` e `PA`, com apresentações fixadas **independentemente da família que testemunha a separação** e sem modificação ad hoc posterior (sem axiomas/macros/regras criados a posteriori para os valores desejados). Só **depois** de `𝔠_T` fixado é legítimo abreviar `ℓ_T(φ)`, `C_T(L)`, `R_T`, `N_T`.
- **Q1-P^adm = problema intermediário (é o caminho C7):** mesma `T`, `Thm(P₀) = Thm(P₁) = Thm(T)`, verificadores efetivos e traduções uniformes para uma apresentação-base. **C7 resolve/aproxima Q1-P^adm e não é solução de Q1-C.** Nome oficial novo para o objeto antes chamado "P-1^pres/Q1^pres" (mesmo objeto).
- Escopo estrito: em Q1, "teorias concretas" = teorias + apresentações canônicas fixas, explícitas e independentes da família-testemunha. Escopo auxiliar: extensões conservativas e apresentações alternativas admitidas **só** em Q1-P^adm, dentro de `A(T)` (§9.2).
- Cuidado canônico: numerais `S^n0` custam `O(n)` e notação binária `O(log n)` — a escolha muda `μ_T` e portanto todo `ℓ`; registrar sempre o pacote.
- Nomenclatura obrigatória: as condições A1–A7 da direção chamam-se aqui **Adm.1–Adm.7** (evita colisão com A1–A36 do projeto) e os níveis de robustez **rob.0/rob.1/rob.2** (evita colisão com os níveis de evidência A/B/C/D).

### 9.2 Classe admissível `A(T)` = Adm.1–Adm.7 (mapeamento com o que já existe)

| # | Condição | Já coberto por / observação |
|---|---|---|
| Adm.1 | correção e completude: `Thm(P′) = Thm(T)` | conservatividade (`desenvolvimento` §4) |
| Adm.2 | verificação efetiva: `Prf_{P′}` decidível (ideal: p-tempo em `|p|+|φ|`) | D8 (decidível); p-tempo = obrigação adicional (D) |
| Adm.3 | expansão efetiva `E: P′ → P_T` com `Prf_{P′}(p,φ) ⟹ Prf_{P_T}(E(p),φ)` | = **I2** do lema de isolamento + `desenvolvimento` §4/§5 |
| Adm.4 | apresentação uniforme (procedimento finito; sem tabela infinita não computável de comprimentos) | exige explicitamente o que A23/A32 pressupunham |
| Adm.5 | independência do testemunho (sem custo "declarado" externamente) | **A24** + isolamento (I3) |
| Adm.6 | contabilidade honesta (dado auxiliar no comprimento da prova, ou em descrição fixa contabilizada à parte) | **N-1** (linha verbatim) |
| Adm.7 | não-degenerescência: sem regra `π̄ / Thm(T)` (a condição lateral esconderia a decisão de `T`) | **A27** (decidiria `Thm(T)`) |

**Custos = comprimentos sintáticos reais:** `cost(q) = |q|` (símbolos/bits) e `ℓ_{P′}(σ) = min{|q| : Prf_{P′}(q,σ)}` — nunca custo atribuído pelo projetista; o padding só **produz** a string longa (símbolos reais, N-1), a exclusão de provas menores é o **lema de isolamento** (I3). Reformulação exigida pela direção de 29/09 §8 — já compatível com N-1/A24 daqui.

### 9.3 Robustez rob.0 → rob.1 → rob.2 (sequência obrigatória antes do canônico)

- **rob.0 — conservatividade simples:** `Thm(P′) = Thm(P)` (bastante para possibilidade lógica; vulnerável à crítica de "efeito de codificação").
- **rob.1 — simulação computável** nos dois sentidos (proíbe apresentações não efetivas; ainda permite grandes saltos de comprimento).
- **rob.2 — simulação polinomial mútua:** `ℓ_{P′}(φ) ≤ p(ℓ_P(φ)+|φ|)` e `ℓ_P(φ) ≤ q(ℓ_{P′}(φ)+|φ|)`.
- **A36 (D — obrigação):** rob.2 **não** preserva `N` automaticamente — do ponto de vista lógico, valores distintos podem colapsar sob distorção polinomial (ex.: `r_i = i` mapeado a `⌈i^{1/d}⌉` satisfaz ambas as simulações para polinômios adequados). A **estabilidade da separação** sob rob.2 é a obrigação **T6** e exige prova com os polinômios **concretos** escritos; separações com lacuna polinomial (nossa: `n²` vs `n`) sobrevivem à distorção polinomial **se** provado, não automaticamente.
- Sequência: rob.0 → rob.1 → rob.2 → caso canônico. Uma separação de `N` que sobreviva a rob.2 tem força muito maior.

### 9.4 A35 — monotonicidade-alvo (refuta o próximo teorema na forma singleton)

**A35 (Nível B — prova completa).** Fixada a apresentação `P` e com `L_n`, `K_n` não decrescentes, o índice `n ↦ C_P(L_n) ∩ [0,K_n]` é **crescente por inclusão**: `C_P(L)` é cumulativa em `L` (união sobre `|Φ| ≤ L`), a janela `[0,K]` cresce com `K`, e os valores `ℓ` dos ladders são fixos (apresentação fixa). Logo **toda sequência-alvo de um teorema de janela com `P` único deve ser aninhada** (`S_n ⊆ S_{n+1}` em cada passo de crescimento de `(L_n, K_n)`).

Em particular `C_P(L_n) ∩ [0,K_n] = {M_n}` com `M_n → ∞` é **impossível**, mesmo exigindo a igualdade apenas para **infinitos** `n`:
- se `K_n` é limitado: a janela crescente dentro de `[0,B]` estabiliza (conjunto finito) e `M_n` fica constante nos infinitos índices de igualdade ✗;
- se `K_n → ∞`: escolhe-se uma subsequência de índices de igualdade com `K` não decrescente; a aninhabilidade dá `{M_{n_i}} ⊆ {M_{n_{i+1}}}` ⟹ `M_{n_i} = M_{n_{i+1}}` ⟹ `M` constante em índices não limitados ✗ (contradiz `M_n → ∞`).

**Consequências:** (i) a forma singleton `{M_n}` proposta para `C_{P_esp}` (direção de 29/09 §"próximo objetivo" e revisão `revisão.md` §5) é **falsa** — a mesma refutação vale para a família única fixa (valores do ladder fixos ⟹ mesma monotonicidade); (ii) **A32** é o caso especial (custo fixo de cilindro provável); (iii) só valem alvos **aninhados crescentes** — é a correção de §9.5.

### 9.5 Teorema-alvo corrigido (enunciado; Nível D — construção = C)

> **Teorema de realizabilidade uniforme em janela para apresentações admissíveis (forma aninhada).**
> Existem uma teoria `T`, uma família efetiva única e duas apresentações `P_esp, P_den ∈ A(T)` (Adm.1–Adm.7; **`ν` comum**; custos sintáticos reais; expansão uniforme para uma apresentação-base comum), e parâmetros `L_n = ⌈3log₂ n⌉`, `M_n = n²`, `K_n = M_n`, `s₀` = sobre-custo mínimo do certificado, `V` = conjunto fino de custos da base (padding para a potência de 2 seguinte), tais que as sequências-alvo **aninhadas**
> `S_esp(n) := {m² : m ≤ n} ∪ (V ∩ [0,K_n])`, `S_den(n) := [s₀, M_n] ∪ (V ∩ [0,K_n])`
> satisfazem, **para todo n** (um único par de apresentações para todos os `n` — obrigação T2/uniformidade; sem `P_n` por `n`):
> `C_{P_esp}(L_n) ∩ [0,K_n] = S_esp(n)` e `C_{P_den}(L_n) ∩ [0,K_n] = S_den(n)`.
>
> **Consequências (constantes visíveis):** `R_esp(L_n;K_n) = R_den(L_n;K_n) = M_n = n²` com `c = C = 1`; `N_esp(n) ≤ n + ⌊log₂ n²⌋ + 1`; `N_den(n) ≥ n² − s₀ + 1`; logo `N_den/N_esp → ∞` — se `N_den ≤ C·N_esp` para `n ≥ n₀`, então `n² − s₀ + 1 ≤ C(n + 2log₂ n + 1)`, falso para `n` grande. Logo `R_esp ≍ R_den` mas `N_esp ≁ N_den`, com `c, C, n₀` escritos.
>
> **Refutação:** recordo visível fora do alvo (busca limitada acha); alvo **não aninhado** (A35); `ν` distinto (A23); custo atribuído em vez de comprimento real (Adm.5/A24); regra `Thm` (Adm.7/A27); apresentação dependente de `n` (viola T2).
>
> **Pendências concretas (C):** (a) base com `V`-padding **uniforme e independente da família** (escopo estrito); (b) para cada `r ∈ [s₀, n²]`, fórmula admissível `Φ_r ≤ L_n` com prova-base em `V` acima de `r` e atalho de comprimento **exatamente** `r` (contagem: precisa de `≈ n²` fórmulas admissíveis `≤ L_n` — `L_n = ⌈3log₂ n⌉` dá `≈ n³` candidatas, folga suficiente); (c) verificação de `S ⊆` (testemunhas) e `S ⊇` (blindagem de recordos, A30) para **todas** as fórmulas `≤ L_n`, não só as projetadas (A25); (d) prova de que `s₀` e `V` não contaminam o denominador.
>
> **[30/09] Executado e parcialmente corrigido pela Etapa 19** (`proofs/realizacao_uniforme_janela_etapa19.md`): **A37** mostra que a pendência (b) na forma "atalho de comprimento exatamente `r`" era **mal posta** (declaração de custo ou nome de prova) — substituída pela **regra de combustível** de `P_den` (provas de fórmulas com carga carregam prova real da sentença `J_p`); **A38** resolve (a)/(c) por construção (combustível em sentenças **não-admissíveis** ⟹ fora de `C_T`; blindagem do lado esp = regra única B-V); **A40** refina os alvos (`S_esp = V ∩ [0,K_n]`, sem atalhos nenhum; `S_den` por contagem) e dispensa `R` exato (`≍` basta). Teorema resultante: **§5 da Etapa 19 (Nível C)**.

### 9.6 Escada de transferência (T1–T7) e política de resultados

- **T1** realização em janela (formalmente preparada) → **T2** uniformidade (um único `P′` para todo `n` — exigido em §9.5) → **T3** eliminar pesos artificiais (custos = comprimentos reais; já é a regra aqui) → **T4** internalizar os certificados no sistema-base (reflexão limitada, consistência finita, regras derivadas uniformes, extensões definicionais) → **T5** tradução `P′ → P_T` com sobrecusto controlado → **T6** estabilidade da separação sob o sobrecusto (**A36**: exigir prova; D) → **T7** remover a janela (controle de cauda = A29/§14; segue **D**).
- **Política de maturidade** (nenhuma conclusão promovida sem prova explícita de transferência): realização abstrata → realização em janela → apresentação conservativa → apresentação admissível → apresentação polinomialmente equivalente → ambiente canônico → espectro global.
- **Rota canônica adotada:** `Q1-P^adm → reflexão finita (T vs T + Con_T(n̄), T vs T + RFN^{≤n}_Γ(T)) → S¹₂ vs extensão natural → S¹₂ vs PA`. Motivação: relação lógica explícita, força calibrável, conexão consistência finita ↔ comprimento de prova. **Q1-C segue ABERTO**; a verdadeira dificuldade continua sendo **cotas inferiores uniformes** `ℓ_T(σ_{n,i}) ≥ A(n,i)` com `U(n,i) < A(n,i+1)` (para recordos distintos) e controle de cauda (T7).
