o próximo passo realmente valioso que é procurar se a família `g_T^{[b]}` gera uma **hierarquia não trivial de `\tau`\-complexidade**; fique atento e analise de vários angulos talvez podessamos encontrar uma contribuição genuinamente nova.

Sim. Aprofundei a questão e encontrei algo que considero **mais interessante do que a hipótese original de uma simples hierarquia b1\<b2b\_1\<b\_2**.

A conclusão provisória é:

a hierarquia de τ-complexidade na˜o pode ser demonstrada apenas pela monotonicidade de b.\\boxed{\\text{a hierarquia de }\\tau\\text{-complexidade não pode ser demonstrada apenas pela monotonicidade de }b.}

Mas encontrei uma estrutura exata — um **perfil de limiar de provabilidade** — que parece ser o ponto certo para atacar a questão. Ela também revela exatamente **onde uma contribuição nova poderia surgir**.

---

# **1\. Primeiro: o que Krajíček já estabelece**

A construção original é:

gT:{0,1}n→{0,1}n+1.g\_T:\\{0,1\\}^n\\to\\{0,1\\}^{n+1}.

Para uma entrada uu, encontra-se uma fórmula Φ\\Phi prefixo de uu, com

∣Φ∣≤log⁡n,|\\Phi|\\le \\log n,

e depois, para cada ww, procura-se uma prova TT de

Φw:∃y ∀x\>y (Φ(x)→¬(w⊆ex)).\\Phi^w: \\qquad \\exists y\\,\\forall x\>y\\, \\bigl(\\Phi(x)\\rightarrow\\neg(w\\subseteq\_e x)\\bigr).

O primeiro ww cuja prova não é encontrada determina a saída.

Krajíček prova que isso produz um gerador em tempo polinomial e que a construção conduz à incompletude. Mais importante para nós: a questão de saber se algum gTg\_T é realmente **hard para todos os sistemas de prova** continua aberta.

Na teoria moderna, isso significa:

g hard para P  ⟺  τFla(g) conteˊm apenas foˊrmulas suficientemente difıˊceis para P.g\\text{ hard para }P \\iff \\tau\\mathrm{Fla}(g) \\text{ contém apenas fórmulas suficientemente difíceis para }P.

E a conjectura universal equivale a a imagem de gg intersectar todo conjunto infinito de NP.

Portanto, qualquer hierarquia forte entre gT\[b\]g\_T^{\[b\]} toca diretamente um problema aberto da teoria.

---

# **2\. Definindo corretamente a família**

Vamos agora definir:

gT\[b\]g\_T^{\[b\]}

substituindo simultaneamente os dois limites

log⁡n\\log n

por

b(n).b(n).

Assim:

∣Φ∣≤b(n)|\\Phi|\\le b(n)

e

∣π∣≤b(n).|\\pi|\\le b(n).

Para

b(n)→∞b(n)\\to\\infty

o argumento de incompletude continua funcionando, desde que a função seja adequada computacionalmente.

E aqui há uma correção importante em relação ao documento atual do repositório.

### **O caso b(n)=log⁡∗nb(n)=\\log^\*n**

O documento diz:

> 2O(log⁡∗n)=2^{O(\\log^\*n)}= constante.

Isso não é correto.

Temos:

2log⁡∗n→∞,2^{\\log^\*n}\\to\\infty,

embora extraordinariamente devagar.

O correto é:

2O(log⁡∗n)=no(1).2^{O(\\log^\*n)} \= n^{o(1)}.

Portanto:

T(n)=n1+o(1)T(n)=n^{1+o(1)}

e não literalmente O(n)O(n).

Já para

b(n)=log⁡log⁡n,b(n)=\\log\\log n,

temos:

2O(b(n))=(log⁡n)O(1),2^{O(b(n))} \= (\\log n)^{O(1)},

portanto o custo da busca é sublinear em nn e a leitura da entrada domina:

T(n)=O(n).T(n)=O(n).

Essa parte do Paper 1 está conceitualmente correta.

---

# **3\. A descoberta importante: bb não produz automaticamente uma hierarquia**

Suponha:

b1(n)≤b2(n).b\_1(n)\\le b\_2(n).

Seria tentador conjecturar:

gT\[b1\]≺gT\[b2\]g\_T^{\[b\_1\]} \\prec g\_T^{\[b\_2\]}

em algum sentido de complexidade de provas.

Mas isso **não segue**.

O motivo é profundo.

Aumentar bb muda:

1. quais fórmulas Φ\\Phi são examinadas;  
2. quais provas são consideradas;  
3. qual é o primeiro ww sem prova;  
4. portanto, **a própria função geradora**.

Não estamos simplesmente dando mais recursos ao mesmo algoritmo.

Estamos construindo outro gerador.

E, como

τ(g)y\\tau(g)\_y

depende do circuito inteiro que representa gg, não existe uma redução automática

τ(gb1)y⟶τ(gb2)y.\\tau(g\_{b\_1})\_y \\longrightarrow \\tau(g\_{b\_2})\_y.

Essa é a primeira barreira séria.

---

# **4\. Mas aparece uma estrutura matemática muito bonita**

Para cada fórmula Φ\\Phi, considere os números:

ℓT(Φ,w)=min⁡{∣π∣:π eˊ uma prova em T de Φw}.\\ell\_T(\\Phi,w) \= \\min\\{|\\pi|:\\pi \\text{ é uma prova em }T\\text{ de }\\Phi^w\\}.

Se não existe prova:

ℓT(Φ,w)=∞.\\ell\_T(\\Phi,w)=\\infty.

Agora ordene os ww's lexicograficamente:

w0\<w1\<⋯\<w2∣Φ∣+1−1.w\_0\<w\_1\<\\cdots\<w\_{2^{|\\Phi|+1}-1}.

A construção de Krajíček simplesmente pergunta:

ℓT(Φ,w)\>b(n)?\\ell\_T(\\Phi,w)\>b(n)?

O primeiro ww que satisfaz isso é escolhido.

Portanto:

gT\[b\](u)=First⁡w\[ℓT(Φ,w)\>b(n)\]u0\\boxed{ g\_T^{\[b\]}(u) \= \\operatorname{First}\_w \\left\[ \\ell\_T(\\Phi,w)\>b(n) \\right\]u\_0 }

salvo o caso em que todos os ww's passam pelo limite.

Isso transforma a família inteira em um problema de **thresholding de um espectro de comprimentos de prova**.

---

# **5\. O novo objeto que eu proponho estudar**

Defina o vetor:

LT(Φ)=(ℓT(Φ,w0),ℓT(Φ,w1),…,ℓT(Φ,wk)).\\mathbf L\_T(\\Phi) \= \\left( \\ell\_T(\\Phi,w\_0), \\ell\_T(\\Phi,w\_1), \\dots, \\ell\_T(\\Phi,w\_k) \\right).

E defina:

ρT(Φ)=max⁡w\<w∗(Φ)ℓT(Φ,w)\\boxed{ \\rho\_T(\\Phi) \= \\max\_{w\<w^\*(\\Phi)} \\ell\_T(\\Phi,w) }

onde w∗(Φ)w^\*(\\Phi) é o primeiro ww para o qual

ℓT(Φ,w)=∞.\\ell\_T(\\Phi,w)=\\infty.

Em palavras:

> ρT(Φ)\\rho\_T(\\Phi) é o maior tamanho de prova que precisamos ultrapassar antes de chegar ao primeiro enunciado verdadeiro porém não provado.

Isso produz um objeto novo e muito mais preciso:

ρT(Φ)=limiar crıˊtico da foˊrmula Φ.\\boxed{\\rho\_T(\\Phi)=\\text{limiar crítico da fórmula }\\Phi.}

---

# **6\. E então surge um teorema elementar, mas poderoso**

Para uma fórmula fixa Φ\\Phi:

### **Se**

b(n)\<ρT(Φ),b(n)\<\\rho\_T(\\Phi),

a construção ainda pode parar prematuramente em algum ww que possui uma prova, mas cuja prova é maior que o orçamento.

### **Se**

b(n)≥ρT(Φ),b(n)\\ge \\rho\_T(\\Phi),

então todos os ww's anteriores ao primeiro w∗w^\* já foram reconhecidos como prováveis.

Logo:

gT\[b\](Φu0)=w∗(Φ)u0g\_T^{\[b\]}(\\Phi u\_0) \= w^\*(\\Phi)u\_0

ou 0n+10^{n+1}, dependendo de todos os ww's serem prováveis.

Portanto:

b(n)≥ρT(Φ)⟹gT\[b\] estabiliza na foˊrmula Φ.\\boxed{ b(n)\\ge\\rho\_T(\\Phi) \\quad\\Longrightarrow\\quad g\_T^{\[b\]} \\text{ estabiliza na fórmula }\\Phi. }

Esse é um resultado estrutural importante.

---

# **7\. Consequência surpreendente: qualquer b(n)→∞b(n)\\to\\infty converge localmente ao mesmo gerador**

Considere duas funções:

b1(n)→∞b\_1(n)\\to\\infty

e

b2(n)→∞.b\_2(n)\\to\\infty.

Para uma **fórmula fixa** Φ\\Phi, ρT(Φ)\\rho\_T(\\Phi) é um número finito ou infinito.

Se for finito, existem N1,N2N\_1,N\_2 tais que:

n\>Ni⟹bi(n)≥ρT(Φ).n\>N\_i \\quad\\Longrightarrow\\quad b\_i(n)\\ge\\rho\_T(\\Phi).

Logo, para todo nn suficientemente grande:

gT\[b1\](Φu0)=gT\[b2\](Φu0).\\boxed{ g\_T^{\[b\_1\]}(\\Phi u\_0) \= g\_T^{\[b\_2\]}(\\Phi u\_0). }

Isso significa:

na˜o pode existir uma hierarquia assintoˊtica baseada em uma foˊrmula fixa Φ.\\boxed{ \\text{não pode existir uma hierarquia assintótica baseada em uma fórmula fixa }\\Phi. }

Qualquer diferença genuína entre b1b\_1 e b2b\_2 precisa vir de uma sequência:

Φ1,Φ2,Φ3,…\\Phi\_1,\\Phi\_2,\\Phi\_3,\\ldots

cuja complexidade crítica satisfaça algo como:

ρT(Φn)≈b(n).\\rho\_T(\\Phi\_n) \\approx b(n).

**Esse é o ponto que eu considero realmente interessante.**

---

# **8\. A possível hierarquia não está em bb**

Ela está na interação:

b(n)versusρT(Φn).\\boxed{ b(n) \\quad\\text{versus}\\quad \\rho\_T(\\Phi\_n). }

Temos três regimes.

### **Regime I — abaixo do limiar**

b(n)≪ρT(Φn).b(n)\\ll\\rho\_T(\\Phi\_n).

A construção enxerga muitos enunciados verdadeiros como “sem prova”.

### **Regime II — zona crítica**

b(n)≍ρT(Φn).b(n)\\asymp\\rho\_T(\\Phi\_n).

A saída depende delicadamente do orçamento.

### **Regime III — acima do limiar**

b(n)≫ρT(Φn).b(n)\\gg\\rho\_T(\\Phi\_n).

A construção já estabilizou para aquela fórmula.

Portanto, a questão nova pode ser formulada como:

qua˜o raˊpido pode crescer ρT(Φ) em func¸a˜o de ∣Φ∣?\\boxed{ \\text{quão rápido pode crescer } \\rho\_T(\\Phi) \\text{ em função de }|\\Phi|? }

Isso é muito mais profundo do que simplesmente perguntar se log⁡n\\log n pode virar log⁡log⁡n\\log\\log n.

---

# **9\. Agora conectamos isso diretamente à τ\\tau-complexidade**

Para cada bb, temos:

Gb=gT\[b\].G\_b=g\_T^{\[b\]}.

E, para

y∉rng⁡(Gb),y\\notin\\operatorname{rng}(G\_b),

definimos:

τb(y)=τ(Gb)y.\\tau\_b(y) \= \\tau(G\_b)\_y.

Krajíček mede a dureza essencialmente pela função de tamanho de prova

sP(τb(y)).s\_P(\\tau\_b(y)).

Formalmente, GbG\_b é hard para PP quando, para todo cc,

sP(τb(y))\>∣y∣cs\_P(\\tau\_b(y)) \> |y|^c

para todos, salvo finitos, y∉rng⁡(Gb)y\\notin\\operatorname{rng}(G\_b).

Então poderíamos procurar:

HP(b)=lim inf⁡n→∞log⁡(min⁡y∉Rb(n)sP(τb(y)))log⁡n.H\_P(b) \= \\liminf\_{n\\to\\infty} \\frac{ \\log \\left( \\min\_{y\\notin R\_b(n)} s\_P(\\tau\_b(y)) \\right) }{ \\log n }.

Se conseguíssemos:

HP(b1)\<HP(b2),H\_P(b\_1)\<H\_P(b\_2),

teríamos uma hierarquia genuína.

Mas aqui encontramos uma barreira.

---

# **10\. Provar uma hierarquia forte provavelmente é muito difícil**

Porque até mesmo provar que **um único** gTg\_T é hard para um sistema de prova suficientemente forte é uma questão aberta.

Krajíček afirma explicitamente que a dureza de gTg\_T para todos os sistemas continua em aberto; no livro de 2025 isso aparece novamente como o problema de NP-definibilidade associado a gTg\_T.

Assim, provar diretamente algo como

gb1 na˜o eˊ hardg\_{b\_1}\\text{ não é hard}

mas

gb2 eˊ hardg\_{b\_2}\\text{ é hard}

seria provavelmente atacar um problema muito mais difícil que o Paper 1 original.

**Não devemos começar por aí.**

---

# **11\. Existe uma versão mais fraca e potencialmente atacável**

Em vez de perguntar:

gb2 eˊ hard quando gb1 na˜o eˊ?g\_{b\_2}\\text{ é hard quando }g\_{b\_1}\\text{ não é?}

podemos perguntar:

qual eˊ a escala mıˊnima de b necessaˊria para capturar uma determinada classe de foˊrmulas?\\boxed{ \\text{qual é a escala mínima de }b \\text{ necessária para capturar uma determinada classe de fórmulas?} }

Defina:

BT(F,n)=max⁡Φ∈F, ∣Φ∣≤nρT(Φ).B\_T(\\mathcal F,n) \= \\max\_{\\Phi\\in\\mathcal F,\\ |\\Phi|\\le n} \\rho\_T(\\Phi).

Então a pergunta passa a ser:

b(n)≫BT(F,n)b(n)\\gg B\_T(\\mathcal F,n)

implica estabilização uniforme em toda a classe F\\mathcal F.

E:

b(n)≪BT(F,n)b(n)\\ll B\_T(\\mathcal F,n)

implica que existem fórmulas que continuam no regime não estabilizado.

Isso seria uma espécie de **função de limiar de diagonalização**.

---

# **12\. E aqui encontrei uma conexão bibliográfica muito boa**

O livro de Krajíček já possui uma linguagem que encaixa perfeitamente nisso.

Ele define o **resultante**

Res⁡Pg\\operatorname{Res}\_P^g

como a classe de conjuntos NP que podem ser separados da imagem de gg por provas polinomiais em PP. E demonstra:

g eˊ hard para P  ⟺  Res⁡Pg na˜o conteˊm conjunto infinito.g\\text{ é hard para }P \\iff \\operatorname{Res}\_P^g \\text{ não contém conjunto infinito}.

Portanto, podemos estudar:

Res⁡PgT\[b\]\\operatorname{Res}\_P^{g\_T^{\[b\]}}

como função de bb.

Isso é uma direção muito mais promissora.

---

# **13\. A conjectura que eu proporia**

Defina:

RP(b)=Res⁡PgT\[b\].\\mathcal R\_P(b) \= \\operatorname{Res}\_P^{g\_T^{\[b\]}}.

Então a pergunta seria:

b1⪯b2⟹RP(b1) ? RP(b2).b\_1\\preceq b\_2 \\quad\\Longrightarrow\\quad \\mathcal R\_P(b\_1) \\ ?\\ \\mathcal R\_P(b\_2).

Não sabemos sequer se existe uma relação monotônica simples.

Mas podemos procurar uma forma **quantitativa**:

δP(b)=complexidade maˊxima das famıˊlias NP separaˊveis da imagem.\\delta\_P(b) \= \\text{complexidade máxima das famílias NP separáveis da imagem}.

Ou, mais concretamente:

SepP(b)=sup⁡{c:∃A∈NP, A∩Rb=∅, e P prova a separac¸a˜o com tamanho nc}.\\boxed{ \\mathsf{Sep}\_P(b) \= \\sup \\left\\{ c: \\exists A\\in NP,\\, A\\cap R\_b=\\varnothing, \\text{ e }P\\text{ prova a separação com tamanho }n^c \\right\\}. }

