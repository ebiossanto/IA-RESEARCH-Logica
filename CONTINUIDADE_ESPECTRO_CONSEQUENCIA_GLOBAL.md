# Continuidade de Pesquisa — Do Espectro de Limiares à Consequência Global no Gerador

**Autor:** Euzébio Soares  
**Data:** 27/09/2026  
**Base:** `Espectro de Limiares de Prova e Geradores de Krajíček` (7 páginas)

## 0. Objetivo deste ciclo

O trabalho atual já estabelece, para uma fórmula fixa `Phi`, a cadeia

`comprimentos mínimos -> seletor J -> transições B_T(Phi) -> limiar final rho_T(Phi)`.

O objetivo deste ciclo é dar um significado global e observável ao espectro. A ideia central é considerar, para cada tamanho de entrada `n`, a família do gerador quando o orçamento é variado:

`G_{T,n}(c) := g_T^[c]` restrito às entradas de tamanho `n`.

A hipótese de pesquisa passa a ser:

> `C_T(L_n)` não é somente um conjunto abstrato de limiares; ele é exatamente o suporte dos instantes em que a função global do gerador muda.

Além disso, a massa espectral em cada limiar mede exatamente a fração de entradas que mudam quando o orçamento passa de `r-1` para `r`.

---

## 1. Notação global

Defina

`L_n := floor(log_2 n)`.

Para uma fórmula admissível `Phi`, seja

`U_n(Phi) := {u in {0,1}^n : Form_n(u)=Phi}`.

Pela propriedade de código livre de prefixo, esses cilindros são disjuntos. Quando `|Phi| <= L_n`, cada cauda possível produz uma entrada e

`|U_n(Phi)| = 2^(n-|Phi|)`.

Defina a discrepância normalizada entre dois orçamentos `c1 <= c2` por

`D_n(c1,c2) := 2^(-n) |{u in {0,1}^n : g_T^[c1](u) != g_T^[c2](u)}|`.

Para um limiar inteiro `r >= 1`, defina a intensidade espectral

`lambda_{T,n}(r) := sum_{Phi in F_n} 2^(-|Phi|) 1_{r in B_T(Phi)}`,

onde `F_n` é o conjunto de fórmulas admissíveis que aparecem em entradas de tamanho `n`.

Defina ainda a cobertura espectral de um intervalo `I=(c1,c2]` por

`Gamma_{T,n}(I) := sum_{Phi in F_n} 2^(-|Phi|) 1_{B_T(Phi) intersect I != emptyset}`.

---

## 2. Teorema novo A — identidade global de uma transição

### Teorema A (massa espectral = massa de Hamming da transição)

Para todo `n` e todo inteiro `r >= 1`, sob a injetividade concreta de `Out_n` sobre os candidatos selecionados,

`D_n(r-1,r) = lambda_{T,n}(r)`.

### Demonstração

Particione `u in {0,1}^n` em:

1. entradas para as quais `Form_n(u)` é indefinida;
2. entradas em um cilindro `U_n(Phi)`.

No primeiro caso, pela definição operacional de `Out_n`, a saída é independente do orçamento, logo não há contribuição para `D_n(r-1,r)`.

No segundo caso, escreva `u=Phi u_0`. O Teorema 3.4 do artigo dá

`J_{T,Phi}(r-1) != J_{T,Phi}(r)`  se e somente se  `r in B_T(Phi)`.

Pela injetividade de `Out_u`, isso equivale a

`g_T^[r-1](u) != g_T^[r](u)`.

Logo, dentro de cada cilindro `U_n(Phi)`, ou todas as caudas contribuem, ou nenhuma contribui. Se `r in B_T(Phi)`, a contribuição é

`|U_n(Phi)|/2^n = 2^(n-|Phi|)/2^n = 2^(-|Phi|)`.

Somando sobre os cilindros disjuntos, obtém-se

