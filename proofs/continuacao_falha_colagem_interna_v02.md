# Falha de colagem interna: primeiro teorema rigoroso

## Continuação do “Princípio da Perspectiva Externa”, versão 0.2

## 0. Objetivo e status

Este documento dá um passo além da metáfora e prova um teorema preciso: uma teoria pode verificar cada candidato padrão a uma prova de contradição, separadamente, sem conseguir colar essas verificações numa única sentença universal. Isso formaliza a diferença entre “examinar todos os fragmentos um de cada vez” e “certificar internamente a totalidade”.

O teorema não é reivindicado como novo. Ele é uma consequência limpa da representabilidade do predicado de prova, da correção de teorias aritméticas fracas para cálculos concretos e do segundo teorema de incompletude. A contribuição em desenvolvimento é usar esse fenômeno como caso-base para uma teoria quantitativa da colagem de perspectivas.

---

## 1. Hipóteses formais

Fixe uma teoria `T` tal que:

1. `T` é uma teoria de primeira ordem na linguagem da aritmética;
2. `T` é consistente;
3. `T` é recursivamente enumerável;
4. `T` contém uma teoria aritmética elementar suficiente para verificar relações primitivas recursivas em argumentos numerais, por exemplo `Q` com uma codificação adequada, ou, de modo mais confortável, `EA`;
5. a formalização usual das condições de derivabilidade de Hilbert–Bernays–Löb vale para o predicado escolhido de provabilidade de `T`.

Escolha uma numeração de Gödel e uma relação primitiva recursiva

`Prf_T(p,x)`

com a interpretação:

> `p` é o código de uma derivação em `T` da fórmula cujo código é `x`.

Defina:

- `⊥` como a sentença `0 = 1`;
- `b := ⌜⊥⌝`;
- `Prov_T(x) := ∃p Prf_T(p,x)`;
- `Con(T) := ¬Prov_T(b)`, isto é, `∀p ¬Prf_T(p,b)`;
- `C_T(n) := ¬Prf_T(n,b)`.

Assim, `C_T(n)` diz que o número `n` não codifica uma prova de contradição em `T`.

### Observação sobre a complexidade

Para uma apresentação efetiva padrão de `T`, a relação `Prf_T` pode ser tornada primitiva recursiva mediante a inclusão, no certificado de prova, dos testemunhos necessários para verificar o uso dos axiomas enumerados. Logo, cada instância fechada `Prf_T(n,b)` é um cálculo finito decidível. A formalização exata depende da apresentação de `T`; por isso, a codificação deve permanecer fixa em toda a demonstração.

---

## 2. Teorema principal

### Teorema 1. Falha de colagem das verificações locais de consistência

Sob as hipóteses acima:

1. para todo número natural padrão `n`,

   `T ⊢ C_T(n)`;

2. mas

   `T ⊬ ∀x C_T(x)`.

Equivalentemente, existe uma família efetiva de sentenças decidíveis `C_T(0), C_T(1), ...` tal que todas as instâncias padrão são demonstráveis em `T`, enquanto sua universalização não é demonstrável em `T`.

### Prova

#### Parte 1: cada candidato padrão é rejeitado

Fixe externamente um número natural padrão `n`.

Como `T` é consistente, `n` não pode ser o código de uma prova em `T` de `⊥`. Portanto, no modelo padrão dos naturais,

`N ⊨ ¬Prf_T(n,b)`.

A afirmação `Prf_T(n,b)` é uma computação finita sobre os numerais concretos `n` e `b`. Como a teoria-base contida em `T` verifica corretamente cálculos primitivos recursivos fechados, ela demonstra o resultado negativo desse cálculo:

`T ⊢ ¬Prf_T(n̄,b̄)`.

Aqui `n̄` e `b̄` são os numerais correspondentes. Logo,

`T ⊢ C_T(n̄)`.

Como `n` foi arbitrário no metanível, concluímos:

`para todo n ∈ N padrão, T ⊢ C_T(n̄)`.

É essencial notar que essa conclusão é metalinguística. Ela não é, ainda, uma prova em `T` da sentença universal.

#### Parte 2: a colagem universal falha

Pela definição,

`∀x C_T(x)`

é literalmente, ou é demonstravelmente equivalente na teoria-base, a