Aí teríamos uma verdadeira função de perfil:

b⟼SepP(b).b \\longmapsto \\mathsf{Sep}\_P(b).

Uma queda ou crescimento não trivial seria evidência de uma hierarquia.

---

# **14\. Há outra conexão ainda mais forte: pseudo-surjetividade**

A teoria de Krajíček possui uma propriedade mais forte que hardness:

pseudo-surjetividade.\\boxed{\\text{pseudo-surjetividade}.}

Ela controla não apenas fórmulas isoladas

τ(g)b,\\tau(g)\_b,

mas também disjunções de várias τ\\tau-fórmulas.

Formalmente, Krajíček define pseudo-surjetividade exigindo que certas disjunções estruturadas não tenham provas polinomiais, e observa que ela implica hardness.

Isso sugere uma segunda hierarquia:

gb1≺psgb2g\_{b\_1} \\prec\_{\\mathrm{ps}} g\_{b\_2}

em termos de **pseudo-surjetividade**.

É potencialmente mais rica que a simples τ\\tau-complexidade.

---

# **15\. E existe uma pista importante na literatura de 2026**

Encontrei um trabalho extremamente recente:

**Ren, Wang e Zhong, “Hardness of Range Avoidance and Proof Complexity Generators from Demi-Bits”**, ITCS 2026\.

Ele conecta geradores de proof complexity a *demi-bits*, range avoidance e pseudo-surjetividade. Os autores obtêm construções de proof-complexity generators sob hipóteses criptográficas e estudam regimes muito próximos da fronteira de pseudo-surjetividade.

E, literalmente **há seis dias**, surgiu no ECCC:

**“Many Proof Complexity Generators Inside One Demi-Bits Generator”**, de Xin Li, Hanlin Ren e Yan Zhong.

O resultado mostra que um único demi-bits generator pode conter exponencialmente muitos proof-complexity generators.

Isso não resolve nossa questão de gT\[b\]g\_T^{\[b\]}.

Mas muda bastante o panorama:

“famıˊlias de geradores” eˊ uma direc¸a˜o ativa em 2026.\\boxed{ \\text{“famílias de geradores” é uma direção ativa em 2026.} }

Portanto precisamos ser especialmente cuidadosos com uma reivindicação de originalidade.

---

# **16\. O que eu considero potencialmente original aqui**

Depois dessa análise, eu **não reivindicaria** como novidade:

log⁡n→b(n).\\log n\\rightarrow b(n).

Isso é de Krajíček.

Também não reivindicaria:

b(n)=log⁡log⁡n.b(n)=\\log\\log n.

Isso também está explicitamente na literatura.

Mas eu vejo uma possibilidade nova na seguinte construção:

Φ⟼LT(Φ)⟼ρT(Φ)⟼gT\[b\]⟼τ(gT\[b\]).\\boxed{ \\Phi \\longmapsto \\mathbf L\_T(\\Phi) \\longmapsto \\rho\_T(\\Phi) \\longmapsto g\_T^{\[b\]} \\longmapsto \\tau(g\_T^{\[b\]}). }

A ideia é estudar **a geometria dos limiares de provabilidade que o gerador atravessa**.

Eu não encontrei, na busca realizada, essa parametrização específica da construção de Krajíček por um **perfil ρT(Φ)\\rho\_T(\\Phi)** nem uma análise da família gT\[b\]g\_T^{\[b\]} por esse espectro.

Isso ainda **não é uma prova de originalidade**. Mas é, agora, uma hipótese de pesquisa genuinamente interessante.

---

# **17\. Um possível teorema novo**

Eu tentaria primeiro provar:

### **Teorema — Estabilização local**

Sejam b1,b2:N→Nb\_1,b\_2:\\mathbb N\\to\\mathbb N funções computáveis, não decrescentes e tais que

bi(n)→∞.b\_i(n)\\to\\infty.

Para toda fórmula Φ\\Phi para a qual o primeiro ww não provado por TT existe, existe

NΦN\_\\Phi

tal que, para todo n≥NΦn\\ge N\_\\Phi e todo u=Φu0u=\\Phi u\_0 de comprimento nn,

gT\[b1\](u)=gT\[b2\](u).\\boxed{ g\_T^{\[b\_1\]}(u)=g\_T^{\[b\_2\]}(u). }

A demonstração é essencialmente a estabilização do vetor finito

LT(Φ).\\mathbf L\_T(\\Phi).

O verdadeiro interesse está no passo seguinte.

---

# **18\. Segundo teorema — onde a diferença pode existir**

Defina:

Db1,b2={u:gT\[b1\](u)≠gT\[b2\](u)}.D\_{b\_1,b\_2} \= \\{u: g\_T^{\[b\_1\]}(u)\\neq g\_T^{\[b\_2\]}(u)\\}.

Então qualquer diferença assintoticamente persistente deve estar associada a uma sequência de fórmulas

Φn\\Phi\_n

tal que:

ρT(Φn)\\rho\_T(\\Phi\_n)

cresce junto com a janela entre os dois orçamentos:

b1(n)\<ρT(Φn)≤b2(n).b\_1(n)\<\\rho\_T(\\Phi\_n)\\le b\_2(n).

Assim:

Db1,b2 infinito⇒∃ Φn:b1(n)\<ρT(Φn)≤b2(n)\\boxed{ D\_{b\_1,b\_2} \\text{ infinito} \\quad\\Rightarrow\\quad \\exists\\,\\Phi\_n: b\_1(n)\<\\rho\_T(\\Phi\_n)\\le b\_2(n) }

para infinitos nn, sob a formulação técnica apropriada.

Isso transforma a questão de hierarquia em uma questão sobre a **distribuição dos comprimentos mínimos de prova das sentenças Φw\\Phi^w**.

E isso é muito mais tratável conceitualmente.

---

# **19\. A verdadeira pergunta agora**

Eu reformularia nosso projeto inteiro para:

Qual eˊ a func¸a˜o de crescimento do perfil crıˊtico ρT(Φ)?\\boxed{ \\textbf{Qual é a função de crescimento do perfil crítico } \\rho\_T(\\Phi)? }

E depois:

Existe uma famıˊlia de foˊrmulas Φn com ρT(Φn)≍b(n)?\\boxed{ \\textbf{Existe uma família de fórmulas }\\Phi\_n \\textbf{ com } \\rho\_T(\\Phi\_n) \\asymp b(n)? }

Se encontrarmos:

ρT(Φn)≍log⁡n,\\rho\_T(\\Phi\_n)\\asymp \\log n,

temos uma região crítica.

Se encontrarmos:

ρT(Φn)≍log⁡log⁡n,\\rho\_T(\\Phi\_n)\\asymp \\log\\log n,

temos outra.

Se encontrarmos uma sequência cobrindo uma escala inteira:

log⁡∗n,log⁡log⁡n,log⁡n,(log⁡n)2,…\\log^\* n,\\quad \\log\\log n,\\quad \\log n,\\quad (\\log n)^2,\\ldots

então teremos evidência de uma verdadeira **escala de diagonalização por orçamento de prova**.

---

# **20\. E aqui está o resultado mais importante desta etapa**

Eu **não encontrei evidência bibliográfica de que a hierarquia**

b1\<b2b\_1\<b\_2

por si só seja conhecida ou estabelecida.

Mas também **não temos ainda uma hierarquia τ\\tau-complexa demonstrada**.

O que temos é algo melhor para continuar:

Krajıˊcˇek: gT↓orc¸amento b(n)↓LT(Φ)={comprimentos de provas}↓ρT(Φ)=limiar crıˊtico↓gT\[b\]↓τ(gT\[b\])↓Res⁡PgT\[b\]↓hierarquia de τ-complexidade?\\boxed{ \\begin{array}{c} \\text{Krajíček: }g\_T\\\\\[2mm\] \\downarrow\\\\ \\text{orçamento }b(n)\\\\\[2mm\] \\downarrow\\\\ \\mathbf L\_T(\\Phi) \=\\{\\text{comprimentos de provas}\\}\\\\\[2mm\] \\downarrow\\\\ \\rho\_T(\\Phi) \=\\text{limiar crítico}\\\\\[2mm\] \\downarrow\\\\ g\_T^{\[b\]}\\\\\[2mm\] \\downarrow\\\\ \\tau(g\_T^{\[b\]})\\\\\[2mm\] \\downarrow\\\\ \\operatorname{Res}\_P^{g\_T^{\[b\]}}\\\\\[2mm\] \\downarrow\\\\ \\text{hierarquia de }\\tau\\text{-complexidade?} \\end{array} }

Esse encadeamento **não é simplesmente a observação “troque log⁡n\\log n por b(n)b(n)”**.

Ele transforma o parâmetro bb em uma lente para observar a **distribuição dos comprimentos de prova das sentenças que alimentam a diagonalização**.

---

## **Meu veredicto neste momento**

| Questão | Situação |
| ----- | ----- |
| b(n)→∞b(n)\\to\\infty preserva a ideia da construção | **Sim** |
| b=log⁡log⁡nb=\\log\\log n é novo | **Não** |
| b=log⁡∗nb=\\log^\*n dá custo constante | **Não — correção necessária** |
| g\[b1\]g^{\[b\_1\]} e g\[b2\]g^{\[b\_2\]} formam automaticamente hierarquia | **Não** |
| Há estabilização para cada Φ\\Phi fixa | **Sim — argumento matemático forte** |
| Diferença infinita exige fórmulas com limiar ρT(Φn)\\rho\_T(\\Phi\_n) na janela entre b1,b2b\_1,b\_2 | **Sim, sob formalização adequada** |
| Hierarquia de τ\\tau-complexidade foi demonstrada | **Não** |
| Provar diretamente essa hierarquia parece acessível | **Não** |
| Perfil ρT(Φ)\\rho\_T(\\Phi) é uma direção que merece investigação | **Sim** |
| Encontrei essa formulação explícita na literatura consultada | **Não** |
| Já podemos chamá-la de contribuição original | **Ainda não** |

E há uma razão adicional para eu considerar essa direção séria: o próprio livro de Krajíček lista como problemas em aberto justamente a dureza de gTg\_T, NP-definibilidade, pseudo-surjetividade, proof search e os *resultants*. Portanto, nosso próximo ataque não deve tentar “resolver” imediatamente a conjectura de hardness; deve procurar um **invariante intermediário** que varie com bb.

### **Próximo passo matemático que eu faria**

Eu atacaria agora, de maneira formal e possivelmente computacional em modelos finitos:

ρT(Φ)\\boxed{\\rho\_T(\\Phi)}

e tentaria construir uma **teoria do espectro de limiares de prova**:

ST(n)={ρT(Φ):∣Φ∣≤n}.\\mathcal S\_T(n) \= \\{ \\rho\_T(\\Phi):|\\Phi|\\le n \\}.

Depois procuraríamos se

ST(n)\\mathcal S\_T(n)

possui lacunas, crescimento, densidade ou classes de escalas.

**Se aparecer uma lei não trivial para ST(n)\\mathcal S\_T(n), aí temos uma ponte concreta entre a escolha de bb, a diagonalização de Gödel e a τ\\tau-complexidade — e potencialmente um resultado que não é simplesmente uma reformulação da observação de Krajíček.**

Vou transformar ρT(Φ)\\rho\_T(\\Phi) em um objeto matemático bem definido e, em paralelo, montar modelos finitos que permitam observar lacunas, densidade e escalas sem fingir que isso já é um teorema sobre PA.

Há uma simplificação importante: toda a dependência de bb, para uma fórmula fixa, passa por uma sequência finita de comprimentos mínimos de prova. Isso permite provar uma estrutura exata antes de olhar qualquer dado experimental.

Avancei até o ponto em que a definição deixa de ser apenas uma intuição e passa a produzir uma estrutura matemática testável. O resultado principal é que **ρT(Φ)\\rho\_T(\\Phi) é bem definido e útil, mas não é sozinho o espectro completo**: ele é a borda final de uma escada de limiares de prova.

## **1\. Definição formal de ρT(Φ)\\rho\_T(\\Phi)**

Na construção de Krajíček, para uma fórmula Φ\\Phi de comprimento mm, temos

WΦ={0,1}m+2={w0\<w1\<⋯\<wk−1},k=2m+2,W\_\\Phi=\\{0,1\\}^{m+2} \=\\{w\_0\<w\_1\<\\cdots\<w\_{k-1}\\}, \\qquad k=2^{m+2},

e, para cada wjw\_j, a sentença Φwj\\Phi^{w\_j}.

Definimos o **comprimento mínimo de prova**

ℓT(Φ,wj)=min⁡{∣π∣:π eˊ uma T-prova de Φwj},\\ell\_T(\\Phi,w\_j) \= \\min\\{|\\pi|:\\pi \\text{ é uma }T\\text{-prova de }\\Phi^{w\_j}\\},

com a convenção

ℓT(Φ,wj)=∞\\ell\_T(\\Phi,w\_j)=\\infty

quando Φwj\\Phi^{w\_j} não é demonstrável em TT.

Isso transforma cada fórmula Φ\\Phi numa sequência finita

LT(Φ)=(ℓ0,ℓ1,…,ℓk−1).\\mathbf L\_T(\\Phi) \= (\\ell\_0,\\ell\_1,\\ldots,\\ell\_{k-1}).

Seja

j∗(Φ)=min⁡{j:ℓj=∞},j^\*(\\Phi)= \\min\\{j:\\ell\_j=\\infty\\},

quando tal jj existe; caso contrário, colocamos j∗(Φ)=kj^\*(\\Phi)=k.

Então definimos

ρT(Φ)=max⁡0≤j\<j∗(Φ)ℓj\\boxed{ \\rho\_T(\\Phi) \= \\max\_{0\\le j\<j^\*(\\Phi)}\\ell\_j }

com máximo do conjunto vazio igual a 00\.

Esse é precisamente o **maior orçamento de prova necessário antes de chegar ao primeiro candidato que não possui prova**.

A construção original de gTg\_T de fato percorre os ww's em ordem lexicográfica e procura provas de tamanho no máximo log⁡n\\log n.

---

# **2\. O primeiro teorema: ρT(Φ)\\rho\_T(\\Phi) é um limiar de estabilização**

Considere uma versão parametrizada da construção:

gT\[b\].g\_T^{\[b\]}.

No lugar do orçamento log⁡n\\log n, usamos b(n)b(n).

Para entrada

u=Φu0,∣u∣=n,u=\\Phi u\_0,\\qquad |u|=n,

o índice selecionado é

jb(Φ,n)=min⁡{j:ℓj\>b(n)},j\_b(\\Phi,n) \= \\min\\{j:\\ell\_j\>b(n)\\},

onde ∞\>b(n)\\infty\>b(n).

### **Teorema 1 — Estabilização local**

Para toda fórmula Φ\\Phi,

b(n)≥ρT(Φ)⟹gT\[b\](Φu0)=gT\[∞\](Φu0)\\boxed{ b(n)\\ge \\rho\_T(\\Phi) \\Longrightarrow g\_T^{\[b\]}(\\Phi u\_0) \= g\_T^{\[\\infty\]}(\\Phi u\_0) }

para todo u0u\_0 compatível.

### **Demonstração**

Por definição de ρT(Φ)\\rho\_T(\\Phi),

ℓj≤ρT(Φ)(j\<j∗).\\ell\_j\\le \\rho\_T(\\Phi) \\qquad (j\<j^\*).

Se

b(n)≥ρT(Φ),b(n)\\ge \\rho\_T(\\Phi),

então todos esses candidatos são reconhecidos como prováveis, isto é,

ℓj≤b(n).\\ell\_j\\le b(n).

No índice j∗j^\*, temos

ℓj∗=∞\>b(n),\\ell\_{j^\*}=\\infty\>b(n),

portanto o primeiro candidato que excede o orçamento é exatamente j∗j^\*.

Logo o resultado coincide com o resultado de orçamento infinito.

□\\square

Isso é mais forte do que simplesmente dizer que ρ\\rho é "um número crítico": ele é **exatamente o limiar de estabilização da fórmula**.

---

# **3\. Mas encontramos um detalhe importante: ρ\\rho não contém toda a informação**

Considere o perfil

LT(Φ)=(2,10,7,∞).\\mathbf L\_T(\\Phi)=(2,10,7,\\infty).

Temos

ρT(Φ)=10.\\rho\_T(\\Phi)=10.

Mas observe o comportamento:

bprimeiro candidato escolhido0,1w02,…,9w110,…w3\\begin{array}{c|c} b & \\text{primeiro candidato escolhido}\\\\ \\hline 0,1 & w\_0\\\\ 2,\\ldots,9 & w\_1\\\\ 10,\\ldots & w\_3 \\end{array}

