# 07 — Consequência global: auditoria dos documentos-fonte e incorporação ao artigo

**Data:** 27/09/2026 — mesmo ciclo da §5/§6 do `paper/main.tex`.
**Status:** auditoria concluída (A/B); incorporação feita com correções obrigatórias; trilhas não percorridas registradas (§5 abaixo).
**Depende de:** `06_GEOMETRIA_CT.md` (geometria), `01_NUCLEO_DURO.md` §4–§8, `paper/main.tex` §3–§4.
**Documentos auditados (na raiz do projeto):** `desenv..md`; `CONTINUIDADE_ESPECTRO_CONSEQUENCIA_GLOBAL.md`; `Revisão e sugestoes.md`.
**Editorial:** "possível contribuição original" permanece restrita ao objeto espectral e à geometria de `C_T`; comparação Gödel/Parikh/Pudlák/Buss segue obrigatória (já no Marco 1 §6).

---

## 1. Veredito por documento

| Documento | O que é | Veredito |
|---|---|---|
| `Revisão e sugestoes.md` (788 linhas) | Revisão externa por pares | **VÁLIDA e já incorporada**: valida a camada local 3.1–3.5 e a enumeração 410155 independentemente; 3 correções concretas aplicadas (ver §3) |
| `CONTINUIDADE_ESPECTRO_CONSEQUENCIA_GLOBAL.md` (473 linhas) | Ciclo "do espectro à consequência global" — Teoremas A–F | **VÁLIDO com correções obrigatórias** (§3): primeira ponte exata espectro↔dinâmica; entrega substancialmente as buscas (a)/(b) da Etapa 11 |
| `desenv..md` (676 linhas) | Estratégia em 24 seções: identidade de cobertura, regimes, gate 5, ciclos 1–6 | **VÁLIDO**: mesma identidade do Teorema C com notação `Γ_T(L;I)`; acréscimos próprios (regimes assintóticos, redução `A ≤_m DISAGREE`, conjectura `Γ ≥ ε` i.o., gates) adotados como *questões/obrigações*, não como teoremas |

Convergência independente dos dois documentos sobre a mesma identidade é evidência positiva de que ela é o ponto canônico — mas **não substitui prova**: a identidade está provada no `paper` §6 (`thm:cobertura`) a partir de `eq:71b` + `lem:cilindros-n`.

## 2. O que foi incorporado ao `paper/main.tex` (§6 `sec:consequencia`)

| Fonte | Conteúdo | Rótulo no artigo |
|---|---|---|
| Teorema C / desenv §7 | Identidade de cobertura `D_n(b₁,b₂) = Γ_{T,n}((b₁(n),b₂(n)])` | `thm:cobertura` (`eq:cobertura`) |
| Teorema A | `D_n(r−1,r) = λ_{T,n}(r)` (derivada de Hamming = massa espectral) | `cor:intensidade` |
| Teorema B | `r ∈ C_T(L_n) ⟺ D_n(r−1,r) > 0`, `r ≥ 1` | `cor:suporte-dinamico` |
| — | `A_T > 0 ⟺ D_n > 0` + limite inferior `D_n ≥ A_T/((β₂−β₁)2^{L_n})` | `cor:atividade` (fecha P-3 e P-2.q4 p/ saídas) |
| Teorema D | `R_n^glob = R_T(L_n)` exato | `thm:estab-global` |
| Teorema E | `|𝒢_n| = |C_T(L_n)∖{0}| + 1` | `thm:regimes` (**corrigido**, ver §3) |
| Teorema F / §8 | Trajetória `V_{T,n}`, leitura probabilística, perfil `H_T` | `rem:trajetoria`, `rem:perfil-global` |
| desenv §5 | `Γ_T(L;I)` para janelas crescentes | `rem:assintoticos` (trilha aberta) |
| desenv §13–14 | Redução `A ≤_m DISAGREE` | `rem:disagree` (condicionada; com armadilha P≠NP visível) |
| — | Proibições + range + Q1 | `rem:abertas-global` |