`∀x ¬Prf_T(x,b)`,

que, pela lógica de primeira ordem, equivale a

`¬∃x Prf_T(x,b)`.

Esta é precisamente a sentença padrão `Con(T)`.

Se tivéssemos

`T ⊢ ∀x C_T(x)`,

então teríamos

`T ⊢ Con(T)`.

Mas, pelo segundo teorema de incompletude de Gödel, aplicado ao predicado padrão de provabilidade e sob as hipóteses declaradas, a consistência de `T` implica

`T ⊬ Con(T)`.

Portanto,

`T ⊬ ∀x C_T(x)`.

Isso conclui a prova. `□`

---

## 3. O conteúdo lógico exato

O resultado não diz que há algum número padrão `n` que a teoria seja incapaz de examinar. Ao contrário:

`∀n ∈ N  [T ⊢ C_T(n̄)]`.

O que falha é a troca entre os operadores

`∀n` no metanível

e

`T ⊢ ∀x` no nível interno.

Em símbolos, é inválida a passagem geral:

`[∀n ∈ N, T ⊢ φ(n̄)]  ⇒  [T ⊢ ∀x φ(x)]`.

No caso construído, o antecedente é verdadeiro e o consequente é falso.

Essa é uma forma de `ω`-incompletude. A família inteira é visível externamente como uma família de teoremas, mas `T` não possui a universalização correspondente como teorema.

---

## 4. Interpretação como ilha, bordas e distância

A tradução rigorosa da metáfora passa a ser:

- **ilha:** a teoria `T` e seus recursos inferenciais;
- **ponto local:** um número padrão `n`, candidato concreto a prova de contradição;
- **vista local:** a demonstração `T ⊢ C_T(n̄)`;
- **cobertura externa:** a afirmação metateórica `∀n ∈ N, T ⊢ C_T(n̄)`;
- **colagem interna:** uma única prova `T ⊢ ∀x C_T(x)`;
- **obstrução:** a segunda incompletude, pois a colagem seria `Con(T)`;
- **perspectiva externa:** uma metateoria `M` capaz de provar `Con(T)` e justificar a família globalmente.

A frase correta não é “o sistema não consegue ver nenhuma parte de si”. O teorema mostra algo mais sutil:

> O sistema consegue eliminar cada candidato padrão individual, mas não consegue transformar todas essas eliminações numa certificação universal interna de que nenhum candidato existe.

---

## 5. Teorema relativo a uma metateoria

### Teorema 2. Colagem relativa

Seja `M` uma teoria que formaliza a sintaxe de `T` e tal que

`M ⊢ Con(T)`.

Então

`M ⊢ ∀x C_T(x)`.

Contudo, se `M` também é consistente, recursivamente enumerável e suficientemente forte, então

`M ⊬ Con(M)`.

### Prova

A primeira conclusão decorre da definição de `Con(T)`. A segunda é uma nova aplicação do segundo teorema de incompletude, agora a `M`. `□`

### Consequência

A exterioridade é relativa, não absoluta. `M` pode colar as vistas sobre `T`, mas surge uma nova família

`C_M(n) := ¬Prf_M(n,⌜⊥⌝)`

cujas instâncias padrão são demonstráveis em `M`, sem que `M` demonstre sua universalização.

Isso fornece uma hierarquia:

`T_0 := T`,

`T_{k+1} := T_k + Con(T_k)`.

Sob hipóteses apropriadas de consistência, cada etapa fecha uma lacuna anterior e cria uma nova lacuna reflexiva no nível seguinte.

---

## 6. Um lema de diagonalização complementar

O teorema anterior usa consistência. Há também uma obstrução semântica baseada em verdade.

### Lema 3. Nenhuma colagem interna global de verdade

Suponha que `T` seja consistente e tenha força suficiente para o lema diagonal. Não existe fórmula `Tr(x)` tal que, para toda sentença aritmética `φ`,

`T ⊢ Tr(⌜φ⌝) ↔ φ`.

### Prova

Pelo lema diagonal, existe uma sentença `λ` para a qual

`T ⊢ λ ↔ ¬Tr(⌜λ⌝)`.

Aplicando a suposta bicondicional de verdade a `λ`, obtemos

`T ⊢ Tr(⌜λ⌝) ↔ λ`.