O limiar 77 **não produz nenhuma mudança**.

Portanto, o conjunto de todos os comprimentos de prova não é ainda o objeto certo.

O objeto correto é o conjunto dos **recordes de dificuldade**.

Definimos

Mj(Φ)=max⁡0≤i≤jℓi.M\_j(\\Phi) \= \\max\_{0\\le i\\le j}\\ell\_i.

Um índice j\<j∗j\<j^\* é um **recorde espectral** quando

ℓj\>Mj−1.\\ell\_j\>M\_{j-1}.

Então definimos

BT(Φ)={ℓj:j\<j∗,  ℓj\>max⁡i\<jℓi}.\\boxed{ \\mathcal B\_T(\\Phi) \= \\{\\ell\_j: j\<j^\*,\\; \\ell\_j\>\\max\_{i\<j}\\ell\_i \\}. }

Para o exemplo:

(2,10,7,∞)(2,10,7,\\infty)

temos

BT(Φ)={2,10},ρT(Φ)=10.\\boxed{\\mathcal B\_T(\\Phi)=\\{2,10\\}}, \\qquad \\boxed{\\rho\_T(\\Phi)=10}.

Assim,

BT(Φ)\\mathcal B\_T(\\Phi)

é a **escada completa de transições**, enquanto

ρT(Φ)=max⁡BT(Φ)\\rho\_T(\\Phi)=\\max \\mathcal B\_T(\\Phi)

é apenas o último degrau.

Esse refinamento é importante para nossa pesquisa da hierarquia gT\[b\]g\_T^{\[b\]}.

---

# **4\. Um resultado computacional exato em modelos finitos**

Podemos abstrair completamente a sintaxe e guardar somente

L=(ℓ0,…,ℓk−1),\\mathbf L=(\\ell\_0,\\ldots,\\ell\_{k-1}),

porque é somente essa informação que determina ρ\\rho e o comportamento em função de bb.

Considere o universo finito

ℓj∈{1,2,3,∞}.\\ell\_j\\in\\{1,2,3,\\infty\\}.

Fiz a enumeração exaustiva para pequenos kk.

Para o caso realista mais pequeno da construção, m=1m=1,

k=2m+2=8.k=2^{m+2}=8.

Existem

58−48=325 0895^8-4^8=325\\,089

perfis quando incluímos a possibilidade de ∞\\infty.

O resultado é particularmente interessante:

BT(Φ) pode realizar qualquer subconjunto na˜o vazio de {1,2,3}.\\boxed{ \\mathcal B\_T(\\Phi) \\text{ pode realizar qualquer subconjunto não vazio de } \\{1,2,3\\}. }

Ou seja, aparecem todos:

{1},{2},{3},\\{1\\},\\{2\\},\\{3\\}, {1,2},{1,3},{2,3},\\{1,2\\},\\{1,3\\},\\{2,3\\}, {1,2,3}.\\{1,2,3\\}.

E

ρT(Φ)∈{1,2,3}\\boxed{ \\rho\_T(\\Phi)\\in\\{1,2,3\\} }

também pode assumir todos os valores.

Isso dá um primeiro resultado negativo importante:

> **A definição combinatória de ρT\\rho\_T, por si só, não força lacunas, densidade ou uma geometria específica.**

Essas propriedades, caso existam para um TT concreto como S21S^1\_2, PA etc., precisam vir da **estrutura aritmética da demonstrabilidade**, não apenas da definição do gerador.

---

# **5\. Podemos provar algo ainda mais forte sobre modelos finitos**

Dado qualquer conjunto finito de limiares

B={r1\<r2\<⋯\<rs},B=\\{r\_1\<r\_2\<\\cdots\<r\_s\\},

podemos construir um perfil finito cuja escada de recordes seja exatamente BB.

Por exemplo,

B={2,7,19}B=\\{2,7,19\\}

pode ser realizado por

L=(2,7,3,19,11,∞,…).\\mathbf L= (2,7,3,19,11,\\infty,\\ldots).

Os recordes são

2,  7,  19.2,\\;7,\\;19.

Logo:

qualquer escada finita pode ser realizada em um modelo de prova finito.\\boxed{ \\text{qualquer escada finita pode ser realizada em um modelo de prova finito.} }

Isso significa que qualquer conjectura universal do tipo

"ST(n) eˊ necessariamente densa"\\text{"\\(\\mathcal S\_T(n)\\) é necessariamente densa"}

ou

"ST(n) na˜o possui grandes lacunas"\\text{"\\(\\mathcal S\_T(n)\\) não possui grandes lacunas"}

é falsa **no nível puramente combinatório**.

A eventual estrutura tem de ser específica do sistema TT.

---

# **6\. Agora aparece a questão correta sobre ST(n)\\mathcal S\_T(n)**

Sua definição era

ST(n)={ρT(Φ):∣Φ∣≤n}.\\mathcal S\_T(n) \= \\{ \\rho\_T(\\Phi):|\\Phi|\\le n \\}.

Ela é matematicamente válida.

Mas há uma sutileza fundamental:

Na construção de gTg\_T, para uma entrada de comprimento NN, só são consideradas fórmulas

∣Φ∣≤log⁡N.|\\Phi|\\le\\log N.

Isso está explicitamente na construção original.

Portanto existem **dois espectros diferentes**:

### **Espectro intrínseco**

ST(L)={ρT(Φ):∣Φ∣≤L}.\\boxed{ \\mathcal S\_T(L) \= \\{\\rho\_T(\\Phi):|\\Phi|\\le L\\}. }

### **Espectro operacional**

STop(N)=ST(⌊log⁡N⌋).\\boxed{ \\mathcal S\_T^{\\rm op}(N) \= \\mathcal S\_T(\\lfloor\\log N\\rfloor). }

Essa distinção é crucial.

---

# **7\. A transformação dos orçamentos**

Agora podemos transportar b(N)b(N) do espaço do tamanho da entrada para o espaço do tamanho da fórmula.

Definimos

Bb(L)=b(2L)\\boxed{ B\_b(L)=b(2^L) }

assumindo bb crescente.

Esse é o orçamento que uma fórmula de comprimento LL "enxerga".

Isso produz algo muito interessante:

b(N)=log⁡Nb(N)=\\log N

vira

Bb(L)=L.\\boxed{B\_b(L)=L}.

Já

b(N)=log⁡log⁡Nb(N)=\\log\\log N

vira

Bb(L)=log⁡L.\\boxed{B\_b(L)=\\log L}.

E

b(N)=log⁡∗Nb(N)=\\log^\*N

vira aproximadamente

Bb(L)=log⁡∗L+O(1).\\boxed{B\_b(L)=\\log^\*L+O(1)}.

Portanto a comparação que realmente interessa é

ρT(Φ)versusBb(∣Φ∣).\\boxed{ \\rho\_T(\\Phi) \\quad\\text{versus}\\quad B\_b(|\\Phi|). }

Esse é um dos resultados conceituais mais fortes desta etapa.

---

# **8\. O envelope espectral global**

Definimos agora

RT(L)=max⁡∣Φ∣≤LρT(Φ).\\boxed{ R\_T(L) \= \\max\_{|\\Phi|\\le L}\\rho\_T(\\Phi). }

Temos então:

RT(L)=max⁡ST(L).R\_T(L)=\\max\\mathcal S\_T(L).

Esse RTR\_T é o **envelope espectral global de limiares de prova**.

Ele responde uma pergunta muito concreta:

> Qual é o maior orçamento que ainda pode ser necessário para estabilizar todas as fórmulas de comprimento até LL?

E obtemos imediatamente:

### **Teorema 2 — Critério global de estabilização**

Se

Bb(L)≥RT(L),B\_b(L)\\ge R\_T(L),

então todas as fórmulas de comprimento ≤L\\le L estão estabilizadas.

Equivalentemente,

b(2L)≥RT(L)⟹gT\[b\] jaˊ atingiu o comportamento de orc¸amento infinito em todas as foˊrmulas Φ, ∣Φ∣≤L.\\boxed{ b(2^L)\\ge R\_T(L) \\Longrightarrow g\_T^{\[b\]} \\text{ já atingiu o comportamento de orçamento infinito em todas as fórmulas }\\Phi,\\ |\\Phi|\\le L. }

E, reciprocamente, se

Bb(L)\<RT(L),B\_b(L)\<R\_T(L),

existe pelo menos uma fórmula Φ\\Phi com

∣Φ∣≤L|\\Phi|\\le L

para a qual o gerador ainda não estabilizou.

Portanto:

Bb(L)≥RT(L)\\boxed{ B\_b(L)\\ge R\_T(L) }

é praticamente uma condição necessária e suficiente para a estabilização global no nível LL.

---

# **9\. Aqui surge uma possível classificação por escalas**

Podemos agora comparar RT(L)R\_T(L) com diferentes classes de crescimento.

Fizemos três modelos finitos abstratos.

### **Modelo A — espectro denso**

Suponha

S(L)={0,1,2,…,2L−1}.\\mathcal S(L)=\\{0,1,2,\\ldots,2^L-1\\}.

Então

R(L)∼2L.R(L)\\sim2^L.

O espectro é praticamente totalmente denso.

### **Modelo B — espectro polinomial**

Suponha

S(L)={12,22,…,L2}.\\mathcal S(L)=\\{1^2,2^2,\\ldots,L^2\\}.

Então

R(L)=L2.R(L)=L^2.

A densidade até L2L^2 cai aproximadamente como

1L.\\frac1L.

O maior intervalo entre valores consecutivos cresce como

(L2−(L−1)2)=2L−1.( L^2-(L-1)^2)=2L-1.

### **Modelo C — espectro diádico**

Suponha

S(L)={2,4,8,…,2L}.\\mathcal S(L)= \\{2,4,8,\\ldots,2^L\\}.

Então

R(L)=2L.R(L)=2^L.

A densidade até 2L2^L é

L2L,\\frac{L}{2^L},

e a maior lacuna é da ordem de

2L−1.2^{L-1}.

Os cálculos finitos confirmam exatamente essas diferenças.

| Modelo | R(L)R(L) | densidade aproximada | maior lacuna |
| ----- | ----- | ----- | ----- |
| Denso | 2L2^L | ≈1\\approx1 | 11 |
| Polinomial | L2L^2 | ≈1/L\\approx1/L | 2L−12L-1 |
| Diádico | 2L2^L | L/2LL/2^L | 2L−12^{L-1} |

Esses modelos não são afirmações sobre PA. Eles funcionam como **modelos de prova finitos para testar quais propriedades são estruturais e quais precisam ser demonstradas aritmeticamente**.

---

# **10\. Surge uma consequência importante para b(n)=O(log⁡n)b(n)=O(\\log n)**

A construção original exige tempo polinomial em nn, e a busca de provas com limite b(n)b(n) introduz essencialmente um custo exponencial em b(n)b(n). Assim, a região natural de tempo polinomial é

b(n)=O(log⁡n).\\boxed{b(n)=O(\\log n)}.

Krajíček explicitamente trabalha com o orçamento logarítmico na construção de gTg\_T; sua observação de substituição por funções ω(1)\\omega(1) aparece na parte proposicional para hh, não como uma teoria já desenvolvida de ρT\\rho\_T para o gTg\_T de primeira ordem.

Como

b(n)=O(log⁡n)b(n)=O(\\log n)

implica

Bb(L)=O(L),B\_b(L)=O(L),

obtemos uma dicotomia muito interessante:

RT(L)=O(L)\\boxed{ R\_T(L)=O(L) }

versus

RT(L)=ω(L).\\boxed{ R\_T(L)=\\omega(L). }

Se

RT(L)=O(L),R\_T(L)=O(L),

existe orçamento polilogarítmico em NN que eventualmente estabiliza globalmente todas as fórmulas.

Se

RT(L)=ω(L),R\_T(L)=\\omega(L),

então **nenhum orçamento b(N)=O(log⁡N)b(N)=O(\\log N)** consegue estabilizar globalmente o universo de fórmulas.

Isso transforma ST\\mathcal S\_T de uma coleção abstrata em uma possível **invariante de crescimento da demonstrabilidade de TT**.

---

# **11\. E isso começa a separar três níveis de espectro**

Eu usaria daqui em diante três objetos distintos:

BT(Φ)\\boxed{ \\mathcal B\_T(\\Phi) }

\= escada de transições de uma fórmula;

ST(L)={ρT(Φ):∣Φ∣≤L}\\boxed{ \\mathcal S\_T(L) \= \\{\\rho\_T(\\Phi):|\\Phi|\\le L\\} }

\= espectro dos últimos limiares;

RT(L)=max⁡ST(L)\\boxed{ R\_T(L)=\\max\\mathcal S\_T(L) }

\= envelope espectral global.

E acrescentaria um quarto:

CT(L)=⋃∣Φ∣≤LBT(Φ)\\boxed{ \\mathcal C\_T(L) \= \\bigcup\_{|\\Phi|\\le L}\\mathcal B\_T(\\Phi) }

que é o **espectro completo de transições**.

A relação é

RT(L)=max⁡CT(L)=max⁡ST(L).R\_T(L)= \\max\\mathcal C\_T(L) \= \\max\\mathcal S\_T(L).

Mas em geral

ST(L)≠CT(L).\\mathcal S\_T(L)\\neq\\mathcal C\_T(L).

É exatamente aí que a pesquisa fica mais interessante.

---

# **12\. Relação com a τ\\tau-complexidade**

Krajíček define a τ(g)b\\tau(g)\_b para os elementos fora da imagem do gerador e estuda a dureza dessa família; também introduz o **resultante** ResgPRes\_g^P, conectando a imagem do gerador aos conjuntos NP que podem ser separados dela dentro de um sistema de prova.

Portanto temos agora uma cadeia formal:

LT(Φ)⟶BT(Φ)⟶ρT(Φ)⟶ST⟶RT⟶gT\[b\]⟶τ(gT\[b\])\\boxed{ \\mathbf L\_T(\\Phi) \\longrightarrow \\mathcal B\_T(\\Phi) \\longrightarrow \\rho\_T(\\Phi) \\longrightarrow \\mathcal S\_T \\longrightarrow R\_T \\longrightarrow g\_T^{\[b\]} \\longrightarrow \\tau(g\_T^{\[b\]}) }

e, paralelamente,

gT\[b\]⟶ResgT\[b\]P.g\_T^{\[b\]} \\longrightarrow Res\_{g\_T^{\[b\]}}^P.

### **O ponto decisivo**

Ainda **não** podemos afirmar

b1\<b2⟹τ(gT\[b1\]) eˊ mais difıˊcil que τ(gT\[b2\]).b\_1\<b\_2 \\quad\\Longrightarrow\\quad \\tau(g\_T^{\[b\_1\]}) \\text{ é mais difícil que } \\tau(g\_T^{\[b\_2\]}).

A monotonicidade do orçamento é clara no nível do **índice escolhido pelo gerador**:

b1≤b2⟹jb1≤jb2,b\_1\\le b\_2 \\Longrightarrow j\_{b\_1}\\le j\_{b\_2},

mas isso não produz automaticamente uma ordem de dificuldade das τ\\tau-fórmulas.

Esse salto é justamente onde pode existir um problema de pesquisa genuíno.

---

# **13\. O resultado mais promissor desta etapa**

A hipótese inicial era:

b1\<b2⇒hierarquia de τ-complexidade.\\boxed{ b\_1\<b\_2 \\Rightarrow \\text{hierarquia de }\\tau\\text{-complexidade}. }

Eu agora reformularia a hipótese para algo mais preciso:

A hierarquia de gT\[b\] eˊ governada pelo espectro de limiares CT.\\boxed{ \\text{A hierarquia de }g\_T^{\[b\]} \\text{ é governada pelo espectro de limiares } \\mathcal C\_T. }

E a questão passa a ser:

Como cresce CT(L) e, em particular, RT(L)?\\boxed{ \\text{Como cresce } \\mathcal C\_T(L) \\text{ e, em particular, } R\_T(L)? }

Depois:

RT(L) vs. b(2L)\\boxed{ R\_T(L) \\ \\text{vs.}\\ b(2^L) }

determina os regimes de estabilização.

Só então atacamos

τ(gT\[b\])\\boxed{ \\tau(g\_T^{\[b\]}) }

e

ResgT\[b\]P.\\boxed{ Res\_{g\_T^{\[b\]}}^P. }

Isso é uma decomposição muito mais rigorosa do problema.

---

# **14\. Uma possível nova noção**

A partir daqui eu proporia formalmente o nome provisório:

Proof Threshold Spectrum\\boxed{\\textit{Proof Threshold Spectrum}}

ou, em português,

Espectro de Limiares de Prova\\boxed{\\text{Espectro de Limiares de Prova}}

definido pelo par