A §5 do artigo (geometria: `def:geometria`, `lem:lattice`, `lem:mult-suporte`, `lem:massa`, `prop:limites`, `lem:identidades`, `lem:atividade`, `lem:barreira`, `rem:abertas-geom`) saiu de `06_GEOMETRIA_CT.md` §9.1–9.3. **PDF: 18 pp desde 28/09/2026 (17 pp até 27/09), zero `LaTeX Warning`** (só os 3 "a verificar" bibliográficos; 6 `Overfull` preexistentes em texto antigo).

## 3. Correções obrigatórias aplicadas sobre as fontes

1. **Teorema E (regimes):** `0 ∉ C_T(L_n)` **não** é dado — transição em `r = 0` não cria regime (não existe orçamento −1). Enunciado corrigido com `|C_T∖{0}|` **e** prova de **não-revisitância** (cada coordenada de `V(c) = (J_Φ(c))_Φ` é não decrescente por `lem:monotonicidade` → se uma coordenada sobe, nunca volta → regimes distintos). Fonte dizia só "distintos por (b)+(c)"; a cadeia não-revisitância é necessária e foi escrita.
2. **`F_n = {Φ : |Φ| ≤ ⌊log n⌋}`:** load-bearing (Teoremas A–D, §8) e **não estava provado**. Prova escrita: `lem:cilindros-n` (⊆ de `def:form`; ⊇ via `Φ·0^{n−|Φ|}` + unicidade por código livre de prefixo; particionamento; Kraft ≤ 1).
3. **Leitura probabilística incondicional** (doc §9: `U` uniforme): `P(Form(U) definida e B ∩ I ≠ ∅) = Γ` — corrigido para o evento **com** "form definida" (sem isso, `Σ2^{−|Φ|} < 1` e a igualdade falha).
4. **`r ≥ 1`** explícito em toda a cadeia `λ`/suporte/regimes (domínio do orçamento é `ℕ`).
5. **`lem:outinj` (turno anterior):** lacuna `|u₀| ≥ 1` fechada via `def:form` (`|u₀| = n−|Φ| ≥ n−⌊log n⌋ ≥ 1`) — é a hipótese visível de `eq:71b`, portanto do `thm:cobertura`.
6. **Disclaimers (turno anterior):** `rem:realiz-alcance` (escadas finitas livres ≠ realizabilidade por teorias); `Buss1994` com `note` "a verificar" (59(3), 737–756 vs entrada 59(4)).
7. **§16 do doc ("verificação independente confirmou"): NÃO adotada.** `verifica_espectro.py` (19/19) **não** cobre A–F. Não entra no artigo como verificada; reprodução da §16 só sob pedido.

## 4. O que foi recusado / mantido proibido

- Nenhuma afirmação de: hierarquia `b₁<b₂ ⟹ ≺`, diferença de `rng`, ponte com `τ`, novidade de `b(n)`, no-majorant, `R_T ≡_T 0'`, "R_T suficiente". Tudo em `rem:abertas-geom` (P-4) e `rem:abertas-global`.
- **§12 (range: `rng(g^[r−1]) ⊋ rng(g^[r])`):** enunciado atraente, **não provado no doc** → registrado como ataque da **Etapa 13** (certificado de exclusividade), não entra como resultado.
- **NP-dureza via `DISAGREE`:** recusada explicitamente em `rem:disagree` (para `b(n) = O(log n)`, `DISAGREE ∈ P` pela Etapa 2 → `P = NP` se `A` NP-completa). Alvo legítimo: propriedades de *proof complexity*.
- **Diferença de imagens:** segue proibida (P-4.2) mesmo p/ saídas provadas.

## 5. Caminhos ainda não percorridos (candidatos a contribuição/avanço)

