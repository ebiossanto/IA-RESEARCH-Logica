# Custo de colagem, consistência finita e reflexão uniforme

## Continuação técnica, versão 0.3

## 0. Resultado desta etapa

Este documento fixa uma noção formal de custo de colagem, define com precisão a função de comprimento `L_T(N)`, prova limites elementares sob convenções explícitas, registra o teorema polinomial conhecido de Pudlák e compara a consistência finita com reflexão local e uniforme.

Não se reivindica originalidade para os limites conhecidos. A contribuição conceitual em desenvolvimento é a organização de três eixos independentes de custo:

1. **custo lógico**, medido por força reflexiva;
2. **custo sintático**, medido por comprimento de prova;
3. **custo de uniformização**, medido pela passagem de uma família externa de provas para uma única demonstração interna de sua correção.

---

## 1. Convenções fixas

Fixe:

- uma teoria aritmética consistente `T`, recursivamente axiomatizada;
- uma teoria-base `B`, por exemplo `EA`, com `B ⊆ T`;
- um cálculo de primeira ordem fixo;
- um alfabeto finito para fórmulas e provas;
- uma codificação binária eficiente de numerais;
- `|π|`, o número total de símbolos da prova `π`;
- `Prf_T(p,x)`, um predicado aritmético que representa: “`p` codifica uma prova em `T` da fórmula de código `x`”;
- `⊥ := (0=1)` e `b := ⌜⊥⌝`.

Uma prova de tamanho no máximo `N` significa uma cadeia de símbolos de comprimento no máximo `N`, não um código numérico menor que `N`.

Defina o predicado limitado de prova:

`Prf_T^{≤N}(p,x) := Prf_T(p,x) ∧ Len(p) ≤ N`.

A consistência finita de `T` até `N` símbolos é

`Con_T(N) := ∀p( Len(p) ≤ N → ¬Prf_T(p,b) )`.

Para cada `N` padrão, `Con_T(N)` é uma sentença aritmética fechada. A consistência global é

`Con(T) := ∀p ¬Prf_T(p,b)`.

No metanível,

`Con(T) ⇔ ∀N Con_T(N)`.

A formalização interna dessa equivalência requer apenas fatos elementares sobre comprimentos e pode ser realizada em uma base adequada.

---

## 2. Comprimento mínimo

Defina

`L_T(N) := min { |π| : π é uma T-prova de Con_T(N) }`.

Se `T` é consistente e contém aritmética suficiente para verificar computações fechadas, o conjunto é não vazio para cada `N` padrão. Portanto `L_T(N)` está bem definido externamente.

### Dependência de apresentação

`L_T(N)` não é um invariante absoluto. Ele depende de:

- linguagem de `T`;
- sistema de prova;
- abreviações permitidas;
- codificação dos numerais;
- definição de comprimento;
- apresentação do predicado `Prf_T`.

Comparações assintóticas só fazem sentido após fixar essas escolhas ou provar robustez sob simulações polinomiais.

---

## 3. Custo de colagem como objeto multidimensional

Seja `φ(x)` uma fórmula para a qual cada instância padrão é demonstrável em `T`. Uma **realização de colagem** é um par

`G = (M, Π)`

em que:

1. `M` é uma extensão admissível de `T`;
2. `Π` é uma `M`-prova de `∀x φ(x)`.

Defina o custo vetorial:

`Cost_T(G) := (r_T(M), |Π|, u_T(G))`.

Os componentes são:

- `r_T(M)`: custo reflexivo de passar de `T` para `M`;
- `|Π|`: custo sintático da prova global;
- `u_T(G)`: custo de uniformização, definido abaixo.

### 3.1 Custo reflexivo

Fixe uma progressão de reflexão `R^α(T)`:

- `R^0(T) := T`;
- `R^{α+1}(T) := R^α(T) + RFN_Γ(R^α(T))`;
- em limites, `R^λ(T) := ⋃_{β<λ}R^β(T)`, usando uma notação ordinal efetiva fixada.

Então