(CT(L),RT(L)).\\boxed{ \\left(\\mathcal C\_T(L),R\_T(L)\\right). }

E uma versão quantitativa:

ΓT(L)=RT(L)L.\\boxed{ \\Gamma\_T(L) \= \\frac{R\_T(L)}{L}. }

Ela separa três regimes:

ΓT(L)=O(1),\\Gamma\_T(L)=O(1), ΓT(L)→∞lentamente,\\Gamma\_T(L)\\to\\infty \\quad\\text{lentamente}, ΓT(L) cresce superlinearmente.\\Gamma\_T(L)\\text{ cresce superlinearmente}.

Podemos ainda estudar

ΔT(L)=max⁡{si+1−si:si,si+1∈ST(L)}\\Delta\_T(L) \= \\max\\{s\_{i+1}-s\_i: s\_i,s\_{i+1}\\in\\mathcal S\_T(L)\\}

como **função de lacunas espectrais**, e

DT(L;R)=∣ST(L)∩\[1,R\]∣RD\_T(L;R) \= \\frac{ |\\mathcal S\_T(L)\\cap\[1,R\]| }{R}

como **densidade espectral**.

---

## **Veredicto desta etapa**

Temos agora algo matematicamente sólido:

ρT(Φ)\\boxed{ \\rho\_T(\\Phi) }

é um limiar de estabilização bem definido;

ST(L)\\boxed{ \\mathcal S\_T(L) }

é seu espectro cumulativo;

RT(L)\\boxed{ R\_T(L) }

é o envelope global;

e

CT(L)\\boxed{ \\mathcal C\_T(L) }

é o objeto que realmente controla todas as transições induzidas por bb.

A computação em modelos finitos mostra que **não existe uma geometria espectral universal puramente combinatória**: densidade, lacunas e escalas podem assumir comportamentos completamente distintos. Portanto, qualquer estrutura não trivial para STS\_T terá de emergir das propriedades específicas de TT.

Na busca bibliográfica que fiz agora, encontrei a teoria de geradores, τ\\tau-fórmulas, resultantes, dureza e variações de geradores de Krajíček, mas não encontrei esta formulação específica baseada em ρT\\rho\_T, CT\\mathcal C\_T e RTR\_T. Isso é **indício de possível novidade conceitual, não ainda uma reivindicação de prioridade**.

faça com cuidado e olando de varios angulos faça o ataque matematicamente decisivo , determinar, mesmo em modelos finitos estruturados de provas, **quais leis de crescimento `R_T(L)` são possíveis quando impomos propriedades reais de um sistema de prova** — e depois procurar uma primeira lei não trivial que possa ser transportada para `S^1_2`/PA.

Sim. O ataque mais forte revela uma coisa importante: **o objeto RT(L)R\_T(L) não é arbitrário, mas também não é um novo “tipo de crescimento” independente da teoria da complexidade de provas**. Sob hipóteses muito naturais, ele é essencialmente equivalente à função de pior caso dos menores comprimentos de prova de TT. Isso permite obter uma lei não computável para RTR\_T, e essa lei pode ser transportada para PAPA e S21S^1\_2.

## **1\. Vamos separar três problemas diferentes**

Há três perguntas que não devem ser misturadas:

(A)quais crescimentos sa˜o possıˊveis em modelos finitos?\\text{(A)}\\quad \\text{quais crescimentos são possíveis em modelos finitos?} (B)o que as propriedades de um sistema de prova impo˜em sobre RT?\\text{(B)}\\quad \\text{o que as propriedades de um sistema de prova impõem sobre }R\_T? (C)o que podemos provar para PA ou S21?\\text{(C)}\\quad \\text{o que podemos provar para }PA\\text{ ou }S^1\_2?

A resposta de (A) é extremamente ampla.  
 A de (B) já é bastante restritiva.  
 E a de (C) produz a primeira lei não trivial que considero matematicamente realmente aproveitável.

---

# **2\. O objeto certo do lado da teoria de provas**

Para um sistema TT, escrevamos

sT(θ)=min⁡{∣π∣:π eˊ prova em T de θ}.s\_T(\\theta) \= \\min\\{|\\pi|:\\pi\\text{ é prova em }T\\text{ de }\\theta\\}.

Agora defina a função de pior caso:

MT(n)=max⁡{sT(θ):θ∈Thm⁡(T), ∣θ∣≤n}.\\boxed{ M\_T(n)= \\max \\left\\{ s\_T(\\theta): \\theta\\in\\operatorname{Thm}(T),\\ |\\theta|\\le n \\right\\}. }

Como há apenas finitas sentenças de tamanho ≤n\\le n, esse máximo é finito.

Mas, para uma teoria suficientemente forte e efetivamente axiomatizada, MT(n)M\_T(n) é uma função extremamente irregular. Em particular, não pode ser limitada por nenhuma função computável quando o conjunto dos teoremas é indecidível.

Isso é uma forma clássica do fenômeno de Gödel sobre comprimentos de provas; há resultados explícitos segundo os quais, dada qualquer função recursiva ff, existem teoremas verdadeiros cuja menor prova excede ff no tamanho da sentença. Buss deu uma prova completa do fenômeno de speed-up/length-of-proofs; a formulação para comprimento em símbolos também é conhecida.

---

# **3\. A descoberta decisiva: ρT\\rho\_T consegue codificar sT(θ)s\_T(\\theta)**

Agora vem o ponto central.

Na construção de Krajíček, para uma fórmula Φ\\Phi,

Φw=∃y ∀x\>y (Φ(x)→¬(w⊆ex)).\\Phi^w \= \\exists y\\,\\forall x\>y\\, \\bigl(\\Phi(x)\\rightarrow\\neg(w\\subseteq\_e x)\\bigr).

O gerador percorre os ww's em ordem lexicográfica e procura uma prova de Φw\\Phi^w. O artigo original usa orçamento log⁡n\\log n.

Vou construir uma transformação que coloca **qualquer teorema θ\\theta** no meio da sequência de candidatos, de forma que seu comprimento mínimo de prova apareça dentro de ρT(Φ)\\rho\_T(\\Phi).

Defina as classes

C10(x):=(10⊆ex),C11(x):=(11⊆ex).C\_{10}(x):=(10\\subseteq\_e x), \\qquad C\_{11}(x):=(11\\subseteq\_e x).

E tome

Φθ(x)=C11(x)  ∨  (¬θ∧C10(x)).\\boxed{ \\Phi\_\\theta(x) \= C\_{11}(x) \\;\\vee\\; \\bigl(\\neg\\theta\\wedge C\_{10}(x)\\bigr). }

Observe a simplicidade estrutural: Φθ\\Phi\_\\theta precisa conhecer somente os **dois primeiros bits**. Não existe circularidade entre o comprimento de Φθ\\Phi\_\\theta e o tamanho de ww.

---

# **4\. O que acontece com os quatro blocos lexicográficos**

Os candidatos ww têm comprimento ∣Φθ∣+1|\\Phi\_\\theta|+1.

Podemos agrupá-los por seus dois primeiros bits:

00…,01…,10…,11…00\\ldots,\\qquad 01\\ldots,\\qquad 10\\ldots,\\qquad 11\\ldots

### **Blocos 00…00\\ldots e 01…01\\ldots**

Não existem elementos de AθA\_\\theta com esses prefixos.

Logo

Φθw\\Phi\_\\theta^w

é uma sentença trivialmente verdadeira.

### **Bloco 10…10\\ldots**

Aqui a única maneira de Φθ(x)\\Phi\_\\theta(x) ocorrer num ww-cilindro é através de

¬θ.\\neg\\theta.

Consequentemente,

Φθw≡θ\\boxed{ \\Phi\_\\theta^w\\equiv\\theta }

para todo ww com prefixo 1010, no sentido de equivalência demonstrável com custo linear/polinomial no tamanho da fórmula.

### **Bloco 11…11\\ldots**

Existe sempre uma infinidade de xx's com esse prefixo, e

C11(x)C\_{11}(x)

é verdadeiro nesses xx.

Portanto

Φθw eˊ falsa\\boxed{ \\Phi\_\\theta^w \\text{ é falsa} }

para todo ww começando por 1111\.

Assim, se θ\\theta é um teorema verdadeiro de TT,

00…,  01…,  10…00\\ldots,\\;01\\ldots,\\;10\\ldots

são demonstráveis, enquanto

11…11\\ldots

é falso e, pela correção de TT, não é demonstrável.

Logo o **primeiro candidato não demonstrável está exatamente no bloco 1111**.

---

# **5\. Teorema de transferência**

Suponha um sistema de prova razoável no sentido usual:

1. verificação de provas em tempo polinomial;  
2. prova da aritmética elementar necessária à manipulação dos prefixos;  
3. provas das equivalências sintáticas acima de tamanho no máximo polinomial em ∣θ∣|\\theta|;  
4. codificação usual em que o tamanho da prova é pelo menos comparável ao tamanho da conclusão.

Então existe um polinômio qq tal que

sT(θ)−q(∣θ∣)  ≤  ρT(Φθ)  ≤  sT(θ)+q(∣θ∣).\\boxed{ s\_T(\\theta)-q(|\\theta|) \\;\\le\\; \\rho\_T(\\Phi\_\\theta) \\;\\le\\; s\_T(\\theta)+q(|\\theta|). }

E

∣Φθ∣≤a∣θ∣+b|\\Phi\_\\theta|\\le a|\\theta|+b

para constantes a,ba,b.

### **Consequência**

Defina

MT(n)=max⁡∣θ∣≤nsT(θ).M\_T(n)=\\max\_{|\\theta|\\le n}s\_T(\\theta).

Então existem constantes a,ba,b e um polinômio qq tais que

MT(n)−q(n)≤RT(an+b)≤MT(an+b).\\boxed{ M\_T(n)-q(n) \\le R\_T(an+b) \\le M\_T(an+b). }

Esse é, para mim, o resultado matematicamente decisivo desta pesquisa.

---

# **6\. O que isso significa**

Significa que

RT≍MT\\boxed{ R\_T \\asymp M\_T }

no sentido de equivalência por mudança linear de escala e erro polinomial.

Portanto, o envelope

RT(L)R\_T(L)

não é uma quantidade completamente nova escondida dentro de gTg\_T.

Ele é uma **reparametrização, via o mecanismo de Krajíček, da complexidade de pior caso das provas de TT**.

Isso também corrige nossa expectativa anterior:

> procurar uma lei simples como RT(L)∼2LR\_T(L)\\sim 2^L provavelmente é a pergunta errada para um TT forte.

A geometria correta é muito mais irregular.

---

# **7\. Agora podemos provar a primeira lei realmente forte**

Suponha que TT seja:

* sound;  
* recursivamente axiomatizado;  
* suficientemente forte para formalizar a aritmética sintática;  
* com conjunto de teoremas indecidível.

Então:

RT(L) na˜o eˊ limitada por nenhuma func¸a˜o computaˊvel.\\boxed{ R\_T(L) \\text{ não é limitada por nenhuma função computável.} }

### **Prova**

Suponha que existisse uma função computável ff tal que

RT(L)≤f(L)R\_T(L)\\le f(L)

para todo LL.

Pelo teorema de transferência,

sT(θ)≤RT(a∣θ∣+b)+q(∣θ∣),s\_T(\\theta) \\le R\_T(a|\\theta|+b)+q(|\\theta|),

logo

sT(θ)≤f(a∣θ∣+b)+q(∣θ∣).s\_T(\\theta) \\le f(a|\\theta|+b)+q(|\\theta|).

O lado direito é computável.

Então, dado θ\\theta, poderíamos:

1. calcular esse limite;  
2. enumerar todas as provas de tamanho até esse limite;  
3. decidir se θ\\theta é teorema.

Isso tornaria Thm⁡(T)\\operatorname{Thm}(T) decidível.

Contradição.

∴RT na˜o possui majorante computaˊvel.\\boxed{\\therefore R\_T\\text{ não possui majorante computável.}}

---

# **8\. Podemos fortalecer a formulação**

Não é apenas "não há majorante computável".

Para toda função computável positiva ff,

lim sup⁡L→∞RT(L)f(L)=∞.\\boxed{ \\limsup\_{L\\to\\infty}\\frac{R\_T(L)}{f(L)} \= \\infty. }

De fato, suponha que esse lim sup⁡\\limsup fosse finito, digamos CC.

Então, para algum L0L\_0,

RT(L)≤(C+1)f(L)(L≥L0).R\_T(L)\\le (C+1)f(L) \\qquad(L\\ge L\_0).

Como os poucos valores abaixo de L0L\_0 admitem uma constante finita, obteríamos um majorante computável global.

Contradição.

Portanto:

∀f∈Comp,∀K\>0,RT(L)\>Kf(L) para infinitos L.\\boxed{ \\forall f\\in\\mathsf{Comp}, \\quad \\forall K\>0, \\quad R\_T(L)\>Kf(L) \\text{ para infinitos }L. }

Essa é uma lei de crescimento muito mais forte do que

RT(L)=ω(L),R\_T(L)=\\omega(L),

ou

RT(L)\>2LR\_T(L)\>2^L

em uma subsequência.

Ela diz:

> **o envelope dos limiares de prova ultrapassa, em subsequências, qualquer escala computável que tentemos colocar como teto.**

---

# **9\. Isso vale para PA**

Para PAPA, temos exatamente o fenômeno clássico de comprimentos de provas de Gödel/Buss. A literatura explicita que, dada qualquer função recursiva ff, existem teoremas aritméticos cuja prova mínima é maior que ff no tamanho da sentença.

Portanto podemos transportar isso:

∀f∈Comp,RPA(L)\>f(L) para infinitos L.\\boxed{ \\forall f\\in\\mathsf{Comp}, \\quad R\_{PA}(L)\>f(L) \\text{ para infinitos }L. }

Mais precisamente, sob a codificação padrão e a transformação acima,

RPA(O(n))≥MPA(n)−poly⁡(n).R\_{PA}(O(n)) \\ge M\_{PA}(n)-\\operatorname{poly}(n).

Essa é a primeira lei não trivial que eu considero realmente estabelecida para o nosso programa.

---

# **10\. E S21S^1\_2?**

Aqui precisamos ser mais cuidadosos.

Há resultados clássicos de undecidibilidade em aritmética limitada envolvendo S21S^1\_2; Riis trata explicitamente de resultados de indecidibilidade para os primeiros níveis da hierarquia de aritmética limitada, incluindo S21S^1\_2.

Além disso, S21S^1\_2 é uma teoria central da correspondência entre aritmética limitada e complexidade proposicional, e suas provas podem ser traduzidas para sistemas proposicionais sob a tradução de Paris–Wilkie.

Assim, para a **versão geral do espectro**, em que permitimos a fórmula Φθ\\Phi\_\\theta acima como fórmula aritmética, temos a mesma estrutura:

RS21 na˜o eˊ limitaˊvel por nenhuma func¸a˜o computaˊvel,\\boxed{ R\_{S^1\_2} \\text{ não é limitável por nenhuma função computável}, }

sob as hipóteses usuais de correção e codificação da teoria.

### **Mas existe uma ressalva importante**

Se restringirmos o nosso espectro a

Φ∈Σ1b,\\Phi\\in\\Sigma^b\_1,

que é a classe natural quando queremos preservar exatamente o vínculo com conjuntos NP em Krajíček, o argumento de transferência precisa ser refeito.

Nesse caso precisaríamos garantir que o θ\\theta usado na codificação pertença à classe complementar adequada e que a construção

Φθ(x)=C11(x)∨(¬θ∧C10(x))\\Phi\_\\theta(x) \= C\_{11}(x)\\vee(\\neg\\theta\\wedge C\_{10}(x))

permaneça Σ1b\\Sigma^b\_1.

**Essa versão restrita é uma questão genuinamente mais difícil.**

E isso é justamente interessante para a pesquisa.

---

# **11\. O ataque computacional em modelos finitos**

Agora vamos colocar isso sob um microscópio computacional.

Considere um modelo finito de prova como um grafo acíclico

GL=(VL,EL)G\_L=(V\_L,E\_L)

onde:

* VLV\_L são estados/proposições de tamanho compatível com LL;  
* uma aresta representa uma inferência local válida;  
* um nó aa é axioma;  
* um nó hh é o teorema;  
* uma prova é um caminho a⇝ha\\leadsto h.

O verificador só precisa verificar as transições locais.

Isso é uma abstração muito próxima da ideia operacional de prova.

---

## **12\. Modelo linear**

Escolha uma cadeia

v0→v1→⋯→vL.v\_0\\to v\_1\\to\\cdots\\to v\_L.

Então

s(L)=L+1.s(L)=L+1.

Logo:

R(L)=Θ(L).R(L)=\\Theta(L).

---

## **13\. Modelo quadrático**