1. **Leis assintóticas de `Γ_T(L;I_L)`** (regimes →0 / limsup>0 / crescimento) p/ janelas crescentes — `rem:assintoticos`; o caso `I` fixo é trivial (monotonia + Kraft), o rico exige `I_L` escalado. **[ENUNCIADA 27/09/2026 — `06` §9.6; ABSORVIDA NO `paper` 28/09/2026]**: hierarquia P1/P2/P3 explicitada; sub-casos **fechados** (fixo Q-1, ninhado Q-2 com colapso dos regimes, saturante Q-3 sob (P4′), positividade exata Q-4); **alinhamento `b(n)` ↔ `B_b(L)` fechado** (Q-5 + Cor 1–4: exatidão em escala log, `cor:atividade` estendido a variáveis via `A^var`) — no artigo: `lem:transporte` + `cor:escala-log` (§5), `cor:atividade-var` (§6) e o enunciado Q-Asy em `rem:assintoticos`; **família `I_L` FIXADA (28/09/2026 — `06` §9.6.6): `I_L = (L, L+w]`, `w ≥ 1`** (= regimes `⌊log n⌋` vs `⌊log n⌋ + w`; transporte = janela verdadeira por Cor 1; não ninhada e, sob (P4′), não saturante — **Conj-F, Nível D**, `Γ ≥ ε` i.o., com achados A7–A10 e critérios de refutação; a consequência do `desenv..md` §22 é teorema `thm:cobertura`, o aberto é a antecedente); **seguem abertas**: o conteúdo de Conj-F (P2/Regime B para essa família), a classe rica na forma geral (Q-Asy) e P-2 q2/q3/q5. Regime C reformulado sobre `A_T`/`Ã_T`/`Z_L` (Kraft: `Γ ≤ 1`).
2. **Classificação de `DISAGREE`/`g^[b]` por crescimento de `b(n)`** (p/ `O(log n)` em P; além: desconhecido) — quição própria, não tratada nas fontes.
3. **Certificado de exclusividade de range** (`y = g^[r−1](u)`, `∀v: g^[r](v) ≠ y`) → ponte transição↔range (Etapa 13; doc §12). **[EXECUTADO 28/09/2026 — redução + existência]**: cadeia em `proofs/certificado_exclusividade_range_etapa13.md` — Lema 13.3 caracteriza `rng(g^[c])` pelo símbolo selecionado `σ_Ψ(c)` (finito e decidível; **achado A11: a versão ingênua, só `|Ψ| = |Φ|`, é FALSA** — ambiguidade de divisão de `Out`), Teorema 13.4 (com `n = 2^{|Φ|}` a condição (E) fica independente da cauda), Cor 13.5 (decidível por par, **sem barreira G.10**) e **Teorema 13.6 (Nível C): sob (P4′)(i) existe par explícito com `E_{r−1,r}(2^{m₀}) ≠ ∅`** — a ponte fecha existencialmente; **a forma geral de P-4.2 segue aberta** (critério R5f).
4. **Suficiência de `R_T` (Q1):** pares com mesmo `R_T(L)` e distintos `λ/Γ` (`C₁={R}` vs `C₂={1..R}`), **realizáveis** como `C_T` de teorias — a identidade não depende do envelope, a realizabilidade depende (Etapa 10). **[PARCIAL 27/09/2026]** realizabilidade **na classe de modelos** verificada: `Env1`/`Env2` (`R≡8`; `λ(8)` 15/16 vs ½; `D₁₆(0,3)` 0 vs 1/16 — `08` §10.3 M.3). Realização por **teorias concretas** permanece **ABERTA** (a pergunta certa do Q1).
5. **Objeto enriquecido `𝔖_T`** = (`C_T`, `N_T`, `λ/Γ`, `H_T`) vs `R_T` (review §25 + desenv §11) — quantificar o que o envelope descarta.
6. **Separação `T₁,T₂`** com mesmo `R_T` e geometrias distintas (P-1; exige modelos concretos — Etapa 10, scripts `src/julia/`). **[PARCIAL 27/09/2026]** separação computada no par `Env1`/`Env2` (mesmo envelope `8`; `N(4)` 1 vs 8; `Δ` 0 vs 1 — `08` §10.3 M.2): **dado observado sobre modelos**, não sobre teorias; P-1 forte (`S¹₂` vs `PA`) segue **ABERTO** (G.10).
7. **Equivalência de intervalo no gadget** (`θ ∈ A ⟺ B_T(Φ_θ) ∩ I_θ ≠ ∅`) e versão `Σ₁ᵇ` — obrigações de `sec:gadget` (`hyp:P4p`, `hyp:P7a` condicionais).
8. **Concentração `Γ` vs `Σλ`**: quando vale `Γ = Σλ` (nenhuma entrada muda 2×; igualdade em `rem:trajetoria`) e limites `k` — dado, não explorado.
9. **Ponte `τ`** (Etapa 14) — só com hipóteses visíveis (Nível C/D).

