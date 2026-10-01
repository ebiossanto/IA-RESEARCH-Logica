Vou construir a versão rigorosa no nível correto: primeiro como um **teorema de janela exata para apresentações de prova**, e não ainda como solução do caso canônico S21/PAS^1\_2/\\mathrm{PA}S21​/PA. Isso preserva a barreira G.10 e evita confundir “mesmos teoremas” com “mesmos comprimentos mínimos de prova”. O documento já demonstra que CT(L)∩\[0,K\]C\_T(L)\\cap\[0,K\]CT​(L)∩\[0,K\] é decidível por busca limitada, mas adverte que igualdades globais continuam proibidas sem controle da cauda.

# **1\. Ambiente formal corrigido**

Fixemos:

* uma linguagem recursiva L\\mathcal LL;  
* uma teoria consistente e recursivamente axiomatizada TTT;  
* um sistema de provas PPP para TTT;  
* um predicado decidível Prf⁡P(p,φ);\\operatorname{Prf}\_P(p,\\varphi);PrfP​(p,φ);  
* uma codificação ν\\nuν;  
* uma função computável de custo cost⁡P(p)∈N.\\operatorname{cost}\_P(p)\\in\\mathbb N.costP​(p)∈N.

Definimos o comprimento mínimo por

ℓP(φ):=min⁡{cost⁡P(p):Prf⁡P(p,φ)},\\ell\_P(\\varphi) := \\min\\bigl\\{ \\operatorname{cost}\_P(p): \\operatorname{Prf}\_P(p,\\varphi) \\bigr\\},ℓP​(φ):=min{costP​(p):PrfP​(p,φ)},

com a convenção

ℓP(φ)=∞\\ell\_P(\\varphi)=\\inftyℓP​(φ)=∞

se não existir prova de φ\\varphiφ em PPP.

A notação mais completa seria

ℓT,P,ν(φ),\\ell\_{T,P,\\nu}(\\varphi),ℓT,P,ν​(φ),

mas, como TTT e ν\\nuν permanecerão fixados nesta seção, escreveremos simplesmente ℓP(φ)\\ell\_P(\\varphi)ℓP​(φ).

---

# **2\. A família indexada e os recordes**

Seja

Φ=(φ0,φ1,…,φm)\\Phi=(\\varphi\_0,\\varphi\_1,\\ldots,\\varphi\_m)Φ=(φ0​,φ1​,…,φm​)

uma família finita ordenada de fórmulas. Definimos:

ajP(Φ):=ℓP(φj).a\_j^P(\\Phi):=\\ell\_P(\\varphi\_j).ajP​(Φ):=ℓP​(φj​).

Um índice j≤mj\\leq mj≤m é um **índice de recorde em PPP** quando:

ajP(Φ)\<∞a\_j^P(\\Phi)\<\\inftyajP​(Φ)\<∞

e

aiP(Φ)\<ajP(Φ)para todo i\<j.a\_i^P(\\Phi)\<a\_j^P(\\Phi) \\qquad \\text{para todo }i\<j.aiP​(Φ)\<ajP​(Φ)para todo i\<j.

Assim, o conjunto dos valores recordes da família é

CP(Φ):={ajP(Φ):j≤m, ajP(Φ)\<∞, ∀i\<j aiP(Φ)\<ajP(Φ)}.C\_P(\\Phi) := \\left\\{ a\_j^P(\\Phi): j\\leq m,\\ a\_j^P(\\Phi)\<\\infty,\\ \\forall i\<j\\, a\_i^P(\\Phi)\<a\_j^P(\\Phi) \\right\\}.CP​(Φ):={ajP​(Φ):j≤m, ajP​(Φ)\<∞, ∀i\<jaiP​(Φ)\<ajP​(Φ)}.

Para uma classe finita de famílias de tamanho sintático limitado,

FL:={Φ:∣Φ∣≤L},\\mathcal F\_L := \\{\\Phi:|\\Phi|\\leq L\\},FL​:={Φ:∣Φ∣≤L},

definimos:

CP(L):=⋃Φ∈FLCP(Φ).C\_P(L):= \\bigcup\_{\\Phi\\in\\mathcal F\_L}C\_P(\\Phi).CP​(L):=Φ∈FL​⋃​CP​(Φ).

A janela limitada é:

CP(L;K):=CP(L)∩\[0,K\].C\_P(L;K) := C\_P(L)\\cap\[0,K\].CP​(L;K):=CP​(L)∩\[0,K\].

Definimos ainda:

NP(L;K):=∣CP(L;K)∣N\_P(L;K):=|C\_P(L;K)|NP​(L;K):=∣CP​(L;K)∣

e, quando o conjunto não é vazio,

RP(L;K):=max⁡CP(L;K).R\_P(L;K):=\\max C\_P(L;K).RP​(L;K):=maxCP​(L;K).

A definição global anterior é recuperada por:

CP(L)=⋃K∈NCP(L;K).C\_P(L)=\\bigcup\_{K\\in\\mathbb N}C\_P(L;K).CP​(L)=K∈N⋃​CP​(L;K).

