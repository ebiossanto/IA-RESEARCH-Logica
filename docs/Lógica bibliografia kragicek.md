Fiz a verificação bibliográfica com foco específico no **Paper 1 — “Barateando a Diagonalização”**, confrontando o texto do seu repositório com o artigo de Krajíček, a publicação de 2025, o livro *Proof Complexity Generators* e trabalhos anteriores sobre diagonalização e geradores de complexidade de provas.

O resultado é **mais sutil do que simplesmente “já foi publicado”**. Há uma distinção importante entre a observação exata do seu Paper 1 e uma observação muito próxima que Krajíček publicou explicitamente.

## **1\. O que exatamente o Paper 1 afirma**

O seu Paper 1 propõe substituir, na construção de gTg\_T de Krajíček,

log⁡n\\log n

por uma função

b(n)→∞,b(n)\\to\\infty,

computável e não decrescente.

O documento formula isso explicitamente:

> “Troque ‘log n’ por ‘b(n)’ nos dois lugares da construção de Krajicek”

e afirma que:

gT(b)g\_T^{(b)}

continua tendo stretch de um bit, imagem co-infinita e a mesma propriedade de interseção condicional, enquanto o custo computacional passa aproximadamente para

O(n+2O(b(n))).O\\left(n+2^{O(b(n))}\\right).

Também apresenta o caso

b(n)=log⁡log⁡nb(n)=\\log\\log n

como particularmente interessante, pois

2O(log⁡log⁡n)=(log⁡n)O(1),2^{O(\\log\\log n)} \=(\\log n)^{O(1)},

fazendo o custo total ser dominado pela leitura da entrada, isto é, linear em nn.

Essa formulação é matematicamente plausível e, com hipóteses técnicas adequadas sobre bb, pode ser formalizada.

Mas vem a questão da originalidade.

---

# **2\. O artigo de Krajíček de 2023/2025 contém uma observação extremamente próxima**

O artigo central é:

**Jan Krajíček, “A Proof Complexity Conjecture and the Incompleteness Theorem”**

* publicado online: 19/09/2023;  
* publicado no *Journal of Symbolic Logic*, vol. 90, n.º 3, em 2025;  
* páginas 1206–1210;  
* DOI 10.1017/jsl.2023.69.

O ponto decisivo está na **nota de rodapé 3**, na seção proposicional.

Krajíček escreve que a função

log⁡log⁡n\\log\\log n

que limita o parâmetro ℓ\\ell pode ser substituída por **qualquer função ω(1)\\omega(1) computável em tempo construtível**, aproximando o tempo de computação de hh de quase-polinomial.

Ou seja, a ideia estrutural

log⁡log⁡n⟶b(n)=ω(1)\\log\\log n \\quad\\longrightarrow\\quad b(n)=\\omega(1)

**não é nova em 2026**.

E há algo ainda mais importante: a publicação impressa que contém essa observação é justamente a edição de **2025** do JSL. O próprio PDF publicado identifica o volume 90, número 3, setembro de 2025\.

Portanto, se a pergunta for:

> “Krajíček publicou em 2025 uma generalização do tipo log⁡log⁡n→ω(1)\\log\\log n\\to\\omega(1)?”

A resposta é:

SIM, explicitamente.\\boxed{\\textbf{SIM, explicitamente.}}

---

# **3\. Mas há uma diferença importante — e ela muda o veredicto**

Aqui está a parte que considero essencial para sermos intelectualmente honestos.

A observação de Krajíček na nota de rodapé **não é literalmente a mesma proposição do seu Paper 1**.

Seu Paper 1 modifica a construção **de primeira ordem gTg\_T**:

gT.g\_T.

Krajíček, na nota de rodapé 3, está discutindo a construção **proposicional hPh\_P**.

Isso aparece claramente na estrutura do artigo.

Na construção de gTg\_T, Krajíček define:

∣Φ∣≤log⁡n|\\Phi|\\leq \\log n

e procura provas de tamanho

≤log⁡n.\\leq\\log n.

O artigo descreve isso explicitamente nas etapas 1 e 2 da construção.