`D_n(r-1,r) = sum_{Phi:r in B_T(Phi)} 2^(-|Phi|) = lambda_{T,n}(r)`.

QED.

### Interpretação

Isto dá uma interpretação operacional exata do espectro:

`lambda_{T,n}(r)` = fração das entradas de tamanho `n` que mudam quando o orçamento passa de `r-1` para `r`.

Portanto `lambda` não é uma estatística arbitrária: é uma derivada discreta, em distância de Hamming normalizada, da família de geradores em função do orçamento.

---

## 3. Teorema novo B — o espectro global é o suporte da dinâmica do gerador

### Teorema B (caracterização global de C_T)

Para `L_n=floor(log_2 n)` e `r>=1`,

`r in C_T(L_n)  <=>  D_n(r-1,r) > 0`.

### Demonstração

Pelo Teorema A,

`D_n(r-1,r)=lambda_{T,n}(r)`.

A massa `lambda` é positiva exatamente quando existe alguma fórmula `Phi` com `|Phi|<=L_n` e `r in B_T(Phi)`. Isto equivale a

`r in union_{|Phi|<=L_n} B_T(Phi) = C_T(L_n)`.

QED.

### Consequência conceitual

A definição original de `C_T(L)` ganha agora uma interpretação dinâmica:

`C_T(L_n)` = conjunto exato dos tempos de transição da família global de geradores no comprimento `n`.

Assim, a palavra “espectro” deixa de ser apenas uma metáfora.

---

## 4. Teorema novo C — identidade global para dois orçamentos

### Teorema C (cobertura espectral exata)

Para `c1 <= c2`,

`D_n(c1,c2) = Gamma_{T,n}((c1,c2])`.

### Demonstração

Novamente decompõe-se o domínio em cilindros `U_n(Phi)`. Para um `u` com `Form_n(u)=Phi`, o Corolário 3.9 do artigo dá

`g_T^[c1](u) != g_T^[c2](u)`

se e somente se

`B_T(Phi) intersect (c1,c2] != emptyset`.

A contribuição relativa desse cilindro é `2^(-|Phi|)`. Somando os cilindros disjuntos resulta na fórmula.

QED.

### Observação importante

`lambda` é aditiva em `r`, mas `Gamma` não é, em geral, aditiva nos intervalos: uma mesma fórmula pode ter mais de uma transição dentro de intervalos diferentes. Isso distingue claramente:

- **intensidade espectral:** quantas transições existem naquele ponto, ponderadas pela massa do cilindro;
- **cobertura espectral:** quantas entradas são afetadas por pelo menos uma transição no intervalo.

---

## 5. Teorema novo D — R_T(L) é o tempo global exato de estabilização

Defina, para um tamanho `n`,

`R_n^glob := min { c : para todo c' >= c e todo u in {0,1}^n, g_T^[c'](u)=g_T^[c](u) }`.

### Teorema D

Se `L_n=floor(log_2 n)`, então

`R_n^glob = R_T(L_n)`.

### Demonstração

Pelo Teorema 3.1 do artigo, todo `Phi` com `|Phi|<=L_n` está estabilizado quando `c>=rho_T(Phi)`. Logo, quando `c>=R_T(L_n)`, todos os cilindros estão estabilizados simultaneamente. Portanto

`R_n^glob <= R_T(L_n)`.

Para a desigualdade inversa, se `R_T(L_n)=r>0`, existe alguma fórmula `Phi` com `r in B_T(Phi)` ou, equivalentemente, com `rho_T(Phi)=r`. Pelo Teorema A,

`D_n(r-1,r)>0`.

Logo o gerador ainda muda no passo `r-1 -> r`, impedindo estabilização antes de `r`. Portanto

`R_n^glob >= R_T(L_n)`.

QED.

### Consequência

`R_T(L)` passa a ter uma interpretação semântica precisa:

> é o último orçamento em que a família de geradores ainda sofre alguma mudança em alguma entrada admissível daquele comprimento.