Combinando as duas equivalências, `T` prova `λ ↔ ¬λ`, logo é inconsistente. Contradição. `□`

### Relação com o Teorema 1

- o Teorema 1 obstrui a colagem de verificações de ausência de prova de contradição;
- o Lema 3 obstrui um predicado interno global de verdade;
- ambos dependem de transformar a autorreferência em uma sentença que escapa à pretensa totalização.

---

## 7. Nova definição: lacuna de uniformização

Para uma fórmula aritmética `φ(x)`, defina a propriedade:

`ULG(T,φ) :⇔ [∀n ∈ N, T ⊢ φ(n̄)] ∧ [T ⊬ ∀x φ(x)]`.

Leia-se: `φ` produz uma **lacuna local-global de uniformização** em `T`.

Pelo Teorema 1:

`ULG(T,C_T)`.

A propriedade em si é metateórica. Ela não é automaticamente um predicado aritmético interno a `T`.

### Por que essa definição ainda não é uma contribuição nova

Esse fenômeno está ligado à `ω`-incompletude e aos esquemas de reflexão. Apenas renomeá-lo não cria um novo resultado. Para haver contribuição, precisamos enriquecer `ULG` com uma medida ou uma classificação não trivial.

---

## 8. Próximo candidato: custo de colagem

Fixe uma classe `K` de extensões admissíveis de `T` e uma medida de custo `c_T(M)`. Para uma fórmula `φ(x)` com lacuna local-global, proponha:

`GlueCost_K(T,φ) := inf { c_T(M) : M ∈ K, M ⊇ T e M ⊢ ∀x φ(x) }`.

No caso `φ = C_T`, qualquer `M` admissível no conjunto prova `Con(T)`.

Possíveis medidas:

1. número de iterações de reflexão;
2. ordinal de reflexão;
3. aumento de força para sentenças `Π_1`;
4. comprimento mínimo de uma prova da universalização após adicionar axiomas permitidos;
5. complexidade descritiva do conjunto de axiomas adicionais.

### Primeira normalização recomendada

Começar com uma medida discreta, sem ordinais:

- `T^(0) := T`;
- `T^(k+1) := T^(k) + Con(T^(k))`;
- `d_T(ψ) := min {k : T^(k) ⊢ ψ}`, se tal `k` existir.

Então:

`d_T(Con(T)) = 1`,

pois `T^(1)` contém `Con(T)` como axioma, enquanto `T^(0)=T` não a prova.

Esse exemplo é correto, mas trivial. O primeiro problema não trivial deve usar uma família de alvos `ψ_m` e estudar o crescimento de `d_T(ψ_m)`, ou substituir consistência simples por níveis de reflexão `Π_n`.

---

## 9. Candidato a próximo teorema de pesquisa

### Problema A. Estratificação pela hierarquia aritmética

Para `Γ = Π_k` ou `Σ_k`, defina o esquema de reflexão uniforme:

`RFN_Γ(T) := {∀a(Prov_T(⌜φ(ȧ)⌝) → φ(a)) : φ ∈ Γ}`.

Investigar uma quantidade

`g_T(k) := custo mínimo para obter RFN_{Π_k}(T)`.

Objetivos:

1. provar monotonicidade `g_T(k) ≤ g_T(k+1)`;
2. identificar quando a desigualdade é estrita;
3. comparar `g_T(k)` com indução transfinita parcial;
4. verificar invariância sob apresentações razoáveis de `T`;
5. encontrar uma separação quantitativa que não seja apenas notacional.

A literatura já liga níveis de reflexão a indução transfinita e a espectros de conservatividade. Portanto, a novidade precisará estar na medida escolhida, em uma classe nova de certificados ou em limites de recursos.

### Problema B. Colagem limitada por tamanho de prova

Defina

`Con_T(N) := ∀p ≤ N ¬Prf_T(p,b)`.

Cada `Con_T(N)` é uma verificação finita e, sob hipóteses adequadas, `T` a prova. Pergunte pelo comprimento mínimo

`L_T(N) := menor comprimento de uma prova em T de Con_T(N)`.

Possível alvo original:

> provar limites inferiores ou separações entre o custo agregado de certificar candidatos individuais e o custo de uma prova comprimida de `Con_T(N)`.

