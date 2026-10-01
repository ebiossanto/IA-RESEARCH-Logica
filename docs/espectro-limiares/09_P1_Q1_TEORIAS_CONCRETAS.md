# 09 — P-1/Q1 para teorias concretas (`S¹₂`, `PA`): o que foi desenvolvido, a barreira G.10 e o que falta

**Data:** 28/09/2026 · **Revisão:** 29/09/2026 (correções 1–6 de `revisão.md` aplicadas nesta revisão — ver §1 e as notas `C1′`/`C7`) · **Status:** documento de consolidação (não introduz teoremas novos — cada afirmação abaixo é citada com fonte e nível) · **Níveis no texto:** A/B/C/D por item.

Depende de: `06_GEOMETRIA_CT.md` §9.2–§9.4 (G.1–G.10, protocolo), `08_ETAPA10_MODELOS.md` (vereditos), `07_CONSEQUENCIA_GLOBAL.md` §5 (trilhas 4–6), `01_ambiente_formal_e_codificacoes.md` §7.7 (Q3/F1–F6), `paper/main.tex` (`rem:abertas-geom`, `rem:abertas-global`, `lem:barreira`, §8), `proofs/perfil_instabilidade_etapa12.md` (A19–A22, Lemas 12.1–12.2), `proofs/certificado_exclusividade_range_etapa13.md` (A15, Cor 13.5), `revisão.md` (revisão externa 29/09), `desenvolvimento nc.md` (programa rigoroso), `proofs/realizabilidade_apresentacoes_etapa18.md` (cadeia da revisão: achados A23–A34, lema de isolamento, janela exata).

**Tese do documento (a frase-chave):** para `S¹₂`/`PA`, P-1/Q1 **não são acessíveis por simulação** — os invariantes exatos não são computáveis (G.10) — e **só temos modelos** (`Env1`/`Env2`), que são *dado observado*, não teorema. O que resta são **três tipos legítimos de ataque**: janelas decidíveis com cota prévia, testemunhas Σ₁ com hipóteses visíveis, e teoremas de provabilidade (não simulação). **Correção de 29/09 (revisão §2):** o espectro medido é o de uma **apresentação** `(T, P, ν, |·|)`; P-1/Q1 lidos na interpretação canônica **B** seguem ABERTOS, e o alvo acessível por construção é a versão auxiliar **P-1^pres/Q1^pres** (C7), que é **resultado intermediário, não solução do caso canônico** (revisão §10.6).

---

## 1. Fundamentos (correções 1 e 3 da revisão de 29/09): o espectro é de uma apresentação

O que `C_T(L)` mede depende de como `T` é apresentado. Componentes **separados sempre** (revisão §2/§3.1; `desenvolvimento nc.md` §1):

| Componente | Papel |
|---|---|
| `T` | teoria (conjunto de teoremas / esquema de axiomas) |
| axiomatização | escolha concreta dos axiomas — mesma teoria, várias |
| `P` | sistema/cálculo de provas, `Prf_P` decidível (D8) |
| `ν` | codificação de fórmulas e provas (D3, livre de prefixo) |
| `|·|` (`cost_P`) | medida de tamanho (D5: comprimento da string-prova; custo ≥ 1) |

Definições operacionais: `ℓ_{T,P,ν}(φ) := min{|p|_ν : Prf_P(p,φ)}` (`∞` se não há prova); `C_{T,P,ν}(L)` = recordos sobre as famílias projetadas; `R`, `N`, `λ`, `Γ` herdam os índices. **Escrever `C_T(L)` só após fixar `(P₀, ν₀)`** — em todo o resto, `C_T` é sigla da apresentação fixada. Para o alvo canônico, o pacote completo é o **ambiente canônico** `𝔠_T = (L_T, A_T, P_T, ν_T, μ_T)` (linguagem, axiomatização, cálculo, codificação, medida) — e a escolha de numerais importa: `S^n0` custa `O(n)`, notação binária custa `O(log n)`; `μ_T` muda e `ℓ_T` muda junto (cuidado registrado pela direção de 29/09).