Isso é muito mais forte conceitualmente do que simplesmente dizer que `R_T(L)` é o máximo de um conjunto de números.

---

## 6. Teorema novo E — número exato de regimes do gerador

Defina

`G_n := { g_T^[c]|_{ {0,1}^n } : c in N }`.

### Teorema E

`|G_n| = |C_T(L_n)| + 1`.

### Ideia da prova

Começamos com o regime `c=0`. Quando `r notin C_T(L_n)`, o Teorema B garante que

`g_T^[r-1] = g_T^[r]`

em todo o domínio de tamanho `n`.

Quando `r in C_T(L_n)`, temos

`D_n(r-1,r)>0`,

logo as duas funções globais são diferentes.

Assim, cada elemento de `C_T(L_n)` cria exatamente um novo regime global, enquanto todos os valores de orçamento entre dois pontos consecutivos do espectro representam a mesma função.

Após `R_T(L_n)`, a função não muda mais.

Portanto existe exatamente um regime inicial mais um regime para cada transição global:

`|G_n|=|C_T(L_n)|+1`.

---

## 7. Teorema novo F — comprimento espectral da trajetória

Defina a variação espectral até `m` por

`V_{T,n}(m) := sum_{r=1}^m lambda_{T,n}(r)`.

Pelo Teorema A,

`V_{T,n}(m) = sum_{r=1}^m D_n(r-1,r)`.

Trocando a ordem das somas,

`V_{T,n}(m) = sum_{Phi in F_n} 2^(-|Phi|) |B_T(Phi) intersect [1,m]|`.

Assim, `V` é o número esperado de transições percorridas por uma entrada uniforme de tamanho `n`, ponderado pela codificação dos cilindros.

Além disso, pela desigualdade triangular da distância de Hamming,

`D_n(0,m) <= V_{T,n}(m)`.

A igualdade ocorre exatamente quando nenhuma entrada sofre duas ou mais mudanças de saída ao longo dos passos `0,1,...,m`.

### Interpretação

O espectro agora define uma espécie de “comprimento” da trajetória do gerador no espaço discreto das funções `{0,1}^n -> {0,1}^{n+1}`.

---

## 8. Perfil de estabilização — uma distribuição espectral nova

Defina a massa de fórmulas não estabilizadas no orçamento `c` por

`H_T(L,c) := sum_{|Phi|<=L} 2^(-|Phi|) 1_{rho_T(Phi)>c}`.

Para `L=L_n`, compare o gerador de orçamento `c` com qualquer orçamento `c* >= R_T(L_n)`. Pelo Teorema C,

`D_n(c,c*) = H_T(L_n,c)`.

Portanto `H_T(L,c)` é exatamente a fração de entradas de tamanho `n` que ainda não atingiram o regime estacionário no orçamento `c`.

Propriedades imediatas:

1. `H_T(L,c)` é não crescente em `c`;
2. `H_T(L,c)=0` para `c>=R_T(L)`;
3. `H_T(L,c)>0` exatamente quando existe alguma fórmula de tamanho `<=L` com `rho_T(Phi)>c` e cilindro não vazio;
4. a queda
   `H_T(L,c-1)-H_T(L,c)` mede a massa de fórmulas cujo último recorde é exatamente `c`.

Essa função é, portanto, a função de sobrevivência de uma distribuição ponderada dos limiares finais `rho_T(Phi)`.

---

## 9. Nova interpretação probabilística do espectro

Se `U` é uniforme em `{0,1}^n` e `Phi=Form_n(U)` quando definida, então:

`P(B_T(Phi) intersect I != emptyset) = Gamma_{T,n}(I)`.

E

`E[ |B_T(Phi) intersect I| ] = sum_{r in I} lambda_{T,n}(r)`.

Portanto:

`Gamma_{T,n}(I) <= sum_{r in I} lambda_{T,n}(r)`.

Se cada fórmula possui no máximo `k` transições dentro de `I`, então

