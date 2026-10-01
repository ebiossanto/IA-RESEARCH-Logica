#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
verifica_espectro.py
====================
Verificacao exaustiva (por enumeracao finita) das definicoes e teoremas
locais do "espectro de limiares de prova", conforme o documento

  Nucleo formal minimo do espectro de limiares de prova.md

Definicoes reproduzidas aqui (secao 0 a 4 do nucleo):

  Perfil:   L = (ell_0, ell_1, ..., ell_{k-1}),  ell_j em N U {inf}
  j*        = min { j < k : ell_j = inf }   (k se o conjunto for vazio)
  rho       = max { ell_j : j < j* }        (0 se j* = 0)
  I (recordes) = { j < j* : ell_j > max_{i<j} ell_i },  max sobre vazio = -1
  B_T       = { ell_j : j em I }            ("escada de limiares")
  J(c)      = min { j < k : ell_j > c }     (k se o conjunto for vazio)

Propriedades verificadas (numeracao do nucleo):

  (T5.1a) c >= rho  ==>  J(c) = j*                       [estabilizacao]
  (T5.1b) J(c) = j*  <==>  c >= rho                      [limiar exato, iff]
  (L6.1)  J nao decrescente                               [monotonicidade]
  (T6.2)  J(r-1) != J(r)  <==>  r em B_T     (todo r >= 1) [transicoes unitarias]
  (T6.3)  c1 <= c2:  J(c1) != J(c2)  <==>  B_T inter (c1,c2] != vazio
  (T4.1)  B_T != vazio  ==>  rho = max B_T;  j*=0 ==> B_T=vazio e rho=0
  (REAL)  toda escada finita estritamente crescente (inclusive vazia)
          e B_T de algum perfil admissivel
  (EXEMP) perfil (2,10,7,inf) ==> B_T={2,10}, rho=10, j*=3   [exemplo do nucleo]