**Três interpretações (revisão §2):**
- **A (apresentação):** invariantes de `(T, P, ν)` — variar `P`/`ν` mantendo `Thm(T)`. **É a interpretação do alvo auxiliar P-1^pres/Q1^pres** (C7), e nela as duas apresentações comparadas devem usar **`ν` comum** — com `ν` distinto, padding de codificação trivializa a separação (**A23**, `proofs/...etapa18.md` §2).
- **B (canônica):** apresentação canônico-teórica fixada (`S¹₂`/`PA` com dedução natural) e `C_T := C_{T,P₀,ν₀}`. **É a leitura canônica de P-1/Q1** (`06` §9.3) — permanece ABERTA.
- **C (invariantização):** ínfio sobre todas as apresentações — **degenera** (axiomatizar `φ` diretamente; só tem conteúdo restringindo a classe de traduções). Não usada.

**Duas consequências que mudam o enunciado de P-1/Q1:**
1. "Mesmos teoremas" **não** implica "mesmos comprimentos": extensões conservativas alteram `ℓ` (atalhos comprimem sem acrescentar teoremas — `desenvolvimento nc.md` §4). Logo P-1/Q1 são perguntas sobre **apresentações**; a versão que se pode construir é **P-1^pres/Q1^pres** (C7), **não** a canônica.
2. Todo resultado desta linha registra `(P, ν)` junto — nunca "a teoria" isoladamente; e a cota/`ℓ` exato jamais segue de limite superior sozinho (C1′, A28).

---

## 2. Enunciados exatos (onde estão escritos)

**P-1 (Etapa 9 — o alvo publicável).** Demonstrar `T₁, T₂` com `R_{T₁}(L) ≍ R_{T₂}(L)` mas `N_{T₁}(L) ≁ N_{T₂}(L)` ou `Δ_{T_i}(L)` radicalmente distintos.
*Fontes:* `06` §9.3; `paper` `rem:abertas-geom` (P-1). Convenção `≍`: `f ≍ g` ⟺ `∃c,C > 0 ∀L ≥ L₀: c·f(L) ≤ g(L) ≤ C·f(L)` — **registrar sempre a constante**.

**Q1 (suficiência de `R_T`).** Existem espectros com o mesmo `R_T(L)` e distintos `λ/Γ` — esquematicamente `C₁ = {R}` versus `C₂ = {1,…,R}` — **realizáveis como `C_T` de teorias concretas**?
*Fontes:* `paper` `rem:abertas-global` (ii) e §8 item (3); `07` §5 trilha 4; `08` §10.5 item 2. A pergunta **certa** (a que decide se `R_T` é ou não suficiente "em geral") é a realizabilidade por teorias concretas — a identidade `D_n = Γ` não depende do envelope, a realizabilidade depende.

**Barreira G.10 (nível B — `06` §9.2, `paper` `lem:barreira`).** Para `T ∈ {S¹₂, PA}` (ou qualquer `T` r.e. suficientemente forte):
1. `r ∈ C_T(L)` é **Σ₁** (enumerável);
2. calcular **exatamente** `N_T(L)`, `m_T(L,r)`, `Δ_T(L)` ou `μ_{T,L}` exige decidir `T ⊬ φ` (complemento de Σ₁-completo — não-decidível);
3. consequência metodológica: nenhuma simulação produz `j*_T(Φ)` — só `ĵ = J_{T,Φ}(c)` com `ĵ ≤ j*` **sempre** e `ĵ = j*` **ss** `c ≥ ρ_T(Φ)`; todo experimento registra `(limite, ĵ, Φ)` e **dado observado ≠ teorema**.

*Nada aqui alega grau algum de `R_T`* (P-4.6 preservada).

---

## 3. O que G.10 **não** barra (as três portas legítimas)

G.10 barra o **valor exato ilimitado**. Não barra:

1. **Janelas decidíveis com cota prévia (B).** A prova de **A7** (`06` §9.6.6) mostra: para `K` fixo, decidir "`r` é recorde com `ℓ_j = r`" para `r ≤ K`, `|Φ| ≤ L` é **busca finita** (`Prf_T` decidível; não achou prova `≤ K` ⇒ `ℓ > K ≥ r`). Logo **`C_T(L) ∩ [0, K]` é computável para qualquer `T` r.e.** — e se alguém provar uma cota `R_T(L) ≤ K` para um `T` concreto, `C_T(L)` inteiro fica computável. Mesmo esquema do **A15/Cor 13.5** (`proofs/...etapa13.md`): teste por par `r` finito, **sem barreira G.10**; e do **Lema 12.1** (`proofs/...etapa12.md`): sondagem `ρ_T(Φ) > c ⟺ T ⊢ Φ^{w_{J(c)}}` — Σ₁ e portanto semidecidível por baixo. O **Lema 12.2** fecha mais: `𝔍_{T,L,c}` (contada e ponderada) é **decidível** em `(L,c)` fixos, enquanto `H_T` só é Σ₁.
2. **Testemunhas Σ₁ com cota honesta (B).** Reportar `N_T(L) ≥ k`, `Γ_T(L;I) ≥ ε`, `C_T(L) ⊇ S` **com testemunha explícita** `(Φ, j, prova)` é sempre legítimo. O protocolo A5/G.10 permanece: **nunca** reportar `Γ = 0` / `H = 0` / `N = k` (igualdade) sem prova completa — só cotas com testemunha, e sempre `(limite, ĵ, Φ)` nas buscas truncadas.
3. **Teoremas de provabilidade, não simulação (C/D).** Provar propriedades dos invariantes **sem computá-los** é exatamente o que os Lemas G.1–G.9 já fazem (nível B, todos provados sem calcular `N_T`). P-1/Q1 para `S¹₂`/`PA`, se fechados, serão **teoremas** (contagem, correção/soundness, cotas de prova, conservatividade, speed-up) — nunca a saída de um script.

Porta extra registrada: **`T` fora da classe de G.10** (§5, C5 abaixo).

---

## 4. O que foi desenvolvido (inventário com evidência)

### 4.1 Teoremas (nível B) — o que já está provado sem simulação

| Item | Fonte |
|---|---|
| Lemas **G.1–G.9** (lattice `C_T(L) ⊆ C_T(L')`, multiplicidade = suporte, `Z_L`/`μ_{T,L}`, limites `N ≤ 2^{2L+2}`, identidades, atividade, estabilização de `I_{T,Φ}` em `j*` — iff `c ≥ ρ`, `μ` probabilidade) | `06` §9.2 → `paper` §5 |
| Barreira **G.10** (Σ₁/Π₁) | `06` §9.2 → `paper` `lem:barreira` |
| Identidade de cobertura `D_n = Γ`, regimes `|𝒢_n| = |C_T∖{0}|+1`, estabilização `R^glob_n = R_T(L_n)` | `paper` §6 (`thm:cobertura`, `thm:regimes`, `thm:estab-global`) |
| **A7**: `C_T(L) ∩ [0,K]` decidível por busca limitada ⇒ `R_T(L) → ∞` (não limitada) | `06` §9.6.6 |
| **A15 / Cor 13.5**: teste por par decidível, **fora** de G.10 | `proofs/certificado_exclusividade_range_etapa13.md` |
| **Lema 12.1/12.2**: sondagem de `ρ` é Σ₁; `𝔍` decidível em `(L,c)` fixos | `proofs/perfil_instabilidade_etapa12.md` |
| **A19**: `H_T(L,c) = Γ_T(L;(c,∞))` ⇒ protocolo A5 herdado | idem |
| **Teorema 13.6 (Nível C)**: sob `(P4′)(i)`, `E_{r−1,r}(2^{m₀}) ≠ ∅` (ponte `transição → range` existencial) | `proofs/...etapa13.md` |
| **Q3.C**: equivalência de intervalo **na banda** sob `(P4′)/(P7a)/(P5)` + plano **F1–F6** | `01_ambiente` §7.7 |
| **Prop. da janela** (`C(L) ∩ [0,K]` computável — a prova abstrata de A7) e **teorema da janela exata** (realização + blindagem de **recordos** ⇒ igualdade na janela) | `proofs/realizabilidade_apresentacoes_etapa18.md` §3 (condicionais assinalados: A30) |
| **Lema de isolamento de comprimento** (I1–I3 ⟹ `ℓ_{P'}(σ) = r`; finito por instância; `I2 ∧ I3 ≡` "nenhuma prova curta") | idem §3.2 (correção 5 da revisão; ver C1′/C7) |