`r_T(M) := inf { α : R^α(T) interpreta M ou prova os axiomas relevantes de M }`.

Para evitar problemas ordinais na primeira fase, use a versão finita:

`r_T^{fin}(M) := min { k∈N : R^k(T) ⊢ Ax_M relevante }`.

### 3.2 Custo de uniformização

Uma família externa de provas é uma função computável `s` tal que, para cada `n` padrão,

`s(n)` codifica uma T-prova de φ(n̄).

Defina `u_T(G)` como o menor tamanho de um programa/circuito, numa máquina universal fixada, que:

1. produz os certificados locais `s(n)`;
2. juntamente com axiomas adicionais de `M`, permite formalizar em `M` a correção uniforme necessária para derivar `∀x φ(x)`.

Esse componente ainda é uma definição de pesquisa. Para resultados imediatos, usaremos a projeção bidimensional

`Cost_T^{(2)}(G) := (r_T(M), |Π|)`

ordenada por Pareto. Não se deve somar força lógica e número de símbolos sem uma normalização arbitrária.

### 3.3 Custo de colagem

Defina o conjunto de custos mínimos:

`Glue_T(φ) := Min_Pareto { Cost_T^{(2)}(M,Π) : M⊇T e M⊢∀xφ(x) }`.

Para `φ(x) := ¬Prf_T(x,b)`, a conclusão global é `Con(T)`. Logo, qualquer realização de colagem prova `Con(T)`.

---

## 4. Primeiro teorema sobre o custo lógico

### Teorema 1. Custo reflexivo positivo da colagem de consistência

Suponha que `T` seja consistente e satisfaça as hipóteses do segundo teorema de incompletude. Para

`φ_T(x) := ¬Prf_T(x,b)`,

não existe realização de colagem com `M=T`. Em particular,

`r_T(M) > 0`

para toda realização cuja escala atribua custo zero precisamente às extensões conservativas incapazes de provar novos fatos reflexivos.

Por outro lado, em

`M := T + Con(T)`,

há uma realização com um passo axiomático de consistência.

#### Prova

A colagem é

`∀x φ_T(x) ≡ Con(T)`.

Se `M=T` a provasse, teríamos `T⊢Con(T)`, contra a segunda incompletude. Já `T+Con(T)` prova a sentença por ser axioma. `□`

### Observação

Isso prova apenas que o custo é positivo numa escala apropriada. Não mostra que uma aplicação de **reflexão uniforme completa** seja o passo mínimo: adicionar apenas `Con(T)` é muito mais fraco que adicionar todo o esquema de reflexão uniforme.

---

## 5. Limites elementares para `L_T(N)`

## 5.1 Limite inferior sintático

### Proposição 2. Limite pelo tamanho da conclusão

Em qualquer cálculo no qual a última linha da prova seja literalmente a fórmula provada,

`L_T(N) ≥ |Con_T(N)|`.

#### Prova

A prova contém sua última fórmula como uma subcadeia. Portanto, seu número total de símbolos é pelo menos o número de símbolos da conclusão. `□`

Com numerais binários e uma formulação na qual `N` aparece explicitamente,

`|Con_T(N)| = Ω(log(N+1))`.

Logo,

`L_T(N) = Ω(log(N+1))`.

Se numerais unários forem usados sem abreviações, o limite passa a `Ω(N)`. Isso mostra por que a convenção de codificação é indispensável.

### Limitação da proposição

Esse lower bound é incondicional, mas fraco. Ele mede apenas o custo de escrever a conclusão, não a dificuldade de prová-la.

---

## 5.2 Limite superior por enumeração explícita

### Proposição 3. Limite exponencial elementar

Suponha:

1. o alfabeto de provas tem `a≥2` símbolos;
2. `T` verifica corretamente computações primitivas recursivas fechadas;
3. para cada cadeia `w` de tamanho `≤N`, existe uma `T`-prova de tamanho `poly(N)` de que `w` não é uma prova de `⊥`, sempre que esse é o resultado correto da verificação;
4. `T` permite combinar a lista finita dessas verificações numa prova de `Con_T(N)` com overhead polinomial por item.