Já a observação da nota de rodapé aparece na seção 3, durante a construção proposicional de hPh\_P, onde o parâmetro ℓ\\ell surge associado ao tamanho dos circuitos utilizados na simulação dos certificados/provas.

Portanto:

### **Formulação de Krajíček publicada**

log⁡log⁡n⟶ω(1)\\boxed{ \\log\\log n \\longrightarrow \\omega(1) }

para um parâmetro da construção proposicional hPh\_P.

### **Formulação do Paper 1**

log⁡n⟶b(n)→∞\\boxed{ \\log n \\longrightarrow b(n)\\to\\infty }

diretamente na construção de gTg\_T.

Essas duas coisas são **muito próximas conceitualmente**, mas não são literalmente o mesmo enunciado.

---

# **4\. A generalização do Paper 1 é matematicamente correta?**

Minha análise é:

Sim, essencialmente correta, com hipoˊteses teˊcnicas que devem ser explicitadas.\\boxed{\\textbf{Sim, essencialmente correta, com hipóteses técnicas que devem ser explicitadas.}}

A ideia pode ser reconstruída diretamente.

Considere b:N→Nb:\\mathbb N\\to\\mathbb N tal que:

b(n)→∞.b(n)\\to\\infty.

Substituímos:

∣Φ∣≤log⁡n|\\Phi|\\le \\log n

por

∣Φ∣≤b(n),|\\Phi|\\le b(n),

e

∣π∣≤log⁡n|\\pi|\\le\\log n

por

∣π∣≤b(n).|\\pi|\\le b(n).

A prova de Krajíček da propriedade de interseção usa essencialmente o fato de que, para qualquer prova fixa de tamanho LL, eventualmente:

b(n)≥L.b(n)\\ge L.

Como

b(n)→∞,b(n)\\to\\infty,

isso acontece.

Portanto, o argumento assintótico de estabilização do prefixo w0w\_0 continua funcionando.

O próprio artigo mostra que, na construção original, basta chegar a um nn suficientemente grande para que o limite de busca contenha as provas relevantes.

Isso é exatamente o mecanismo que o Paper 1 generaliza.

---

# **5\. Mas existe uma pequena correção importante no Paper 1**

O Paper 1 atualmente diz:

> “Seja b(n)b(n) qualquer função computável em tempo, não decrescente, com b(n)→∞b(n)\\to\\infty.”

Eu não deixaria o artigo assim.

Eu colocaria pelo menos:

b:N→N eˊ total, computaˊvel, na˜o decrescente e b(n)→∞.\\boxed{ b:\\mathbb N\\to\\mathbb N \\text{ é total, computável, não decrescente e } b(n)\\to\\infty. }

E, para a análise de complexidade desejada, acrescentaria uma condição como:

b(n)≤nO(1)b(n)\\le n^{O(1)}

ou, dependendo do objetivo:

b(n)=o(n)b(n)=o(n)

para estudar a região subexponencial.

A razão é que “b(n)→∞b(n)\\to\\infty” sozinho garante a propriedade matemática da diagonalização, mas **não caracteriza a classe de complexidade do algoritmo**.

Isso é importante.

---

# **6\. A fórmula de custo do Paper 1 também precisa de uma pequena precisão**

O Paper 1 afirma:

Tb(n)=O(n+2O(b(n))).T\_b(n)=O(n+2^{O(b(n))}).

Isso está essencialmente correto para a implementação ingênua, porque:

* há aproximadamente 2O(b(n))2^{O(b(n))} possíveis ww;  
* para cada ww, existem aproximadamente 2O(b(n))2^{O(b(n))} possíveis provas;  
* verificar cada candidato é polinomial no tamanho da prova.

Assim:

2O(b(n))⋅2O(b(n))=2O(b(n)).2^{O(b(n))} \\cdot 2^{O(b(n))} \= 2^{O(b(n))}.

Portanto:

Tb(n)=nO(1)+2O(b(n))\\boxed{ T\_b(n)=n^{O(1)}+2^{O(b(n))} }

é uma formulação mais segura.

Para

b(n)=log⁡log⁡n,b(n)=\\log\\log n,

temos:

2O(b(n))=2O(log⁡log⁡n)=(log⁡n)O(1).2^{O(b(n))} \= 2^{O(\\log\\log n)} \= (\\log n)^{O(1)}.