## 6. Próximos passos (prioridade)

1. ~~Etapa 10: scripts `src/julia/` (modelos; alvos P-1/Q1)~~ — **EXECUTADA (27/09/2026)**: `etapa10_modelos.jl` + `results/etapa10_resultados.txt` (3.764 verificações) + veredito `08_ETAPA10_MODELOS.md` (P-1/Q1 parciais; teorias concretas seguem abertas).
2. ~~`02_REVISAO_CRITICA.md` §3.1/§5 com vereditos pós-Ciclo 2 + §6/§7 do artigo; espelhar inventário do `06`.~~ — **CONCLUÍDO (27/09/2026)**: vereditos em `02` §3.1 (obrigações 1–7 item a item), §3.4 (mapa consolidado C2.1–C2.8), §3.5 (artigo §§5–§7); inventário do `06` §9.0 espelhado em `02` §5.0; §12 do doc global registrada como ataque da Etapa 13 (`02` §5.4).
3. ~~Ataques: §12 (range) como Etapa 13; enunciar Q3/formalização de (P4′) (bloqueio conhecido: exige formalização assistida por máquina).~~ — **CONCLUÍDO (27/09/2026)**: (a) §12 registrada como ataque da **Etapa 13** em `02` §5.4 (com P-4.2 mantida até a ponte fechar — **a ponte fecha existencialmente em 28/09/2026**, Teorema 13.6 Nível C, `proofs/certificado_exclusividade_range_etapa13.md`; P-4.2 **forma geral** segue mantida); (b) **Q3 enunciada** em `01_ambiente` §7.7 — rótulo registrado (era órfão), 6 achados de ataque (banda, não-uniformidade de `b₂`, cilindro, provabilidade-só, barreira NP, testemunho exponencial), Teorema Q3.C fechado **na banda** sob (P4′)/(P7a)/(P5) com critérios de refutação, e plano de formalização **F1–F6** para `(P4′)`/`(P7a)` (Lean reaproveitável; saída = constantes explícitas). O **fechamento** de F1–F6 segue bloqueado por formalização assistida por máquina.
4. Decidir reprodução da §16 (`verifica_espectro.py` estendido p/ `thm:cobertura`/`thm:regimes` em instâncias finitas) — **sob pedido**.
5. ~~Revisar `README.md`/`ARSENAL_FERRAMENTAS.md` p/ apontar `07` e a §6.~~ — **CONCLUÍDO (27/09/2026)**: `README` (linhas do `01_ambiente` com §7.7/Q3, do `07` com "Teoremas A–F → §6" e estado das 9 trilhas, e do gadget na tabela de resultados); `ARSENAL` §5 com o ciclo completo do `paper` (pdflatex→bibtex→pdflatex×2, saída esperada 17 pp/0 avisos — hoje **18 pp**, atualizado em 28/09/2026), ressalva de `verifica_espectro.py` (19/19, **não** cobre A–F — §3.7) e nota de que a §6 se sustenta na bateria da Etapa 10 + nas correções obrigatórias do `07` §3.

**Fim do documento.**