---

# **3\. Decidibilidade da janela**

## **Proposição 3.1. Decidibilidade limitada**

Suponha que:

1. FL\\mathcal F\_LFL​ seja finita e efetivamente enumerável;  
2. Prf⁡P(p,φ)\\operatorname{Prf}\_P(p,\\varphi)PrfP​(p,φ) seja decidível;  
3. para cada KKK, existam apenas finitos objetos ppp com cost⁡P(p)≤K,\\operatorname{cost}\_P(p)\\leq K,costP​(p)≤K, enumeráveis efetivamente.

Então CP(L;K)C\_P(L;K)CP​(L;K) é decidível e computável a partir de (P,L,K)(P,L,K)(P,L,K).

### **Prova**

Para cada fórmula φ\\varphiφ que aparece em alguma família Φ∈FL\\Phi\\in\\mathcal F\_LΦ∈FL​, enumeramos todos os candidatos ppp tais que

cost⁡P(p)≤K.\\operatorname{cost}\_P(p)\\leq K.costP​(p)≤K.

Como o conjunto é finito e Prf⁡P\\operatorname{Prf}\_PPrfP​ é decidível, podemos determinar se existe prova de φ\\varphiφ com custo no máximo KKK.

Se houver, calculamos exatamente:

ℓP≤K(φ):=min⁡{cost⁡P(p):Prf⁡P(p,φ), cost⁡P(p)≤K}.\\ell\_P^{\\leq K}(\\varphi) := \\min\\left\\{ \\operatorname{cost}\_P(p): \\operatorname{Prf}\_P(p,\\varphi),\\ \\operatorname{cost}\_P(p)\\leq K \\right\\}.ℓP≤K​(φ):=min{costP​(p):PrfP​(p,φ), costP​(p)≤K}.

Se não houver, concluímos apenas:

ℓP(φ)\>KouℓP(φ)=∞.\\ell\_P(\\varphi)\>K \\quad\\text{ou}\\quad \\ell\_P(\\varphi)=\\infty.ℓP​(φ)\>KouℓP​(φ)=∞.

Para decidir se r≤Kr\\leq Kr≤K pertence ao espectro, essa distinção é irrelevante. Se uma fórmula não possui prova de custo no máximo KKK, ela não pode produzir um valor recorde r≤Kr\\leq Kr≤K.

Portanto, para cada Φ=(φ0,…,φm)∈FL\\Phi=(\\varphi\_0,\\ldots,\\varphi\_m)\\in\\mathcal F\_LΦ=(φ0​,…,φm​)∈FL​, calculamos todos os valores finitos de ℓP(φj)\\ell\_P(\\varphi\_j)ℓP​(φj​) que não excedem KKK e verificamos a condição finita:

∀i\<jℓP(φi)\<ℓP(φj).\\forall i\<j\\quad \\ell\_P(\\varphi\_i)\<\\ell\_P(\\varphi\_j).∀i\<jℓP​(φi​)\<ℓP​(φj​).

Quando ℓP(φj)=r≤K\\ell\_P(\\varphi\_j)=r\\leq KℓP​(φj​)=r≤K, qualquer predecessor sem prova até KKK satisfaz

ℓP(φi)\>K≥r,\\ell\_P(\\varphi\_i)\>K\\geq r,ℓP​(φi​)\>K≥r,

e, portanto, impede que jjj seja recorde. Assim, nenhuma informação não limitada é necessária.

Logo CP(L;K)C\_P(L;K)CP​(L;K) é computável. □\\square□

Essa é precisamente a forma segura da janela decidível registrada no documento: a busca limitada resolve CT(L)∩\[0,K\]C\_T(L)\\cap\[0,K\]CT​(L)∩\[0,K\], sem resolver a cauda acima de KKK.

---

# **4\. Extensões conservativas de uma apresentação**

## **Definição 4.1. Extensão conservativa de apresentação**

Diremos que P′P'P′ é uma **extensão conservativa de apresentação** de PPP, e escreveremos

P⪯consP′,P\\preceq\_{\\mathrm{cons}}P',P⪯cons​P′,

quando:

1. toda prova de PPP pode ser traduzida efetivamente em uma prova de P′P'P′;  
2. toda prova de P′P'P′ pode ser expandida efetivamente em uma prova de PPP;  
3. ambas provam exatamente as mesmas fórmulas: Thm⁡(P′)=Thm⁡(P).\\operatorname{Thm}(P')=\\operatorname{Thm}(P).Thm(P′)=Thm(P).

A conservatividade diz respeito à provabilidade, não ao comprimento:

P⪯consP′⇏ℓP(φ)=ℓP′(φ).P\\preceq\_{\\mathrm{cons}}P' \\quad\\not\\Rightarrow\\quad \\ell\_P(\\varphi)=\\ell\_{P'}(\\varphi).P⪯cons​P′⇒ℓP​(φ)=ℓP′​(φ).

Uma apresentação pode incluir macros, lemas certificados ou regras derivadas que comprimem provas sem acrescentar teoremas.

---

# **5\. Atalhos certificados**