Consequentemente:

Tb(n)=O(n)+(log⁡n)O(1)=O(n).T\_b(n) \= O(n)+(\\log n)^{O(1)} \= O(n).

Então o fenômeno de **“diagonalização linear”** é matematicamente legítimo sob o modelo de custo adequado.

---

# **7\. O ponto realmente interessante: Krajíček já tinha praticamente a mesma ferramenta**

A literatura anterior torna o quadro ainda mais claro.

Krajíček trabalha com diagonalização em complexidade de provas desde pelo menos 2004, no artigo:

**“Diagonalization in proof complexity”**, *Fundamenta Mathematicae* 182 (2004), 181–192.

O próprio livro de 2025 lista esse trabalho entre as referências centrais do desenvolvimento histórico dos geradores.

Em 2009 aparece também:

**“A proof complexity generator”**, de Krajíček.

Em 2011, ele trabalha especificamente com a complexidade das tautologias produzidas por geradores:

**“On the proof complexity of the Nisan–Wigderson generator based on a hard NP∩coNPNP\\cap coNP function”**.

Em 2023/2024 aparece:

**“On the existence of strong proof complexity generators”**, onde Krajíček sistematiza a conjectura de geradores hard para todos os sistemas de prova e relaciona o assunto a bounded arithmetic, Kolmogorov, proof search etc.

Finalmente, em 2025, o livro:

**Jan Krajíček, *Proof Complexity Generators*, Cambridge University Press, 2025**

possui capítulos específicos sobre:

* τ\\tau-formulas e geradores;  
* hardness;  
* stretch;  
* Kolmogorov complexity;  
* gadget generators;  
* consistência;  
* contextos e incompletude.

Portanto, **o terreno conceitual do Paper 1 está extremamente bem estabelecido**.

---

# **8\. O livro de 2025 altera alguma coisa?**

Pesquisei especificamente isso.

O livro possui um capítulo inteiro chamado **“The Stretch”**, publicado online pela Cambridge em 29 de maio de 2025\. Ele trata justamente da razão saída/entrada dos geradores, compressão/descompressão e complexidade de Kolmogorov limitada no tempo.

O livro também contém uma seção específica sobre os geradores associados à construção de Krajíček de 2023, reproduzindo a questão da construção gTg\_T e seu problema de hardness.

Entretanto, **não encontrei nas fontes pesquisáveis do livro uma passagem que formule explicitamente exatamente a proposição do seu Paper 1 como**

∀b(n)→∞,gT(b)\\forall b(n)\\to\\infty,\\qquad g\_T^{(b)}

com custo

O(n+2O(b(n)))O(n+2^{O(b(n))})

e, especificamente,

b(n)=log⁡log⁡n⇒T(n)=O(n).b(n)=\\log\\log n \\Rightarrow T(n)=O(n).

Isso é importante.

Portanto não seria intelectualmente correto eu dizer:

> “Krajíček publicou exatamente o Paper 1.”

**Não encontrei evidência disso.**

---

# **9\. Então o Paper 1 é original?**

Aqui está meu veredicto, em três níveis.

| Afirmação | Veredicto bibliográfico |
| ----- | ----- |
| Krajíček construiu gTg\_T por diagonalização baseada em provas | **Já existente** |
| A diagonalização pode usar um parâmetro de crescimento muito lento em vez de log⁡n\\log n | **Já existe essencialmente na literatura** |
| log⁡log⁡n\\log\\log n pode substituir um parâmetro ω(1)\\omega(1) na construção proposicional | **Explicitamente publicado por Krajíček** |
| A substituição log⁡n→b(n)\\log n\\to b(n) aplicada explicitamente a gTg\_T | **Não encontrei publicação explícita com essa formulação exata** |
| b(n)=log⁡log⁡nb(n)=\\log\\log n produz custo O(n)O(n) para essa versão de gTg\_T | **Não encontrei essa formulação explícita** |
| A prova da generalização exige uma técnica nova | **Não parece** |
| A observação, como resultado matemático isolado, é uma contribuição forte | **Não** |
| Pode ser apresentada como uma observação técnica nova se formalizada cuidadosamente | **Possivelmente, mas a novidade é fraca** |