`(1/k) sum_{r in I} lambda_{T,n}(r) <= Gamma_{T,n}(I) <= sum_{r in I} lambda_{T,n}(r)`.

Isto separa formalmente concentração de transições de cobertura de entradas.

---

## 10. A nova arquitetura conceitual

A primeira versão do projeto enfatizava

`L_T -> B_T -> rho_T -> C_T -> R_T`.

A extensão mais informativa é

`L_T`
`  -> J_T, Phi`
`  -> B_T(Phi)`
`  -> lambda_T,n(r) = massa da transição r`
`  -> Gamma_T,n(I) = massa de cobertura do intervalo`
`  -> D_n(c1,c2) = desacordo global`
`  -> R_T(L_n) = último instante global de mudança`.

Em particular,

`C_T(L_n) = supp(lambda_T,n)`

e

`R_T(L_n) = max supp(lambda_T,n)`.

Essa é uma formulação muito mais forte para a futura seção de “geometria do espectro”.

---

## 11. O que isso resolve e o que ainda não resolve

### Resolvido neste ciclo

- O espectro passa a ter uma consequência global exata no gerador.
- `C_T(L)` é identificável como suporte de mudanças globais.
- `R_T(L)` é identificável como estabilização global exata.
- `lambda` mede a massa de Hamming de cada transição.
- `Gamma` mede exatamente a massa de entradas afetadas por um intervalo de orçamentos.
- O número de regimes distintos do gerador em comprimento `n` é `|C_T(L_n)|+1`.
- A soma das intensidades fornece uma variação total espectral da trajetória do gerador.

### Ainda não resolvido

Isto ainda não prova que o espectro controla `tau(g_T)`, hardness, pseudosurjectivity ou propriedades profundas do range. A conexão com essas noções continua sendo um segundo problema.

---

## 12. Próximo ataque: separar espectro de comportamento e espectro de range

A principal dificuldade para passar ao range é que

`g^[b1](u) != g^[b2](u)`

não implica, por si só,

`rng(g^[b1]) != rng(g^[b2])`.

A próxima construção recomendada é um **certificado espectral de exclusividade**.

Para um ponto `r in B_T(Phi)`, procurar um `u` tal que

`y = g_T^[r-1](u) != g_T^[r](u)`

e provar simultaneamente

`for all v, g_T^[r](v) != y`.

Então

`y in rng(g_T^[r-1]) \ rng(g_T^[r])`,

e teremos uma ponte direta

`spectral transition -> range separation`.

O alvo intermediário deve ser uma condição estrutural verificável sobre `Out` que torne esse `y` globalmente decodificável.

> **Resultado (28/09/2026, Etapa 13).** A condição foi encontrada e a ponte fecha existencialmente — cadeia em `proofs/certificado_exclusividade_range_etapa13.md`: **Lema 13.3**: `y ∈ rng(g_T^[c])` ⟺ `y = 0^{n+1}` (com entrada de `Form` indefinida) ou `∃Ψ` admissível, `|Ψ| ≤ ⌊log n⌋`, com símbolo selecionado `σ_Ψ(c) = y[1..q(Ψ)]` — finito e decidível por busca limitada a `c` (**sem barreira G.10**); **Teorema 13.4**: com `n = 2^{|Φ|}` a exclusividade de `y = w_{j₁}·u₀` equivale a (E): `∀Ψ`, `|Ψ| ≤ |Φ|`, `σ_Ψ(r) ≠ w_{j₁}[1..q(Ψ)]` — e **a versão ingênua (só `|Ψ| = |Φ|`) é falsa** (achado A11: ambiguidade de divisão de `Out` — Ψ menor re-partilha a cauda); **Teorema 13.6 (Nível C)**: sob `(P4′)(i)` o certificado existe com dados explícitos (`Φ*` argmax de `ℓ₀` entre as admissíveis mínimas, `r = ℓ₀^{Φ*}`, `n = 2^{m₀}`), i.e. `E_{r−1,r}(2^{m₀}) ≠ ∅`. **P-4.2 (forma geral) permanece proibida** — só um par é garantido.

