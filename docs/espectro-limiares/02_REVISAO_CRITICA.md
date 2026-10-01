# 02 — Revisão crítica e lista do que falta

Escopo: auditar os fontes da linha (arquivos em `C:\Users\Euzébio Soares\Desktop\Lógica\` — atualmente em `proofs\` e `docs\`), classificar cada alegação, registrar a verificação bibliográfica feita até aqui e listar explicitamente o que falta. Este documento é a peça de "não repetir o que já existe".

---

## 1. Artefatos de forma nos fontes (corrigir antes de qualquer formalização)

Fonte principal: `Núcleo formal mínimo do espectro de limiares de prova.md`.

1. **Eco textual após cada fórmula — RESOLVIDO (27/09/2026).** Todo bloco `\boxed{...}` é seguido de uma repetição em texto simples onde `≠` aparece como `=` e `≠∅` como `=∅` (linhas 259, 387, 393, 453, 463, 505, 509, 513, 517, 553, 557, 569, 589, 601, 855). **O LaTeX está correto; o eco estava errado.** Removidos os 15 ecos (corte na fronteira LaTeX/eco com auditoria antes/depois; verificação final: 0 linhas `neq+zwsp`, 0 linhas `neq+inversão =`; negação preservada em todas, com abort do script se perdida). Cópias `docs\` e `proofs\` regravadas e idênticas (MD5 `5D5749AB4BB37BBCA87F00586AB783F7`, 857 linhas).
2. **Parágrafos duplicados — RESOLVIDO (27/09/2026):** removidas as 2ªs cópias (linhas antigas 451, 607, 643, 645 — Teorema 6.2 direção inversa; `S_T` guarda só o último limiar; bloco duplo da hipótese de acessibilidade operacional). Verificação: cada trecho agora ocorre exatamente 1× (busca por conteúdo).
3. **`q(Φ)` inconsistente — RESOLVIDO (26/09/2026).** O §1.2 do núcleo deixava em aberto `q(Φ)=|Φ|+1` ou `|Φ|+2`. **Fixado `q(Φ)=|Φ|+1`** em `01_ambiente_formal_e_codificacoes.md` §3 (D7): a aritmética do stretch de `g_T` (`|w₀u₀| ∈ {0,1}^{n+1}` força `|w| = |Φ|+1`) mais três ocorrências concordantes do paper original (`[K23]` Teorema 2.2, §3, Lema 3.2) e duas dos fontes da linha (`[DK]` linhas 1338 e 2872). Lá registrado o **erratum aparente** no passo 2 do paper (`c := |Φ|+1` junto de `w ∈ {0,1}^{c+1}` daria `|w| = |Φ|+2` e saída `n+2`, contradizendo o próprio passo 3). O bloqueio do gadget acabou.
4. **Links SharePoint mortos — RESOLVIDO (27/09/2026).** Estavam em `desenv. logica kubricek leis.md`, `logica  organização.md`, `Cópia de logica  organização.md` e no próprio núcleo (referências `seducsp-my...epoint.com` apontam para um OneDrive pessoal inacessível). Substituídos 41 URLs por caminho local `../proofs/` (válido tanto a partir de `docs\` quanto de `proofs\`; rótulo `[\[seducsp-my...epoint.com\]]` → `[arquivo local]`). Verificação: 0 URLs SharePoint na árvore do projeto (grep `sharepoint`).
5. **Colisão de notação com o projeto Gödel — RESOLVIDO (27/09/2026).** O projeto usa `ρ_b(Φ; H)` = *rank de cobertura*; aqui `ρ_T(Φ)` = *limiar de prova*. Também `g^{a,b}` (Gödel: dois orçamentos `|Φ|≤a(n)`, `|π|≤b(n)`) versus `g_T^[b]` (aqui: diagonal `a=b`). **Decisão: manter os dois símbolos com sufixos obrigatórios (`_b`/`_T`) e tabelar a distinção** — Tabela 1 em `04_CONTINUIDADE.md` §2 (inclui aviso para `RBT`/`PPR` vs `R_T`: não citar lado a lado sem revisar `09_EVOLUCAO…`).
6. **`logica  organização.md` mistura fonte e transcrição de chat** (linhas 423+ contêm "BizChat", "Copilot said"). Separar o documento de avaliação do log de conversa antes de citá-lo.

---

## 2. Verificação analítica dos resultados locais

Feita nesta sessão, caso a caso (e por enumeração exaustiva — `src/python/verifica_espectro.py`, 410.155 perfis, 7.737.331 pares, tudo passando).

| Resultado | Veredito | Observação |
|---|---|---|
| Definições `ℓ, J, j*, ρ, I, B_T, S_T, C_T, R_T` | **Corretas** | Bem-feitas, casos de fronteira tratados (`max ∅ = 0`, `J = k` se vazio). |
| Teorema 5.1 (estabilização) | **Correto, incompleto** | Só uma direção. A recíproca vale: `J(c)=j* ⟺ c ≥ ρ` (provado e verificado). Incorporar. |
| Lema 6.1 (monotonicidade) | **Correto** | Trivial, como escrito. |
| Teorema 6.2 (transições unitárias) | **Correto** | Direção direta exige `ℓ` inteiro (`> r−1 ∧ ≤ r ⟹ = r`) — escrito. |
| Teorema 6.3 (intervalos) | **Correto** | Consequência de 6.2 + monotonicidade. |
| Corolários 7.1–7.3 | **Corretos, com ressalvas já no texto** | Injetividade de `Out` necessária; "diferença de saída ≠ diferença de imagem" corretamente alertado. |
| Exemplo `(2,10,7,∞)` | **Correto** | Reproduzido pelo script (`J(9)=1`, `J(10)=3`). |
| Novo: salto de `J` pode exceder 1 | **Verificado** | Máx. 8 na enumeração; nenhum enunciado do fonte afirma o contrário, mas convém declarar. |
| Realização de escadas | **Prova elementar** | Perfil `(b₀,…,b_r,∞)` realiza qualquer escada — logo `C_T(L)` é combinatoriamente livre; o conteúdo empírico é o que teorias concretas produzem. |

**Status geral: a teoria local (Partes I–II do plano, Etapas 1–5) está sólida no nível de definição e prova de caso finito.** O que falta nela é formalização em texto único, decisão de `q(Φ)` e fixação da codificação (Etapa 1).

---

## 3. Auditoria das alegações fortes

### 3.1 O gadget `θ ↦ Φ_θ` (Etapa 7) — **Nível C, condicionado; padronizado (D11)**

**Correção de 26/09/2026:** o esboço anterior do núcleo **misturava duas versões** — a construção "timeout" (`NH_θ`) com uma análise de blocos que só vale para a versão **bloco** (`(11⊆_e x) ∨ (¬θ ∧ 10⊆_e x)`); em particular a conclusão "`j*` = primeira palavra do bloco 11" é **falsa** para timeout (lá `j* = k_Φ` quando `T ⊢ θ`). Padrão agora: versão bloco, com análise e cotas reconstruídas em `01_ambiente_formal_e_codificacoes.md` §7 (Lemas 7.1–7.3, Corolário 7.4, procedimento de decisão) e em `01_NUCLEO_DURO.md` §5. A versão timeout ficou registrada como alternativa em `01_ambiente` §7.4, com a obrigação extra que ela tem (formalizar o custo da simulação de máquina — `[DK]` linha 2858 afirma sem dar custo) e a vantagem que ela tem (`Φ_θ ∈ Δᵇ₁` para todo `θ`, sem restrição `θ ∈ Πᵇ₁`).

O esboço da versão bloco é consistente; as duas direções `T ⊢ Φ^{w*} ↔ θ` (bloco 10) funcionam **sem** soundness (lógica direta sobre o cilindro). As obrigações 1–7 foram atacadas no **Ciclo 2** (`01_ambiente_formal_e_codificacoes.md` §7.6, Proposições C2.1–C2.8, 27/09/2026) — veredito pós-Ciclo 2, item a item:

- 1. linearidade `|Φ_θ| ≤ a|θ|+b` — **FECHADA (B)** (C2.1(i): `|Φ_θ| = |θ| + κ₀`, cópia literal de `¬θ`);
- 2. uniformidade p-tempo de `(θ,w) ↦ Φ_θ^w` e `|Φ_θ^w| ≤ a'|Φ_θ|+|w|+b'` — **FECHADA (B) sob a hipótese nomeada (P7a)** (C2.1(iii)–(iv)); **sem (P7a) falha** (com numerais unários `w` custa `Θ(2^{|w|})` — achado 1; o salvaguarda o `#` de Buss);
- 3. formalização das provas triviais curtas (blocos 00/01) — (P6): **semântica FECHADA (B); sintática CONDICIONADA a (P4′)** (C2.2);
- 4. formalização da equivalência do bloco 10 **com custo linear** — (P7), núcleo da transferência: **semântica FECHADA (B)** (C2.3); **sintática CONDICIONADA a (P4′)** (C2.4 — `(P7)` é derivável de `(P4′)`; o que falta é `(P4′)` em si). `(P4)` **não** implica `(P7)` (achado 2);
- 5. **onde entra correção:** `j*` no bloco 11 exige `T ⊬ sentença falsa` — **FECHADA (C)**: `(H-som)` isolado com ocorrência **única** na §7 (C2.5; fora dela, `∅' ≤_T Thm(T)`); `Thm(T) ≤_T R_T` é **sintático** e não usa `(P5)` (C2.6, achado 5); `(P5)` restringe-se a L7.3 e à completude Σ₁;
- 6. classe sintática: `Φ_θ ∈ Σ^b_1 ⟺ θ ∈ Π^b_1` — **PARCIAL**: `θ ∈ Πᵇ₁ ⇒ Φ_θ ∈ Σᵇ₁` **FECHADA (B)** (C2.7(a)); o `⟺` literal para `θ` arbitrário reduz-se à **questão aberta D** de `01_ambiente` §4.3 — **NÃO FECHÁVEL aqui** (sustenta-se só "até equivalência em `S¹₂`", C2.7(b));
- 7. combinar tudo: `s_T(θ) ± (a(|θ|+q)+c)` e escala — **FECHADA com duas correções de escopo** (C2.6 + C2.8): caso `T ⊬ θ` é **sintático** (a redação anterior via "falsidade + `(H-som)`" pressupunha `ℕ ⊭ θ` — corrigida, achado 4); a escala vale **`M_T(m) ≤ R_T(a·m+b)+c` irrestrita** e **`M_T(m) ≤ R_T^Σ(a·m+b)+c` só para `θ ∈ Πᵇ₁`** (achado 7).

`q(Φ)` (item 1.3 acima) está resolvido. Classificação atualizada: **Nível C condicionado** — fechado onde as hipóteses nomeadas bastam; `(P4′)` e a questão D seguem **não fecháveis** sem formalização assistida por máquina (Lean do projeto Gödel reaproveitável). Mapa consolidado na §3.4; **nada disto altera os teoremas locais — o núcleo permanece intacto** (§7.6, fechamento).

### 3.2 A "lei" de `R_T^Σ` e o grau de Turing — **conteúdo clássico, embalagem nova**

Alegação forte do desenvolvimento: `R_T^Σ ≡_T Thm(T) ≡_T 0'` e `limsup R_T^Σ(L)/f(L) = ∞` para toda f computável positiva. Duas observações de auditoria:

1. **`M_T ≡_T Thm(T)` é elementar** (prova em `01_NUCLEO_DURO.md` §6): decidir `T ⊢ θ` = buscar prova até `M_T(|θ|)`. Não estava explicitado em nenhum fonte — é a chave para entender o que a alegação significa.
2. **O ancestral clássico:** o teorema de **speed-up de Gödel (1936), "On the length of proofs"** afirma: para toda função recursiva f existem sentenças prováveis em PA cuja prova mais longa (i.e., mais curta) excede `f(|φ|)`. Ou seja: *nenhuma majorante computável para comprimentos mínimos de prova* é **clássico desde 1936** (formulação e prova em Buss, JSL 1994, e no verbete SEP "Kurt Gödel", Theorem 5). A transferência para `R_T^Σ` é uma **reembalagem via gadget** da mesma verdade.

Veredito: `R_T^Σ ≡_T ∅'` e a lei de crescimento são **Nível B** (conteúdo: Σ⁰₁-completude de `Thm(PA)`/`Thm(S^1_2)`, clássica; a parte técnica nova é apenas o transporte por `ρ_T(Φ_θ) = s_T(θ)+O(1)`). **Não podem ser apresentadas como descoberta.** O que poderia ser novo é a **relação quantitativa** `M_T(m) ≤ R_T^Σ(a·m+b)+c` e a geometria de `C_T` — ambos ainda não provados.

### 3.3 A lacuna central (admitida pelo próprio material)

`ρ_T → C_T → g_T^[b]` existe; `g_T^[b] → τ(g_T^[b])` **não existe**. Sem essa ponte, o espectro é uma teoria interna dos geradores, não de complexidade de provas. É a prioridade real depois das Etapas 1–8.

### 3.4 Veredito pós-Ciclo 2 — mapa consolidado (`01_ambiente` §7.6, 27/09/2026)

| Peça | Veredito | Evidência |
|---|---|---|
| Obrigação 1 — linearidade `\|Φ_θ\| ≤ a\|θ\|+b` | **FECHADA (B)** | C2.1(i) |
| Obrigação 2 — uniformidade e linearidade de `(θ,w) ↦ Φ_θ^w` | **FECHADA (B) sob (P7a)** | C2.1; falha sem (P7a) |
| Obrigação 3 — Lema 7.1 (blocos 00/01) | **semântica FECHADA (B) / sintática sob (P4′)** | C2.2 |
| Obrigação 4 — Lema 7.2 (bloco 10) com custo linear | **semântica FECHADA (B) / sintática sob (P4′)** | C2.3, C2.4 |
| Obrigação 5 — Lema 7.3 + isolamento de `(H-som)` | **FECHADA (C)** — ocorrência única na §7 | C2.5 |
| Obrigação 6 — classe sintática `Σᵇ₁ ⟺ Πᵇ₁` | **PARCIAL** — `θ ∈ Πᵇ₁` FECHADA (B); `θ` arbitrário = questão aberta D | C2.7 |
| Obrigação 7 — combinação e escala | **FECHADA (C)** com escopo corrigido | C2.6 + C2.8 |
| `Thm(T) ≤_T R_T` | **PROVADA** sem `(P5)` e sem linearidade | C2.6 |
| `(P4′)` e `(P7a)` em si | **NÃO FECHÁVEIS aqui** — formalização assistida por máquina (Lean do projeto Gödel reaproveitável) | §7.6, achados 1–2 |
| Questão aberta D (`R_T^Σ` com `θ` arbitrário) | **NÃO FECHÁVEL aqui** | §4.3, C2.7 |

**Hipóteses nomeadas (condicionam tudo que é Nível C):** **(P4′)** = cotas de tamanho `O(|w|+|θ|+1)` em `T` para três esquemas de `⊆_e` (vazio/prefixo 10/cofinalidade — sem elas `(P4)` é só definibilidade e as obrigações 3–4 ficam condicionadas); **(P7a)** = dispositivo de embutimento linear de `w` na assinatura (ex.: `#` de Buss, `t_w = ((1#b₀)#b₁)#…`). **Correções de escopo aplicadas:** caso `T ⊬ θ` sintático (§7.2); escopo e forma da escala (`R_T` irrestrito / `R_T^Σ` só `θ ∈ Πᵇ₁`). **Nenhum teorema local da §5/§6 do artigo é alterado por estas correções.**

### 3.5 Veredito sobre as seções §5–§7 do artigo (`paper/main.tex`, 27/09/2026)

**§5 `sec:geometria` (escrito; níveis A/B).** Insumo: `06_GEOMETRIA_CT.md`. Rótulos: `def:geometria`, `lem:lattice`, `lem:mult-suporte`, `lem:massa`, `prop:limites`, `lem:identidades`, `lem:atividade`, `lem:barreira` (G.10 — barreira Σ₁), `rem:abertas-geom`, + convenções D-geo-1…4 explícitas e proibições P-1–P-5 visíveis. Veredito: **correto e completo no que se propõe** — invariantes elementares com provas; nada além do nível B é alegado.

**§6 `sec:consequencia` (escrito; níveis B/C-condicionado).** Rótulos: `def:cilindros`, `lem:cilindros-n`, `def:cobertura`, `thm:cobertura`, `cor:intensidade`, `cor:suporte-dinamico`, `cor:atividade`, `thm:estab-global`, `thm:regimes`, `rem:trajetoria`, `rem:perfil-global`, `rem:assintoticos`, `rem:disagree`, `rem:abertas-global`. **Correções obrigatórias do `07` aplicadas antes da redação:** (1) Teorema E com o indicador — `|𝒢_n| = |C_T(L_n)∖{0}| + 1`, `0 ∉ C` explícito e prova de **não-revisitância** (`V(c)` não decrescente); (2) `F_n = {Φ : |Φ| ≤ ⌊log n⌋}` **provado** (`lem:cilindros-n`), não suposto; (3) leitura probabilística corrigida (evento "Form definida e `B ∩ I ≠ ∅`"); (4) `r ≥ 1` em toda a cadeia λ/suporte/regimes; (5) §16 da fonte ("verificação independente confirmou") **não adotada** — `verifica_espectro.py` não cobre A–F; (6) NP-dureza via `DISAGREE` **recusada** (`rem:disagree`: para `b(n) = O(log n)` ∈ P — alvo é proof complexity).

**§7 `sec:comparacao` (FECHADA — obrigação editorial).** Comparação explícita com Gödel 1936 / Parikh / Pudlák / Buss presente desde o Marco 1; mantém o estatuto de "possível contribuição original" **restrito** ao objeto espectral e à geometria de `C_T` (Etapa 17, §4.2 — sem colisão em 7 frentes).

**Estado de verificação (evidência, não prova):** PDF de **18 pp** (28/09/2026; era 17 pp), **0 `LaTeX Warning`** (refs/citações) e 0 erro — restam 6 `Overfull \hbox` **preexistentes**, todos em texto não alterado por esta rodada (`eq:difs`, `prop:limites` + prova, `lem:identidades`, `lem:atividade`, `thm:estab-global`); 3 "a verificar" no `.bib` (Parikh1973 *journal*, Pudlák1986 *booktitle/publisher*, Buss1994 nota). A **Etapa 10** (`08_ETAPA10_MODELOS.md`) submeteu os teoremas computacionais da §5/§6 a enumeração independente — **3.764 verificações passando**, incl. `thm:cobertura` (192 config. com orçamentos constantes e variáveis), `thm:regimes` (com **refutação observada** da versão sem o indicador), `thm:estab-global`, `cor:intensidade`, `cor:suporte-dinamico`, `cor:atividade`, `prop:limites`, `lem:mult-suporte`/`lem:identidades`/`lem:atividade`, `rem:trajetoria`, `rem:perfil-global`. **Dado que corrobora, não substitui as provas.**

**O que §5/§6 NÃO estabelecem (mantido visível):** P-4 (1–7: hierarquia de orçamentos, `rng`, `τ`, novidade de `b(n)`, no-majorant, `R_T ≡_T 0'`); P-2 qs. 1–3 e 5; P-1 forte (`S¹₂` vs `PA`); ~~alinhamento `b(n)` ↔ `B_b(L)` para orçamentos variáveis (pendência registrada na própria §6)~~ — **FECHADO em 27/09/2026 na fonte** (`06` §9.6.4: lema Q-5 sanducho, exatidão em escala log, `cor:atividade` estendido a `A^var`) e **absorvido no `paper` em 28/09/2026** (`lem:transporte` + `cor:escala-log` em §5; `cor:atividade-var` em §6; `rem:assintoticos` reescrito com Q-Asy — PDF 18 pp, 0 `LaTeX Warning`); range (Etapa 13: **um par explícito** sob (P4′)(i), Nível C — cadeia em `proofs/certificado_exclusividade_range_etapa13.md`; a forma geral `A_T > 0 ⟹ rng distinto` = P-4.2 segue **aberta**) / τ (Etapas 14–16).

---

## 4. Verificação bibliográfica (o que já foi checado, com fontes)

**Buscas realizadas** (nesta sessão e na anterior): "proof complexity Krajíček generators shortest proof Turing degree"; "reflection rank slow consistency Pakhomov Walsh"; `"proof threshold" spectrum / threshold of provability shortest proof length`; "Gödel 1936 speed-up theorem length of proofs"; "Parikh lengths of proofs / Pudlák survey"; "maximum shortest proof length function".

### 4.1 Tabela de vereditos por alegação

| Alegação do projeto | Veredito | Fonte / evidência |
|---|---|---|
| `log n → b(n)` na diagonalização | **Nível B** (não reivindicável) | Krajíček, *JSL* 90(3) 2025, 1206–1210, DOI 10.1017/jsl.2023.69, **nota de rodapé 3** admite `log log n → ω(1)` — na construção proposicional `h_P`, não em `g_T`. Prioridade conceitual de Krajíček (recebido 03/2023). Ver `Lógica bibliografia kragicek.md` (veredito Nível B mantido). |
| "Nenhuma majorante computável para `R_T^Σ`" | **Nível B** (embalagem nova) | Gödel 1936 speed-up + Σ⁰₁-completude; ver §3.2. |
| `R_T^Σ ≡_T Thm(T) ≡_T 0'` | **Nível B** | Decorre do gadget (condicionado) + clássico `Thm(T) ≡_T 0'`. |
| Teoremas locais 5.1/6.2/6.3 + `ρ` exato | **Nível B** (matemática elementar correta) | Nenhum conflito encontrado; a *aplicação ao gerador* é a parte não localizada. Verificação por enumeração feita. |
| Objeto "espectro de limiares de prova" (`B_T, C_T, R_T` como espectro de comprimentos mínimos dentro de uma teoria) | **Nível C candidato — busca incompleta** | Não encontrado equivalente exato. Próximo nome conhecido: **"spectra" de teoria** (Aguilera–Pakhomov, *The spectrum of Π¹₃-soundness*, 2023 — espectos de *soundness*, classificam teorias/sentenças, não comprimentos de prova); **ranks de reflexão** (Pakhomov–Walsh, JSL 2021 — invariantes ordinais, não numéricos); "sharp threshold in proof complexity" (Achlioptas–Beame–Molloy, FOCS 2001 — limiar em fórmulas aleatórias, sem conflito). |
| Comprimento de provas como função e seus máximos | **Território clássico a citar obrigatoriamente** | Gödel 1936; Parikh, *Some results on the length of proofs* (1973); Buss, *On Gödel's theorems on lengths of proofs I* (JSL 1994) e *Bounded Arithmetic, Proof Complexity and Two Papers of Parikh* (APAL 1999); Pudlák, *The lengths of proofs* (Handbook of Proof Theory 1998) e *On the length of proofs of finitistic consistency statements* (1986); Freund–Pakhomov (short proofs / slow consistency). |
| Geradores `g_T`, `τ`, range avoidance | **Literatura ativa, citar** | Krajíček, *Diagonalization in proof complexity* (FM 2004); *On the existence of strong proof complexity generators* (BSL 2024); *Proof Complexity Generators* (CUP 2025); ECCC TR23-030 (2023); Ren–Wang–Zhong, demi-bits (ITCS 2026, citado no desenvolvimento). |

### 4.2 Queries da Etapa 17 — EXECUTADAS EM 27/09/2026 — **ETAPA 17 FECHADA**

**Método:** busca web (motor de busca + acesso direto a arXiv/ECCC/páginas dos autores) + **busca textual integral no livro de Krajíček** (`k4.pdf`, 167 pp., 251.747 caracteres, baixado de `karlin.mff.cuni.cz/~krajicek/k4.pdf` para `docs/k4.pdf` e varrido por script: `spectrum=0`, `spectra=0`, `threshold=0`, `first unprovable=0`, `unprovable candidate=0`, `running maximum=0`, `shortest proof=0`, `ρ=0`, `j*=0`; `stretch`=68 e `gadget`=81 — capítulos relevantes existem e foram varridos; os 2 achados de `worst case` e o 1 de `record` são retóricos/alheios). **Ressalva de método:** sem acesso MathSciNet/Scopus — havendo acesso institucional, reexecutar os itens 1–3.

| # | Query | Resultado | Veredito |
|---|---|---|---|
| 1 | `"proof length spectrum"` / `"spectrum of shortest proofs"` | Único uso do termo: preprint de raciocínio de LLMs (Arkoudas 2026), binning empírico de comprimentos — objeto distinto; nenhum uso em proof complexity. | **sem colisão** |
| 2 | `"maximal shortest proof"` / `"worst-case proof length" function` | **Zero resultados.** | **sem colisão** — `M_T` aparentemente sem nome alternato na literatura |
| 3 | `"threshold of provability"` / `"proof threshold function"` | Usos apenas em direito/estatística; **nenhum uso em lógica ou bounded arithmetic.** | **sem colisão** |
| 4 | Livro *Proof Complexity Generators* (2025) — `k4.pdf` | Varredura integral (acima): nenhum termo do espectro aparece. | **sem colisão** — prioridade de conceito não está no livro |
| 5 | "record" / "running maximum" + speed-up | Território clássico: Gödel 1936 speed-up (SEP; Buss, JSL 1994). | **Nível B mantido** (§3.2) |
| 6 | ECCC TR23-030 (problema aberto) | Confirmado: "rng(g_T) intersecta toda coleção NP infinita?" em aberto; demi-bits (Ren–Wang–Zhong, ITCS 2026) resolveram o problema correlato de Chen–Li. | **citável** — relação com Etapa 15 registrada |
| 7 | Pudlák, *The lengths of proofs* (Handbook 1998) | Referência obrigatória confirmada; nenhuma função máxima homônima. | **citável** |

**Conclusão da Etapa 17:** nenhuma colisão de prioridade para o objeto espectral (`B_T, C_T, R_T`, `ρ` como limiar exato, `j*`) em nenhuma das 7 frentes, incluindo o texto integral do livro de Krajíček. Status editorial: **"possível contribuição original" documentado** para o objeto espectral e para a geometria de `C_T(L)`; Nível B mantido para `b(n)`, ausência de majorante e `R_T ≡_T 0'` (§3.2/§4.1); Nível C condicionado para o gadget. A comparação direta com Gödel 1936/Parikh/Pudlák/Buss continua obrigatória na redação (`03`, item 13).

Regra mantida da organização (Etapa 17): só usar "novo" após busca documentada + comparação direta — **busca documentada cumprida em 27/09/2026** (este §4.2); a comparação direta é o item de redação acima.

---

## 5. Lista consolidada do que falta

### 5.0 Inventário espelhado de `06_GEOMETRIA_CT.md` §9.0 (sincronizado em 27/09/2026)

*(Espelho — a fonte de verdade é o `06`; divergências são erro de sincronia.)*

| Peça | Veredito | Onde |
|---|---|---|
| Definições dos invariantes (`N_T, Δ_T, D_T, A_T, K_T, m_T, Z_L, μ_{T,L}`, atividade, perfil) | **FECHADAS (A)** — 4 convenções novas explícitas | `06` §9.1 → `paper` §5 `def:geometria` |
| Propriedades elementares (Lemas G.1–G.9) | **FECHADAS (B)** — provas completas | `06` §9.2 → `paper` §5 (`lem:lattice` … `lem:atividade`) |
| Barreira de computabilidade (G.10) | **FECHADA (B)** — limita o experimentalismo | `06` §9.2 → `paper` §5 `lem:barreira` |
| Separação `R_{T₁} ≍ R_{T₂}` com `N`/`Δ` distintos (P-1) | **ATAQUE PARCIAL (27/09, Etapa 10)** — testemunho `Env1`/`Env2` na classe de modelos (mesmo `R≡8`; `N(4)` 1 vs 8); `T₁,T₂` concretos **seguem não-fecháveis** (G.10) | `06` §9.3 P-1 → `08` §10.5 |
| `A_T ≠ 0` em infinitos `L`; densidade; expoente (P-2, qs. 1–5) | **ABERTAS, exceto a q4** — q4 **FECHADA** 27/09 p/ saídas | `06` §9.3 P-2 → `paper` §6 `cor:atividade`; mapeamento q1↔P1/q2≠P2 em `06` §9.6.5 |
| Limite inferior de `D_n` via `A_T` (P-3) | **FECHADO (27/09)** — `D_n = Γ_{T,n}` + limite via `A_T` | `06` §9.3 P-3 → `paper` §6 `thm:cobertura`, `cor:atividade` |
| Pontes: hierarquia `b₁ < b₂ ⟹ ≺`; `rng`; `τ`; novidade de `b(n)`; no-majorant; `R_T ≡_T 0'` | **PROIBIDAS** — lista permanente (P-4) | `06` §9.3 P-4 → `paper` §5/§6 remarks |
| `Z_L > 0` e `I_{T,Φ}` sem convenção; D-geo-2/3; `Out` | **CONDICIONADAS** — (P4′), convenções | `06` §9.1, G.4, G.8 |

### 5.1 Bloqueadores (sem eles nada avança)

- [x] Fixar ambiente formal (Etapa 1): T = `S^1_2`, linguagem, codificação de fórmulas/provas/palavras, `Prf_T`, `|·|`, ordem lex, **e `q(Φ)` (decidir `|Φ|+1` vs `|Φ|+2`)**. — **FECHADO (26/09/2026)**: `q(Φ)=|Φ|+1` fixado em `01_ambiente` §3 (D7), com o provável erratum de `|Φ|`/`|Φ|+1` no `[K23]` registrado; `01_ambiente_formal_e_codificacoes.md` é a dependência canônica do `06` e do `paper` §2.
- [x] Reconstruir `g_T^[b]` sem misturar n, L, |w|, b(n) (Etapa 2) e provar tempo polinomial para `b(n)=O(log n)`. — **FECHADO (27/09/2026)**: `01_ambiente` §5.4 (Teorema 5.4 + Corolário 5.5) sob `(P2)(P3)` + `b` p-tempo-computável; sem `Σ⁰₁/Π⁰₁` no escopo.
- [x] Limpar os artefatos da §1 (ecos, duplicações, links, colisão `ρ`). — **FECHADO (27/09/2026)**: §1 itens 1–5 RESOLVIDOS com verificação (MD5, greps, auditoria antes/depois).
- [x] Produzir `01_ambiente_formal_e_codificacoes.md` — critério: todas as expressões `Φ^w, ℓ_T, ρ_T, B_T, C_T, R_T, g_T^[b]` sem ambiguidade. — **FECHADO**: documento existe (§§3–8), com `Out` explícita (`w·u₀`), `ρ_T` como `ℓ_T ∘ out` e ordem determinística determinística.

### 5.2 Curto prazo (Ciclo 1 — fundação formal)

- [x] Escrever os teoremas locais em texto único, **incluindo o iff de ρ** e a observação de salto. — **FECHADO (Marco 1)**: `paper` §3 `thm:limiar-exato` (dois sentidos) + `obs:salto`; provas completas, 0 avisos LaTeX.
- [x] Prova formal (ou escrito caso-a-caso completo) dos Corolários 7.1–7.3 com `Out` explícita. — **FECHADO (Marco 1)**: `def:out` (`w·u₀`) + `lem:outinj` descarrega a hipótese do Cor 7.1(b) e registra a colisão da convenção `0^{n+1}`; caso-a-caso no `01_ambiente` §5.
- [ ] Incorporar o script como anexo verificável do artigo (resultado já gerado). — **SEGUE PENDENTE**: `verifica_espectro.py` (19/19, fora de linha por padrão) ainda não integra o PDF; decisão editorial (anexo vs seção "verificação computacional") em aberto.
- [ ] Decidir a classe de `Φ` (irrestrita vs `Σ^b_1`) — Etapa 1, item 6. — **PARCIAL (27/09)**: `θ ∈ Πᵇ₁ ⇒ Φ_θ ∈ Σᵇ₁` **FECHADA (B)** (C2.7(a)); o `⟺` literal para `θ` arbitrário reduz-se à **questão aberta D** (§3.1/§3.4) — não fechável aqui.

### 5.3 Médio prazo (Ciclo 2 — auditoria da transferência)

- [ ] Formalizar `θ ↦ Φ_θ` linha a linha (Etapa 7, obrigações 1–6), com `|Φ_θ| ≤ a|θ|+b`. — **PARCIAL (27/09, C2.1–C2.7)**: linearidade e uniformidade fechadas (a segunda sob **(P7a)**); L7.1/L7.2 semântica fechada, sintática condicionada a **(P4′)**; restam `(P4′)` em si (formalização assistida) e a questão D — mapa na §3.4. **Obrigação 8/Q3 enunciada** em `01_ambiente` §7.7 (27/09): Teorema Q3.C fechado na banda + plano F1–F6.
- [ ] Separar, em cada direção, consistência / correção / Σ₁-correção / reflexão externa. — **PARCIAL (27/09, C2.5/C2.6)**: `(H-som)` isolado com ocorrência **única** na §7 e `(P5)` restrito a L7.3 + completude Σ₁ (`Thm(T) ≤_T R_T` não o usa); a separação sistemática completa segue pendente.
- [ ] Provar ou rejeitar `Thm(T) ≤_T R_T^Σ`; então enunciar `R_T^Σ ≡_T Thm(T)` com hipóteses visíveis (Nível C). — **PARCIAL (27/09)**: `Thm(T) ≤_T R_T` **PROVADA** (C2.6, sem `(P5)` e sem linearidade); `R_T ≡_T Thm(T) ≡_T ∅'` enunciada (Nível C) em `01_ambiente` §7.2 com `(P5)` visível **apenas** em `∅' ≤_T Thm(T)`; a versão **`R_T^Σ` com `θ` arbitrário** depende da questão D.
- [x] Provar a relação quantitativa `M_T(m) ≤ R_T^Σ(a·m+b)+c` — é o resultado que **não** é trivialmente clássico. — **FECHADO na forma correta (27/09, C2.8)**: vale **`M_T(m) ≤ R_T(a·m+b)+c` irrestrita** e **`≤ R_T^Σ(a·m+b)+c` só para `θ ∈ Πᵇ₁`**; a forma literal antiga (Σ irrestrito) era fora de escopo — `M_T` é irrestrito (achado 7).
- [x] Escrever a comparação explícita com Gödel 1936 / Parikh / Pudlák (§4.1) — obrigatório para honestidade intelectual. — **FECHADO (Marco 1)**: `paper` §7 `sec:comparacao` (+ Buss); obrigação editorial mantida viva (Etapa 17).

### 5.4 Longo prazo (Ciclos 3–5)

- [x] Geometria de `C_T(L)`: `N_T, Δ_T, D_T, A_T, multiplicidade, μ_{T,L}` (Etapa 9). — **FECHADO (27/09/2026)**: `06` (definições + G.1–G.10, 4 convenções) → `paper` §5 `sec:geometria`; elementos da §5/§6 submetidos à enumeração da Etapa 10 (3.764 checks).
- [x] Modelos finitos estruturados + dois sistemas com mesmo envelope e geometrias diferentes (Etapa 10) → prova de que `C_T` guarda informação além de `R_T`. — **EXECUTADO 27/09/2026**: `src/julia/etapa10_modelos.jl` + `results/etapa10_resultados.txt` (3.764 verificações); testemunho `Env1`/`Env2` (mesmo `R≡8`, `N(4)` 1 vs 8, `λ(8)` 15/16 vs ½, `D₁₆(0,3)` 0 vs 1/16) — **prova por construção de que `C_T` guarda informação além de `R_T`, na classe de modelos**; para teorias concretas segue aberto (G.10). Ver `08_ETAPA10_MODELOS.md` §10.3–10.5.
- [x] Atividade espectral `A_T(L; b₁, b₂)` e primeiro teorema quantitativo espectro×gerador (Etapa 11). — **FECHADO (27/09/2026)**: `paper` §6 — identidade `D_n = Γ_{T,n}` (`thm:cobertura`) + limite inferior via `A_T` para orçamentos constantes (`cor:atividade`); `F_n = {Φ : |Φ| ≤ ⌊log n⌋}` provado (`lem:cilindros-n`); `r ≥ 1` em toda a cadeia; ver `06` P-3.
- [ ] Perfil de instabilidade `(C_T(L), 𝔍_{T,L,c})` (Etapa 12). — **PARCIAIS ATUALIZADAS (28/09/2026)**: a pendência antiga ("`rem:perfil-global` cobre só `c` fixo") **fechou** — cadeia `proofs/perfil_instabilidade_etapa12.md`: (a) **Teorema 12.4 (B)**: `D_n(b₁,b₂) = H_T(L_n, b₁(n))` para **`b₁ = c(n)` arbitrária** com `b₂(n) ≥ R_T(L_n)` (a hipótese "c fixo" nunca foi usada em `rem:perfil-global`) + forma geral (sanducho com igualdade nas duas pontas **sse** `b₂(n) ≥ R_T(L_n)`); (b) `H_T(L,c) = Γ_T(L;(c,∞))` (A19) ⇒ protocolo A5/G.10 herdado sem nova prova; (c) perfil `𝔍` **definido nas duas normalizações** (contada do fonte; ponderada `2^{−|Φ|}` = lei do índice selecionado para entrada uniforme) com leis **B**: particão, monotonia estocástica em `c`, terminal para `c ≥ R_T(L)`, **decidibilidade** em `(L,c)` fixos (busca limitada; `H_T` só Σ₁ — sondagem Lema 12.1); (d) achados **A18–A22** (G.8 com rótulo invertido, **corrigido em `06` §9.2**; `𝔍` **não determina** `H`/`D_n`; índice `j` não comparável entre fórmulas; diagonal `(L_n, c(n))` **sem monotonia em `n`**). **Segue em aberto (C/D):** lei assintótica do diagonal `𝔍_{T,L_n,c(n)}` (a pergunta de Q-Asy/Conj-F) e a absorção no `paper` (`rem:perfil-global` estendido) — **só sob pedido**.
- [ ] Saída → imagem (`E_{b₁,b₂}(n)`) antes de τ (Etapa 13) e só então τ/resultantes (Etapas 14–16). — **ATAQUE REGISTRADO (27/09/2026)** a partir de `CONTINUIDADE_ESPECTRO_CONSEQUENCIA_GLOBAL.md` **§12** (\"certificado espectral de exclusividade\"): `g^[b₁](u) ≠ g^[b₂](u)` **não** implica `rng(g^[b₁]) ≠ rng(g^[b₂])`; alvo: para cada `r ∈ B_T(Φ)`, achar `u` com `y := g_T^[r−1](u) ≠ g_T^[r](u)` e provar **simultaneamente** `∀v: g_T^[r](v) ≠ y` — daí `y ∈ rng(g_T^[r−1]) ∖ rng(g_T^[r])` e a ponte `transição espectral → separação de range` fica **direta**. Alvo intermediário da §12: condição **estrutural verificável sobre `Out`** que torne `y` globalmente decodificável (candidata: `Out(u, w) = w·u₀` invertível em `w` sobre a imagem, `lem:outinj`). Enquanto isso não fechar, **P-4.2 permanece em vigor**: `A_T > 0 ⟹ rng(g^[b₁]) ≠ rng(g^[b₂])` é **proibido** (`cor:atividade` cobre só saídas). Complemento: a **§13** do mesmo doc (`C₁={R}` vs `C₂={1..R}`) foi atacada **parcialmente** na Etapa 10 (`08` M.2/M.3 — `Env1`/`Env2`); a realizabilidade por **teorias concretas** segue aberta (G.10). — **ATAQUE EXECUTADO (28/09/2026; Nível B + C)**: cadeia completa em `proofs/certificado_exclusividade_range_etapa13.md`. (a) **Lema 13.1**: `J_{T,Φ}(r−1) < J_{T,Φ}(r) ⟺ r ∈ B_T(Φ)` — o salto do seletor **é** a transição; (b) **Lema 13.2**: a diferença `g_T^[r−1](u) ≠ g_T^[r](u)` é consequência imediata (Lema 5.3) — o conteúdo da Etapa 13 é a exclusividade; (c) **Lema 13.3** (= a «condição estrutural sobre `Out`» pedida pela §12): `y ∈ rng(g^[c])` ⟺ `y = 0^{n+1}` (com entrada de `Form` indefinida) `∨ ∃Ψ` admissível, `|Ψ| ≤ ⌊log n⌋`, cujo símbolo selecionado `σ_Ψ(c)` é o prefixo `y[1..q(Ψ)]` — reduz `∀v` (infinito) a uma conjunção **finita e decidível**; (d) **Teorema 13.4**: com `n = 2^{|Φ|}` e cauda ≠ toda nula, `y = w_{j₁}·u₀ ∈ rng(g^[r−1]) ∖ rng(g^[r])` ⟺ **(E)**: `∀Ψ`, `|Ψ| ≤ |Φ|`, `σ_Ψ(r) ≠ w_{j₁}[1..q(Ψ)]` — **achado A11: a versão ingênua (só `|Ψ| = |Φ|`) é FALSA** (ambiguidade de divisão de `Out`: `Ψ` menor re-partilha a cauda — contraexemplo explícito na cadeia); (e) **Corolário 13.5**: (E) decidível por par (busca limitada a `r` — **sem barreira G.10**, mesmo esquema de A7), busca existencial **semi-decidível**; (f) **Teorema 13.6 (Nível C)**: sob **(P4′)(i)** (esquema vazio; = F1) o certificado **existe com dados explícitos** — `m₀` = tamanho mínimo admissível, `Φ*` = **argmax** de `ℓ₀` sobre `S₀ = {Ψ admissível : |Ψ| = m₀}` (achado A17: argmax, não argmin), `r = ℓ₀^{Φ*} ≥ 1`, `n = 2^{m₀}`, `u₀ = 1·0^{…}`, `y = 0^{q(Φ*)}·u₀`; logo **`E_{r−1,r}(2^{m₀}) ≠ ∅`** e a ponte `transição espectral → rng distinto` **fecha para esse par**. Achados A11–A17 e critérios **R1–R5** gravados na cadeia. **Mantido visível:** **P-4.2 na forma geral permanece PROIBIDA** (par ativo arbitrário / `b` variável: (E) é decidível por par mas **não foi avaliada** para pares genéricos; `cor:atividade` segue cobrindo **só saídas**); formalização de (P4′)(i) = F1 (bloqueada, Lean); **nenhuma simulação executada** (busca por pares genéricos = `src/julia/etapa13_certificado.jl`, **não criado — só sob pedido**); Etapas 14–16 (τ) intactas.

### 5.5 O que NÃO fazer agora (concordância com a organização §5)

Não tentar: hardness de `g_T^[b]`, separações de τ-complexidade, pseudo-surjetividade, monotonicidade de imagem. Todos exigem questões abertas centrais.

---

## 6. Veredito geral

- **Sólido (Nível A/B):** definições do espectro, teoremas locais (incluindo `ρ` exato — fortalecimento novo), realizabilidade de escadas, verificação computacional.
- **Promissor e possivelmente original (Nível C candidato):** o objeto "espectro de limiares de prova" como invariante e a **geometria de `C_T(L)`** — nenhum conflito de prioridade encontrado, mas a busca é incompleta (§4.2).
- **Clássico, não reivindicar (Nível A/B):** parametrização por `b(n)`; ausência de majorante computável; `R_T^Σ ≡_T 0'`.
- **Condicionado (Nível C):** gadget `θ ↦ Φ_θ` e a transferência quantitativa.
- **Inexistente (lacuna principal):** ponte `C_T → τ`.

**Adendo pós-27/09/2026 (síntese das §§3.4–3.5, §5.0 e da Etapa 10):**

- **Ciclo 2:** obrigações 1–7 do gadget atacadas — 1, 5 e 7 fechadas (B/C); 3 e 4 fechadas na semântica, **condicionadas a `(P4′)`** na sintática; 6 parcial (questão D); 2 fechada sob **`(P7a)`**. `(P4′)`/`(P7a)` são **hipóteses nomeadas**, não fecháveis aqui. Correções de escopo aplicadas (caso `T ⊬ θ` sintático; escala `R_T` irrestrito / `R_T^Σ` só `Πᵇ₁`). **Nenhum teorema local alterado.**
- **Artigo:** §5 `sec:geometria` (A/B) e §6 `sec:consequencia` (B/C-condicionado) **fechadas** com as 6 correções obrigatórias do `07`; §7 `sec:comparacao` cumpre a obrigação editorial; **18 pp** (28/09/2026, após absorver a `06` §9.6 — `lem:transporte`, `cor:escala-log`, `cor:atividade-var`, Q-Asy em `rem:assintoticos`), 0 `LaTeX Warning`, 3 "a verificar" no `.bib`.
- **Etapa 10:** P-1 e Q1 **parciais** — testemunho na classe de modelos (`Env1`/`Env2`; `C₁={8}` vs `C₂={1..8}`), teorias concretas seguem abertas (G.10). Inventário do `06` §9.0 espelhado na §5.0; **§12 do doc global registrada como ataque da Etapa 13** (§5.4) — **ponte fechada existencialmente em 28/09/2026** (Teorema 13.6, Nível C — `proofs/certificado_exclusividade_range_etapa13.md`), **mas P-4.2 (forma geral) segue mantida**.