---

# **10\. A diferença entre “não encontrei” e “é original”**

Esta distinção é fundamental.

Minha pesquisa encontrou:

a ideia central jaˊ estaˊ muito proˊxima da literatura de Krajıˊcˇek.\\boxed{ \\text{a ideia central já está muito próxima da literatura de Krajíček.} }

Mas não encontrei:

uma publicac¸a˜o que contenha literalmente o teorema geral do Paper 1 para gT.\\boxed{ \\text{uma publicação que contenha literalmente o teorema geral do Paper 1 para }g\_T. }

Isso **não autoriza afirmar originalidade**.

Na pesquisa matemática, há três níveis diferentes:

### **Nível A — resultado já publicado**

na˜o original\\boxed{\\text{não original}}

### **Nível B — resultado não encontrado, mas consequência imediata**

novidade formal, mas provavelmente baixa\\boxed{\\text{novidade formal, mas provavelmente baixa}}

### **Nível C — nova técnica ou nova consequência não trivial**

potencial contribuic¸a˜o original\\boxed{\\text{potencial contribuição original}}

Eu colocaria o Paper 1 atualmente em:

Nıˊvel B\\boxed{\\textbf{Nível B}}

e não em A ou C.

---

# **11\. Existe, porém, uma coisa interessante no Paper 1**

A frase mais interessante do documento não é simplesmente:

b(n)=log⁡log⁡n.b(n)=\\log\\log n.

É a separação:

custo da diagonalizac¸a˜o≠custo da proposicionalizac¸a˜o\\boxed{ \\text{custo da diagonalização} \\quad\\neq\\quad \\text{custo da proposicionalização} }

Essa interpretação é conceitualmente boa.

O artigo de Krajíček mostra uma construção gTg\_T de primeira ordem que é p-time e, depois, uma versão proposicional hPh\_P cuja construção envolve custos muito maiores. O próprio artigo dá:

2O((log⁡n)log⁡log⁡n)2^{O((\\log n)^{\\log\\log n})}

para a versão proposicional.

Então existe realmente uma distinção estrutural:

gT⟶incompletude\\boxed{ g\_T \\quad\\longrightarrow\\quad \\text{incompletude} }

versus

hP⟶complexidade de provas.\\boxed{ h\_P \\quad\\longrightarrow\\quad \\text{complexidade de provas}. }

E essa diferença é importante no programa de pesquisa.

Mas **a distinção em si também não é desconhecida**: Krajíček já apresenta explicitamente a passagem de gTg\_T para a versão proposicional e discute as complicações técnicas dessa passagem.

---

# **12\. Uma descoberta ainda mais importante para o nosso projeto**

A literatura de 2004–2025 mostra que a pergunta interessante não é:

> “Podemos substituir log⁡n\\log n por log⁡log⁡n\\log\\log n?”

Essa já é uma variação pequena demais.

A pergunta mais forte seria:

Qual eˊ a menor func¸a˜o b(n) que preserva simultaneamente a diagonalizac¸a˜o e uma propriedade nova de complexidade?\\boxed{ \\text{Qual é a menor função }b(n) \\text{ que preserva simultaneamente a diagonalização e uma propriedade nova de complexidade?} }

Por exemplo, definir:

BT={b:gT(b) satisfaz determinada propriedade}\\mathcal B\_T \= \\left\\{ b: g\_T^{(b)} \\text{ satisfaz determinada propriedade} \\right\\}

e investigar um limiar:

b∗(n).b\_\*(n).

Isso seria bem mais interessante.

---

# **13\. Uma possível nova pergunta matemática**

Podemos definir:

gT\[b\]g\_T^{\[b\]}

como a versão de Krajíček em que os dois limites log⁡n\\log n são substituídos por b(n)b(n).

Então temos:

b1≤b2b\_1\\le b\_2

e potencialmente uma relação de monotonicidade:

Range⁡(gT\[b1\])versusRange⁡(gT\[b2\]).\\operatorname{Range}(g\_T^{\[b\_1\]}) \\quad\\text{versus}\\quad \\operatorname{Range}(g\_T^{\[b\_2\]}).