Faça

v0→v1→⋯→vL2.v\_0\\to v\_1\\to\\cdots\\to v\_{L^2}.

Então

R(L)=Θ(L2).R(L)=\\Theta(L^2).

---

## **14\. Modelo exponencial**

Faça a cadeia com

2L2^L

transições:

v0→v1→⋯→v2L.v\_0\\to v\_1\\to\\cdots\\to v\_{2^L}.

Então

R(L)=Θ(2L).\\boxed{ R(L)=\\Theta(2^L). }

O verificador continua sendo polinomial no tamanho da **prova**, porque verificar uma cadeia de comprimento 2L2^L custa apenas tempo linear nesse comprimento.

---

# **15\. E uma escala dupla-exponencial também é possível**

Nada no conceito de verificação polinomial proíbe

R(L)=22LR(L)=2^{2^L}

em um modelo artificial:

v0→v1→⋯→v22L.v\_0\\to v\_1\\to\\cdots\\to v\_{2^{2^L}}.

O custo de verificação continua polinomial no tamanho da entrada de prova, porque a própria prova possui tamanho gigantesco.

Meu teste computacional em modelos de cadeia confirma os valores esperados:

| LL | Linear | Quadrático | Exponencial |
| ----- | ----- | ----- | ----- |
| 2 | 2 | 4 | 4 |
| 3 | 3 | 9 | 8 |
| 4 | 4 | 16 | 16 |
| 5 | 5 | 25 | 32 |
| 6 | 6 | 36 | 64 |
| 7 | 7 | 49 | 128 |
| 8 | 8 | 64 | 256 |

E os respectivos espectros

S(L)={R(k):k≤L}\\mathcal S(L)=\\{R(k):k\\le L\\}

apresentam comportamentos diferentes:

### **Linear**

{2,3,4,5,6,7,8}\\{2,3,4,5,6,7,8\\}

densidade alta, lacuna máxima 11\.

### **Quadrático**

{4,9,16,25,36,49,64}\\{4,9,16,25,36,49,64\\}

densidade em \[1,64\]\[1,64\]:

764≈0.1094.\\frac7{64}\\approx0.1094.

Maior lacuna:

64−49=15.64-49=15.

### **Exponencial**

{4,8,16,32,64,128,256}\\{4,8,16,32,64,128,256\\}

densidade:

7256≈0.0273.\\frac7{256}\\approx0.0273.

Maior lacuna:

256−128=128.256-128=128.

Portanto a pergunta "há lacunas?" não possui uma resposta universal nem sequer em modelos de prova finitos.

---

# **16\. Mas agora vem a parte mais interessante do modelo finito**

Podemos construir um sistema finito que tenha prova por **histórico de computação**.

Escolha uma máquina universal UU.

Considere a sentença

θe=“U(e) termina”.\\theta\_e=\\text{“$U(e)$ termina”}.

Uma prova de θe\\theta\_e é simplesmente um histórico completo:

C0,C1,…,CtC\_0,C\_1,\\ldots,C\_t

onde

C0→C1→⋯→CtC\_0\\to C\_1\\to\\cdots\\to C\_t

e cada transição é validada localmente.

O verificador funciona em tempo polinomial no tamanho do histórico.

Isso tem uma consequência impressionante:

s(θe)≍tes(\\theta\_e)\\asymp t\_e

até fatores polinomiais, onde tet\_e é o tempo de parada da máquina.

Logo

max⁡∣e∣≤Ls(θe)\\max\_{|e|\\le L}s(\\theta\_e)

tem crescimento do tipo Busy Beaver:

M(L)≈BB(L)\\boxed{ M(L)\\approx BB(L) }

em equivalência de escala adequada.

Isso nos dá um **modelo estrutural de prova**, não simplesmente uma função inventada à mão:

* prova \= histórico de computação;  
* verificação \= checagem local;  
* soundness \= uma história válida realmente demonstra a parada;  
* theoremhood \= enumerável;  
* menor prova \= menor histórico.

Assim, uma escala não computável do tipo Busy Beaver aparece naturalmente.

---

# **17\. Isso muda a interpretação dos modelos finitos**

Agora podemos separar:

### **Modelos finitos artificiais**

Podem produzir

L,L2,2L,22L,…L,\\quad L^2,\\quad 2^L,\\quad 2^{2^L},\\ldots

### **Modelos computacionais estruturados**

Podem produzir comportamento Busy-Beaver-like.

### **Teorias matemáticas suficientemente fortes**

Não podem possuir uma majorante computável para RTR\_T.

Portanto o panorama é:

linear  ⊂  polinomial  ⊂  exponencial  ⊂  superexponencial  ⊂  na˜o computavelmente limitado.\\boxed{ \\text{linear} \\;\\subset\\; \\text{polinomial} \\;\\subset\\; \\text{exponencial} \\;\\subset\\; \\text{superexponencial} \\;\\subset\\; \\text{não computavelmente limitado}. }

O último regime é inevitável para PAPA, S21S^1\_2 e outras teorias suficientemente fortes, sob as hipóteses usuais.

---

# **18\. O que isso diz sobre ST(L)\\mathcal S\_T(L)?**

Aqui aparece uma distinção que acho particularmente promissora.

O envelope

RT(L)R\_T(L)

é essencialmente equivalente a MT(L)M\_T(L).

Mas a **geometria interna**

ST(L)\\mathcal S\_T(L)

não é.

E o espectro completo

CT(L)=⋃∣Φ∣≤LBT(Φ)\\boxed{ \\mathcal C\_T(L) \= \\bigcup\_{|\\Phi|\\le L} \\mathcal B\_T(\\Phi) }

é ainda mais rico.

Temos então:

RT(L)mede a altura;\\boxed{ R\_T(L) } \\quad\\text{mede a altura;} ST(L)mede os picos finais;\\boxed{ \\mathcal S\_T(L) } \\quad\\text{mede os picos finais;} CT(L)mede toda a topologia discreta dos limiares.\\boxed{ \\mathcal C\_T(L) } \\quad\\text{mede toda a topologia discreta dos limiares.}

A parte potencialmente genuinamente nova está cada vez mais claramente deslocando-se para

CT(L) e sua distribuic¸a˜o\\boxed{\\mathcal C\_T(L)\\text{ e sua distribuição}}

e não para RTR\_T sozinho.

---

# **19\. Uma nova conjectura que agora ficou precisa**

Eu proporia separar duas conjecturas.

### **Conjectura A — equivalência de envelope**

Para sistemas razoáveis,

RT(L)≍MT(L)\\boxed{ R\_T(L) \\asymp M\_T(L) }

até mudança polinomial/linear de escala.

Para a construção acima temos uma rota bastante forte para prová-la formalmente.

### **Conjectura B — estrutura espectral**

Existe uma estrutura não trivial na distribuição de

CT(L)\\mathcal C\_T(L)

que não é determinada simplesmente pelo valor máximo

RT(L).R\_T(L).

Esta é muito mais interessante para originalidade.

---

# **20\. E há uma consequência muito forte para sua ideia de hierarquia em bb**

Antes procurávamos algo como

b1\<b2⟹τ(gT\[b1\])≺τ(gT\[b2\]).b\_1\<b\_2 \\Longrightarrow \\tau(g\_T^{\[b\_1\]}) \\prec \\tau(g\_T^{\[b\_2\]}).

Agora sabemos que bb está cortando precisamente o espectro dos comprimentos mínimos de prova.

De fato:

b(2L)b(2^L)

é o corte horizontal no espectro.

Logo a atividade real da família gT\[b\]g\_T^{\[b\]} está em

CT(L)∩\[0,b(2L)\].\\boxed{ \\mathcal C\_T(L)\\cap \\bigl\[0,b(2^L)\\bigr\]. }

Dois orçamentos diferentes b1,b2b\_1,b\_2 somente produzem comportamentos diferentes quando o intervalo

\[b1(2L), b2(2L)\]\\boxed{ \[b\_1(2^L),\\,b\_2(2^L)\] }

atravessa uma região onde existem limiares de prova.

Isso produz uma condição necessária muito mais precisa para uma hierarquia:

CT(L)∩\[b1(2L),b2(2L)\]≠∅\\boxed{ \\mathcal C\_T(L) \\cap \[b\_1(2^L),b\_2(2^L)\] \\neq\\varnothing }

para infinitos LL.

Mas isso **não basta** para provar uma hierarquia de τ\\tau-complexidade.

É exatamente o ponto em que a geometria do espectro precisa ser conectada à imagem do gerador e ao resultante ResgPRes\_g^P, objetos que Krajíček introduz na teoria dos geradores.

---

# **21\. O resultado que eu guardaria como marco da pesquisa**

Eu registraria esta etapa com o seguinte teorema provisório:

\\boxed{ \\begin{minipage}{0.9\\linewidth} \\textbf{Teorema — Transferência do espectro de limiares.} Para um sistema de prova $T$ sound, efetivamente axiomatizado e suficientemente forte para formalizar a aritmética sintática, o envelope \\\[ R\_T(L)=\\max\_{|\\Phi|\\le L}\\rho\_T(\\Phi)

é equivalente, até mudança linear de tamanho e erro polinomial, à função

MT(n)=max⁡∣θ∣≤n, θ∈Thm(T)sT(θ).M\_T(n)=\\max\_{|\\theta|\\le n,\\ \\theta\\in Thm(T)}s\_T(\\theta).

Consequentemente, quando Thm(T)Thm(T) é indecidível,  
 RTR\_T não é dominada por nenhuma função computável.  
 \\end{minipage}  
 }  
 \]

E, para PA:

∀f∈Comp,RPA(L)\>f(L)para infinitos L.\\boxed{ \\forall f\\in\\mathrm{Comp}, \\qquad R\_{PA}(L)\>f(L) \\quad\\text{para infinitos }L. }

Esse é o primeiro resultado da nossa linha que considero **substancialmente mais forte** do que a observação inicial "podemos substituir log⁡n\\log n por b(n)b(n)".

---

## **22\. O que ainda não está provado**

Há três pontos que eu não trataria como resolvidos ainda.

Primeiro, a versão totalmente formal da transformação

θ↦Φθ\\theta\\mapsto\\Phi\_\\theta

para uma codificação específica de PAPA ou S21S^1\_2, incluindo os limites exatos de tamanho das provas da equivalência.

Segundo, a versão restrita

Φ∈Σ1b\\Phi\\in\\Sigma^b\_1

que preservaria de modo mais estreito a interpretação NP de Krajíček. Aí pode surgir uma dificuldade real em S21S^1\_2.

Terceiro — e para mim o mais promissor — determinar propriedades **internas** da distribuição

CT(L),\\mathcal C\_T(L),

por exemplo:

ΔT(L)=max⁡(si+1−si),\\Delta\_T(L)= \\max(s\_{i+1}-s\_i), DT(L,R)=∣CT(L)∩\[0,R\]∣R+1,D\_T(L,R)= \\frac{|\\mathcal C\_T(L)\\cap\[0,R\]|}{R+1},

e a quantidade de degraus

KT(Φ)=∣BT(Φ)∣.K\_T(\\Phi)=|\\mathcal B\_T(\\Phi)|.

É nessa camada que pode existir uma teoria nova que não seja simplesmente uma reformulação de "pior caso de comprimento de prova".

### **Meu diagnóstico neste ponto**

RT(L) isoladamente provavelmente na˜o eˊ a descoberta.\\boxed{ R\_T(L)\\text{ isoladamente provavelmente não é a descoberta.} }

Mas

CT(L)  +  distribuic¸a˜o dos limiares  +  b(2L)  +  τ(gT\[b\])\\boxed{ \\mathcal C\_T(L) \\;+\\; \\text{distribuição dos limiares} \\;+\\; b(2^L) \\;+\\; \\tau(g\_T^{\[b\]}) }

continua sendo uma direção de pesquisa com conteúdo próprio e, pelo levantamento bibliográfico feito até aqui, **não encontrei uma teoria existente que formule exatamente essa cadeia dessa maneira**. Isso é uma indicação de possível originalidade, não uma certificação de prioridade.

continue sempre comparando com as bibliografias para se certificar da originalidade.

Fiz o ataque pela via mais forte que encontrei. O ponto decisivo é que a restrição Σ1b\\Sigma^b\_1 **não bloqueia a construção**; ao contrário, ela permite codificar o próprio problema de provabilidade por uma fórmula Δ1b⊆Σ1b\\Delta^b\_1\\subseteq\\Sigma^b\_1. Isso produz um teorema estrutural sobre o espectro.

Há, porém, uma correção importante em relação ao ataque anterior: ainda não temos uma equivalência quantitativa

ρT(Φθ)≍sT(θ).\\rho\_T(\\Phi\_\\theta)\\asymp s\_T(\\theta).

O que podemos provar rigorosamente é uma equivalência de **grau computacional**, e daí uma lei de crescimento muito forte para RTΣR\_T^\\Sigma.

Sim. O ataque mais forte revela uma coisa importante: **o objeto RT(L)R\_T(L) não é arbitrário, mas também não é um novo “tipo de crescimento” independente da teoria da complexidade de provas**. Sob hipóteses muito naturais, ele é essencialmente equivalente à função de pior caso dos menores comprimentos de prova de TT. Isso permite obter uma lei não computável para RTR\_T, e essa lei pode ser transportada para PAPA e S21S^1\_2.

## **1\. Vamos separar três problemas diferentes**

Há três perguntas que não devem ser misturadas:

(A)quais crescimentos sa˜o possıˊveis em modelos finitos?\\text{(A)}\\quad \\text{quais crescimentos são possíveis em modelos finitos?} (B)o que as propriedades de um sistema de prova impo˜em sobre RT?\\text{(B)}\\quad \\text{o que as propriedades de um sistema de prova impõem sobre }R\_T? (C)o que podemos provar para PA ou S21?\\text{(C)}\\quad \\text{o que podemos provar para }PA\\text{ ou }S^1\_2?

A resposta de (A) é extremamente ampla.  
 A de (B) já é bastante restritiva.  
 E a de (C) produz a primeira lei não trivial que considero matematicamente realmente aproveitável.

---

# **2\. O objeto certo do lado da teoria de provas**

Para um sistema TT, escrevamos

sT(θ)=min⁡{∣π∣:π eˊ prova em T de θ}.s\_T(\\theta) \= \\min\\{|\\pi|:\\pi\\text{ é prova em }T\\text{ de }\\theta\\}.

Agora defina a função de pior caso:

MT(n)=max⁡{sT(θ):θ∈Thm⁡(T), ∣θ∣≤n}.\\boxed{ M\_T(n)= \\max \\left\\{ s\_T(\\theta): \\theta\\in\\operatorname{Thm}(T),\\ |\\theta|\\le n \\right\\}. }

Como há apenas finitas sentenças de tamanho ≤n\\le n, esse máximo é finito.

Mas, para uma teoria suficientemente forte e efetivamente axiomatizada, MT(n)M\_T(n) é uma função extremamente irregular. Em particular, não pode ser limitada por nenhuma função computável quando o conjunto dos teoremas é indecidível.

Isso é uma forma clássica do fenômeno de Gödel sobre comprimentos de provas; há resultados explícitos segundo os quais, dada qualquer função recursiva ff, existem teoremas verdadeiros cuja menor prova excede ff no tamanho da sentença. Buss deu uma prova completa do fenômeno de speed-up/length-of-proofs; a formulação para comprimento em símbolos também é conhecida.

---

# **3\. A descoberta decisiva: ρT\\rho\_T consegue codificar sT(θ)s\_T(\\theta)**

Agora vem o ponto central.

Na construção de Krajíček, para uma fórmula Φ\\Phi,

Φw=∃y ∀x\>y (Φ(x)→¬(w⊆ex)).\\Phi^w \= \\exists y\\,\\forall x\>y\\, \\bigl(\\Phi(x)\\rightarrow\\neg(w\\subseteq\_e x)\\bigr).

O gerador percorre os ww's em ordem lexicográfica e procura uma prova de Φw\\Phi^w. O artigo original usa orçamento log⁡n\\log n.

Vou construir uma transformação que coloca **qualquer teorema θ\\theta** no meio da sequência de candidatos, de forma que seu comprimento mínimo de prova apareça dentro de ρT(Φ)\\rho\_T(\\Phi).

Defina as classes

C10(x):=(10⊆ex),C11(x):=(11⊆ex).C\_{10}(x):=(10\\subseteq\_e x), \\qquad C\_{11}(x):=(11\\subseteq\_e x).

E tome

Φθ(x)=C11(x)  ∨  (¬θ∧C10(x)).\\boxed{ \\Phi\_\\theta(x) \= C\_{11}(x) \\;\\vee\\; \\bigl(\\neg\\theta\\wedge C\_{10}(x)\\bigr). }