Uso:  python verifica_espectro.py
Sai com codigo 0 se todos os testes passarem, 1 caso contrario.
"""

import sys
from itertools import product

INF = None  # representante de +infinito (el_j = infinito  <==>  nao demonstravel)


# ----------------------------------------------------------------------
# Nucleo de calculo
# ----------------------------------------------------------------------
def j_estrela(L):
    """j*(Phi): primeiro indice com comprimento infinito; k se todos finitos."""
    for j, v in enumerate(L):
        if v is INF:
            return j
    return len(L)


def rho(L):
    """rho_T(Phi): maximo dos comprimentos minimos antes de j*; 0 se j*=0."""
    jstar = j_estrela(L)
    vals = [v for v in L[:jstar] if v is not INF]
    return max(vals) if vals else 0


def indices_recorde(L):
    """I_T(Phi): indices de recorde prefixais antes de j*."""
    jstar = j_estrela(L)
    I, rec = [], -1
    for j in range(jstar):
        if L[j] > rec:
            I.append(j)
            rec = L[j]
    return I


def escada(L):
    """B_T(Phi): conjunto (finito) dos limiares efetivos de transicao."""
    return [L[j] for j in indices_recorde(L)]


def J(L, c):
    """J_{T,Phi}(c): primeiro candidato sem prova de comprimento <= c."""
    for j, v in enumerate(L):
        if v is INF or v > c:
            return j
    return len(L)


def max_finito(L):
    fin = [v for v in L if v is not INF]
    return max(fin) if fin else 0


# ----------------------------------------------------------------------
# Fabrica de perfis (para testar a realizabilidade de escadas)
# ----------------------------------------------------------------------
def perfil_de_escada(esc, k=None):
    """Constroi L com B_T(L) = esc (esc: lista estritamente crescente)."""
    base = list(esc) + [INF]
    if k is None:
        k = max(8, len(base))
    assert len(base) <= k
    return base + [INF] * (k - len(base))


# ----------------------------------------------------------------------
# Testes
# ----------------------------------------------------------------------
def main():
    falhas = []
    n_perfis = 0
    pares_testados = 0
    saltos_maximos = {}  # "k" -> maior salto observado de J num unico r

    def check(cond, msg):
        if not cond:
            falhas.append(msg)

    # Valores finitos possiveis + infinito.  Infinito precisa aparecer para
    # cobrir a hipotese "primeiro candidato nao demonstravel".
    valores = [0, 1, 2, 3, INF]

    # ----------------------------------------------------------------------
    # Enumeracao exaustiva de perfis (k = 1..6 e k = 2^q para q=1,2,3)
    # ----------------------------------------------------------------------
    tamanhos = [1, 2, 3, 4, 5, 6, 8]
    for k in tamanhos:
        for tup in product(valores, repeat=k):
            L = list(tup)
            n_perfis += 1
            jstar = j_estrela(L)
            r = rho(L)
            B = escada(L)

            # ---- (T4.1) rho = max B quando B nao vazio; j*=0 => B vazio, rho=0
            if jstar == 0:
                check(B == [], f"T4.1: j*=0 mas B={B} (L={L})")
                check(r == 0, f"T4.1: j*=0 mas rho={r} (L={L})")
            else:
                check(B != [], f"T4.1: j*>0 mas B vazio (L={L})")
                check(r == max(B),
                      f"T4.1: rho={r} != max B={max(B)} (L={L})")

            # ---- (T5.1a/b) estabilizacao e limiar exato
            M = max_finito(L)
            for c in range(0, M + 3):
                if c >= r:
                    check(J(L, c) == jstar,
                          f"T5.1a: c={c} >= rho={r} mas J={J(L,c)} != j*={jstar} (L={L})")
                if J(L, c) == jstar:
                    check(c >= r,
                          f"T5.1b: J({c})=j* mas c < rho={r} (L={L})")

            # ---- (L6.1) monotonicidade
            for c1 in range(0, M + 2):
                for c2 in range(c1, M + 3):
                    check(J(L, c1) <= J(L, c2),
                          f"L6.1: J({c1})={J(L,c1)} > J({c2})={J(L,c2)} (L={L})")

            # ---- (T6.2) transicoes unitarias exatamente em B_T
            salto_max = 0
            for rr in range(1, M + 2):
                mudou = J(L, rr - 1) != J(L, rr)
                em_B = rr in B
                check(mudou == em_B,
                      f"T6.2: r={rr}; J({rr-1})={J(L,rr-1)}, J({rr})={J(L,rr)}, "
                      f"B={B} (L={L})")
                if mudou:
                    salto_max = max(salto_max, abs(J(L, rr) - J(L, rr - 1)))
            saltos_maximos[k] = max(saltos_maximos.get(k, 0), salto_max)

            # ---- (T6.3) caracterizacao em intervalos
            for c1 in range(0, M + 2):
                for c2 in range(c1, M + 3):
                    mudou = J(L, c1) != J(L, c2)
                    inter = any(c1 < b <= c2 for b in B)
                    check(mudou == inter,
                          f"T6.3: ({c1},{c2}]; J({c1})={J(L,c1)}, J({c2})={J(L,c2)}, "
                          f"B={B} (L={L})")
                    pares_testados += 1

    # ----------------------------------------------------------------------
    # (REAL) toda escada finita estritamente crescente e realizavel
    # ----------------------------------------------------------------------
    n_escadas = 0
    k_pad = 8
    # sequencias estritamente crescentes sobre {0,1,2,3,4,5} de comprimento 0..4
    def crescentes(pool, maxlen):
        yield []
        for r in range(1, maxlen + 1):
            for c in product(pool, repeat=r):
                if all(c[i] < c[i + 1] for i in range(r - 1)):
                    yield list(c)

    for esc in crescentes([0, 1, 2, 3, 4, 5], 4):
        n_escadas += 1
        L = perfil_de_escada(esc, k=k_pad)
        check(escada(L) == esc,
              f"REAL: escada {esc} nao realizavel; obtido {escada(L)} (L={L})")
        if esc:
            check(rho(L) == max(esc),
                  f"REAL: rho={rho(L)} != max {esc} (L={L})")
        else:
            check(rho(L) == 0 and j_estrela(L) == 0,
                  f"REAL: escada vazia com rho={rho(L)}, j*={j_estrela(L)}")

    # ----------------------------------------------------------------------
    # (EXEMP) exemplo documentado: L = (2,10,7,inf)
    # ----------------------------------------------------------------------
    Lex = [2, 10, 7, INF]
    check(escada(Lex) == [2, 10], f"EXEMP: B_T={escada(Lex)} != [2,10]")
    check(rho(Lex) == 10, f"EXEMP: rho={rho(Lex)} != 10")
    check(j_estrela(Lex) == 3, f"EXEMP: j*={j_estrela(Lex)} != 3")
    check(J(Lex, 9) == 1 and J(Lex, 10) == 3,
          f"EXEMP: J(9)={J(Lex,9)}, J(10)={J(Lex,10)} (esperado 1 e 3)")

    # ----------------------------------------------------------------------
    # Relatorio
    # ----------------------------------------------------------------------
    print("=" * 70)
    print("Verificacao exaustiva do espectro de limiares de prova")
    print("=" * 70)
    print(f"perfis enumerados          : {n_perfis}")
    print(f"pares (c1,c2) testados     : {pares_testados}")
    print(f"escadas testadas (REAL)    : {n_escadas}")
    print(f"maior salto unitario de J  : {max(saltos_maximos.values())}")
    print(f"exemplo (2,10,7,inf)       : "
          f"B_T={escada(Lex)}, rho={rho(Lex)}, j*={j_estrela(Lex)}, "
          f"J(9)={J(Lex,9)}, J(10)={J(Lex,10)}")
    print("-" * 70)
    if falhas:
        print(f"FALHAS: {len(falhas)}")
        for f in falhas[:40]:
            print("  -", f)
        if len(falhas) > 40:
            print(f"  ... e mais {len(falhas) - 40}")
        return 1
    print("TODOS OS TESTES PASSARAM (T5.1a/b, L6.1, T6.2, T6.3, T4.1, REAL, EXEMP)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