Então existem constantes `c,d>0` tais que

`L_T(N) ≤ c·a^N·N^d`.

#### Prova

Há

`1+a+a²+...+a^N ≤ a^{N+1}`

cadeias de tamanho no máximo `N`. Como `T` é consistente, nenhuma delas é uma prova válida de `⊥`. Pela hipótese 3, cada rejeição tem prova de tamanho no máximo `q(N)` para algum polinômio fixo `q`. Concatenando as verificações e aplicando a regra finita de agregação da hipótese 4, obtemos uma prova de tamanho no máximo

`c₀ a^{N+1}(q(N)+N^{d₀})`.

Absorvendo constantes e polinômios, resulta

`L_T(N) ≤ c·a^N·N^d`. `□`

### Cuidado

A proposição é um esquema condicional sobre a apresentação concreta. Não basta dizer “há finitos casos”: é preciso que `T` formalize a verificação e a agregação com o custo alegado.

---

## 5.3 Limites polinomiais conhecidos

Para classes amplas de teorias naturais e formalizações razoáveis, Pudlák provou que há constantes positivas `ε,k,c,C` tais que, para `N` suficientemente grande,

`cN^ε ≤ L_T(N) ≤ CN^k`.

O upper bound polinomial usa predicados parciais de verdade e codificações abreviadas, evitando a enumeração exponencial de todas as cadeias. O lower bound é genuinamente proof-theoretic e é muito mais forte que o simples custo de escrever o numeral.

Este resultado não deve ser atribuído a toda teoria recursivamente axiomatizada sem hipóteses. A expressão “teorias razoáveis” precisa ser substituída, numa versão para publicação, pelas condições exatas do teorema escolhido e pelo sistema de comprimento usado no artigo original.

### Corolário 4. Janela polinomial

Nas hipóteses do teorema de Pudlák,

`L_T(N) = N^{Θ(1)}`

no sentido fraco de estar entre duas potências possivelmente diferentes de `N`.

Isso não determina o expoente ótimo e não implica `L_T(N)=Θ(N^c)` para algum `c` específico.

---

## 6. Consistência finita como reflexão limitada

Defina reflexão local para uma sentença `σ`:

`Rfn_T(σ) := Prov_T(⌜σ⌝) → σ`.

Para `σ=⊥`, temos

`Prov_T(⌜⊥⌝) → ⊥`.

Classicamente, como `⊥` é falsa, essa sentença equivale a

`¬Prov_T(⌜⊥⌝)`,

isto é, `Con(T)`.

A versão limitada é

`Rfn_T^{≤N}(⊥) := Prov_T^{≤N}(⌜⊥⌝) → ⊥`,

que equivale a `Con_T(N)`.

Portanto:

> `Con_T(N)` é exatamente reflexão local limitada para a sentença falsa `⊥`.

Ela não é reflexão uniforme para uma classe de fórmulas.

---

## 7. Reflexão uniforme

Para uma classe de fórmulas `Γ`, defina

`RFN_Γ(T) := { ∀x(Prov_T(⌜ψ(ẋ)⌝) → ψ(x)) : ψ∈Γ }`.

Uma codificação esquemática equivalente pode usar um predicado parcial de verdade `True_Γ`:

`∀u( Sent_Γ(u) ∧ Prov_T(u) → True_Γ(u) )`.

A equivalência entre essas apresentações exige uma teoria-base adequada e um tratamento uniforme da satisfação para `Γ`.

### Teorema 5. Reflexão uniforme implica consistência

Se `Γ` contém uma fórmula equivalente a `⊥`, então

`B + RFN_Γ(T) ⊢ Con(T)`.

#### Prova

A instância de reflexão correspondente a `⊥` é

`Prov_T(⌜⊥⌝) → ⊥`.

Como `B⊢¬⊥`, a lógica clássica fornece

`¬Prov_T(⌜⊥⌝)`,

isto é, `Con(T)`. `□`

