# 05 — Desenvolvimento reproduzível

Como regenerar a verificação, em que ordem ler o material e o que cada artefato cobre.

---

## 1. Ambiente

- Sistema: Windows (PowerShell), Python **3.12.10**.
- Sem dependências externas (biblioteca padrão: `itertools`, `sys`).

## 2. Comandos

Comandos executados a partir da **raiz do projeto** (`Desktop\Lógica\`):

```powershell
# 1. Executar a verificação exaustiva (≈40 s; imprime e retorna código 0 se tudo OK)
python "src\python\verifica_espectro.py"

# 2. Regenerar o arquivo de resultado
python "src\python\verifica_espectro.py" |
  Out-File -Encoding utf8 "src\python\resultado_verificacao.txt"
```

Resultado esperado (idêntico ao arquivo salvo):

```
perfis enumerados          : 410155
pares (c1,c2) testados     : 7737331
escadas testadas (REAL)    : 57
maior salto unitario de J  : 8
exemplo (2,10,7,inf)       : B_T=[2, 10], rho=10, j*=3, J(9)=1, J(10)=3
TODOS OS TESTES PASSARAM (T5.1a/b, L6.1, T6.2, T6.3, T4.1, REAL, EXEMP)
```

Código de saída: `0` = todos os testes passaram; `1` = há falhas (lista as primeiras 40).

## 3. O que o script cobre — e o que **não** cobre

**Cobre** (enumeração finita, k ∈ {1,…,6,8}; valores {0,1,2,3,∞}):

- T5.1a: `c ≥ ρ ⟹ J(c)=j*`; T5.1b: recíproca (`ρ` é limiar exato);
- L6.1: monotonicidade de `J`;
- T6.2: `J(r−1)≠J(r) ⟺ r ∈ B_T`, todo `r ≥ 1`;
- T6.3: `J(c₁)≠J(c₂) ⟺ B_T∩(c₁,c₂]≠∅`;
- T4.1: `j*=0 ⟺ B_T=∅ ∧ ρ=0`; `j*>0 ⟹ ρ=max B_T`;
- REAL: toda escada finita estritamente crescente (inclusive vazia) é realizável;
- EXEMP: reprodução do exemplo documentado `(2,10,7,∞)`.

**Não cobre:**

- **Não é prova substituta.** Os teoremas são de caso finito sobre perfis e valem para todo `k`; a enumeração é checagem independente, não demonstração. As provas escritas continuam obrigatórias (núcleo §5–7).
- Não testa o gadget `θ↦Φ_θ`, correção/soundness, nem a computabilidade de `g_T^[b]` (Etapa 7, pendente).
- Não testa acessibilidade operacional `F_n` nem a relação `C_T(L)` vs `B_b(L)`.
- Não modela teorias T concretas (`S^1_2`, PA) — perfis são abstratos.

## 4. Ordem de leitura recomendada

1. `README.md` (mapa e status).
2. `01_NUCLEO_DURO.md` (definições e teoremas verificados).
3. `02_REVISAO_CRITICA.md` (o que não está provado, o que é clássico, o que falta).
4. `03_PRONTOS_E_A_FAZER.md` (checklist operacional).
5. `04_CONTINUIDADE.md` (relação com `Gödel\` e com a linha da colagem).
6. Fontes primárias: `../../proofs/Núcleo formal mínimo do espectro de limiares de prova.md`, `../../proofs/desenv. logica kubricek leis.md`, `../../docs/logica  organização.md`, `../../docs/Lógica bibliografia kragicek.md`.

## 5. Estrutura da pasta (projeto unificado em 26/09/2026)

```
Lógica\                              raiz do projeto
├── README.md                        mapa e status do projeto
├── DOCUMENTO_CONTINUIDADE_PESQUISA.md   histórico de decisões (de onde partimos / para onde vamos)
├── proofs\                          rascunhos de lógica e provas (fontes primárias da linha)
├── docs\
│   ├── espectro-limiares\           este subprojeto (documentos 01–05)
│   ├── documento_continuidade_perspectiva_colagem_reflexao_v1.md
│   ├── logica  organização.md       diagnóstico crítico + plano de 18 etapas
│   └── Lógica bibliografia kragicek.md
├── src\python\                      Pilar 2A — verificação exaustiva
│   ├── verifica_espectro.py            verificação exaustiva (stdlib)
│   └── resultado_verificacao.txt       saída congelada
├── src\julia\                       Pilar 2B — simulações de alta performance
├── assets\geogebra\                 Pilar 2C — modelagem geométrica dinâmica
└── paper\                           Pilar 4 — artigo (main.tex, references.bib, figures\)
```

## 6. Regra de versionamento

Ao alterar as definições do núcleo (n, `q(Φ)`, convenções de `>`/`≥`), reexecutar o script e atualizar `resultado_verificacao.txt` no mesmo commit. Se o script falhar, o `01_NUCLEO_DURO.md` está errado — corrigir o texto, nunca o script para casar com o texto.