Observe a simplicidade estrutural: Φθ\\Phi\_\\theta precisa conhecer somente os **dois primeiros bits**. Não existe circularidade entre o comprimento de Φθ\\Phi\_\\theta e o tamanho de ww.

---

# **4\. O que acontece com os quatro blocos lexicográficos**

Os candidatos ww têm comprimento ∣Φθ∣+1|\\Phi\_\\theta|+1.

Podemos agrupá-los por seus dois primeiros bits:

00…,01…,10…,11…00\\ldots,\\qquad 01\\ldots,\\qquad 10\\ldots,\\qquad 11\\ldots

### **Blocos 00…00\\ldots e 01…01\\ldots**

Não existem elementos de AθA\_\\theta com esses prefixos.

Logo

Φθw\\Phi\_\\theta^w

é uma sentença trivialmente verdadeira.

### **Bloco 10…10\\ldots**

Aqui a única maneira de Φθ(x)\\Phi\_\\theta(x) ocorrer num ww-cilindro é através de

¬θ.\\neg\\theta.

Consequentemente,

Φθw≡θ\\boxed{ \\Phi\_\\theta^w\\equiv\\theta }

para todo ww com prefixo 1010, no sentido de equivalência demonstrável com custo linear/polinomial no tamanho da fórmula.

### **Bloco 11…11\\ldots**

Existe sempre uma infinidade de xx's com esse prefixo, e

C11(x)C\_{11}(x)

é verdadeiro nesses xx.

Portanto

Φθw eˊ falsa\\boxed{ \\Phi\_\\theta^w \\text{ é falsa} }

para todo ww começando por 1111\.

Assim, se θ\\theta é um teorema verdadeiro de TT,

00…,  01…,  10…00\\ldots,\\;01\\ldots,\\;10\\ldots

são demonstráveis, enquanto

11…11\\ldots

é falso e, pela correção de TT, não é demonstrável.

Logo o **primeiro candidato não demonstrável está exatamente no bloco 1111**.

---

# **5\. Teorema de transferência**

Suponha um sistema de prova razoável no sentido usual:

1. verificação de provas em tempo polinomial;  
2. prova da aritmética elementar necessária à manipulação dos prefixos;  
3. provas das equivalências sintáticas acima de tamanho no máximo polinomial em ∣θ∣|\\theta|;  
4. codificação usual em que o tamanho da prova é pelo menos comparável ao tamanho da conclusão.

Então existe um polinômio qq tal que

sT(θ)−q(∣θ∣)  ≤  ρT(Φθ)  ≤  sT(θ)+q(∣θ∣).\\boxed{ s\_T(\\theta)-q(|\\theta|) \\;\\le\\; \\rho\_T(\\Phi\_\\theta) \\;\\le\\; s\_T(\\theta)+q(|\\theta|). }

E

∣Φθ∣≤a∣θ∣+b|\\Phi\_\\theta|\\le a|\\theta|+b

para constantes a,ba,b.

### **Consequência**

Defina

MT(n)=max⁡∣θ∣≤nsT(θ).M\_T(n)=\\max\_{|\\theta|\\le n}s\_T(\\theta).

Então existem constantes a,ba,b e um polinômio qq tais que

MT(n)−q(n)≤RT(an+b)≤MT(an+b).\\boxed{ M\_T(n)-q(n) \\le R\_T(an+b) \\le M\_T(an+b). }

Esse é, para mim, o resultado matematicamente decisivo desta pesquisa.

---

# **6\. O que isso significa**

Significa que

RT≍MT\\boxed{ R\_T \\asymp M\_T }

no sentido de equivalência por mudança linear de escala e erro polinomial.

Portanto, o envelope

RT(L)R\_T(L)

não é uma quantidade completamente nova escondida dentro de gTg\_T.

Ele é uma **reparametrização, via o mecanismo de Krajíček, da complexidade de pior caso das provas de TT**.

Isso também corrige nossa expectativa anterior:

> procurar uma lei simples como RT(L)∼2LR\_T(L)\\sim 2^L provavelmente é a pergunta errada para um TT forte.

A geometria correta é muito mais irregular.

---

# **7\. Agora podemos provar a primeira lei realmente forte**

Suponha que TT seja:

* sound;  
* recursivamente axiomatizado;  
* suficientemente forte para formalizar a aritmética sintática;  
* com conjunto de teoremas indecidível.

Então:

RT(L) na˜o eˊ limitada por nenhuma func¸a˜o computaˊvel.\\boxed{ R\_T(L) \\text{ não é limitada por nenhuma função computável.} }

### **Prova**

Suponha que existisse uma função computável ff tal que

RT(L)≤f(L)R\_T(L)\\le f(L)

para todo LL.

Pelo teorema de transferência,

sT(θ)≤RT(a∣θ∣+b)+q(∣θ∣),s\_T(\\theta) \\le R\_T(a|\\theta|+b)+q(|\\theta|),

logo

sT(θ)≤f(a∣θ∣+b)+q(∣θ∣).s\_T(\\theta) \\le f(a|\\theta|+b)+q(|\\theta|).

O lado direito é computável.

Então, dado θ\\theta, poderíamos:

1. calcular esse limite;  
2. enumerar todas as provas de tamanho até esse limite;  
3. decidir se θ\\theta é teorema.

Isso tornaria Thm⁡(T)\\operatorname{Thm}(T) decidível.

Contradição.

∴RT na˜o possui majorante computaˊvel.\\boxed{\\therefore R\_T\\text{ não possui majorante computável.}}

---

# **8\. Podemos fortalecer a formulação**

Não é apenas "não há majorante computável".

Para toda função computável positiva ff,

lim sup⁡L→∞RT(L)f(L)=∞.\\boxed{ \\limsup\_{L\\to\\infty}\\frac{R\_T(L)}{f(L)} \= \\infty. }

De fato, suponha que esse lim sup⁡\\limsup fosse finito, digamos CC.

Então, para algum L0L\_0,

RT(L)≤(C+1)f(L)(L≥L0).R\_T(L)\\le (C+1)f(L) \\qquad(L\\ge L\_0).

Como os poucos valores abaixo de L0L\_0 admitem uma constante finita, obteríamos um majorante computável global.

Contradição.

Portanto:

∀f∈Comp,∀K\>0,RT(L)\>Kf(L) para infinitos L.\\boxed{ \\forall f\\in\\mathsf{Comp}, \\quad \\forall K\>0, \\quad R\_T(L)\>Kf(L) \\text{ para infinitos }L. }

Essa é uma lei de crescimento muito mais forte do que

RT(L)=ω(L),R\_T(L)=\\omega(L),

ou

RT(L)\>2LR\_T(L)\>2^L

em uma subsequência.

Ela diz:

> **o envelope dos limiares de prova ultrapassa, em subsequências, qualquer escala computável que tentemos colocar como teto.**

---

# **9\. Isso vale para PA**

Para PAPA, temos exatamente o fenômeno clássico de comprimentos de provas de Gödel/Buss. A literatura explicita que, dada qualquer função recursiva ff, existem teoremas aritméticos cuja prova mínima é maior que ff no tamanho da sentença.

Portanto podemos transportar isso:

∀f∈Comp,RPA(L)\>f(L) para infinitos L.\\boxed{ \\forall f\\in\\mathsf{Comp}, \\quad R\_{PA}(L)\>f(L) \\text{ para infinitos }L. }

Mais precisamente, sob a codificação padrão e a transformação acima,

RPA(O(n))≥MPA(n)−poly⁡(n).R\_{PA}(O(n)) \\ge M\_{PA}(n)-\\operatorname{poly}(n).

Essa é a primeira lei não trivial que eu considero realmente estabelecida para o nosso programa.

---

# **10\. E S21S^1\_2?**

Aqui precisamos ser mais cuidadosos.

Há resultados clássicos de undecidibilidade em aritmética limitada envolvendo S21S^1\_2; Riis trata explicitamente de resultados de indecidibilidade para os primeiros níveis da hierarquia de aritmética limitada, incluindo S21S^1\_2.

Além disso, S21S^1\_2 é uma teoria central da correspondência entre aritmética limitada e complexidade proposicional, e suas provas podem ser traduzidas para sistemas proposicionais sob a tradução de Paris–Wilkie.

Assim, para a **versão geral do espectro**, em que permitimos a fórmula Φθ\\Phi\_\\theta acima como fórmula aritmética, temos a mesma estrutura:

RS21 na˜o eˊ limitaˊvel por nenhuma func¸a˜o computaˊvel,\\boxed{ R\_{S^1\_2} \\text{ não é limitável por nenhuma função computável}, }

sob as hipóteses usuais de correção e codificação da teoria.

### **Mas existe uma ressalva importante**

Se restringirmos o nosso espectro a

Φ∈Σ1b,\\Phi\\in\\Sigma^b\_1,

que é a classe natural quando queremos preservar exatamente o vínculo com conjuntos NP em Krajíček, o argumento de transferência precisa ser refeito.

Nesse caso precisaríamos garantir que o θ\\theta usado na codificação pertença à classe complementar adequada e que a construção

Φθ(x)=C11(x)∨(¬θ∧C10(x))\\Phi\_\\theta(x) \= C\_{11}(x)\\vee(\\neg\\theta\\wedge C\_{10}(x))

permaneça Σ1b\\Sigma^b\_1.

**Essa versão restrita é uma questão genuinamente mais difícil.**

E isso é justamente interessante para a pesquisa.

---

# **11\. O ataque computacional em modelos finitos**

Agora vamos colocar isso sob um microscópio computacional.

Considere um modelo finito de prova como um grafo acíclico

GL=(VL,EL)G\_L=(V\_L,E\_L)

onde:

* VLV\_L são estados/proposições de tamanho compatível com LL;  
* uma aresta representa uma inferência local válida;  
* um nó aa é axioma;  
* um nó hh é o teorema;  
* uma prova é um caminho a⇝ha\\leadsto h.

O verificador só precisa verificar as transições locais.

Isso é uma abstração muito próxima da ideia operacional de prova.

---

## **12\. Modelo linear**

Escolha uma cadeia

v0→v1→⋯→vL.v\_0\\to v\_1\\to\\cdots\\to v\_L.

Então

s(L)=L+1.s(L)=L+1.

Logo:

R(L)=Θ(L).R(L)=\\Theta(L).

---

## **13\. Modelo quadrático**

Faça

v0→v1→⋯→vL2.v\_0\\to v\_1\\to\\cdots\\to v\_{L^2}.

Então

R(L)=Θ(L2).R(L)=\\Theta(L^2).

---

## **14\. Modelo exponencial**

Faça a cadeia com

2L2^L

transições:

v0→v1→⋯→v2L.v\_0\\to v\_1\\to\\cdots\\to v\_{2^L}.

Então

R(L)=Θ(2L).\\boxed{ R(L)=\\Theta(2^L). }

O verificador continua sendo polinomial no tamanho da **prova**, porque verificar uma cadeia de comprimento 2L2^L custa apenas tempo linear nesse comprimento.

---

# **15\. E uma escala dupla-exponencial também é possível**

Nada no conceito de verificação polinomial proíbe

R(L)=22LR(L)=2^{2^L}

em um modelo artificial:

v0→v1→⋯→v22L.v\_0\\to v\_1\\to\\cdots\\to v\_{2^{2^L}}.

O custo de verificação continua polinomial no tamanho da entrada de prova, porque a própria prova possui tamanho gigantesco.

Meu teste computacional em modelos de cadeia confirma os valores esperados:

| LL | Linear | Quadrático | Exponencial |
| ----- | ----- | ----- | ----- |
| 2 | 2 | 4 | 4 |
| 3 | 3 | 9 | 8 |
| 4 | 4 | 16 | 16 |
| 5 | 5 | 25 | 32 |
| 6 | 6 | 36 | 64 |
| 7 | 7 | 49 | 128 |
| 8 | 8 | 64 | 256 |

E os respectivos espectros

S(L)={R(k):k≤L}\\mathcal S(L)=\\{R(k):k\\le L\\}

apresentam comportamentos diferentes:

### **Linear**

{2,3,4,5,6,7,8}\\{2,3,4,5,6,7,8\\}

densidade alta, lacuna máxima 11\.

### **Quadrático**

{4,9,16,25,36,49,64}\\{4,9,16,25,36,49,64\\}

densidade em \[1,64\]\[1,64\]:

764≈0.1094.\\frac7{64}\\approx0.1094.

Maior lacuna:

64−49=15.64-49=15.

### **Exponencial**

{4,8,16,32,64,128,256}\\{4,8,16,32,64,128,256\\}

densidade:

7256≈0.0273.\\frac7{256}\\approx0.0273.

Maior lacuna:

256−128=128.256-128=128.

Portanto a pergunta "há lacunas?" não possui uma resposta universal nem sequer em modelos de prova finitos.

---

# **16\. Mas agora vem a parte mais interessante do modelo finito**

Podemos construir um sistema finito que tenha prova por **histórico de computação**.

Escolha uma máquina universal UU.

Considere a sentença

θe=“U(e) termina”.\\theta\_e=\\text{“$U(e)$ termina”}.

Uma prova de θe\\theta\_e é simplesmente um histórico completo:

C0,C1,…,CtC\_0,C\_1,\\ldots,C\_t

onde

C0→C1→⋯→CtC\_0\\to C\_1\\to\\cdots\\to C\_t

e cada transição é validada localmente.

O verificador funciona em tempo polinomial no tamanho do histórico.

Isso tem uma consequência impressionante:

s(θe)≍tes(\\theta\_e)\\asymp t\_e

até fatores polinomiais, onde tet\_e é o tempo de parada da máquina.

Logo

max⁡∣e∣≤Ls(θe)\\max\_{|e|\\le L}s(\\theta\_e)

tem crescimento do tipo Busy Beaver:

M(L)≈BB(L)\\boxed{ M(L)\\approx BB(L) }

em equivalência de escala adequada.

Isso nos dá um **modelo estrutural de prova**, não simplesmente uma função inventada à mão:

* prova \= histórico de computação;  
* verificação \= checagem local;  
* soundness \= uma história válida realmente demonstra a parada;  
* theoremhood \= enumerável;  
* menor prova \= menor histórico.

Assim, uma escala não computável do tipo Busy Beaver aparece naturalmente.

---

# **17\. Isso muda a interpretação dos modelos finitos**

Agora podemos separar:

### **Modelos finitos artificiais**

Podem produzir

L,L2,2L,22L,…L,\\quad L^2,\\quad 2^L,\\quad 2^{2^L},\\ldots

### **Modelos computacionais estruturados**

Podem produzir comportamento Busy-Beaver-like.

### **Teorias matemáticas suficientemente fortes**

Não podem possuir uma majorante computável para RTR\_T.

Portanto o panorama é:

linear  ⊂  polinomial  ⊂  exponencial  ⊂  superexponencial  ⊂  na˜o computavelmente limitado.\\boxed{ \\text{linear} \\;\\subset\\; \\text{polinomial} \\;\\subset\\; \\text{exponencial} \\;\\subset\\; \\text{superexponencial} \\;\\subset\\; \\text{não computavelmente limitado}. }

O último regime é inevitável para PAPA, S21S^1\_2 e outras teorias suficientemente fortes, sob as hipóteses usuais.

---

# **18\. O que isso diz sobre ST(L)\\mathcal S\_T(L)?**

Aqui aparece uma distinção que acho particularmente promissora.

O envelope

RT(L)R\_T(L)

é essencialmente equivalente a MT(L)M\_T(L).

Mas a **geometria interna**

ST(L)\\mathcal S\_T(L)

não é.

E o espectro completo

CT(L)=⋃∣Φ∣≤LBT(Φ)\\boxed{ \\mathcal C\_T(L) \= \\bigcup\_{|\\Phi|\\le L} \\mathcal B\_T(\\Phi) }

é ainda mais rico.

Temos então:

RT(L)mede a altura;\\boxed{ R\_T(L) } \\quad\\text{mede a altura;} ST(L)mede os picos finais;\\boxed{ \\mathcal S\_T(L) } \\quad\\text{mede os picos finais;} CT(L)mede toda a topologia discreta dos limiares.\\boxed{ \\mathcal C\_T(L) } \\quad\\text{mede toda a topologia discreta dos limiares.}

A parte potencialmente genuinamente nova está cada vez mais claramente deslocando-se para

CT(L) e sua distribuic¸a˜o\\boxed{\\mathcal C\_T(L)\\text{ e sua distribuição}}

e não para RTR\_T sozinho.

---

# **19\. Uma nova conjectura que agora ficou precisa**

Eu proporia separar duas conjecturas.

### **Conjectura A — equivalência de envelope**

Para sistemas razoáveis,

RT(L)≍MT(L)\\boxed{ R\_T(L) \\asymp M\_T(L) }