### 4.2 Dado observado (nível C) — a classe de modelos (Etapa 10)

Executado 27/09/2026: `src/julia/etapa10_modelos.jl` + `results/etapa10_resultados.txt` — **3.764 verificações PASS** (25 IDs; protocolo `06` §9.4 completo; busca truncada: nenhuma; seed `20260927`).

- **P-1 parcial (M.2):** par `Env1`/`Env2` com **mesmo envelope** `R_T(L) = 8` (`L = 1..4`) e geometrias distintas — `N(4)`: **1 vs 8** (fator 8), `Δ(4)`: **0 vs 1**, trajetória de `N`: `(1,1,1,1)` vs `(1,2,3,8)`, `Z`: 4 vs 8.
- **Q1 parcial (M.3):** `C₁ = {8}` vs `C₂ = {1..8}` realizáveis como `C_T` de **modelos** — `λ_Env1(8) = 15/16`, `λ_Env2(8) = ½` (e `λ(7)=¼`, `λ(5)=⅛`, `λ(1,2,3,4,6)=1/16`); `D₁₆(0,3)`: **0 vs 1/16**.
- **M.4:** indicador `r ≥ 1` do Teorema E **confirmado por refutação** da versão antiga (`|𝒢|` dados `1,3,5` vs versão antiga `2,4,6`).

**Veredito gravado (`08` §10.5):** P-1 **atacado, PARCIAL**; Q1 **atacado, PARCIAL**; para **teorias concretas** ambos **ABERTOS** (G.10). **Não anunciar P-1/Q1 como fechados.** Honestidade: os modelos foram *construídos* para separar — o conteúdo é que a pipeline inteira (`D_n`, `Γ`, `λ`, regimes, estabilização) calcula coerentemente o testemunho e o sandbox não deixou passar erro.

### 4.3 Metodologia fixada (nível C)

Protocolo `06` §9.4 (obrigatório por experimento): (i) definição do modelo; (ii) objetos enumerados; (iii) algoritmo; (iv) limite de tamanho; (v) reprodutível (script versionado); (vi) **dado observado vs teorema, separados por linha** + registro `(limite, ĵ, Φ)` de toda busca truncada. Limite duro: `N_T ≤ 2^{2L+2}` (G.5); `μ` só com `Z_L > 0` (G.4); `Δ_T` sempre com a cadeia de conjuntos que o produziu (G.2).

---

## 5. O que falta — caminhos a desenvolver (C1′–C7)

Cada caminho traz: meio, nível, o que destrava, **critério de refutação**.

### C1′ — Cotas **só para a família projetada** (correções 2 e 4 da revisão; antiga C1)

- **Impossibilidade da cota total (A27).** Uma cota uniforme total `K(L)` **computável** — "toda fórmula provável `≤ L` tem prova `≤ K(L)`" — decidiria `Thm(T)`: enumerar fórmulas `≤ L`, enumerar provas `≤ K(L)`, verificar. **Impossível** para `T` r.e. indecidível. As referências clássicas (Parikh 1973 / Pudlák 1986 / Buss 1994) **não** se leem como cota computável total (revisão §3.2) — é cota de **família projetada**.
- **Forma certa (3 peças; nenhuma sozinha fecha):** (i) cota de existência **só para as famílias projetadas** escolhidas `(σ_i, r_i)` / `(Φ, w_j)`; (ii) dado limite de existência, `ℓ` exato vem de **busca finita** sobre provas de custo `< U` — **nunca a cota superior sozinha implica comprimento exato** (A28; correção 4); (iii) `ℓ = ∞` exige **controle semântico** (correção de `T`/(P5)) — é o meio de C2. A janela `[0,K]` continua decidível (A7 = Prop. da janela da Etapa 18): ela trata "prova `> K`" e "sem prova" **igual** (rejeita o candidato), por isso **não** colide com A27.
- **Fontes possíveis de `K`/`U` (mantidas):** (a) limites clássicos de comprimento de prova (Parikh 1973 / Buss 1994, 1999 / Pudlák 1986, 1998 — **3 refs "a verificar", bloqueio ativo**); (b) obrigações **F1–F4** do gadget, cuja saída obrigatória é **cota explícita** `|p| ≤ K₁(|w|+1)` — se fecharem, `ρ_T` fica **computável na família do gadget**; (c) `(P4′)` de modo geral.
- **Nível:** C ao aplicar (hipótese: a cota é correta, visível e vale para `T` fixado).
- **Destrava:** primeiro dado **concreto** (não-modelo) sobre `C_T(L)` de uma teoria real.
- **Refutação:** cota `K` que não cobre algum `r` da **família projetada** (derruba a aplicação, não A7); igualdade `ℓ = U` alegada **sem** busca finita (A28); erro na enumeração de provas.