Isso aproxima a teoria da complexidade de provas. Entretanto, qualquer lower bound robusto pode ser difícil e deverá especificar o sistema de provas, a codificação e a medida de comprimento.

---

## 10. Pontos que impedem conclusões excessivas

1. Não existe aqui um “lado de fora absoluto”. Uma metateoria forte também sofre sua própria incompletude.
2. O resultado exige hipóteses sobre efetividade, força aritmética e consistência.
3. O fato de todas as instâncias padrão serem prováveis não fornece, por si só, um algoritmo cuja correção uniforme `T` possa provar.
4. Modelos não padrão de `T + ¬Con(T)` podem conter um elemento não padrão que o modelo interpreta como uma prova de contradição. Isso não é um código padrão de prova real.
5. A escolha do predicado de provabilidade importa. Predicados artificiais podem invalidar slogans ingênuos; adotamos o predicado padrão com condições de derivabilidade explícitas.
6. O Teorema 1 não prova que qualquer forma de autoexplicação é impossível. Ele identifica uma forma precisa que falha.

---

## 11. Entregável matemático obtido

Foi provada a seguinte afirmação verificável:

> Para toda teoria consistente, efetivamente axiomatizada e aritmeticamente suficiente `T`, existe uma família computável `C_T(n)` de verificações locais sobre a própria sintaxe de `T` tal que `T` demonstra cada instância padrão `C_T(n̄)`, mas não demonstra a sentença universal `∀x C_T(x)`.

A prova reduz a colagem universal à sentença `Con(T)` e aplica o segundo teorema de incompletude.

Esse resultado é o primeiro núcleo formal sólido da ideia. Ele substitui “o sistema só vê fragmentos” por uma afirmação rigorosa sobre instâncias, quantificação interna e uniformização.

---

## 12. Roteiro imediato para a versão 0.3

1. Fixar definitivamente a teoria-base, preferencialmente `EA`.
2. Definir uma apresentação concreta de `PA` e de `Prf_PA(p,x)`.
3. formalizar o Teorema 1 na teoria-base, distinguindo metateorema e sentença interna;
4. escolher entre dois caminhos:
   - reflexão estratificada `Π_n`, mais próximo da teoria da demonstração;
   - consistência finita `Con_T(N)`, mais próximo da complexidade de provas;
5. provar pelo menos um lema quantitativo não trivial;
6. comparar com `ω`-incompletude, reflexão uniforme, progressões de Turing–Feferman, análise ordinal e selector proofs;
7. mecanizar o teorema-base em Isabelle/HOL, Lean ou Coq.

---

## 13. Referências para a revisão

- Pakhomov, F.; Rathjen, M.; Rossegger, D. “Feferman’s Completeness Theorem”, *Bulletin of Symbolic Logic* 31(3), 2025. O trabalho trata iterações transfinitas de reflexão, salienta a dependência da apresentação computável e fornece limites para níveis da hierarquia aritmética.
- Frittaion, E. “A Note on Fragments of Uniform Reflection in Second Order Arithmetic”, *Bulletin of Symbolic Logic* 28(3), 2022. Relaciona fragmentos de reflexão uniforme e indução transfinita.
- Beklemishev, L. D. “Proof-theoretic analysis by iterated reflection”, *Archive for Mathematical Logic* 42, 2003. Desenvolve análise proof-theoretic por reflexão iterada.
- Feferman, S. “Transfinite recursive progressions of axiomatic theories”, *Journal of Symbolic Logic* 27, 1962.
- Freund, A. “A Note on Iterated Consistency and Infinite Proofs”, versão final associada a *Archive for Mathematical Logic*. Discute ordinais `Π^0_1` e reflexão iterada.

---

## Conclusão

O passo rigoroso foi alcançado: há uma família explícita de vistas locais, todas certificáveis internamente uma a uma, cuja colagem universal é impossível dentro da teoria consistente. A explicação correta da impossibilidade não é espacial, mas lógica: o quantificador universal interno transforma a coleção de verificações locais na afirmação reflexiva global `Con(T)`, exatamente onde incide a segunda incompletude.

O próximo avanço genuíno não será repetir essa impossibilidade, mas medir o custo da colagem parcial e provar uma separação quantitativa entre visão local e certificação global.