Consequentemente,

`RFN_Γ(T) ⇒ ∀N Con_T(N)`.

A recíproca não vale em geral: consistência diz apenas que `T` não prova `⊥`; reflexão uniforme afirma a correção de todas as provas de `T` para todas as fórmulas de `Γ`.

---

## 8. Comparação rigorosa dos três níveis

### Nível A: consistência finita

`Con_T(N)`

- verifica apenas provas de contradição até `N` símbolos;
- é uma sentença individual;
- para teorias naturais, admite provas internas polinomiais em `N`;
- não fornece, dentro de `T`, uma prova da consistência global.

### Nível B: consistência global

`Con(T)`

- equivale à totalização `∀N Con_T(N)` em bases adequadas;
- é reflexão local para `⊥`;
- não é demonstrável em `T` se `T` satisfaz a segunda incompletude;
- pode ser adicionada por um único axioma, sem conceder reflexão uniforme geral.

### Nível C: reflexão uniforme

`RFN_Γ(T)`

- afirma correção para uma classe inteira de fórmulas;
- implica `Con(T)` quando `Γ` contém `⊥`;
- normalmente é estritamente mais forte que mera consistência;
- seus fragmentos acompanham níveis da hierarquia aritmética e se relacionam com indução transfinita e reflexão iterada.

A cadeia segura é

`RFN_Γ(T) ⇒ Con(T) ⇒ Con_T(N)` para cada `N`.

As conversas não são válidas em geral.

---

## 9. O aparente paradoxo dos certificados curtos

Para teorias naturais, podemos ter provas `T`-internas de `Con_T(N)` com comprimento polinomial em `N`, embora `T` não prove `Con(T)`.

Não há contradição. As afirmações são:

`∀N∈ℕ ∃π [Prf_T(π,⌜Con_T(N)⌝) ∧ |π|≤p(N)]`

no metanível, versus

`T ⊢ ∀N Con_T(N)`

no nível interno.

A existência externa de uma família curta não fornece automaticamente a `T` uma prova interna da correção uniforme da construção de provas. Essa diferença é precisamente o local do custo de uniformização.

---

## 10. Uma definição mais útil de custo de uniformização

Fixe um algoritmo total `S` que, para cada `N`, produz candidato `S(N)` a uma prova de `Con_T(N)`.

Defina a sentença de correção uniforme:

`Corr_T(S) := ∀N Prf_T(S(N),⌜Con_T(N)⌝)`.

Há três propriedades distintas:

1. externamente, `S(N)` é uma prova correta para cada `N` padrão;
2. uma metateoria `M` prova `Corr_T(S)`;
3. `T` prova `Corr_T(S)`.

Se `T` provasse `Corr_T(S)` e também pudesse formalizar que `Con_T(N)` cresce para `Con(T)` sob quantificação universal, então `T` obteria `Con(T)`, contrariando a segunda incompletude. Portanto, algum passo de reflexão ou de extração da conclusão não pode ser realizado internamente de modo irrestrito.

### Definição

`UCost_T(S) := min { r_T(M) : M⊢Corr_T(S) e M justifica a passagem à família global }`.

Essa definição separa:

- produzir provas curtas;
- provar que o produtor sempre produz provas válidas;
- refletir as conclusões dessas provas para obter verdade global.

Essa separação é conceitualmente central e oferece um possível núcleo novo, desde que sejam provadas invariância e separações não triviais.

---

## 11. Resultado combinado

### Teorema 6. Lacuna entre custo finito e custo global

Suponha que `T` esteja na classe para a qual vale o upper bound polinomial de consistência finita. Então existe um polinômio `p` tal que

`L_T(N) ≤ p(N)`

para cada `N` padrão. Entretanto não existe uma `T`-prova de

`∀N Con_T(N)`.

#### Prova

A primeira afirmação é o teorema de upper bound para consistência finita. Para a segunda, uma prova de `∀N Con_T(N)`, combinada em uma base adequada com a equivalência

`∀N Con_T(N) ↔ Con(T)`,