### C2 — Controle da cauda `∞` por falsidade + correção de T (C, hipótese visível)

- **Meio.** Se `Φ^{w_j}` é **falso (em ℕ)** e `T` é **correto (soundness)**, então `T ⊬ Φ^{w_j}`, i.e. `ℓ_j = ∞` — o "primeiro `∞`" (`j*`) pode ser **projetado por construção de fórmulas**, sem simulação. É exatamente o mecanismo do bloco `11` do gadget (`01_NUCLEO_DURO.md` §6: "falsa em ℕ ⟹ por correção/soundness **(P5)** não há prova"). Combinado com testemunhas de prova para as entradas finitas (tipo C3), fixa a escada `B_T(Φ)` por baixo e por cima.
- **Nível:** C — **hipótese visível obrigatória:** **correção de `T` (H-som / (P5))**, nunca embutida (D8); para `Φ^{w_j}` **Σ₁** basta a **Σ₁-correção** — registrar qual das duas se usa, e a polaridade da fórmula.
- **Refutação:** família projetada em que `j*` calculado divergir do `j*` real (ex.: alguma das entradas "falsas" é na verdade provável); ou falha da correção alegada.

### C3 — Testemunhas Σ₁ aplicadas a `S¹₂`/`PA` (B; execução só sob pedido)

- **Meio.** Aplicar o protocolo A5/G.10 a buscas pequenas em `S¹₂`/`PA`: reportar `N ≥ k` / `Γ ≥ ε` / `C_T(L) ⊇ S` com `(Φ, j, prova)` explícitos. **Sem nunca reportar igualdade ou `Γ = 0`.**
- **Nível:** B (protocolo já gravado); a *execução* depende da reabertura do loop de simulação (**sob pedido**).
- **Refutação:** qualquer linha sem testemunha; qualquer `Γ = 0` reportado.

### C4 — Teorema de provabilidade, não simulação (D; o alvo real de P-1/Q1)

- **Meio.** Fechar P-1/Q1 por argumentos que **não computam** invariantes: separação via (a) cotas superiores de prova (C1′) + cauda `∞` por correção de T (C2) sobre fórmulas **projetadas**; (b) pares de teorias com mesma cota de envelope mas geometrias distintas; (c) conservatividade / extensões com speed-up — **comparação obrigatória** com Gödel 1936, Parikh, Pudlák, Buss (`paper` §7 `sec:comparacao`; a "lei" de `R_T` é clássica, não reivindicar).
- **Nível:** D (nenhum ataque executado; idéia registrada aqui).
- **Refutação:** qualquer passo que exija calcular `N_T`/`Δ_T` exatos sem cota (volta a G.10); qualquer comparação sem a constante de `≍`.

### C5 — "Teorias concretas" fora da classe de G.10 (C — decisão editorial pendente)

- **Meio.** G.10 vale para `T` r.e. **suficientemente forte** (Thm(T) Σ₁-completo). Uma teoria concreta com Thm **decidível** (ou cujo fragmento `{Φ^{w_j}}` seja decidível) **escapa da hipótese**: aí os invariantes são computáveis por enumeração de provas e P-1/Q1 fecham **integralmente**.
- **Risco/decisão:** se "teorias concretas" de P-1/Q1 significa **`S¹₂` vs `PA`** (leitura canônica, `06` §9.3), C5 não fecha o alvo — fecha apenas uma instância mais fraca. **Registrar a decisão de escopo antes de investir.**
- **Nível:** C. **Refutação:** mostrar que o `T` escolhido é Σ₁-completo (volta a G.10), ou que a separação obtida não é `≍` com constante registrada.