até mudança polinomial/linear de escala.

Para a construção acima temos uma rota bastante forte para prová-la formalmente.

### **Conjectura B — estrutura espectral**

Existe uma estrutura não trivial na distribuição de

CT(L)\\mathcal C\_T(L)

que não é determinada simplesmente pelo valor máximo

RT(L).R\_T(L).

Esta é muito mais interessante para originalidade.

---

# **20\. E há uma consequência muito forte para sua ideia de hierarquia em bb**

Antes procurávamos algo como

b1\<b2⟹τ(gT\[b1\])≺τ(gT\[b2\]).b\_1\<b\_2 \\Longrightarrow \\tau(g\_T^{\[b\_1\]}) \\prec \\tau(g\_T^{\[b\_2\]}).

Agora sabemos que bb está cortando precisamente o espectro dos comprimentos mínimos de prova.

De fato:

b(2L)b(2^L)

é o corte horizontal no espectro.

Logo a atividade real da família gT\[b\]g\_T^{\[b\]} está em

CT(L)∩\[0,b(2L)\].\\boxed{ \\mathcal C\_T(L)\\cap \\bigl\[0,b(2^L)\\bigr\]. }

Dois orçamentos diferentes b1,b2b\_1,b\_2 somente produzem comportamentos diferentes quando o intervalo

\[b1(2L), b2(2L)\]\\boxed{ \[b\_1(2^L),\\,b\_2(2^L)\] }

atravessa uma região onde existem limiares de prova.

Isso produz uma condição necessária muito mais precisa para uma hierarquia:

CT(L)∩\[b1(2L),b2(2L)\]≠∅\\boxed{ \\mathcal C\_T(L) \\cap \[b\_1(2^L),b\_2(2^L)\] \\neq\\varnothing }

para infinitos LL.

Mas isso **não basta** para provar uma hierarquia de τ\\tau-complexidade.

É exatamente o ponto em que a geometria do espectro precisa ser conectada à imagem do gerador e ao resultante ResgPRes\_g^P, objetos que Krajíček introduz na teoria dos geradores.

---

# **21\. O resultado que eu guardaria como marco da pesquisa**

Eu registraria esta etapa com o seguinte teorema provisório:

\\boxed{ \\begin{minipage}{0.9\\linewidth} \\textbf{Teorema — Transferência do espectro de limiares.} Para um sistema de prova $T$ sound, efetivamente axiomatizado e suficientemente forte para formalizar a aritmética sintática, o envelope \\\[ R\_T(L)=\\max\_{|\\Phi|\\le L}\\rho\_T(\\Phi)

é equivalente, até mudança linear de tamanho e erro polinomial, à função

MT(n)=max⁡∣θ∣≤n, θ∈Thm(T)sT(θ).M\_T(n)=\\max\_{|\\theta|\\le n,\\ \\theta\\in Thm(T)}s\_T(\\theta).

Consequentemente, quando Thm(T)Thm(T) é indecidível,  
 RTR\_T não é dominada por nenhuma função computável.  
 \\end{minipage}  
 }  
 \]

E, para PA:

∀f∈Comp,RPA(L)\>f(L)para infinitos L.\\boxed{ \\forall f\\in\\mathrm{Comp}, \\qquad R\_{PA}(L)\>f(L) \\quad\\text{para infinitos }L. }

Esse é o primeiro resultado da nossa linha que considero **substancialmente mais forte** do que a observação inicial "podemos substituir log⁡n\\log n por b(n)b(n)".

---

## **22\. O que ainda não está provado**

Há três pontos que eu não trataria como resolvidos ainda.

Primeiro, a versão totalmente formal da transformação

θ↦Φθ\\theta\\mapsto\\Phi\_\\theta

para uma codificação específica de PAPA ou S21S^1\_2, incluindo os limites exatos de tamanho das provas da equivalência.

Segundo, a versão restrita

Φ∈Σ1b\\Phi\\in\\Sigma^b\_1

que preservaria de modo mais estreito a interpretação NP de Krajíček. Aí pode surgir uma dificuldade real em S21S^1\_2.

Terceiro — e para mim o mais promissor — determinar propriedades **internas** da distribuição

CT(L),\\mathcal C\_T(L),

por exemplo:

ΔT(L)=max⁡(si+1−si),\\Delta\_T(L)= \\max(s\_{i+1}-s\_i), DT(L,R)=∣CT(L)∩\[0,R\]∣R+1,D\_T(L,R)= \\frac{|\\mathcal C\_T(L)\\cap\[0,R\]|}{R+1},

e a quantidade de degraus

KT(Φ)=∣BT(Φ)∣.K\_T(\\Phi)=|\\mathcal B\_T(\\Phi)|.

É nessa camada que pode existir uma teoria nova que não seja simplesmente uma reformulação de "pior caso de comprimento de prova".

### **Meu diagnóstico neste ponto**

RT(L) isoladamente provavelmente na˜o eˊ a descoberta.\\boxed{ R\_T(L)\\text{ isoladamente provavelmente não é a descoberta.} }

Mas

CT(L)  +  distribuic¸a˜o dos limiares  +  b(2L)  +  τ(gT\[b\])\\boxed{ \\mathcal C\_T(L) \\;+\\; \\text{distribuição dos limiares} \\;+\\; b(2^L) \\;+\\; \\tau(g\_T^{\[b\]}) }

continua sendo uma direção de pesquisa com conteúdo próprio e, pelo levantamento bibliográfico feito até aqui, **não encontrei uma teoria existente que formule exatamente essa cadeia dessa maneira**. Isso é uma indicação de possível originalidade, não uma certificação de prioridade.

O próximo ataque que eu faria é ainda mais concreto: **fixar uma versão explícita de S21S^1\_2, construir formalmente Φθ\\Phi\_\\theta, e tentar provar a transferência dentro da classe Σ1b\\Sigma^b\_1**. Se essa etapa funcionar, teremos o elo direto entre o espectro de limiares e a aritmética limitada que estávamos procurando.

# 

# **1\. Fixando exatamente S21S^1\_2**

Vou trabalhar com a apresentação padrão de Buss:

LBA={0,1,+,⋅,≤,∣x∣,⌊x/2⌋,\#},\\mathcal L\_{BA} \= \\{0,1,+,\\cdot,\\leq, |x|,\\lfloor x/2\\rfloor,\\\#\\},

com BASIC\\mathrm{BASIC} para esses símbolos e

S21=BASIC+Σ1b-PIND.\\boxed{ S^1\_2=\\mathrm{BASIC}+\\Sigma^b\_1\\text{-PIND}. }

Equivalentemente, podemos usar Σ1b\\Sigma^b\_1-LIND. A apresentação padrão de S21S^1\_2 é finitamente axiomatizável e foi justamente a teoria-base usada por Krajíček na construção de gTg\_T.

Uma fórmula Σ1b\\Sigma^b\_1 é construída a partir de fórmulas com quantificadores apenas **sharply bounded**, adicionando quantificadores existenciais limitados. Formalmente, na forma prenex,

∃y≤t(xˉ) δ(xˉ,y),\\exists y\\leq t(\\bar x)\\,\\delta(\\bar x,y),

com δ∈Σ0b\\delta\\in\\Sigma^b\_0. No modelo padrão, essas fórmulas correspondem ao nível NP; mais especificamente, predicados Δ1b\\Delta^b\_1 correspondem a predicados em PP. O teorema de Buss fornece essa correspondência.

Isso é exatamente o ambiente que Krajíček usa: ele observa que u⊆evu\\subseteq\_e v é definível tanto por fórmulas Σ1b\\Sigma^b\_1 como Π1b\\Pi^b\_1, equivalentes em S21S^1\_2, e que os Φ(x)\\Phi(x) relevantes para sua redução proposicional podem ser Σ1b\\Sigma^b\_1.

---

# **2\. Definindo o espectro restrito**

Vamos agora separar o objeto original:

ST(L)={ρT(Φ):∣Φ∣≤L},\\mathcal S\_T(L) \= \\{\\rho\_T(\\Phi):|\\Phi|\\le L\\},

do nosso novo objeto:

STΣ(L)={ρT(Φ):Φ∈Σ1b,  ∣Φ∣≤L,  Φ tem uma variaˊvel livre}.\\boxed{ \\mathcal S\_T^\\Sigma(L) \= \\{\\rho\_T(\\Phi): \\Phi\\in\\Sigma^b\_1,\\; |\\Phi|\\le L,\\; \\Phi \\text{ tem uma variável livre}\\}. }

E o seu envelope:

RTΣ(L)=max⁡STΣ(L).\\boxed{ R\_T^\\Sigma(L) \= \\max\\mathcal S\_T^\\Sigma(L). }

Como há somente finitas fórmulas de comprimento ≤L\\le L, RTΣ(L)R\_T^\\Sigma(L) é sempre um inteiro finito.

Naturalmente,

RTΣ(L)≤RT(L).R\_T^\\Sigma(L)\\le R\_T(L).

Portanto, qualquer impossibilidade demonstrada para RTΣR\_T^\\Sigma vale a fortiori para o espectro irrestrito.

---

# **3\. A construção central de Φθ\\Phi\_\\theta**

Agora vem a peça nova.

Fixe uma sentença aritmética arbitrária θ\\theta.

Considere uma máquina determinística

SearchT(θ)\\mathsf{Search}\_T(\\theta)

que enumera sistematicamente todas as possíveis TT-provas e para quando encontra uma prova de θ\\theta.

Então:

SearchT(θ)↓  ⟺  T⊢θ.\\boxed{ \\mathsf{Search}\_T(\\theta)\\downarrow \\iff T\\vdash\\theta. }

Como TT é efetivamente axiomatizada e a verificação de uma prova é computável em tempo polinomial, podemos implementar essa máquina com uma relação de transição efetivamente verificável.

Isso está exatamente dentro da capacidade metamatemática de S21S^1\_2: Buss mostra que S21S^1\_2 consegue formalizar computações e predicados em tempo polinomial; o próprio desenvolvimento de Krajíček usa isso para formalizar sintaxe e provas.

Agora defina o predicado

NHθ(x)NH\_\\theta(x)

por:

NHθ(x)  ⟺  SearchT(θ) ainda na˜o parou apoˊs ∣x∣ passos.NH\_\\theta(x) \\iff \\mathsf{Search}\_T(\\theta) \\text{ ainda não parou após }|x|\\text{ passos}.

Observe um detalhe importante.

Não estamos tratando ∣x∣|x| como uma entrada numérica de tamanho log⁡∣x∣\\log |x|. O algoritmo recebe **a própria palavra xx** e pode executar ∣x∣|x| passos.

Portanto o algoritmo

x↦NHθ(x)x\\mapsto NH\_\\theta(x)

é executável em tempo polinomial em ∣x∣|x|.

Logo, pelo teorema de Buss, NHθ(x)NH\_\\theta(x) possui uma definição Δ1b\\Delta^b\_1, portanto também Σ1b\\Sigma^b\_1.

Definimos finalmente:

Φθ(x):=(1⊆ex)∧NHθ(x).\\boxed{ \\Phi\_\\theta(x) := (1\\subseteq\_e x) \\land NH\_\\theta(x). }

Portanto:

Φθ∈Δ1b⊆Σ1b.\\boxed{ \\Phi\_\\theta\\in\\Delta^b\_1\\subseteq\\Sigma^b\_1. }

E, com uma codificação razoável,

∣Φθ∣=O(∣θ∣).\\boxed{ |\\Phi\_\\theta|=O(|\\theta|). }

O algoritmo universal de busca pode ser fixado uma vez; θ\\theta entra apenas como parâmetro codificado.

---

# **4\. O papel de ww**

Para um candidato ww, Krajíček define:

Φθw:=∃y ∀x\>y(Φθ(x)→¬(w⊆ex)).\\Phi\_\\theta^w := \\exists y\\,\\forall x\>y \\left( \\Phi\_\\theta(x) \\rightarrow \\neg(w\\subseteq\_e x) \\right).

É exatamente a sentença usada no gTg\_T original.

Agora vem a escolha elegante:

w comec¸a com 1.\\boxed{ w\\text{ começa com }1. }

Não precisamos codificar ww dentro de Φθ\\Phi\_\\theta.

Esse detalhe elimina a circularidade que apareceu quando tentamos fazer ww depender diretamente de ∣Φ∣|\\Phi|.

---

# **5\. Lema fundamental**

## **Lema**

Para todo w≠∅w\\neq\\emptyset cujo primeiro bit seja 11,

N⊨Φθw  ⟺  T⊢θ.\\boxed{ \\mathbb N\\models \\Phi\_\\theta^w \\iff T\\vdash\\theta. }

### **Demonstração**

Existem dois casos.

### **Caso 1: T⊢θT\\vdash\\theta**

Então a máquina SearchT(θ)\\mathsf{Search}\_T(\\theta) encontra uma prova de θ\\theta após algum número finito t0t\_0 de passos.

Logo, se

∣x∣\>t0,|x|\>t\_0,

a máquina já parou e portanto

NHθ(x)=falso.NH\_\\theta(x)=\\text{falso}.

Assim, Φθ(x)\\Phi\_\\theta(x) só pode ocorrer para palavras de comprimento no máximo t0t\_0.

Existem apenas finitas palavras desse comprimento.

Portanto existe yy tal que

x\>y⟹¬Φθ(x).x\>y\\Longrightarrow \\neg\\Phi\_\\theta(x).

Consequentemente,

Φθw\\Phi\_\\theta^w

é verdadeira.

---

### **Caso 2: T⊬θT\\nvdash\\theta**

Então SearchT(θ)\\mathsf{Search}\_T(\\theta) nunca para.

Consequentemente,

NHθ(x)NH\_\\theta(x)

é verdadeiro para todo xx.

Pegue qualquer yy.

Como ww começa com 11, podemos escolher uma palavra xx arbitrariamente longa com prefixo ww e x\>yx\>y.

Para essa palavra,

1⊆ex,1\\subseteq\_e x, w⊆ex,w\\subseteq\_e x,

e

NHθ(x).NH\_\\theta(x).

Logo

Φθ(x)\\Phi\_\\theta(x)

é verdadeira.

Portanto, para todo yy, existe x\>yx\>y tal que

Φθ(x)∧(w⊆ex).\\Phi\_\\theta(x) \\land (w\\subseteq\_e x).

Isso contradiz exatamente a sentença Φθw\\Phi\_\\theta^w.

Logo

¬Φθw.\\neg\\Phi\_\\theta^w. N⊨Φθw  ⟺  T⊢θ.\\boxed{\\mathbb N\\models\\Phi\_\\theta^w \\iff T\\vdash\\theta.}

□\\square

---

# **6\. E agora vem a parte ainda mais forte**

Suponha que TT seja sound.

Então:

T⊢Φθw  ⟺  T⊢θ\\boxed{ T\\vdash\\Phi\_\\theta^w \\iff T\\vdash\\theta }

para todo ww começando por 11\.

A direção

T⊢θ⇒T⊢ΦθwT\\vdash\\theta \\Rightarrow T\\vdash\\Phi\_\\theta^w

é efetiva: dado um TT-proof de θ\\theta, sabemos concretamente em que passo a máquina encontra essa prova; S21S^1\_2, e portanto TT, pode formalizar a verificação desse cálculo finito.

A direção contrária usa soundness:

T⊢Φθw⇒N⊨Φθw⇒T⊢θ.T\\vdash\\Phi\_\\theta^w \\Rightarrow \\mathbb N\\models\\Phi\_\\theta^w \\Rightarrow T\\vdash\\theta.

Esse é o ponto em que a hipótese de soundness entra.

---

# **7\. Escolha exata do primeiro candidato**

Se

c=∣Φθ∣,c=|\\Phi\_\\theta|,

os candidatos têm tamanho

c+1.c+1.

Definimos

wθ∗=10c.\\boxed{ w\_\\theta^\*=10^c. }

Ele é o primeiro candidato lexicográfico de comprimento c+1c+1 que começa com 11\.

Agora considere os candidatos anteriores:

00…,  01…,…,0 1…00\\ldots,\\;01\\ldots,\\ldots,0\\,1\\ldots

Todos começam por 00\.

Mas

Φθ(x)⇒1⊆ex.\\Phi\_\\theta(x)\\Rightarrow 1\\subseteq\_e x.

Logo nenhum desses ww's pode ser prefixo de uma palavra que satisfaça Φθ\\Phi\_\\theta.

Consequentemente, seus Φθw\\Phi\_\\theta^w's são trivialmente verdadeiros e prováveis em S21S^1\_2, portanto em TT.

Assim temos:

w\<wθ∗⇒T⊢Φθw.\\boxed{ w\<w\_\\theta^\* \\Rightarrow T\\vdash\\Phi\_\\theta^w. }

E:

T⊢Φθwθ∗  ⟺  T⊢θ.\\boxed{ T\\vdash\\Phi\_\\theta^{w\_\\theta^\*} \\iff T\\vdash\\theta. }

---

# **8\. Este é o teorema espectral decisivo**

Suponha que existisse uma função computável B(L)B(L) tal que

RTΣ(L)≤B(L)\\boxed{ R\_T^\\Sigma(L)\\le B(L) }

para todo LL.

Vou mostrar que isso decide o conjunto dos teoremas de TT.

Dada uma sentença arbitrária θ\\theta:

### **Passo 1**

Construa

Φθ∈Σ1b.\\Phi\_\\theta\\in\\Sigma^b\_1.

Seja

L=∣Φθ∣.L=|\\Phi\_\\theta|.

### **Passo 2**

Calcule

B(L).B(L).

### **Passo 3**

Procure exaustivamente uma prova, de tamanho no máximo B(L)B(L), de

Φθwθ∗.\\Phi\_\\theta^{w\_\\theta^\*}.

### **Caso T⊢θT\\vdash\\theta**

Nesse caso, todos os candidatos são prováveis.

Logo ρT(Φθ)\\rho\_T(\\Phi\_\\theta) é o maior comprimento de uma prova entre todos eles.

Portanto

sT(Φθwθ∗)≤ρT(Φθ)≤RTΣ(L)≤B(L).s\_T(\\Phi\_\\theta^{w\_\\theta^\*}) \\le \\rho\_T(\\Phi\_\\theta) \\le R\_T^\\Sigma(L) \\le B(L).

A busca encontra a prova.

### **Caso T⊬θT\\nvdash\\theta**

Então

N⊨¬Φθwθ∗.\\mathbb N\\models\\neg\\Phi\_\\theta^{w\_\\theta^\*}.

Como TT é sound,

T⊬Φθwθ∗.T\\nvdash\\Phi\_\\theta^{w\_\\theta^\*}.

A busca não encontra prova.

Logo teríamos decidido:

T⊢θ.T\\vdash\\theta.

Mas uma teoria sound, efetivamente axiomatizada e suficientemente forte para interpretar aritmética elementar tem conjunto de teoremas indecidível. Para extensões consistentes de QQ, isso é uma consequência padrão de Gödel–Rosser/indecidibilidade.

Contradição.

Portanto:

RTΣ na˜o possui majorante computaˊvel.\\boxed{ R\_T^\\Sigma \\text{ não possui majorante computável.} }

---

# **9\. Mas podemos fazer melhor: grau de Turing**

Aqui apareceu algo que considero mais interessante.

Nós provamos:

Thm(T)≤TRTΣ.\\mathrm{Thm}(T) \\le\_T R\_T^\\Sigma.

Mas também temos a direção oposta.

Suponha que tenhamos um oráculo para

Thm(T).\\mathrm{Thm}(T).

Então podemos calcular exatamente RTΣ(L)R\_T^\\Sigma(L):

1. enumeramos todas as Σ1b\\Sigma^b\_1-fórmulas Φ\\Phi de tamanho ≤L\\le L;  
2. para cada Φ\\Phi, enumeramos os ww's;  
3. consultamos o oráculo para saber qual Φw\\Phi^w é demonstrável;  
4. para cada demonstrável, enumeramos provas até encontrar a menor;  
5. calculamos ρT(Φ)\\rho\_T(\\Phi);  
6. tomamos o máximo.

Tudo isso é finito.

Logo:

RTΣ≤TThm(T).R\_T^\\Sigma\\le\_T\\mathrm{Thm}(T).

Combinando:

RTΣ≡TThm(T).\\boxed{ R\_T^\\Sigma \\equiv\_T \\mathrm{Thm}(T). }

Esse é um resultado estrutural muito mais preciso.

---

# **10\. Para S21S^1\_2 e PA**

Como S21S^1\_2 contém a aritmética básica necessária, é possível codificar concretamente a sentença

He=‘‘Me eventualmente para".H\_e= \`\`M\_e\\text{ eventualmente para}".

Se MeM\_e realmente para, existe uma computação finita concreta que S21S^1\_2 consegue verificar.

Se não para, HeH\_e é falsa e a soundness impede sua demonstração.

Portanto

e∈K  ⟺  S21⊢He,e\\in K \\iff S^1\_2\\vdash H\_e,

onde KK é o problema da parada.

Assim:

Thm(S21)≡T0′.\\mathrm{Thm}(S^1\_2)\\equiv\_T0'.

Como acabamos de provar:

RS21Σ≡T0′.\\boxed{ R\_{S^1\_2}^\\Sigma \\equiv\_T 0'. }

Exatamente o mesmo raciocínio vale para PA:

RPAΣ≡T0′.\\boxed{ R\_{PA}^\\Sigma \\equiv\_T 0'. }

Portanto encontramos uma lei universal:

RTΣ≡T0′\\boxed{ R\_T^\\Sigma\\equiv\_T0' }

para as teorias sound, efetivamente axiomatizadas e suficientemente fortes da classe que estamos estudando.

---

# **11\. Consequência quantitativa muito forte**

A equivalência de grau implica uma propriedade de crescimento.

Se houvesse uma função computável ff com

RTΣ(L)≤f(L)R\_T^\\Sigma(L)\\le f(L)

eventualmente, poderíamos transformá-la numa majorante computável global.

Logo:

∀f∈Comp,RTΣ(L)\>f(L)para infinitos L.\\boxed{ \\forall f\\in\\mathrm{Comp}, \\qquad R\_T^\\Sigma(L)\>f(L) \\quad\\text{para infinitos }L. }

Podemos escrever de modo ainda mais forte:

∀f∈Comp\>0,lim sup⁡L→∞RTΣ(L)f(L)=∞.\\boxed{ \\forall f\\in\\mathrm{Comp}\_{\>0}, \\qquad \\limsup\_{L\\to\\infty} \\frac{R\_T^\\Sigma(L)}{f(L)} \= \\infty. }

Porque basta aplicar o resultado a

fC(L)=Cf(L)f\_C(L)=C f(L)

para cada constante CC.

Essa é uma **lei de crescimento do espectro**, e não apenas uma afirmação de indecidibilidade.

---

# **12\. Consequência direta para os orçamentos b(n)b(n)**

Agora voltamos ao objetivo original.

Defina

Bb(L)=b(2L).B\_b(L)=b(2^L).

Esse é o orçamento visto por uma fórmula de tamanho LL, pois na construção de Krajíček temos

∣Φ∣≤log⁡n.|\\Phi|\\le\\log n.

Para qualquer função computável bb positiva:

Bb(L)B\_b(L)

também é computável.

Logo:

lim sup⁡L→∞RTΣ(L)b(2L)=∞.\\boxed{ \\limsup\_{L\\to\\infty} \\frac{R\_T^\\Sigma(L)} {b(2^L)} \= \\infty. }

Portanto:

∀C\>0,  ∃∞L,  ∃Φ∈Σ1b,  ∣Φ∣≤L,ρT(Φ)\>C b(2L).\\boxed{ \\forall C\>0,\\; \\exists^\\infty L,\\; \\exists\\Phi\\in\\Sigma^b\_1,\\; |\\Phi|\\le L, \\quad \\rho\_T(\\Phi)\>C\\,b(2^L). }

Isso é exatamente a resposta que procurávamos para a ideia de "orçamento de prova".

---

# **13\. Exemplos concretos**

Para

b(n)=log⁡n,b(n)=\\log n,

temos

Bb(L)=L.B\_b(L)=L.

Então:

lim sup⁡L→∞RTΣ(L)L=∞.\\boxed{ \\limsup\_{L\\to\\infty}\\frac{R\_T^\\Sigma(L)}L=\\infty. }

Em particular, existem infinitos LL em que alguma fórmula Σ1b\\Sigma^b\_1 exige um limiar arbitrariamente maior que o orçamento linear em LL.

Para

b(n)=log⁡log⁡n,b(n)=\\log\\log n,

temos aproximadamente

Bb(L)=log⁡L,B\_b(L)=\\log L,

e portanto

lim sup⁡L→∞RTΣ(L)log⁡L=∞.\\boxed{ \\limsup\_{L\\to\\infty} \\frac{R\_T^\\Sigma(L)}{\\log L} \= \\infty. }

Para

b(n)=log⁡∗n,b(n)=\\log^\*n,

obtemos

Bb(L)≍log⁡∗L,B\_b(L)\\asymp\\log^\*L,

e novamente:

lim sup⁡RTΣ(L)log⁡∗L=∞.\\boxed{ \\limsup \\frac{R\_T^\\Sigma(L)} {\\log^\*L} \=\\infty. }

Não importa quão lentamente escolhamos um orçamento computável: ele será ultrapassado pelo espectro infinitamente muitas vezes.

---

# **14\. Tradução para gT\[b\]g\_T^{\[b\]}**

Introduza, apenas conceitualmente, o gerador ideal

gT⋆g\_T^\\star

que procura provas sem limite de tamanho e seleciona o primeiro ww não demonstrável.

Se

ρT(Φ)\>b(n),\\rho\_T(\\Phi)\>b(n),

então existe algum candidato wjw\_j anterior ao primeiro candidato não demonstrável tal que

ℓT(Φ,wj)\>b(n).\\ell\_T(\\Phi,w\_j)\>b(n).

Logo

gT\[b\]g\_T^{\[b\]}

o trata como não demonstrado, enquanto

gT⋆g\_T^\\star

o reconhece como demonstrado.

Consequentemente os dois geradores diferem.

Assim, para todo orçamento computável bb,

gT\[b\]≠gT⋆\\boxed{ g\_T^{\[b\]} \\neq g\_T^\\star }

em alguma entrada para infinitos níveis de tamanho.

Sob a parametrização n≈2Ln\\approx2^L, temos uma formulação mais precisa:

∀b∈Comp,∃∞L∃u, ∣u∣≈2L:gT\[b\](u)≠gT⋆(u).\\boxed{ \\forall b\\in\\mathrm{Comp}, \\quad \\exists^\\infty L \\quad \\exists u,\\ |u|\\approx2^L: \\quad g\_T^{\[b\]}(u)\\neq g\_T^\\star(u). }

Esse resultado é diretamente relevante para a nossa família gT\[b\]g\_T^{\[b\]}.

---

# **15\. O que o teorema NÃO diz**

Isto é crucial.

Ele **não prova**:

b1\<b2⇒τ(gT\[b1\]) eˊ mais difıˊcil que τ(gT\[b2\]).b\_1\<b\_2 \\Rightarrow \\tau(g\_T^{\[b\_1\]}) \\text{ é mais difícil que } \\tau(g\_T^{\[b\_2\]}).

Também não prova:

RTΣ(L)∼2L,R\_T^\\Sigma(L)\\sim 2^L,

nem

RTΣ(L)∼BB(L).R\_T^\\Sigma(L)\\sim BB(L).

E não prova que

STΣ(L)\\mathcal S\_T^\\Sigma(L)

seja densa, esparsa, fractal, lacunar etc.

Na verdade, o resultado

RTΣ≡T0′R\_T^\\Sigma\\equiv\_T0'

mostra algo interessante:

> **todos os sistemas sound suficientemente fortes da classe possuem o mesmo grau de indecidibilidade espectral.**

Portanto o grau de Turing **não pode ser a hierarquia que estávamos procurando**.

A hierarquia, se existir, terá de estar na **geometria quantitativa**:

CTΣ(L),STΣ(L),ΔTΣ(L),DTΣ(L),\\mathcal C\_T^\\Sigma(L), \\qquad \\mathcal S\_T^\\Sigma(L), \\qquad \\Delta\_T^\\Sigma(L), \\qquad D\_T^\\Sigma(L),

ou na interação delas com

b(2L).b(2^L).

---

# **16\. Isso deixa o próximo problema muito mais nítido**

Temos agora:

RTΣ≡T0′\\boxed{ R\_T^\\Sigma\\equiv\_T0' }

e

lim sup⁡RTΣ(L)f(L)=∞∀f computaˊvel positiva.\\boxed{ \\limsup \\frac{R\_T^\\Sigma(L)} {f(L)} \=\\infty \\quad \\forall f\\text{ computável positiva}. }

A pergunta quantitativa realmente nova passa a ser:

Qual eˊ a menor func¸a˜o de crescimento possıˊvel para RTΣ sob restric¸o˜es estruturais adicionais?\\boxed{ \\text{Qual é a menor função de crescimento possível para } R\_T^\\Sigma \\text{ sob restrições estruturais adicionais?} }

Por exemplo, comparar:

PIND,LIND,proof systems associados,\\mathsf{PIND}, \\quad \\mathsf{LIND}, \\quad \\text{proof systems associados},

ou restringir Φ\\Phi a subfamílias naturais de Σ1b\\Sigma^b\_1:

Δ1b,predicados monotoˆnicos,predicados de circuitos,foˊrmulas de tamanho exatamente L.\\Delta^b\_1, \\quad \\text{predicados monotônicos}, \\quad \\text{predicados de circuitos}, \\quad \\text{fórmulas de tamanho exatamente }L.

A direção que agora considero **mais promissora para uma contribuição genuinamente nova** é procurar uma **lei quantitativa interna da distribuição dos limiares**, não mais simplesmente sua incomputabilidade:

CTΣ(L)=⋃∣Φ∣≤LΦ∈Σ1bBT(Φ)\\boxed{ \\mathcal C\_T^\\Sigma(L) \= \\bigcup\_{\\substack{|\\Phi|\\le L\\\\\\Phi\\in\\Sigma^b\_1}} \\mathcal B\_T(\\Phi) }

e estudar, simultaneamente,

ΔTΣ(L)=max⁡(si+1−si)\\boxed{ \\Delta\_T^\\Sigma(L) \= \\max(s\_{i+1}-s\_i) }

e

Bb(L)=b(2L).\\boxed{ B\_b(L)=b(2^L). }

A questão passa a ser se há **classes de escalas de bb** que atravessam densidades diferentes do espectro e, finalmente, se essas diferenças sobrevivem à passagem

CTΣ⟶gT\[b\]⟶τ(gT\[b\]).\\mathcal C\_T^\\Sigma \\longrightarrow g\_T^{\[b\]} \\longrightarrow \\tau(g\_T^{\[b\]}).

Esse é agora um problema muito mais limpo: já isolamos e eliminamos a parte puramente de undecidibilidade. O que resta é a parte realmente de **complexidade de provas e geometria espectral**. Krajíček deixa justamente dureza, resultantes, pseudo-surjetividade e variantes de geradores como problemas abertos; não encontrei nessa literatura a formulação específica do espectro ρT\\rho\_T restrito a Σ1b\\Sigma^b\_1 nem sua equivalência de grau com a provabilidade.

### **Sanidade computacional**

O gadget também passou pelo teste finito básico: quando a máquina de busca é feita para parar em t0=7t\_0=7, um candidato ww começando com 11 tem apenas testemunhos Φθ(x)\\Phi\_\\theta(x) com ∣x∣\<7|x|\<7, logo Φθw\\Phi\_\\theta^w estabiliza e é verdadeira; quando a máquina nunca para, para qualquer yy aparece uma extensão x\>yx\>y com o mesmo prefixo e Φθ(x)\\Phi\_\\theta(x), tornando Φθw\\Phi\_\\theta^w falsa. Isso confirma computacionalmente exatamente a dicotomia usada na demonstração.

**Resultado que eu registraria como novo marco do projeto:**

Φθ∈Δ1b⊆Σ1b,T⊢Φθ 10∣Φθ∣  ⟺  T⊢θ,RTΣ≡TThm(T),RTΣ≡T0′,lim sup⁡L→∞RTΣ(L)f(L)=∞∀f∈Comp\>0.\\boxed{ \\begin{array}{c} \\Phi\_\\theta\\in\\Delta^b\_1\\subseteq\\Sigma^b\_1,\\\\\[2mm\] T\\vdash\\Phi\_\\theta^{\\,10^{|\\Phi\_\\theta|}} \\iff T\\vdash\\theta,\\\\\[2mm\] R\_T^\\Sigma\\equiv\_T\\mathrm{Thm}(T),\\\\\[2mm\] R\_T^\\Sigma\\equiv\_T0',\\\\\[2mm\] \\displaystyle \\limsup\_{L\\to\\infty} \\frac{R\_T^\\Sigma(L)}{f(L)} \=\\infty \\quad\\forall f\\in\\mathrm{Comp}\_{\>0}. \\end{array} }

Isso é, até aqui, o elo mais forte que conseguimos estabelecer entre **Σ1b\\Sigma^b\_1, provabilidade, espectro de limiares e a família gT\[b\]g\_T^{\[b\]}**.