produziria uma `T`-prova de `Con(T)`, contrariando a segunda incompletude. `□`

### Interpretação

O custo sintático de cada aproximação finita pode ser polinomial, enquanto o custo lógico da colagem total não é finito dentro da teoria original. Comprimento local baixo e força global insuficiente coexistem.

---

## 12. Limite do que foi provado

Foi provado diretamente neste documento:

1. `Glue_T(φ_T)` não contém realização em `T`;
2. `L_T(N)≥|Con_T(N)|`, portanto `Ω(log N)` com numerais binários explícitos;
3. um upper bound exponencial sob hipóteses de verificação e agregação explícitas;
4. `Con_T(N)` é reflexão local limitada para `⊥`;
5. `RFN_Γ(T)⇒Con(T)⇒Con_T(N)`;
6. a existência de provas locais curtas não implica sua colagem interna.

Foi importado da literatura, e não repro­vado integralmente:

7. para classes amplas de teorias naturais, limites `N^ε ≤ L_T(N) ≤ N^k`.

Uma prova integral do item 7 exigiria reconstruir predicados parciais de verdade, codificação abreviada, estimativas de tamanho e o argumento de lower bound de Pudlák. Isso deve ser uma etapa separada, com uma teoria e um cálculo fixados.

---

## 13. Próximo teorema recomendado

Fixar `T=PA` ou uma extensão natural de `EA`, escolher uma codificação concreta e provar formalmente:

### Meta 1

Existe um algoritmo primitivo recursivo `S` e um polinômio `p` tais que, para cada `N` padrão,

`S(N)` é uma `T`-prova de `Con_T(N)` e `|S(N)|≤p(N)`.

### Meta 2

Classificar a menor teoria `M` que prova a correção uniforme relevante de `S`.

### Meta 3

Comparar essa teoria `M` com:

- `T+Con(T)`;
- `T+RFN_{Π_1}(T)`;
- níveis superiores `T+RFN_{Π_n}(T)`.

O possível resultado original seria uma separação do tipo:

> o gerador local possui complexidade polinomial, mas a prova de sua correção uniforme exige exatamente certo nível de reflexão, medido por conservatividade ou interpretação.

A palavra “exatamente” exige duas metades: um upper bound por construção e um lower bound por um teorema de não interpretação ou não conservatividade.

---

## 14. Referências essenciais

1. Pavel Pudlák, “On the length of proofs of finitistic consistency statements in first order theories”, 1986. Fonte: https://users.math.cas.cz/~pudlak/fin-con.pdf
2. Anton Freund e Fedor Pakhomov, “Short Proofs for Slow Consistency”, *Notre Dame Journal of Formal Logic* 61(1), 2020, pp. 31–49, DOI 10.1215/00294527-2019-0031.
3. Pavel Pudlák, “Reflection principles, propositional proof systems, and theories”, 2020, arXiv:2007.14835.
4. Lev Beklemishev, “Positive provability logic for uniform reflection principles”, *Annals of Pure and Applied Logic* 165(1), 2014, pp. 82–105.
5. Emanuele Frittaion, “A Note on Fragments of Uniform Reflection in Second Order Arithmetic”, *Bulletin of Symbolic Logic* 28(3), 2022, pp. 451–465.

---

## Conclusão

O custo de colagem não deve ser um único número sem dimensão. A formulação mais estável é um custo vetorial que distingue força reflexiva, comprimento da prova e uniformização. Para consistência finita, `L_T(N)` tem um lower bound sintático imediato e, em teorias naturais, situa-se entre potências de `N` por resultados de Pudlák. A reflexão uniforme domina a consistência global, que por sua vez domina cada consistência finita; as implicações inversas falham em geral.

O fato estrutural mais importante é este: **provas locais podem permanecer polinomialmente curtas, enquanto a colagem global continua proibida dentro de `T`**. Assim, a barreira central não é necessariamente o tamanho dos certificados locais, mas a força necessária para demonstrar uniformemente sua correção e refletir suas conclusões.