### C6 — Bloqueios externos (mantidos; nada editado)

1. **3 refs bibliográficas "a verificar"** (Parikh1973 veículo/páginas; Pudlak1986 coletânea; Buss1994 59(3) vs 59(4)) — acesso institucional; **parado pelo usuário**; `MathSciNet` **não** consultado; só sob pedido.
2. **F1–F6** (formalização de `(P4′)`/`(P7a)`) — exige Lean; destrava C1-by-(b), `Teorema 13.6` → B e Q3 fora da banda; **F6** (bomba de banda) é bomba de banda aberta.
3. **Loop de simulação parado** — `verifica_espectro.py` (19/19, **não** cobre A–F) e varreduras maiores só sob pedido; `Env1/Env2` = construção **não executada** para todo `L` (`08` §10.5 item 3).

### C7 — Q1-P^adm (ex-"P-1^pres/Q1^pres"): realizabilidade por **apresentações admissíveis** (alvo intermediário; correção 6; escopo decidido 29/09)

- **Enunciado-alvo (D — não é teorema).** Duas apresentações `P_esp`, `P_den` do **mesmo** `T` com **`ν` comum** (A23), conservativas (`Thm` iguais, `ℓ` livre), tais que, com `K_n = M_n`, `M_n → ∞`: `R_esp(L_n;K_n) = R_den(L_n;K_n) = M_n` (constantes `c = C = 1`) mas `N_esp ≁ N_den` — separação real só **na janela**; `R`/global voltam a G.10 e à cauda Π₁ (A29).
- **O que já está provado (B):** decidibilidade da janela (A7 = Prop. 3.1), **lema de isolamento de comprimento** (I1–I3; verificação finita por instância), teorema "realização + blindagem de **recordos** ⇒ janela exata", certificado finito — todos em `proofs/realizabilidade_apresentacoes_etapa18.md` §3.
- **Fase de ataque registrada (A23–A34, idem §2):** `ν` comum obrigatório (A23); atalhos só axiomáticos com linha verbatim (A24); blindagem no nível de **recordos**, não de comprimento (A30); **A32 refuta** a uniformidade esparso `{M_n}` numa apresentação única; **A33** é o conserto (base de custos finos por padding ⟹ `N_den/N_esp ≍ M/log M → ∞`, até para `T` r.e. indecidível).
- **Construção pendente (C):** explicitar a família `Φ_{r_i}` + base de custos finos; ver revisão §11 (caminho em 7 passos: 1 fixação ✓, 2 isolamento ✓, 3 janela = alvo, 4 realização, 5 enunciado, 6 internalização futura, 7 canônico **ABERTO**).
- **Decisão de escopo (29/09 — oficial; revisão §10.6):** C7 é **Q1-P^adm**, resultado intermediário — **não** resolve P-1/Q1 de `S¹₂`/`PA`; classe de admissibilidade `A(T)` = **Adm.1–Adm.7** (`Thm` igual, `Prf` decidível, expansão efetiva, uniformidade, custo = comprimento real, contabilidade honesta, sem regra `Thm`); robustez em três níveis **rob.0 → rob.1 (simulação computável) → rob.2 (simulação polinomial)** antes do canônico. O caso canônico abre só com cotas superiores **e** inferiores uniformes (C1′ + C2).
- **Correção A35 (29/09):** a janela esparso **singleton `{M_n}`** para `P_esp` é **impossível** com apresentação única e `M_n → ∞` (monotonicidade de `C(L)∩[0,K]` — prova em `proofs/...etapa18.md` §9.4; vale até exigindo igualdade só "para infinitos n"; A32 é caso especial). O **enunciado corrigido** está em §9.5: alvos **aninhados** `S_esp(n) = {m² : m ≤ n} ∪ (V∩[0,K_n])`, `S_den(n) = [s₀, n²] ∪ (V∩[0,K_n])`, `L_n = ⌈3log₂ n⌉`, `K_n = n²` ⟹ `R_esp = R_den = n²` e `N_esp = O(n)` vs `N_den ≍ n²` com constantes escritas (D; construção pendente).
- **Refutação:** qualquer passo que exija computar a escada de um `T` indecidível (volta a G.10); `ν` distinto entre as apresentações; atalho por regra derivada (A24); `R = M` alegado sem uma das três hipóteses de cauda (A29).