Seja Σ={σ1,…,σt}\\Sigma=\\{\\sigma\_1,\\ldots,\\sigma\_t\\}Σ={σ1​,…,σt​} uma família finita de teoremas de PPP. Para cada σi\\sigma\_iσi​, fixemos uma prova-base

πi\\pi\_iπi​

tal que

Prf⁡P(πi,σi).\\operatorname{Prf}\_P(\\pi\_i,\\sigma\_i).PrfP​(πi​,σi​).

Introduzimos um certificado especial

qi=shortcut⁡(i,τi),q\_i=\\operatorname{shortcut}(i,\\tau\_i),qi​=shortcut(i,τi​),

onde τi\\tau\_iτi​ é um preenchimento sintático usado para ajustar o custo.

O verificador de PΣP^\\SigmaPΣ aceita qiq\_iqi​ como prova de σi\\sigma\_iσi​ somente se:

1. iii identifica uma entrada válida da tabela Σ\\SigmaΣ;  
2. a tabela contém a prova-base πi\\pi\_iπi​;  
3. o verificador confirma Prf⁡P(πi,σi);\\operatorname{Prf}\_P(\\pi\_i,\\sigma\_i);PrfP​(πi​,σi​);  
4. o preenchimento τi\\tau\_iτi​ satisfaz as condições sintáticas prescritas.

Definimos o custo do atalho como:

cost⁡PΣ(qi)=ri.\\operatorname{cost}\_{P^\\Sigma}(q\_i)=r\_i.costPΣ​(qi​)=ri​.

Como cada atalho se expande em uma prova-base de PPP, temos:

Thm⁡(PΣ)=Thm⁡(P).\\operatorname{Thm}(P^\\Sigma)=\\operatorname{Thm}(P).Thm(PΣ)=Thm(P).

Portanto:

P⪯consPΣ.P\\preceq\_{\\mathrm{cons}}P^\\Sigma.P⪯cons​PΣ.

Essa construção é conservativa porque os atalhos são apenas nomes comprimidos de provas já existentes.

---

# **6\. Lema de isolamento de comprimento**

A proposição abaixo formaliza o ponto tecnicamente indispensável: adicionar uma prova de comprimento rrr fornece apenas uma cota superior, a menos que todas as provas menores sejam excluídas.

## **Lema 6.1. Isolamento local de comprimento**

Sejam:

* PPP uma apresentação de prova;  
* P′P'P′ uma extensão de PPP;  
* σ\\sigmaσ uma fórmula;  
* qqq uma prova de σ\\sigmaσ em P′P'P′;  
* r=cost⁡P′(q)r=\\operatorname{cost}\_{P'}(q)r=costP′​(q).

Suponha que:

### **I1. Testemunha superior**

Prf⁡P′(q,σ)ecost⁡P′(q)=r.\\operatorname{Prf}\_{P'}(q,\\sigma) \\quad\\text{e}\\quad \\operatorname{cost}\_{P'}(q)=r.PrfP′​(q,σ)ecostP′​(q)=r.

### **I2. Eliminação de novos objetos curtos**

Para toda prova ppp de P′P'P′, se

cost⁡P′(p)\<r\\operatorname{cost}\_{P'}(p)\<rcostP′​(p)\<r

e

Prf⁡P′(p,σ),\\operatorname{Prf}\_{P'}(p,\\sigma),PrfP′​(p,σ),

então existe uma prova E(p)E(p)E(p) em PPP tal que

Prf⁡P(E(p),σ)\\operatorname{Prf}\_P(E(p),\\sigma)PrfP​(E(p),σ)

e

cost⁡P(E(p))\<r.\\operatorname{cost}\_P(E(p))\<r.costP​(E(p))\<r.

### **I3. Ausência de prova curta na base**

∀u \[cost⁡P(u)\<r⟹¬Prf⁡P(u,σ)\].\\forall u\\, \\left\[ \\operatorname{cost}\_P(u)\<r \\Longrightarrow \\neg\\operatorname{Prf}\_P(u,\\sigma) \\right\].∀u\[costP​(u)\<r⟹¬PrfP​(u,σ)\].

Então:

ℓP′(σ)=r.\\ell\_{P'}(\\sigma)=r.ℓP′​(σ)=r.

### **Prova**

Por I1, existe uma prova de σ\\sigmaσ em P′P'P′ de custo rrr. Logo:

ℓP′(σ)≤r.\\ell\_{P'}(\\sigma)\\leq r.ℓP′​(σ)≤r.

Suponha, para obter contradição, que:

ℓP′(σ)\<r.\\ell\_{P'}(\\sigma)\<r.ℓP′​(σ)\<r.

Então existe ppp tal que

Prf⁡P′(p,σ)\\operatorname{Prf}\_{P'}(p,\\sigma)PrfP′​(p,σ)

e

cost⁡P′(p)\<r.\\operatorname{cost}\_{P'}(p)\<r.costP′​(p)\<r.

Por I2, existe E(p)E(p)E(p) satisfazendo:

Prf⁡P(E(p),σ)\\operatorname{Prf}\_P(E(p),\\sigma)PrfP​(E(p),σ)

e

cost⁡P(E(p))\<r.\\operatorname{cost}\_P(E(p))\<r.costP​(E(p))\<r.

Isso contradiz I3. Portanto:

ℓP′(σ)≥r.\\ell\_{P'}(\\sigma)\\geq r.ℓP′​(σ)≥r.

Combinando as duas desigualdades:

ℓP′(σ)=r.\\ell\_{P'}(\\sigma)=r.ℓP′​(σ)=r.

□\\square□

---

## **Observação fundamental**

A mera conservatividade

Thm⁡(P′)=Thm⁡(P)\\operatorname{Thm}(P')=\\operatorname{Thm}(P)Thm(P′)=Thm(P)

não implica I2. Uma macro curta pode ser combinada com outras regras e produzir indiretamente uma nova prova curta de σ\\sigmaσ.

Por isso precisamos controlar não somente os atalhos diretos, mas também as suas composições.

---

# **7\. Isolamento simultâneo**

Para realizar um conjunto inteiro de comprimentos, precisamos de uma versão uniforme.

## **Lema 7.1. Isolamento simultâneo em uma janela**

Sejam:

Σ={σ1,…,σt},0\<r1\<⋯\<rt≤K.\\Sigma=\\{\\sigma\_1,\\ldots,\\sigma\_t\\}, \\qquad 0\<r\_1\<\\cdots\<r\_t\\leq K.Σ={σ1​,…,σt​},0\<r1​\<⋯\<rt​≤K.

Seja PΣP^\\SigmaPΣ uma extensão conservativa de PPP com certificados qiq\_iqi​ tais que:

Prf⁡PΣ(qi,σi),cost⁡PΣ(qi)=ri.\\operatorname{Prf}\_{P^\\Sigma}(q\_i,\\sigma\_i), \\qquad \\operatorname{cost}\_{P^\\Sigma}(q\_i)=r\_i.PrfPΣ​(qi​,σi​),costPΣ​(qi​)=ri​.

Suponha que, para cada i≤ti\\leq ti≤t:

1. não exista prova-base de σi\\sigma\_iσi​ com custo menor que rir\_iri​;  
2. toda prova de σi\\sigma\_iσi​ em PΣP^\\SigmaPΣ com custo menor que rir\_iri​ possa ser eliminada ou expandida em uma prova-base de custo menor que rir\_iri​.

Então:

ℓPΣ(σi)=ripara todo i≤t.\\ell\_{P^\\Sigma}(\\sigma\_i)=r\_i \\qquad \\text{para todo }i\\leq t.ℓPΣ​(σi​)=ri​para todo i≤t.

### **Prova**

Aplicamos o Lema 6.1 separadamente a cada par (σi,ri)(\\sigma\_i,r\_i)(σi​,ri​). □\\square□

---

# **8\. Condição de blindagem da janela**

O isolamento dos elementos desejados ainda não é suficiente para provar que a janela é exata. É necessário excluir valores não desejados produzidos por outras fórmulas.

## **Definição 8.1. Blindagem (L,K)(L,K)(L,K)**

Seja S⊆\[0,K\]S\\subseteq\[0,K\]S⊆\[0,K\]. Diremos que P′P'P′ está **(L,K,S)(L,K,S)(L,K,S)-blindado** quando, para toda fórmula ψ\\psiψ que aparece em alguma família Φ∈FL\\Phi\\in\\mathcal F\_LΦ∈FL​,

ℓP′(ψ)≤K⟹ℓP′(ψ)∈S.\\ell\_{P'}(\\psi)\\leq K \\quad\\Longrightarrow\\quad \\ell\_{P'}(\\psi)\\in S.ℓP′​(ψ)≤K⟹ℓP′​(ψ)∈S.

A blindagem é uma afirmação sobre todos os comprimentos mínimos visíveis na janela.

Como o domínio é finito, ela admite certificado finito:

1. enumerar todas as fórmulas relevantes;  
2. enumerar todas as provas de custo no máximo KKK;  
3. calcular o menor custo encontrado para cada fórmula;  
4. verificar que todo valor encontrado pertence a SSS.

Isso não exige decidir se uma fórmula sem prova até KKK é improvável. Basta concluir:

ℓP′(ψ)\>KouℓP′(ψ)=∞.\\ell\_{P'}(\\psi)\>K \\quad\\text{ou}\\quad \\ell\_{P'}(\\psi)=\\infty.ℓP′​(ψ)\>KouℓP′​(ψ)=∞.

---

# **9\. Teorema da janela exata**

## **Teorema 9.1. Realização exata em janela finita**

Fixem-se L,K∈NL,K\\in\\mathbb NL,K∈N e um conjunto finito:

S={r1\<r2\<⋯\<rt}⊆\[0,K\].S=\\{r\_1\<r\_2\<\\cdots\<r\_t\\}\\subseteq\[0,K\].S={r1​\<r2​\<⋯\<rt​}⊆\[0,K\].

Seja PSP\_SPS​ uma extensão conservativa de PPP. Suponha que:

### **J1. Realização**

Para cada ri∈Sr\_i\\in Sri​∈S, existe uma família

Φi∈FL\\Phi\_i\\in\\mathcal F\_LΦi​∈FL​

e um índice jij\_iji​ nela tal que:

ℓPS((Φi)ji)=ri,\\ell\_{P\_S}((\\Phi\_i)\_{j\_i})=r\_i,ℓPS​​((Φi​)ji​​)=ri​,

e jij\_iji​ é índice de recorde em Φi\\Phi\_iΦi​.

### **J2. Blindagem espectral**

Para toda Φ∈FL\\Phi\\in\\mathcal F\_LΦ∈FL​, todo valor recorde de Φ\\PhiΦ que não exceda KKK pertence a SSS.

Então:

CPS(L)∩\[0,K\]=S.C\_{P\_S}(L)\\cap\[0,K\]=S.CPS​​(L)∩\[0,K\]=S.

### **Prova**

Por J1, para todo ri∈Sr\_i\\in Sri​∈S,

ri∈CPS(L).r\_i\\in C\_{P\_S}(L).ri​∈CPS​​(L).

Como ri≤Kr\_i\\leq Kri​≤K,

S⊆CPS(L)∩\[0,K\].S\\subseteq C\_{P\_S}(L)\\cap\[0,K\].S⊆CPS​​(L)∩\[0,K\].

Reciprocamente, seja

r∈CPS(L)∩\[0,K\].r\\in C\_{P\_S}(L)\\cap\[0,K\].r∈CPS​​(L)∩\[0,K\].

Então existe Φ∈FL\\Phi\\in\\mathcal F\_LΦ∈FL​ e um índice de recorde jjj tal que:

r=ℓPS(φj)≤K.r=\\ell\_{P\_S}(\\varphi\_j)\\leq K.r=ℓPS​​(φj​)≤K.

Por J2,

r∈S.r\\in S.r∈S.

Logo:

CPS(L)∩\[0,K\]⊆S.C\_{P\_S}(L)\\cap\[0,K\]\\subseteq S.CPS​​(L)∩\[0,K\]⊆S.

Portanto:

CPS(L)∩\[0,K\]=S.C\_{P\_S}(L)\\cap\[0,K\]=S.CPS​​(L)∩\[0,K\]=S.

□\\square□

---

# **10\. Certificado finito da janela exata**

O teorema anterior pode ser transformado em um certificado verificável.

Um certificado de

CPS(L)∩\[0,K\]=SC\_{P\_S}(L)\\cap\[0,K\]=SCPS​​(L)∩\[0,K\]=S

é composto por:

## **Parte positiva**

Para cada r∈Sr\\in Sr∈S:

1. uma família Φr∈FL\\Phi\_r\\in\\mathcal F\_LΦr​∈FL​;  
2. um índice jrj\_rjr​;  
3. uma prova qrq\_rqr​;  
4. a verificação: Prf⁡PS(qr,(Φr)jr);\\operatorname{Prf}\_{P\_S}(q\_r,(\\Phi\_r)\_{j\_r});PrfPS​​(qr​,(Φr​)jr​​);  
5. a igualdade: cost⁡PS(qr)=r;\\operatorname{cost}\_{P\_S}(q\_r)=r;costPS​​(qr​)=r;  
6. certificados de que não existe prova de custo menor que rrr;  
7. certificados de que jrj\_rjr​ é recorde.

## **Parte de exclusão**

Para cada fórmula relevante ψ\\psiψ:

1. enumerar todas as provas ppp com cost⁡PS(p)≤K;\\operatorname{cost}\_{P\_S}(p)\\leq K;costPS​​(p)≤K;  
2. determinar o menor custo encontrado;  
3. verificar que esse custo:  
   * pertence a SSS, ou  
   * não produz um recorde;  
4. se nenhuma prova foi encontrada, registrar somente: ℓPS(ψ)\>KouℓPS(ψ)=∞.\\ell\_{P\_S}(\\psi)\>K \\quad\\text{ou}\\quad \\ell\_{P\_S}(\\psi)=\\infty.ℓPS​​(ψ)\>KouℓPS​​(ψ)=∞.

Essa última alternativa é exatamente o motivo pelo qual a janela finita não viola G.10.

---

# **11\. As duas apresentações conservativas**

Agora construímos duas geometrias na mesma janela.

Fixemos:

0\<r1\<r2\<⋯\<rt=M≤K.0\<r\_1\<r\_2\<\\cdots\<r\_t=M\\leq K.0\<r1​\<r2​\<⋯\<rt​=M≤K.

Considere os conjuntos:

Sesp={M}S\_{\\mathrm{esp}}=\\{M\\}Sesp​={M}

e

Sden={r1,…,rt}.S\_{\\mathrm{den}}=\\{r\_1,\\ldots,r\_t\\}.Sden​={r1​,…,rt​}.

No caso máximo denso, tomamos:

Sden={1,2,…,M}.S\_{\\mathrm{den}}=\\{1,2,\\ldots,M\\}.Sden​={1,2,…,M}.

Construímos duas extensões conservativas da mesma apresentação-base PPP:

PespePden.P\_{\\mathrm{esp}} \\quad\\text{e}\\quad P\_{\\mathrm{den}}.Pesp​ePden​.

---

## **11.1 Apresentação esparsa**

A apresentação PespP\_{\\mathrm{esp}}Pesp​ contém um único atalho espectral relevante:

qMespq\_M^{\\mathrm{esp}}qMesp​

para uma sentença σM\\sigma\_MσM​, com:

cost⁡Pesp(qMesp)=M.\\operatorname{cost}\_{P\_{\\mathrm{esp}}} (q\_M^{\\mathrm{esp}}) \=M.costPesp​​(qMesp​)=M.

O lema de isolamento demonstra:

ℓPesp(σM)=M.\\ell\_{P\_{\\mathrm{esp}}}(\\sigma\_M)=M.ℓPesp​​(σM​)=M.

A blindagem deve garantir:

ℓPesp(ψ)≤K⟹ℓPesp(ψ)=M\\ell\_{P\_{\\mathrm{esp}}}(\\psi)\\leq K \\Longrightarrow \\ell\_{P\_{\\mathrm{esp}}}(\\psi)=MℓPesp​​(ψ)≤K⟹ℓPesp​​(ψ)=M

para todo objeto espectral relevante, ou então que qualquer outro comprimento não produz recorde.

Consequentemente:

CPesp(L)∩\[0,K\]={M}.C\_{P\_{\\mathrm{esp}}}(L)\\cap\[0,K\] \= \\{M\\}.CPesp​​(L)∩\[0,K\]={M}.

Portanto:

RPesp(L;K)=MR\_{P\_{\\mathrm{esp}}}(L;K)=MRPesp​​(L;K)=M

e

NPesp(L;K)=1.N\_{P\_{\\mathrm{esp}}}(L;K)=1.NPesp​​(L;K)=1.

---

## **11.2 Apresentação densa**

A apresentação PdenP\_{\\mathrm{den}}Pden​ contém atalhos:

q1den,…,qtdenq\_1^{\\mathrm{den}}, \\ldots, q\_t^{\\mathrm{den}}q1den​,…,qtden​

para sentenças ordenadas

σ1,…,σt,\\sigma\_1,\\ldots,\\sigma\_t,σ1​,…,σt​,

com:

cost⁡Pden(qiden)=ri.\\operatorname{cost}\_{P\_{\\mathrm{den}}} (q\_i^{\\mathrm{den}}) \=r\_i.costPden​​(qiden​)=ri​.

O isolamento simultâneo produz:

ℓPden(σi)=ri.\\ell\_{P\_{\\mathrm{den}}}(\\sigma\_i)=r\_i.ℓPden​​(σi​)=ri​.

Para que todos sejam recordes em uma única família, usamos:

Φden=(σ1,…,σt).\\Phi\_{\\mathrm{den}} \= (\\sigma\_1,\\ldots,\\sigma\_t).Φden​=(σ1​,…,σt​).

Como:

r1\<r2\<⋯\<rt,r\_1\<r\_2\<\\cdots\<r\_t,r1​\<r2​\<⋯\<rt​,

cada índice é um índice de recorde. Logo:

Sden⊆CPden(L)∩\[0,K\].S\_{\\mathrm{den}} \\subseteq C\_{P\_{\\mathrm{den}}}(L)\\cap\[0,K\].Sden​⊆CPden​​(L)∩\[0,K\].

A blindagem exclui os demais valores e fornece:

CPden(L)∩\[0,K\]=Sden.C\_{P\_{\\mathrm{den}}}(L)\\cap\[0,K\] \= S\_{\\mathrm{den}}.CPden​​(L)∩\[0,K\]=Sden​.

Assim:

RPden(L;K)=MR\_{P\_{\\mathrm{den}}}(L;K)=MRPden​​(L;K)=M

e

NPden(L;K)=t.N\_{P\_{\\mathrm{den}}}(L;K)=t.NPden​​(L;K)=t.

No caso totalmente denso:

Sden={1,…,M},S\_{\\mathrm{den}}=\\{1,\\ldots,M\\},Sden​={1,…,M},

obtemos:

NPden(L;K)=M.N\_{P\_{\\mathrm{den}}}(L;K)=M.NPden​​(L;K)=M.

---

# **12\. Comparação rigorosa**

As duas apresentações satisfazem:

Thm⁡(Pesp)=Thm⁡(P)=Thm⁡(Pden).\\operatorname{Thm}(P\_{\\mathrm{esp}}) \= \\operatorname{Thm}(P) \= \\operatorname{Thm}(P\_{\\mathrm{den}}).Thm(Pesp​)=Thm(P)=Thm(Pden​).

Portanto, elas têm exatamente a mesma força dedutiva.

Entretanto:

CPesp(L)∩\[0,K\]={M},C\_{P\_{\\mathrm{esp}}}(L)\\cap\[0,K\] \= \\{M\\},CPesp​​(L)∩\[0,K\]={M},

enquanto:

CPden(L)∩\[0,K\]={r1,…,rt=M}.C\_{P\_{\\mathrm{den}}}(L)\\cap\[0,K\] \= \\{r\_1,\\ldots,r\_t=M\\}.CPden​​(L)∩\[0,K\]={r1​,…,rt​=M}.

Se Sden={1,…,M}S\_{\\mathrm{den}}=\\{1,\\ldots,M\\}Sden​={1,…,M}, então:

CPden(L)∩\[0,K\]={1,…,M}.C\_{P\_{\\mathrm{den}}}(L)\\cap\[0,K\] \= \\{1,\\ldots,M\\}.CPden​​(L)∩\[0,K\]={1,…,M}.

Os envelopes coincidem:

RPesp(L;K)=RPden(L;K)=M.R\_{P\_{\\mathrm{esp}}}(L;K) \= R\_{P\_{\\mathrm{den}}}(L;K) \= M.RPesp​​(L;K)=RPden​​(L;K)=M.

As cardinalidades divergem:

NPesp(L;K)=1,N\_{P\_{\\mathrm{esp}}}(L;K)=1,NPesp​​(L;K)=1, NPden(L;K)=t.N\_{P\_{\\mathrm{den}}}(L;K)=t.NPden​​(L;K)=t.

No caso denso total:

NPden(L;K)NPesp(L;K)=M.\\frac{ N\_{P\_{\\mathrm{den}}}(L;K) }{ N\_{P\_{\\mathrm{esp}}}(L;K) } \= M.NPesp​​(L;K)NPden​​(L;K)​=M.

Portanto, mesmo com:

Resp=Rden,R\_{\\mathrm{esp}}=R\_{\\mathrm{den}},Resp​=Rden​,

o envelope não determina a cardinalidade espectral.

---

# **13\. Versão assintótica condicional**

Para aproximar P-1, consideremos sequências:

Ln,Kn,Mn,L\_n,\\quad K\_n,\\quad M\_n,Ln​,Kn​,Mn​,

com:

Mn≤KneMn→∞.M\_n\\leq K\_n \\quad\\text{e}\\quad M\_n\\to\\infty.Mn​≤Kn​eMn​→∞.

Suponha que as construções anteriores sejam uniformes em nnn e produzam:

CPesp(Ln)∩\[0,Kn\]={Mn},C\_{P\_{\\mathrm{esp}}}(L\_n)\\cap\[0,K\_n\] \= \\{M\_n\\},CPesp​​(Ln​)∩\[0,Kn​\]={Mn​},

e

CPden(Ln)∩\[0,Kn\]={1,…,Mn}.C\_{P\_{\\mathrm{den}}}(L\_n)\\cap\[0,K\_n\] \= \\{1,\\ldots,M\_n\\}.CPden​​(Ln​)∩\[0,Kn​\]={1,…,Mn​}.

Então:

RPesp(Ln;Kn)=RPden(Ln;Kn)=Mn.R\_{P\_{\\mathrm{esp}}}(L\_n;K\_n) \= R\_{P\_{\\mathrm{den}}}(L\_n;K\_n) \= M\_n.RPesp​​(Ln​;Kn​)=RPden​​(Ln​;Kn​)=Mn​.

Logo os envelopes limitados são não apenas assintoticamente equivalentes, mas iguais:

RPesp(Ln;Kn)≍RPden(Ln;Kn)R\_{P\_{\\mathrm{esp}}}(L\_n;K\_n) \\asymp R\_{P\_{\\mathrm{den}}}(L\_n;K\_n)RPesp​​(Ln​;Kn​)≍RPden​​(Ln​;Kn​)

com constantes explícitas:

c=C=1.c=C=1.c=C=1.

Por outro lado:

NPesp(Ln;Kn)=1N\_{P\_{\\mathrm{esp}}}(L\_n;K\_n)=1NPesp​​(Ln​;Kn​)=1

e

NPden(Ln;Kn)=Mn.N\_{P\_{\\mathrm{den}}}(L\_n;K\_n)=M\_n.NPden​​(Ln​;Kn​)=Mn​.

Se fossem assintoticamente equivalentes, existiria C\>0C\>0C\>0 tal que, para todo nnn suficientemente grande,

Mn=NPden(Ln;Kn)≤CNPesp(Ln;Kn)=C.M\_n \= N\_{P\_{\\mathrm{den}}}(L\_n;K\_n) \\leq C N\_{P\_{\\mathrm{esp}}}(L\_n;K\_n) \= C.Mn​=NPden​​(Ln​;Kn​)≤CNPesp​​(Ln​;Kn​)=C.

Isso contradiz:

Mn→∞.M\_n\\to\\infty.Mn​→∞.

Logo:

NPesp(Ln;Kn)≭NPden(Ln;Kn).N\_{P\_{\\mathrm{esp}}}(L\_n;K\_n) \\not\\asymp N\_{P\_{\\mathrm{den}}}(L\_n;K\_n).NPesp​​(Ln​;Kn​)≍NPden​​(Ln​;Kn​).

Isso fecha a versão **limitada por janela** de P-1 para apresentações conservativas, desde que o isolamento e a blindagem sejam uniformemente certificados.

---

# **14\. O que ainda impede a passagem à versão global**

A igualdade de janela:

CP(L)∩\[0,K\]=SC\_P(L)\\cap\[0,K\]=SCP​(L)∩\[0,K\]=S

não implica:

CP(L)=S.C\_P(L)=S.CP​(L)=S.

Pode haver valores acima de KKK:

r\>K,r∈CP(L).r\>K,\\qquad r\\in C\_P(L).r\>K,r∈CP​(L).

Assim, mesmo que:

RPesp(L;K)=RPden(L;K),R\_{P\_{\\mathrm{esp}}}(L;K) \= R\_{P\_{\\mathrm{den}}}(L;K),RPesp​​(L;K)=RPden​​(L;K),

ainda pode ocorrer:

RPesp(L)≠RPden(L).R\_{P\_{\\mathrm{esp}}}(L) \\neq R\_{P\_{\\mathrm{den}}}(L).RPesp​​(L)=RPden​​(L).

Para promover o resultado limitado ao global, precisamos de ao menos uma das hipóteses a seguir.

## **Hipótese de cota global**

RP(L)≤K.R\_P(L)\\leq K.RP​(L)≤K.

Então:

CP(L)=CP(L)∩\[0,K\].C\_P(L)=C\_P(L)\\cap\[0,K\].CP​(L)=CP​(L)∩\[0,K\].

## **Hipótese de cauda falsa**

Toda fórmula candidata após o ponto projetado é falsa em N\\mathbb NN, e TTT possui a correção necessária. Nesse caso:

T⊬φjT\\nvdash\\varphi\_jT⊬φj​

para toda entrada da cauda, de modo que:

ℓP(φj)=∞.\\ell\_P(\\varphi\_j)=\\infty.ℓP​(φj​)=∞.

## **Hipótese de irrelevância da cauda**

Pode haver provas acima de KKK, mas demonstra-se estruturalmente que elas não produzem novos recordes.

Sem uma dessas hipóteses, o resultado correto permanece:

CP(L)∩\[0,K\]=S,C\_P(L)\\cap\[0,K\]=S,CP​(L)∩\[0,K\]=S,

e não:

CP(L)=S.C\_P(L)=S.CP​(L)=S.

---

# **15\. Estatuto matemático final**

Podemos registrar os resultados da seguinte maneira.

## **Provado em nível abstrato**

1. O Lema de isolamento local é válido.  
2. O isolamento simultâneo reduz-se ao lema local.  
3. A janela CP(L)∩\[0,K\]C\_P(L)\\cap\[0,K\]CP​(L)∩\[0,K\] é decidível sob as hipóteses de efetividade.  
4. Realização mais blindagem implicam janela exata.  
5. Duas apresentações conservativas podem ter: Resp(L;K)=Rden(L;K)R\_{\\mathrm{esp}}(L;K)=R\_{\\mathrm{den}}(L;K)Resp​(L;K)=Rden​(L;K) e Nesp(L;K)≠Nden(L;K).N\_{\\mathrm{esp}}(L;K)\\neq N\_{\\mathrm{den}}(L;K).Nesp​(L;K)=Nden​(L;K).  
6. Para uma família uniforme com Mn→∞M\_n\\to\\inftyMn​→∞: Resp≍Rdencom c=C=1,R\_{\\mathrm{esp}}\\asymp R\_{\\mathrm{den}} \\quad\\text{com }c=C=1,Resp​≍Rden​com c=C=1, mas Nesp≭Nden.N\_{\\mathrm{esp}}\\not\\asymp N\_{\\mathrm{den}}.Nesp​≍Nden​.

## **Ainda condicionado**

1. A existência de apresentações naturais, e não artificialmente ponderadas, satisfazendo uniformemente as hipóteses de isolamento.  
2. A blindagem uniforme para uma única apresentação infinita.  
3. A promoção da janela para o espectro global.  
4. A realização nas apresentações canônicas de S21S^1\_2S21​ e PA\\mathrm{PA}PA.  
5. A independência da separação diante de mudanças polinomialmente equivalentes de codificação.

## **Conclusão rigorosa**

O resultado obtido é:

> **O envelope limitado RP(L;K)R\_P(L;K)RP​(L;K) não determina a geometria espectral limitada, mesmo entre apresentações conservativas da mesma teoria.**

Mas ainda não podemos afirmar:

> RT(L)R\_T(L)RT​(L) não determina NT(L)N\_T(L)NT​(L) para as apresentações canônicas de S21S^1\_2S21​ e PA\\mathrm{PA}PA.

Esse segundo enunciado continua aberto, exatamente como exige o documento-base.

A principal melhoria conceitual foi separar três obrigações que antes estavam parcialmente misturadas: **realização**, que fornece os valores desejados; **isolamento**, que prova a minimalidade dos comprimentos; e **blindagem**, que exclui valores adicionais dentro da janela. Essa divisão torna claro o que já é um teorema abstrato e o que ainda precisa ser construído em sistemas aritméticos canônicos.