A pergunta realmente interessante passa a ser:

Como a escolha de b altera a estrutura da imagem e das tautologias τ(gT\[b\])y?\\boxed{ \\text{Como a escolha de }b \\text{ altera a estrutura da imagem e das tautologias }\\tau(g\_T^{\[b\]})\_y? }

Isso conecta diretamente:

b(n)⟶gT\[b\]⟶τ(gT\[b\])y⟶proof complexity.b(n) \\longrightarrow g\_T^{\[b\]} \\longrightarrow \\tau(g\_T^{\[b\]})\_y \\longrightarrow \\text{proof complexity}.

E aí entramos justamente no território que Krajíček estuda: τ\\tau-formulas, hardness, proof search, Kolmogorov complexity e geradores.

**Essa extensão ainda precisaria de uma busca bibliográfica específica antes de ser chamada de nova.**

---

# **14\. Meu veredicto final sobre o Paper 1**

Depois dessa pesquisa, eu **corrigiria a avaliação anterior do projeto**.

Não diria:

> “Paper 1 é uma nova descoberta de Krajíček que não havia sido publicada.”

Também não diria:

> “Paper 1 é exatamente algo já publicado por Krajíček.”

Minha formulação seria:

undefined

Em termos de prioridade:

**Krajíček tem prioridade sobre a ideia geral de reduzir o parâmetro de crescimento para ω(1)\\omega(1).** A publicação é ainda mais antiga que 2025 no sentido de prioridade científica: o artigo foi recebido em 22/03/2023 e publicado online em 19/09/2023; 2025 é o ano do volume impresso do JSL.

O seu repositório, aliás, já contém uma autocorreção importante: o próprio Paper 1 reconhece que a observação está muito próxima da nota de rodapé de Krajíček e marca a contribuição como não estabelecida.

### **Minha recomendação científica**

Eu **não descartaria o Paper 1**, mas também **não o apresentaria como “nova descoberta”**.

Eu o transformaria em uma **nota técnica de preparação** e deslocaria o foco para:

“Minimal Growth Diagonalization”\\boxed{ \\text{“Minimal Growth Diagonalization”} }

isto é, investigar rigorosamente o **limiar assintótico de b(n)b(n)** e, principalmente, se a família

{gT\[b\]:b∈B}\\{g\_T^{\[b\]}:b\\in\\mathcal B\\}

produz uma hierarquia genuína de complexidade das respectivas τ\\tau-fórmulas.

Isso teria muito mais potencial do que simplesmente observar que log⁡n\\log n pode virar log⁡log⁡n\\log\\log n.

---

### **Fontes bibliográficas centrais**

* Krajíček, **“A Proof Complexity Conjecture and the Incompleteness Theorem”**, *Journal of Symbolic Logic* 90(3), 2025, 1206–1210. O texto contém a construção gTg\_T e a nota explícita sobre substituir log⁡log⁡n\\log\\log n por qualquer ω(1)\\omega(1) tempo-construtível na versão proposicional.  
* Krajíček, **“Diagonalization in proof complexity”**, *Fundamenta Mathematicae* 182 (2004), 181–192. É um antecedente importante sobre diagonalização aplicada à complexidade de provas.  
* Krajíček, **“On the existence of strong proof complexity generators”**, *Bulletin of Symbolic Logic* 30(1), 2024\. Desenvolve a teoria moderna de geradores de complexidade de provas e sua relação com hardness, bounded arithmetic e proof search.  
* Krajíček, **Proof Complexity Generators**, Cambridge University Press, 2025\. O livro sistematiza o campo e possui capítulos específicos sobre geradores, stretch e incompletude.  
* Seu **Paper 1**, `paper1_barreira_interpretabilidade.md`, que contém a formulação explícita b(n)→∞b(n)\\to\\infty, o caso log⁡log⁡n\\log\\log n e a própria descoberta da nota de rodapé de Krajíček.

**Conclusão curta:** a pesquisa **refuta uma reivindicação forte de originalidade**, mas **não refuta que exista uma formulação específica, para gTg\_T, que não localizei publicada literalmente**. O resultado, isoladamente, parece uma extensão natural do argumento de Krajíček, não uma nova técnica.