---

## 6. Tabela obrigatória: dado observado × teorema (por linha)

| Afirmação | Estatuto | Fonte |
|---|---|---|
| `Env1`/`Env2` mesmo `R≡8`, `N(4)` 1 vs 8 | **dado observado (modelos)** | `08` §10.4 |
| `λ(8)` 15/16 vs ½; `D₁₆(0,3)` 0 vs 1/16 | **dado observado (modelos)** | `08` §10.4 |
| 3.764 verificações da bateria | **dado observado (confirma teoremas; não substitui provas)** | `results/etapa10_resultados.txt` |
| G.1–G.10, `D_n = Γ`, regimes, estabilização | **teorema (B)** | `06` §9.2, `paper` §§5–6 |
| `C_T(L) ∩ [0,K]` decidível; `𝔍` decidível em `(L,c)` | **teorema (B)** | A7; Lema 12.2 |
| P-1 fechado para `S¹₂`/`PA` | **ABERTO** (G.10) | `06` §9.3; `08` §10.5 |
| Q1 realizável por teorias concretas | **ABERTO** (G.10) | `paper` `rem:abertas-global` (ii) |
| Extensão de `Env1/Env2` a todo `L` | **construção registrada, não executada** | `08` §10.5 item 3 |
| C1′–C7 (caminhos) | **idéias registradas + lemas base da Etapa 18; construção pendente** | este documento; `proofs/...etapa18.md` |
| P-1^pres/Q1^pres (janela exata entre apresentações) | **enunciado-alvo (D) + lemas base (B); construção pendente (C)** | `proofs/realizabilidade_apresentacoes_etapa18.md` |
| Isolamento de comprimento; janela exata condicional (realização + blindagem de recordos) | **teorema (B), condicionais visíveis** | idem §3 |
| Cota uniforme total `K(L)` computável | **REFUTADA — decidiria `Thm(T)`** (A27) | idem §2; `revisão.md` §3.2 |
| Blindagem de **comprimento** para `P ⊆ P'` | **REFUTADA** — usar blindagem de **recordos** (A30) | idem §2 |
| Blindagem esparso `{M_n}` uniforme numa apresentação única | **REFUTADA** (A32); conserto A33 registrado | idem §2 |

---

## 7. Proibições preservadas (herdadas; intactas)

1. **Nunca anunciar P-1 ou Q1 fechados** — o veredito é sempre "atacado, PARCIAL / ABERTO para teorias concretas"; **P-1^pres/Q1^pres** também só como "enunciado-alvo/condicionado" (nunca "resolvido").
2. **Nunca `Γ = 0` / `H = 0` / `N = k`** sem prova completa (A5/G.10); só cotas com testemunha `(Φ, j, prova)` + registro `(limite, ĵ, Φ)`.
3. **P-4 completa (1–7):** sem hierarquia `b₁ < b₂ ⟹ ≺`; sem diferença de `rng(g^[b])` (**P-4.2 mantida** — forma geral, apesar do Teorema 13.6 existencial); sem ponte com `τ`; sem novidade de `b(n)`; sem "no-majorant"; **nenhum grau de `R_T`** sem hipóteses visíveis e nível C.
4. **Nada sobre `PA`/`S¹₂` além do que é teorema** (`08` §10.5 item 4).
5. `≍` sempre com a **constante registrada**.
6. Classificação editorial A/B/C/D por seção; "possível contribuição original" só para o objeto espectral e a geometria de `C_T`.
7. **29/09:** espectro sempre com os componentes `(T, P, ν, |·|)` visíveis (§1); separação **nunca** obtida por atalho de `ν` (A23); cota superior sozinha nunca ⇒ comprimento exato (A28); `R` global nunca igualado sem hipótese de cauda (A29).

---

## 8. Próximos passos ordenados (para ser desenvolvido)

Caminho recomendado pela revisão §11 (7 passos) — status marcado nesta rodada:

1. **[✓] Fixação dos componentes** `(T, P, ν, |·|)` + Interp. A/B/C e decisão (B canônico / A auxiliar com `ν` comum) — este §1; cadeia Etapa 18 §1.
2. **[✓] Lema de isolamento de comprimento** (I1–I3, finito por instância) — Etapa 18 §3.2.
3. **[→] Janela exata** (`C(L) ∩ [0,K] = S` via realização + blindagem de recordos) — o alvo: construir a família `Φ_{r_i}` e a base de custos finos (C7; A33/A34).
4. **[→] Realização esparsa/densa** com `ν` comum, `K_n = M_n`, constantes escritas (C7).
5. **[✓ enunciado / → construção] Q1-P^adm** (ex-P-1^pres/Q1^pres) — enunciado corrigido em C7 + `proofs/...etapa18.md` §9.5 (D); construção pendente (C).
6. **[ futuro D ] Internalização** em teorias assinaladas (`S¹₂`, `S¹₂+RFN(S¹₂)`, `PA`) — só após 3–5 fechados.
7. **[ABERTO] Caso canônico** `S¹₂`/`PA` — abre **só** com cotas superiores **e** inferiores uniformes (C1′+C2); nunca por esta cadeia.

Demais itens mantidos:

8. **[DECIDIDO 29/09 — correção aplicada]** O escopo de "teorias concretas" em Q1 agora é **oficialmente de dois níveis** (direção de 29/09; registrado em `proofs/realizabilidade_apresentacoes_etapa18.md` §9.1):
   - **Q1 = problema canônico (principal):** teorias + **ambiente canônico fixo** `𝔠_T = (L_T, A_T, P_T, ν_T, μ_T)`, preferencialmente `S¹₂` e `PA`, com apresentações fixadas **independentemente da família-testemunha** e sem axiomas/macros/regras ad hoc posteriores; `ℓ_T`/`C_T`/`R_T`/`N_T` só são legítimos depois de `𝔠_T` escrito.
   - **Q1-P^adm = problema intermediário (= caminho C7):** duas apresentações do mesmo `T` dentro de uma classe de admissibilidade `A(T)` (**Adm.1–Adm.7**, custos sintáticos reais `cost(q)=|q|`, expansão efetiva para base comum, `ν` comum). C7 ataca **só** este nível; **nunca** será apresentado como solução de Q1.
   - Rota adotada: `Q1-P^adm → reflexão finita (T vs T+Con/RFN) → S¹₂ vs extensão natural → S¹₂ vs PA` (etapas T1–T7; robustez rob.0→rob.1→rob.2; política de maturidade de 7 níveis). **C5** passa a valer só como instância fraca de Q1-P^adm (não fecha Q1).
9. **C1′ via (b):** perseguir F1–F4 (Lean) — a saída obrigatória são cotas explícitas de prova **da família projetada**, que tornam `ρ` computável na família do gadget (primeiro dado concreto possível).
10. **C2:** esboçar a família de fórmulas projetada (cauda `∞` por correção de T — (P5)/H-som; para `Φ^{w_j}` Σ₁, Σ₁-correção) com critério de refutação — fase de ataque **antes** de redigir qualquer enunciado.
11. **C3:** reabrir buscas pequenas em `S¹₂`/`PA` (**sob pedido**), reportando só cotas com testemunha.
12. **C4:** quando as 3 refs forem liberadas (sob pedido), cruzar cotas clássicas de comprimento de prova com `C_T(L)` — único caminho para P-1/Q1 canônicos **sem** violar G.10.
13. Manter sincronias: este documento e `proofs/realizabilidade_apresentacoes_etapa18.md` registrados no `README` (tabela de documentos); vereditos de `08`/`06`/`07` **não** alterados ("parcial/aberto" permanece).

---

**Proibições verificadas nesta redação:** nenhuma alegação de hierarquia `b₁ < b₂ ⟹ ≺`; nenhuma diferença de `rng`; nenhuma ponte com `τ`; nenhum grau de `R_T`; nenhum `Γ = 0`; P-1/Q1 **não** anunciados como fechados (nem P-1^pres/Q1^pres — só "enunciado-alvo"); P-4.2 mantida; `MathSciNet` não consultado; espectro sempre com `(T, P, ν, |·|)` visíveis; nenhuma cota total computável alegada (A27 refutada); nenhuma exatidão de `ℓ` vindas de cota superior sozinha (A28).

**Fim do documento.**
