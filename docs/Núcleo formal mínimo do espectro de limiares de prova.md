# **Núcleo formal mínimo do espectro de limiares de prova**

A seguir construo uma versão autocontida e matematicamente rigorosa do núcleo formal solicitado. Para evitar importar ambiguidades da codificação original, separo o **mecanismo matemático essencial** da implementação concreta do gerador de Krajíček. As definições poderão depois ser especializadas para a codificação exata adotada no projeto. O desenvolvimento parte das ideias registradas em [desenv. logica kubricek leis](../proofs/desenv.%20logica%20kubricek%20leis.md), mas corrige notação, casos de fronteira e dependências lógicas. [arquivo local](../proofs/desenv.%20logica%20kubricek%20leis.md)

---

## **0\. Convenções e estrutura geral**

Fixamos:

* uma linguagem formal L\\mathcal LL;  
* uma teoria TTT na linguagem L\\mathcal LL;  
* uma codificação binária efetiva de fórmulas, sentenças e provas;  
* uma função de comprimento ∣⋅∣|\\cdot|∣⋅∣;  
* uma relação de prova Prf⁡T(π,θ),\\operatorname{Prf}\_T(\\pi,\\theta),PrfT​(π,θ), significando que π\\piπ codifica uma prova em TTT da sentença θ\\thetaθ;  
* uma ordem lexicográfica \<lex\<\_{\\mathrm{lex}}\<lex​ nas palavras binárias;  
* uma relação de prefixo binário, denotada por w⪯ex.w\\preceq\_e x.w⪯e​x.

Para uma fórmula Φ(x)\\Phi(x)Φ(x) com uma variável livre e uma palavra binária www, definimos a sentença:

Φw:=∃y ∀x\>y (Φ(x)→¬(w⪯ex)).\\boxed{ \\Phi^w := \\exists y\\, \\forall x\>y\\, \\bigl( \\Phi(x)\\rightarrow \\neg(w\\preceq\_e x) \\bigr). }Φw:=∃y∀x\>y(Φ(x)→¬(w⪯e​x)).​

Intuitivamente, Φw\\Phi^wΦw afirma que, a partir de certo ponto, nenhum elemento que satisfaz Φ\\PhiΦ possui www como prefixo.

A teoria desenvolvida abaixo é principalmente **sintática**. Não identificaremos:

T⊬θT\\nvdash\\thetaT⊬θ

com:

N⊨¬θ.\\mathbb N\\models\\neg\\theta.N⊨¬θ.

Essa distinção será fundamental.

---

# **1\. Definição do gerador gT\[b\]g\_T^{\[b\]}gT\[b\]​**

## **1.1 Função de orçamento**

Uma função de orçamento é uma função total:

b:N⟶N.b:\\mathbb N\\longrightarrow\\mathbb N.b:N⟶N.

O valor b(n)b(n)b(n) será o maior comprimento de prova pesquisado em entradas de tamanho nnn.

Não é necessário, para os resultados locais, que bbb seja crescente. Entretanto, para resultados assintóticos posteriores, será conveniente assumir que bbb é:

1. computável;  
2. não decrescente;  
3. ilimitada: lim⁡n→∞b(n)=∞.\\lim\_{n\\to\\infty}b(n)=\\infty.n→∞lim​b(n)=∞.

---

## **1.2 Separação entre núcleo seletor e codificação externa**

O mecanismo relevante do gerador é o seguinte.

Para cada fórmula admissível Φ(x)\\Phi(x)Φ(x), fixamos um comprimento de candidato:

q(Φ)∈N\>0.q(\\Phi)\\in\\mathbb N\_{\>0}.q(Φ)∈N\>0​.

O conjunto ordenado de candidatos é:

WΦ={0,1}q(Φ)={w0\<lexw1\<lex⋯\<lexwkΦ−1},W\_\\Phi \= \\{0,1\\}^{q(\\Phi)} \= \\{w\_0\<\_{\\mathrm{lex}}w\_1\<\_{\\mathrm{lex}}\\cdots\<\_{\\mathrm{lex}}w\_{k\_\\Phi-1}\\},WΦ​={0,1}q(Φ)={w0​\<lex​w1​\<lex​⋯\<lex​wkΦ​−1​},

onde:

kΦ=2q(Φ).k\_\\Phi=2^{q(\\Phi)}.kΦ​=2q(Φ).

A função q(Φ)q(\\Phi)q(Φ) deve ser determinada pela codificação concreta do gerador. Este núcleo não depende de escolher imediatamente entre, por exemplo,

q(Φ)=∣Φ∣+1q(\\Phi)=|\\Phi|+1q(Φ)=∣Φ∣+1

ou

q(Φ)=∣Φ∣+2.q(\\Phi)=|\\Phi|+2.q(Φ)=∣Φ∣+2.

Essa escolha deverá ser fixada quando reconstruirmos exatamente a versão original usada no projeto.

---

## **1.3 Predicado de prova limitada**

Para c∈Nc\\in\\mathbb Nc∈N, definimos:

Prov⁡T,≤c(θ)⟺∃π (∣π∣≤c∧Prf⁡T(π,θ)).\\operatorname{Prov}\_{T,\\leq c}(\\theta) \\quad\\Longleftrightarrow\\quad \\exists\\pi\\, \\bigl( |\\pi|\\leq c \\land \\operatorname{Prf}\_T(\\pi,\\theta) \\bigr).ProvT,≤c​(θ)⟺∃π(∣π∣≤c∧PrfT​(π,θ)).

Para entrada de tamanho nnn, o orçamento é c=b(n)c=b(n)c=b(n).

O índice selecionado por Φ\\PhiΦ e orçamento ccc é:

JT,Φ(c):=min⁡{j\<kΦ:¬Prov⁡T,≤c(Φwj)}.\\boxed{ J\_{T,\\Phi}(c) := \\min \\left\\{ j\<k\_\\Phi: \\neg\\operatorname{Prov}\_{T,\\leq c}(\\Phi^{w\_j}) \\right\\}. }JT,Φ​(c):=min{j\<kΦ​:¬ProvT,≤c​(Φwj​)}.​

Se o conjunto for vazio, adotamos:

JT,Φ(c):=kΦ.J\_{T,\\Phi}(c):=k\_\\Phi.JT,Φ​(c):=kΦ​.

Assim:

* JT,Φ(c)=j\<kΦJ\_{T,\\Phi}(c)=j\<k\_\\PhiJT,Φ​(c)=j\<kΦ​ significa que wjw\_jwj​ é o primeiro candidato para o qual não foi encontrada prova de comprimento ≤c\\leq c≤c;  
* JT,Φ(c)=kΦJ\_{T,\\Phi}(c)=k\_\\PhiJT,Φ​(c)=kΦ​ significa que todos os candidatos possuem alguma prova de comprimento ≤c\\leq c≤c.

---

## **1.4 Definição abstrata completa**

Para cada nnn, supomos determinadas três funções de codificação:

Form⁡n:{0,1}n⇀Form1,\\operatorname{Form}\_n:\\{0,1\\}^n\\rightharpoonup\\mathsf{Form}\_1,Formn​:{0,1}n⇀Form1​, Tail⁡n:{0,1}n⟶{0,1}∗,\\operatorname{Tail}\_n:\\{0,1\\}^n\\longrightarrow\\{0,1\\}^\*,Tailn​:{0,1}n⟶{0,1}∗,

e

Out⁡n:{0,1}n×(WΦ∪{⊥})⟶{0,1}n+1.\\operatorname{Out}\_n: \\{0,1\\}^n\\times \\bigl(W\_\\Phi\\cup\\{\\bot\\}\\bigr) \\longrightarrow \\{0,1\\}^{n+1}.Outn​:{0,1}n×(WΦ​∪{⊥})⟶{0,1}n+1.

Aqui:

* Form⁡n(u)=Φ\\operatorname{Form}\_n(u)=\\PhiFormn​(u)=Φ extrai a fórmula codificada na entrada;  
* Tail⁡n(u)\\operatorname{Tail}\_n(u)Tailn​(u) representa os bits restantes;  
* Out⁡n\\operatorname{Out}\_nOutn​ monta a saída;  
* ⊥\\bot⊥ representa o caso em que todos os candidatos passaram no teste.

Quando Form⁡n(u)=Φ\\operatorname{Form}\_n(u)=\\PhiFormn​(u)=Φ, definimos:

gT,n\[b\](u)={Out⁡n(u,wj),j=JT,Φ(b(n))\<kΦ,Out⁡n(u,⊥),JT,Φ(b(n))=kΦ.g\_{T,n}^{\[b\]}(u) \= \\begin{cases} \\operatorname{Out}\_n(u,w\_j), & j=J\_{T,\\Phi}(b(n))\<k\_\\Phi, \\\\\[2mm\] \\operatorname{Out}\_n(u,\\bot), & J\_{T,\\Phi}(b(n))=k\_\\Phi. \\end{cases}gT,n\[b\]​(u)=⎩⎨⎧​Outn​(u,wj​),Outn​(u,⊥),​j=JT,Φ​(b(n))\<kΦ​,JT,Φ​(b(n))=kΦ​.​

Se nenhuma fórmula válida for extraída, usa-se uma saída padrão fixada pela codificação, por exemplo:

gT,n\[b\](u)=0n+1.g\_{T,n}^{\[b\]}(u)=0^{n+1}.gT,n\[b\]​(u)=0n+1.

Portanto:

gT\[b\]=⋃n≥1gT,n\[b\].\\boxed{ g\_T^{\[b\]} \= \\bigcup\_{n\\geq 1}g\_{T,n}^{\[b\]}. }gT\[b\]​=n≥1⋃​gT,n\[b\]​.​

O núcleo pesquisado pelo projeto é o seletor:

Φ,c⟼JT,Φ(c).\\boxed{ \\Phi,c\\longmapsto J\_{T,\\Phi}(c). }Φ,c⟼JT,Φ​(c).​

Os teoremas locais abaixo dependem desse seletor, e não dos detalhes particulares de Out⁡n\\operatorname{Out}\_nOutn​.

---

# **2\. Definição de ℓT(Φ,w)\\ell\_T(\\Phi,w)ℓT​(Φ,w)**

Para uma fórmula Φ(x)\\Phi(x)Φ(x) e um candidato w∈WΦw\\in W\_\\Phiw∈WΦ​, definimos o comprimento mínimo de prova:

ℓT(Φ,w):=min⁡{∣π∣:Prf⁡T(π,Φw)}.\\boxed{ \\ell\_T(\\Phi,w) := \\min \\left\\{ |\\pi|: \\operatorname{Prf}\_T(\\pi,\\Phi^w) \\right\\}. }ℓT​(Φ,w):=min{∣π∣:PrfT​(π,Φw)}.​

Quando não existe prova em TTT de Φw\\Phi^wΦw, definimos:

ℓT(Φ,w):=∞.\\boxed{ \\ell\_T(\\Phi,w):=\\infty. }ℓT​(Φ,w):=∞.​

Assim:

ℓT(Φ,w)∈N∪{∞}.\\ell\_T(\\Phi,w)\\in\\mathbb N\\cup\\{\\infty\\}.ℓT​(Φ,w)∈N∪{∞}.

A propriedade fundamental é:

Prov⁡T,≤c(Φw)⟺ℓT(Φ,w)≤c.\\operatorname{Prov}\_{T,\\leq c}(\\Phi^w) \\quad\\Longleftrightarrow\\quad \\ell\_T(\\Phi,w)\\leq c.ProvT,≤c​(Φw)⟺ℓT​(Φ,w)≤c.

Logo:

JT,Φ(c)=min⁡{j\<kΦ:ℓT(Φ,wj)\>c},J\_{T,\\Phi}(c) \= \\min \\left\\{ j\<k\_\\Phi: \\ell\_T(\\Phi,w\_j)\>c \\right\\},JT,Φ​(c)=min{j\<kΦ​:ℓT​(Φ,wj​)\>c},

com o valor kΦk\_\\PhikΦ​ quando o conjunto é vazio.

---

## **2.1 Perfil de comprimentos mínimos**

Definimos:

LT(Φ)=(ℓT(Φ,w0),ℓT(Φ,w1),…,ℓT(Φ,wkΦ−1)).\\boxed{ \\mathbf L\_T(\\Phi) \= \\bigl( \\ell\_T(\\Phi,w\_0), \\ell\_T(\\Phi,w\_1), \\ldots, \\ell\_T(\\Phi,w\_{k\_\\Phi-1}) \\bigr). }LT​(Φ)=(ℓT​(Φ,w0​),ℓT​(Φ,w1​),…,ℓT​(Φ,wkΦ​−1​)).​

Esse vetor finito determina completamente o comportamento do seletor:

c⟼JT,Φ(c).c\\longmapsto J\_{T,\\Phi}(c).c⟼JT,Φ​(c).

---

# **3\. Definição de ρT(Φ)\\rho\_T(\\Phi)ρT​(Φ)**

## **3.1 Primeiro candidato não demonstrável**

Definimos:

jT∗(Φ):=min⁡{j\<kΦ:ℓT(Φ,wj)=∞},j\_T^\*(\\Phi) := \\min \\left\\{ j\<k\_\\Phi: \\ell\_T(\\Phi,w\_j)=\\infty \\right\\},jT∗​(Φ):=min{j\<kΦ​:ℓT​(Φ,wj​)=∞},

quando esse conjunto é não vazio.

Se todos os candidatos são demonstráveis, adotamos:

jT∗(Φ):=kΦ.j\_T^\*(\\Phi):=k\_\\Phi.jT∗​(Φ):=kΦ​.

Portanto:

jT∗(Φ)∈{0,…,kΦ}.j\_T^\*(\\Phi)\\in\\{0,\\ldots,k\_\\Phi\\}.jT∗​(Φ)∈{0,…,kΦ​}.

---

## **3.2 Definição do limiar final**

Definimos:

ρT(Φ):=max⁡0≤j\<jT∗(Φ)ℓT(Φ,wj).\\boxed{ \\rho\_T(\\Phi) := \\max\_{0\\leq j\<j\_T^\*(\\Phi)} \\ell\_T(\\Phi,w\_j). }ρT​(Φ):=0≤j\<jT∗​(Φ)max​ℓT​(Φ,wj​).​

Adotamos a convenção:

max⁡∅=0.\\max\\varnothing=0.max∅=0.

Consequentemente:

* se jT∗(Φ)=0j\_T^\*(\\Phi)=0jT∗​(Φ)=0, então ρT(Φ)=0;\\rho\_T(\\Phi)=0;ρT​(Φ)=0;  
* se 0\<jT∗(Φ)\<kΦ0\<j\_T^\*(\\Phi)\<k\_\\Phi0\<jT∗​(Φ)\<kΦ​, então ρT(Φ)\\rho\_T(\\Phi)ρT​(Φ) é o maior comprimento mínimo de prova anterior ao primeiro candidato não demonstrável;  
* se jT∗(Φ)=kΦj\_T^\*(\\Phi)=k\_\\PhijT∗​(Φ)=kΦ​, então: ρT(Φ)=max⁡j\<kΦℓT(Φ,wj).\\rho\_T(\\Phi) \= \\max\_{j\<k\_\\Phi}\\ell\_T(\\Phi,w\_j).ρT​(Φ)=j\<kΦ​max​ℓT​(Φ,wj​).

Em todos os casos:

ρT(Φ)∈N.\\rho\_T(\\Phi)\\in\\mathbb N.ρT​(Φ)∈N.

Isso ocorre porque o máximo é tomado apenas sobre coordenadas finitas.

---

# **4\. Definição de BT(Φ)\\mathcal B\_T(\\Phi)BT​(Φ)**

O valor ρT(Φ)\\rho\_T(\\Phi)ρT​(Φ) registra somente o último limiar necessário para a estabilização. Para registrar todas as transições, precisamos dos recordes prefixais.

## **4.1 Índices de recorde**

Definimos:

IT(Φ):={j\<jT∗(Φ):ℓT(Φ,wj)\>max⁡i\<jℓT(Φ,wi)}.\\boxed{ \\mathcal I\_T(\\Phi) := \\left\\{ j\<j\_T^\*(\\Phi): \\ell\_T(\\Phi,w\_j)\> \\max\_{i\<j}\\ell\_T(\\Phi,w\_i) \\right\\}. }IT​(Φ):={j\<jT∗​(Φ):ℓT​(Φ,wj​)\>i\<jmax​ℓT​(Φ,wi​)}.​

Para j=0j=0j=0, adotamos:

max⁡i\<0ℓT(Φ,wi):=−1.\\max\_{i\<0}\\ell\_T(\\Phi,w\_i):=-1.i\<0max​ℓT​(Φ,wi​):=−1.

Como os comprimentos de prova são não negativos, 000 é um índice de recorde sempre que jT∗(Φ)\>0j\_T^\*(\\Phi)\>0jT∗​(Φ)\>0.

---

## **4.2 Escada de limiares**

Definimos:

BT(Φ):={ℓT(Φ,wj):j∈IT(Φ)}.\\boxed{ \\mathcal B\_T(\\Phi) := \\left\\{ \\ell\_T(\\Phi,w\_j): j\\in\\mathcal I\_T(\\Phi) \\right\\}. }BT​(Φ):={ℓT​(Φ,wj​):j∈IT​(Φ)}.​

Os elementos de BT(Φ)\\mathcal B\_T(\\Phi)BT​(Φ) são chamados de **limiares efetivos de transição** ou **recordes espectrais**.

Se:

IT(Φ)={i0\<i1\<⋯\<ir},\\mathcal I\_T(\\Phi) \= \\{i\_0\<i\_1\<\\cdots\<i\_r\\},IT​(Φ)={i0​\<i1​\<⋯\<ir​},

então:

ℓT(Φ,wi0)\<ℓT(Φ,wi1)\<⋯\<ℓT(Φ,wir).\\ell\_T(\\Phi,w\_{i\_0}) \< \\ell\_T(\\Phi,w\_{i\_1}) \< \\cdots \< \\ell\_T(\\Phi,w\_{i\_r}).ℓT​(Φ,wi0​​)\<ℓT​(Φ,wi1​​)\<⋯\<ℓT​(Φ,wir​​).

Quando BT(Φ)≠∅\\mathcal B\_T(\\Phi)\\neq\\varnothing:

ρT(Φ)=max⁡BT(Φ).\\boxed{ \\rho\_T(\\Phi)=\\max\\mathcal B\_T(\\Phi). }ρT​(Φ)=maxBT​(Φ).​

Se jT∗(Φ)=0j\_T^\*(\\Phi)=0jT∗​(Φ)=0, então:

BT(Φ)=∅,ρT(Φ)=0.\\mathcal B\_T(\\Phi)=\\varnothing, \\qquad \\rho\_T(\\Phi)=0.BT​(Φ)=∅,ρT​(Φ)=0.

---

# **5\. Teorema de estabilização local**

## **Teorema 5.1**

Sejam Φ\\PhiΦ uma fórmula admissível e c∈Nc\\in\\mathbb Nc∈N. Se:

c≥ρT(Φ),c\\geq\\rho\_T(\\Phi),c≥ρT​(Φ),

então:

JT,Φ(c)=jT∗(Φ).\\boxed{ J\_{T,\\Phi}(c)=j\_T^\*(\\Phi). }JT,Φ​(c)=jT∗​(Φ).​

Em particular, para uma entrada u∈{0,1}nu\\in\\{0,1\\}^nu∈{0,1}n que codifica Φ\\PhiΦ, se:

b(n)≥ρT(Φ),b(n)\\geq\\rho\_T(\\Phi),b(n)≥ρT​(Φ),

então gT\[b\](u)g\_T^{\[b\]}(u)gT\[b\]​(u) usa o primeiro candidato realmente não demonstrável, ou a saída ⊥\\bot⊥ quando todos os candidatos são demonstráveis.

---

## **Demonstração**

Considere inicialmente:

jT∗(Φ)\<kΦ.j\_T^\*(\\Phi)\<k\_\\Phi.jT∗​(Φ)\<kΦ​.

Para todo j\<jT∗(Φ)j\<j\_T^\*(\\Phi)j\<jT∗​(Φ), pela definição de ρT(Φ)\\rho\_T(\\Phi)ρT​(Φ):

ℓT(Φ,wj)≤ρT(Φ)≤c.\\ell\_T(\\Phi,w\_j) \\leq \\rho\_T(\\Phi) \\leq c.ℓT​(Φ,wj​)≤ρT​(Φ)≤c.

Logo:

Prov⁡T,≤c(Φwj).\\operatorname{Prov}\_{T,\\leq c}(\\Phi^{w\_j}).ProvT,≤c​(Φwj​).

Portanto, nenhum índice j\<jT∗(Φ)j\<j\_T^\*(\\Phi)j\<jT∗​(Φ) pode ser selecionado por JT,Φ(c)J\_{T,\\Phi}(c)JT,Φ​(c).

No índice jT∗(Φ)j\_T^\*(\\Phi)jT∗​(Φ), temos:

ℓT(Φ,wjT∗(Φ))=∞.\\ell\_T(\\Phi,w\_{j\_T^\*(\\Phi)})=\\infty.ℓT​(Φ,wjT∗​(Φ)​)=∞.

Assim:

ℓT(Φ,wjT∗(Φ))\>c,\\ell\_T(\\Phi,w\_{j\_T^\*(\\Phi)})\>c,ℓT​(Φ,wjT∗​(Φ)​)\>c,

e, consequentemente:

JT,Φ(c)=jT∗(Φ).J\_{T,\\Phi}(c)=j\_T^\*(\\Phi).JT,Φ​(c)=jT∗​(Φ).

Agora suponha:

jT∗(Φ)=kΦ.j\_T^\*(\\Phi)=k\_\\Phi.jT∗​(Φ)=kΦ​.

Nesse caso, todos os candidatos são demonstráveis e:

ρT(Φ)=max⁡j\<kΦℓT(Φ,wj).\\rho\_T(\\Phi) \= \\max\_{j\<k\_\\Phi}\\ell\_T(\\Phi,w\_j).ρT​(Φ)=j\<kΦ​max​ℓT​(Φ,wj​).

Se c≥ρT(Φ)c\\geq\\rho\_T(\\Phi)c≥ρT​(Φ), então para todo j\<kΦj\<k\_\\Phij\<kΦ​:

ℓT(Φ,wj)≤c.\\ell\_T(\\Phi,w\_j)\\leq c.ℓT​(Φ,wj​)≤c.

Portanto o conjunto:

{j\<kΦ:ℓT(Φ,wj)\>c}\\{j\<k\_\\Phi:\\ell\_T(\\Phi,w\_j)\>c\\}{j\<kΦ​:ℓT​(Φ,wj​)\>c}

é vazio. Pela convenção adotada:

JT,Φ(c)=kΦ=jT∗(Φ).J\_{T,\\Phi}(c)=k\_\\Phi=j\_T^\*(\\Phi).JT,Φ​(c)=kΦ​=jT∗​(Φ).

Isso conclui a demonstração. □\\square□

---

## **Corolário 5.2: convergência local**

Se b:N→Nb:\\mathbb N\\to\\mathbb Nb:N→N satisfaz:

b(n)⟶∞,b(n)\\longrightarrow\\infty,b(n)⟶∞,

então, para toda fórmula fixa Φ\\PhiΦ, existe NΦ,bN\_{\\Phi,b}NΦ,b​ tal que:

n≥NΦ,b⟹b(n)≥ρT(Φ).n\\geq N\_{\\Phi,b} \\quad\\Longrightarrow\\quad b(n)\\geq\\rho\_T(\\Phi).n≥NΦ,b​⟹b(n)≥ρT​(Φ).

Consequentemente, em todas as entradas suficientemente longas que codificam essa mesma fórmula:

JT,Φ(b(n))=jT∗(Φ).J\_{T,\\Phi}(b(n))=j\_T^\*(\\Phi).JT,Φ​(b(n))=jT∗​(Φ).

Portanto, nenhuma diferença assintótica persistente entre orçamentos ilimitados pode ser testemunhada por uma única fórmula fixa. Essa conclusão já havia sido identificada no estudo e agora segue formalmente do teorema. [arquivo local](../proofs/desenv.%20logica%20kubricek%20leis.md)

---

# **6\. Teorema de caracterização das transições**

A função:

c⟼JT,Φ(c)c\\longmapsto J\_{T,\\Phi}(c)c⟼JT,Φ​(c)

é uma função em escada.

## **Lema 6.1: monotonicidade**

Se:

c1≤c2,c\_1\\leq c\_2,c1​≤c2​,

então:

JT,Φ(c1)≤JT,Φ(c2).\\boxed{ J\_{T,\\Phi}(c\_1)\\leq J\_{T,\\Phi}(c\_2). }JT,Φ​(c1​)≤JT,Φ​(c2​).​

### **Demonstração**

Se um candidato possui prova de comprimento ≤c1\\leq c\_1≤c1​, então também possui prova de comprimento ≤c2\\leq c\_2≤c2​. Aumentar o orçamento não pode fazer o primeiro candidato não reconhecido mover-se para a esquerda. □\\square□

---

## **Teorema 6.2: caracterização exata das transições unitárias**

Para todo inteiro r≥1r\\geq 1r≥1:

JT,Φ(r−1)≠JT,Φ(r)⟺r∈BT(Φ).\\boxed{ J\_{T,\\Phi}(r-1)\\neq J\_{T,\\Phi}(r) \\quad\\Longleftrightarrow\\quad r\\in\\mathcal B\_T(\\Phi). }

### **Demonstração: direção direta**

Suponha:

JT,Φ(r−1)≠JT,Φ(r).J\_{T,\\Phi}(r-1)\\neq J\_{T,\\Phi}(r).

Seja:

j=JT,Φ(r−1).j=J\_{T,\\Phi}(r-1).j=JT,Φ​(r−1).

Então:

ℓT(Φ,wj)\>r−1.\\ell\_T(\\Phi,w\_j)\>r-1.ℓT​(Φ,wj​)\>r−1.

Como o índice muda no orçamento rrr, o candidato wjw\_jwj​ passa a ser aceito nesse orçamento. Logo:

ℓT(Φ,wj)≤r.\\ell\_T(\\Phi,w\_j)\\leq r.ℓT​(Φ,wj​)≤r.

Como o comprimento é inteiro:

ℓT(Φ,wj)=r.\\ell\_T(\\Phi,w\_j)=r.ℓT​(Φ,wj​)=r.

Além disso, todos os índices i\<ji\<ji\<j já eram aceitos com orçamento r−1r-1r−1. Portanto:

ℓT(Φ,wi)≤r−1\<r\\ell\_T(\\Phi,w\_i)\\leq r-1\<rℓT​(Φ,wi​)≤r−1\<r

para todo i\<ji\<ji\<j.

Assim:

ℓT(Φ,wj)\>max⁡i\<jℓT(Φ,wi),\\ell\_T(\\Phi,w\_j)\> \\max\_{i\<j}\\ell\_T(\\Phi,w\_i),ℓT​(Φ,wj​)\>i\<jmax​ℓT​(Φ,wi​),

e jjj é um índice de recorde. Portanto:

r∈BT(Φ).r\\in\\mathcal B\_T(\\Phi).r∈BT​(Φ).

### **Demonstração: direção inversa**

Suponha:

r∈BT(Φ).r\\in\\mathcal B\_T(\\Phi).r∈BT​(Φ).

Então existe j\<jT∗(Φ)j\<j\_T^\*(\\Phi)j\<jT∗​(Φ) tal que:

ℓT(Φ,wj)=r\\ell\_T(\\Phi,w\_j)=rℓT​(Φ,wj​)=r

e:

ℓT(Φ,wi)\<r\\ell\_T(\\Phi,w\_i)\<rℓT​(Φ,wi​)\<r

para todo i\<ji\<ji\<j.

Com orçamento r−1r-1r−1, todos os candidatos anteriores são aceitos, mas wjw\_jwj​ não é:

JT,Φ(r−1)=j.J\_{T,\\Phi}(r-1)=j.JT,Φ​(r−1)=j.

Com orçamento rrr, wjw\_jwj​ passa a ser demonstrável dentro do limite:

ℓT(Φ,wj)≤r.\\ell\_T(\\Phi,w\_j)\\leq r.ℓT​(Φ,wj​)≤r.

Logo o primeiro candidato rejeitado passa a ter índice estritamente maior que jjj, ou todos os candidatos passam. Assim:


JT,Φ(r)≠JT,Φ(r−1).J\_{T,\\Phi}(r)\\neq J\_{T,\\Phi}(r-1).

Isso conclui a prova. □\\square□

---

## **Teorema 6.3: caracterização em intervalos**

Para quaisquer c1,c2∈Nc\_1,c\_2\\in\\mathbb Nc1​,c2​∈N, com c1≤c2c\_1\\leq c\_2c1​≤c2​:

JT,Φ(c1)≠JT,Φ(c2)⟺BT(Φ)∩(c1,c2\]≠∅.\\boxed{ J\_{T,\\Phi}(c\_1)\\neq J\_{T,\\Phi}(c\_2) \\quad\\Longleftrightarrow\\quad \\mathcal B\_T(\\Phi)\\cap(c\_1,c\_2\]\\neq\\varnothing. }

### **Justificativa**

Pelo Teorema 6.2, a função seletora somente muda nos valores pertencentes a BT(Φ)\\mathcal B\_T(\\Phi)BT​(Φ). Como ela é não decrescente, os valores nos extremos são diferentes exatamente quando ao menos um limiar efetivo é atravessado.

---

## **Observação importante**

O conjunto completo:

{ℓT(Φ,wj):j\<jT∗(Φ)}\\{ \\ell\_T(\\Phi,w\_j): j\<j\_T^\*(\\Phi) \\}{ℓT​(Φ,wj​):j\<jT∗​(Φ)}

pode conter valores que não produzem transição alguma.

Por exemplo:

LT(Φ)=(2,10,7,∞).\\mathbf L\_T(\\Phi)=(2,10,7,\\infty).LT​(Φ)=(2,10,7,∞).

Nesse caso:

BT(Φ)={2,10},\\mathcal B\_T(\\Phi)=\\{2,10\\},BT​(Φ)={2,10},

e o valor 777 não modifica o índice selecionado, pois o candidato de comprimento mínimo 101010 já bloqueia a busca antes dele.

---

# **7\. Corolário para comparação entre dois orçamentos**

Sejam:

b1,b2:N→Nb\_1,b\_2:\\mathbb N\\to\\mathbb Nb1​,b2​:N→N

tais que:

b1(n)≤b2(n).b\_1(n)\\leq b\_2(n).b1​(n)≤b2​(n).

## **Corolário 7.1: comparação local exata**

Para uma entrada de tamanho nnn que codifica a fórmula Φ\\PhiΦ:

JT,Φ(b1(n))≠JT,Φ(b2(n))\\boxed{ J\_{T,\\Phi}(b\_1(n)) \\neq J\_{T,\\Phi}(b\_2(n)) }

se, e somente se:

BT(Φ)∩(b1(n),b2(n)\]≠∅.\\boxed{ \\mathcal B\_T(\\Phi) \\cap \\bigl( b\_1(n),b\_2(n) \\bigr\] \\neq\\varnothing. }

Se, adicionalmente, a função de saída Out⁡n\\operatorname{Out}\_nOutn​ é injetiva no candidato selecionado, então:

gT,n\[b1\](u)≠gT,n\[b2\](u)\\boxed{ g\_{T,n}^{\[b\_1\]}(u) \\neq g\_{T,n}^{\[b\_2\]}(u) }

se, e somente se:

BT(Φ)∩(b1(n),b2(n)\]≠∅.\\mathcal B\_T(\\Phi) \\cap \\bigl( b\_1(n),b\_2(n) \\bigr\] \\neq\\varnothing.

A hipótese de injetividade é necessária porque, em uma codificação degenerada, candidatos diferentes poderiam produzir a mesma palavra de saída.

---

## **Corolário 7.2: coincidência eventual em fórmula fixa**

Se:

b1(n)→∞eb2(n)→∞,b\_1(n)\\to\\infty \\quad\\text{e}\\quad b\_2(n)\\to\\infty,b1​(n)→∞eb2​(n)→∞,

então, para toda fórmula fixa Φ\\PhiΦ, existe NΦN\_\\PhiNΦ​ tal que, para todo n≥NΦn\\geq N\_\\Phin≥NΦ​:

b1(n)≥ρT(Φ)b\_1(n)\\geq\\rho\_T(\\Phi)b1​(n)≥ρT​(Φ)

e:

b2(n)≥ρT(Φ).b\_2(n)\\geq\\rho\_T(\\Phi).b2​(n)≥ρT​(Φ).

Logo:

JT,Φ(b1(n))=JT,Φ(b2(n))=jT∗(Φ).\\boxed{ J\_{T,\\Phi}(b\_1(n)) \= J\_{T,\\Phi}(b\_2(n)) \= j\_T^\*(\\Phi). }JT,Φ​(b1​(n))=JT,Φ​(b2​(n))=jT∗​(Φ).​

Sob a mesma codificação de saída:

gT,n\[b1\](u)=gT,n\[b2\](u)\\boxed{ g\_{T,n}^{\[b\_1\]}(u) \= g\_{T,n}^{\[b\_2\]}(u) }gT,n\[b1​\]​(u)=gT,n\[b2​\]​(u)​

para todas as entradas suficientemente longas que codificam essa fórmula fixa.

---

## **Corolário 7.3: condição necessária para diferença infinita**

Suponha que existam infinitos tamanhos nnn e entradas unu\_nun​ codificando fórmulas Φn\\Phi\_nΦn​ tais que:

gT,n\[b1\](un)≠gT,n\[b2\](un).g\_{T,n}^{\[b\_1\]}(u\_n) \\neq g\_{T,n}^{\[b\_2\]}(u\_n).

Então, para infinitos nnn:

BT(Φn)∩(b1(n),b2(n)\]≠∅.\\boxed{ \\mathcal B\_T(\\Phi\_n) \\cap \\bigl( b\_1(n),b\_2(n) \\bigr\] \\neq\\varnothing. }

Em particular, existem limiares rn∈BT(Φn)r\_n\\in\\mathcal B\_T(\\Phi\_n)rn​∈BT​(Φn​) tais que:

b1(n)\<rn≤b2(n).\\boxed{ b\_1(n)\<r\_n\\leq b\_2(n). }b1​(n)\<rn​≤b2​(n).​

Essa é a formulação correta da ideia de que uma diferença persistente exige uma sequência de fórmulas cujos limiares atravessem a janela entre os dois orçamentos.

## **Advertência**

Esse corolário demonstra diferença de comportamento do algoritmo em determinadas entradas. Ele não demonstra automaticamente:

rng⁡(gT\[b1\])≠rng⁡(gT\[b2\]).\\operatorname{rng}(g\_T^{\[b\_1\]}) \\neq \\operatorname{rng}(g\_T^{\[b\_2\]}).

Uma saída produzida por uma entrada no primeiro gerador pode ser produzida por outra entrada no segundo. Portanto, diferença de saída e diferença de imagem são problemas distintos.

---

# **8\. Espectro intrínseco e espectro operacional**

## **8.1 Espectro intrínseco final**

Para L∈NL\\in\\mathbb NL∈N, definimos:

ST(L)={ρT(Φ):Φ admissıˊvel e ∣Φ∣≤L}.\\boxed{ \\mathcal S\_T(L) \= \\left\\{ \\rho\_T(\\Phi): \\Phi\\text{ admissível e }|\\Phi|\\leq L \\right\\}. }ST​(L)={ρT​(Φ):Φ admissıˊvel e ∣Φ∣≤L}.​

Esse conjunto contém os limiares finais de estabilização das fórmulas de tamanho até LLL.

Definimos o envelope:

RT(L)=max⁡ST(L),\\boxed{ R\_T(L) \= \\max\\mathcal S\_T(L), }RT​(L)=maxST​(L),​

quando ST(L)≠∅\\mathcal S\_T(L)\\neq\\varnothing.

---

## **8.2 Espectro intrínseco completo**

Definimos:

CT(L)=⋃Φ admissıˊvel∣Φ∣≤LBT(Φ).\\boxed{ \\mathcal C\_T(L) \= \\bigcup\_{\\substack{\\Phi\\text{ admissível}\\\\|\\Phi|\\leq L}} \\mathcal B\_T(\\Phi). }CT​(L)=Φ admissıˊvel∣Φ∣≤L​⋃​BT​(Φ).​

Temos:

ST(L)≠CT(L)\\mathcal S\_T(L) \\neq \\mathcal C\_T(L)

em geral.

O conjunto ST(L)\\mathcal S\_T(L)ST​(L) contém somente o último limiar de cada fórmula. Já CT(L)\\mathcal C\_T(L)CT​(L) contém todas as transições efetivas.


Quando os conjuntos não são vazios:

RT(L)=max⁡ST(L)=max⁡CT(L).\\boxed{ R\_T(L) \= \\max\\mathcal S\_T(L) \= \\max\\mathcal C\_T(L). }RT​(L)=maxST​(L)=maxCT​(L).​

---

## **8.3 Fórmulas operacionalmente acessíveis**

Para cada tamanho de entrada nnn, definimos:

Fn={Φ:∃u∈{0,1}n, Form⁡n(u)=Φ}.\\mathfrak F\_n \= \\left\\{ \\Phi: \\exists u\\in\\{0,1\\}^n,\\ \\operatorname{Form}\_n(u)=\\Phi \\right\\}.Fn​={Φ:∃u∈{0,1}n, Formn​(u)=Φ}.

Na construção relevante ao projeto, espera-se uma restrição do tipo:

Fn⊆{Φ:∣Φ∣≤⌊log⁡n⌋}.\\mathfrak F\_n \\subseteq \\left\\{ \\Phi: |\\Phi|\\leq\\lfloor\\log n\\rfloor \\right\\}.Fn​⊆{Φ:∣Φ∣≤⌊logn⌋}.

Não devemos, porém, substituir inclusão por igualdade sem verificar a codificação. Nem toda fórmula curta precisa necessariamente ser acessível em toda entrada de comprimento nnn.

---

## **8.4 Espectro operacional**

Definimos:

STop(n)={ρT(Φ):Φ∈Fn}.\\boxed{ \\mathcal S\_T^{\\mathrm{op}}(n) \= \\left\\{ \\rho\_T(\\Phi): \\Phi\\in\\mathfrak F\_n \\right\\}. }STop​(n)={ρT​(Φ):Φ∈Fn​}.​

E o espectro operacional completo:

CTop(n)=⋃Φ∈FnBT(Φ).\\boxed{ \\mathcal C\_T^{\\mathrm{op}}(n) \= \\bigcup\_{\\Phi\\in\\mathfrak F\_n} \\mathcal B\_T(\\Phi). }CTop​(n)=Φ∈Fn​⋃​BT​(Φ).​

Se todas as fórmulas admissíveis de tamanho até ⌊log⁡n⌋\\lfloor\\log n\\rfloor⌊logn⌋ forem acessíveis, então:

STop(n)=ST(⌊log⁡n⌋),\\mathcal S\_T^{\\mathrm{op}}(n) \= \\mathcal S\_T(\\lfloor\\log n\\rfloor),STop​(n)=ST​(⌊logn⌋),



e:

CTop(n)=CT(⌊log⁡n⌋).\\mathcal C\_T^{\\mathrm{op}}(n) \= \\mathcal C\_T(\\lfloor\\log n\\rfloor).CTop​(n)=CT​(⌊logn⌋).

Sem essa hipótese, temos apenas:

STop(n)⊆ST(⌊log⁡n⌋),\\mathcal S\_T^{\\mathrm{op}}(n) \\subseteq \\mathcal S\_T(\\lfloor\\log n\\rfloor),STop​(n)⊆ST​(⌊logn⌋),

e:

CTop(n)⊆CT(⌊log⁡n⌋).\\mathcal C\_T^{\\mathrm{op}}(n) \\subseteq \\mathcal C\_T(\\lfloor\\log n\\rfloor).CTop​(n)⊆CT​(⌊logn⌋).

---

## **8.5 Transporte do orçamento**

Se LLL representa o tamanho da fórmula e entradas relevantes possuem tamanho aproximadamente 2L2^L2L, definimos:

Bb(L):=b(2L).\\boxed{ B\_b(L):=b(2^L). }Bb​(L):=b(2L).​

Exemplos:

b(n)=⌊log⁡2n⌋⟹Bb(L)=L;b(n)=\\lfloor\\log\_2 n\\rfloor \\quad\\Longrightarrow\\quad B\_b(L)=L;b(n)=⌊log2​n⌋⟹Bb​(L)=L; b(n)=⌊log⁡2log⁡2n⌋⟹Bb(L)≈log⁡2L;b(n)=\\lfloor\\log\_2\\log\_2 n\\rfloor \\quad\\Longrightarrow\\quad B\_b(L)\\approx\\log\_2 L;b(n)=⌊log2​log2​n⌋⟹Bb​(L)≈log2​L; b(n)=log⁡∗n⟹Bb(L)=log⁡∗L+O(1).b(n)=\\log^\*n \\quad\\Longrightarrow\\quad B\_b(L)=\\log^\*L+O(1).b(n)=log∗n⟹Bb​(L)=log∗L+O(1).

Assim, a comparação matematicamente correta no espaço das fórmulas é:

CT(L)versusBb(L)=b(2L).\\boxed{ \\mathcal C\_T(L) \\quad\\text{versus}\\quad B\_b(L)=b(2^L). }CT​(L)versusBb​(L)=b(2L).​

---

## **8.6 Critério de estabilização global**

Se:

Bb(L)≥RT(L),B\_b(L)\\geq R\_T(L),Bb​(L)≥RT​(L),

então todas as fórmulas admissíveis de tamanho até LLL estão localmente estabilizadas no nível correspondente.

Mais precisamente, supondo que entradas de tamanho 2L2^L2L disponibilizem todas essas fórmulas:

b(2L)≥RT(L)⟹JT,Φ(b(2L))=jT∗(Φ)\\boxed{ b(2^L)\\geq R\_T(L) \\Longrightarrow J\_{T,\\Phi}(b(2^L))=j\_T^\*(\\Phi) }b(2L)≥RT​(L)⟹JT,Φ​(b(2L))=jT∗​(Φ)​

para toda Φ\\PhiΦ com:

∣Φ∣≤L.|\\Phi|\\leq L.∣Φ∣≤L.

Reciprocamente, se:

b(2L)\<RT(L),b(2^L)\<R\_T(L),b(2L)\<RT​(L),

então existe alguma fórmula Φ\\PhiΦ de tamanho ≤L\\leq L≤L com:

ρT(Φ)\>b(2L).\\rho\_T(\\Phi)\>b(2^L).ρT​(Φ)\>b(2L).

Isso significa que a fórmula ainda não atingiu seu regime final. Para concluir que o gerador realmente recebe essa fórmula no nível 2L2^L2L, é necessária a hipótese adicional de acessibilidade operacional.

---

# **9\. Hipóteses explícitas sobre TTT**

As hipóteses devem ser separadas conforme o resultado pretendido.

## **9.1 Hipóteses mínimas para as definições**

Para definir:

ℓT,ρT,BT,ST,CT,\\ell\_T,\\quad \\rho\_T,\\quad \\mathcal B\_T,\\quad \\mathcal S\_T,\\quad \\mathcal C\_T,ℓT​,ρT​,BT​,ST​,CT​,

basta que:

1. TTT possua uma noção finita de prova;  
2. provas sejam palavras finitas;  
3. Prf⁡T(π,θ)\\operatorname{Prf}\_T(\\pi,\\theta)PrfT​(π,θ) seja uma relação bem definida;  
4. cada prova possua um comprimento natural ∣π∣|\\pi|∣π∣;  
5. o conjunto de candidatos WΦW\_\\PhiWΦ​ seja finito;  
6. a sentença Φw\\Phi^wΦw seja efetivamente construída a partir de Φ\\PhiΦ e www.

Não são necessárias, nesse nível:

* consistência;  
* correção;  
* completude;  
* decidibilidade do conjunto de teoremas.

---

## **9.2 Hipóteses para que gT\[b\]g\_T^{\[b\]}gT\[b\]​ seja computável**

Para computar o gerador limitado, assumimos:

1. a relação  
    Prf⁡T(π,θ)\\operatorname{Prf}\_T(\\pi,\\theta)PrfT​(π,θ)  
    é decidível;

2. é possível enumerar todas as palavras π\\piπ com:  
    ∣π∣≤b(n);|\\pi|\\leq b(n);∣π∣≤b(n);  
3. a extração da fórmula e a construção de Φw\\Phi^wΦw são computáveis;

4. b(n)b(n)b(n) é computável;

5. Out⁡n\\operatorname{Out}\_nOutn​ é computável.

A decidibilidade de Thm⁡(T)\\operatorname{Thm}(T)Thm(T) não é necessária, pois a busca é limitada pelo orçamento.

## **9.3 Hipóteses para tempo polinomial**

Para demonstrar que gT\[b\]g\_T^{\[b\]}gT\[b\]​ é computável em tempo polinomial em nnn, é suficiente impor condições como:

1. Prf⁡T\\operatorname{Prf}\_TPrfT​ é verificável em tempo polinomial em:  
    ∣π∣+∣θ∣;|\\pi|+|\\theta|;∣π∣+∣θ∣;  
2. o número de candidatos satisfaz:  
    ∣WΦ∣≤nO(1);|W\_\\Phi|\\leq n^{O(1)};∣WΦ​∣≤nO(1);  
3. a construção de cada Φw\\Phi^wΦw tem tamanho polinomial em nnn;

4. o custo da enumeração de provas de comprimento ≤b(n)\\leq b(n)≤b(n) é:  
    2O(b(n));2^{O(b(n))};2O(b(n));  
5. o orçamento satisfaz:  
    b(n)=O(log⁡n).b(n)=O(\\log n).b(n)=O(logn).

Nessas condições:

2O(b(n))=nO(1).2^{O(b(n))}=n^{O(1)}.2O(b(n))=nO(1).

---

## **9.4 Hipóteses não utilizadas nos teoremas locais**

Os teoremas de estabilização e transição são sintáticos. Eles não precisam de:

T consistenteT\\text{ consistente}T consistente

nem de:

T correta em N.T\\text{ correta em }\\mathbb N.T correta em N.

Mesmo se TTT for inconsistente, as definições continuam fazendo sentido. Nesse caso, provavelmente todas as sentenças são demonstráveis, de modo que:

jT∗(Φ)=kΦ.j\_T^\*(\\Phi)=k\_\\Phi.jT∗​(Φ)=kΦ​.

Ainda assim, o teorema de estabilização permanece verdadeiro.

---

## **9.5 Hipóteses necessárias para interpretação semântica**

Se quisermos afirmar que:

T⊬ΦwT\\nvdash\\Phi^wT⊬Φw

ocorre porque Φw\\Phi^wΦw é falsa, ou que uma prova em TTT garante verdade no modelo padrão, será necessária alguma hipótese de correção, por exemplo:

T⊢θ⟹N⊨θ.T\\vdash\\theta \\Longrightarrow \\mathbb N\\models\\theta.T⊢θ⟹N⊨θ.

Dependendo da classe sintática de θ\\thetaθ, uma hipótese mais fraca pode bastar, como:

* Σ1\\Sigma\_1Σ1​-correção;  
* Π1\\Pi\_1Π1​-correção;  
* correção para a classe específica das sentenças Φw\\Phi^wΦw.

Essa hipótese semântica não deve ser ocultada dentro das definições sintáticas.

## **9.6 Hipóteses para versões em aritmética limitada**

Se Φ\\PhiΦ for restrita a:

Σ1b,\\Sigma\_1^b,Σ1b​,

então será necessário demonstrar:

1. que w⪯exw\\preceq\_e xw⪯e​x é definível na classe adequada;

2. que a construção (Φ,w)↦Φw(\\Phi,w)\\mapsto\\Phi^w(Φ,w)↦Φw possui a complexidade sintática anunciada;

3. que as operações de codificação podem ser formalizadas em S21S\_2^1S21​ ou na teoria-base escolhida;

4. que os limites de tamanho são uniformes;

5. que qualquer gadget posterior, como:  
    θ↦Φθ,\\theta\\mapsto\\Phi\_\\theta,θ↦Φθ​,  
    preserva a classe sintática relevante.

Essas condições não são necessárias para o núcleo abstrato, mas serão indispensáveis para a conexão com NP, fórmulas τ\\tauτ e complexidade proposicional.

---

# **Teorema consolidado do núcleo mínimo**

Podemos reunir os resultados principais da seguinte forma.

## **Teorema 9.1: estrutura local do espectro**

Seja TTT um sistema formal com relação finita de prova e seja Φ\\PhiΦ uma fórmula admissível com candidatos ordenados:

WΦ={w0\<lex⋯\<wkΦ−1}.W\_\\Phi=\\{w\_0\<\_{\\mathrm{lex}}\\cdots\<w\_{k\_\\Phi-1}\\}.WΦ​={w0​\<lex​⋯\<wkΦ​−1​}.

Para cada orçamento c∈Nc\\in\\mathbb Nc∈N, defina:

JT,Φ(c)=min⁡{j\<kΦ:ℓT(Φ,wj)\>c},J\_{T,\\Phi}(c) \= \\min\\{j\<k\_\\Phi:\\ell\_T(\\Phi,w\_j)\>c\\},JT,Φ​(c)=min{j\<kΦ​:ℓT​(Φ,wj​)\>c},

com valor kΦk\_\\PhikΦ​ se o conjunto for vazio.

Então:

1. JT,ΦJ\_{T,\\Phi}JT,Φ​ é não decrescente;

2. suas transições ocorrem exatamente nos valores de:  
    BT(Φ);\\mathcal B\_T(\\Phi);BT​(Φ);  
3. para c1≤c2c\_1\\leq c\_2c1​≤c2​:  
    JT,Φ(c1)≠JT,Φ(c2)  ⟺  BT(Φ)∩(c1,c2\]≠∅;J\_{T,\\Phi}(c\_1)\\neq J\_{T,\\Phi}(c\_2) \\iff \\mathcal B\_T(\\Phi)\\cap(c\_1,c\_2\]\\neq\\varnothing;
4. para:  
    c≥ρT(Φ),c\\geq\\rho\_T(\\Phi),c≥ρT​(Φ),  
    vale:  
    JT,Φ(c)=jT∗(Φ);J\_{T,\\Phi}(c)=j\_T^\*(\\Phi);JT,Φ​(c)=jT∗​(Φ);