---

## 13. Ataque à hipótese de que R_T sozinho basta

O próximo experimento matemático deve procurar pares de espectros com o mesmo `R_T(L)` mas com diferentes `lambda` e `Gamma`.

Por exemplo, esquematicamente,

`C_1={R}`

versus

`C_2={1,2,...,R}`.

Ambos possuem o mesmo envelope `R`, mas geram trajetórias com números de regimes radicalmente diferentes.

Se tais perfis puderem ser realizados dentro das restrições relevantes de uma teoria `T`, teremos evidência de que `R_T` é insuficiente e que a informação essencial está em `lambda`, `Gamma` ou nos pares de correlação das transições.

---

## 14. Cuidado decisivo para o gadget

Há uma restrição importante: quando `b(n)=O(log n)`, a busca por provas limitadas até `b(n)` e a enumeração dos candidatos `2^{q(Phi)}` permanecem compatíveis com uma implementação polinomial, sob as convenções usuais de codificação/verificação.

Assim, não devemos tentar fazer o gadget provar diretamente que um problema NP-completo se reduz ao evento de transição quando o parâmetro espectral está em regime logarítmico: isso tenderia a produzir uma consequência de `P=NP`.

O alvo apropriado deve ser uma propriedade de **proof complexity** (por exemplo, estrutura de gerador, dureza, disjunção, range ou uma transferência formal em aritmética limitada), não uma NP-dureza clássica do predicado de transição sem hipóteses adicionais.

---

## 15. Hipóteses de pesquisa para o próximo ciclo

### H1 — suficiência da intensidade

Existe uma função `F` tal que alguma medida importante do gerador é determinada por

`{lambda_T,n(r)}`.

### H2 — insuficiência do envelope

`R_T(L)` sozinho não determina a sensibilidade global do gerador.

### H3 — existência de separadores de range

Há uma classe de instâncias/gadgets em que uma transição espectral produz uma saída globalmente exclusiva.

### H4 — transferência limitada

Pode existir um mapa `theta -> Phi_theta`, com crescimento polinomial de tamanho, que transforme uma propriedade de proof complexity em uma propriedade de transição espectral.

### H5 — ponte para Krajíček

Algum invariante enriquecido do espectro, provavelmente `lambda`, `Gamma`, estrutura de transições ou um objeto de segunda ordem, pode entrar numa caracterização ou limite de uma noção de hardness/range estudada na teoria dos proof complexity generators.

---

## 16. Verificação computacional recomendada

Para cada `n`, gerar todos os perfis artificiais permitidos em uma família finita e comparar diretamente:

1. a enumeração de entradas;
2. `D_n(r-1,r)`;
3. `lambda_T,n(r)`;
4. `D_n(c1,c2)`;
5. `Gamma_T,n((c1,c2])`;
6. `R_T(L_n)`;
7. número de funções distintas `g^[c]`.

Os testes devem ser tratados como validação de consequências dos axiomas dos perfis; eles não substituem prova para a teoria `T` real.

Uma verificação independente sobre perfis sintéticos confirmou a identidade de cobertura em exemplos representativos, inclusive no perfil `(2,10,7,infty)` discutido no artigo.

---

## 17. Resultado estratégico

A situação do projeto muda de

`“temos um espectro e ainda procuramos uma utilidade”`

para

`“o espectro é exatamente a derivada discreta da família de geradores em relação ao orçamento”`.

O próximo objetivo deixa de ser provar que o espectro “deve” ter consequência e passa a ser descobrir **qual invariável espectral é necessária para a consequência mais profunda**.

A ordem recomendada é:

`lambda/Gamma -> range -> gadget -> bounded arithmetic -> hardness/tau`.

O envelope `R_T` deve permanecer como parâmetro de estabilização, mas não como candidato único à teoria espectral completa.
