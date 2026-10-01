# =============================================================================
# Etapa 10 — modelos finitos do espectro de limiares (protocolo 06_GEOMETRIA_CT.md §9.4)
#
# Reprodução (PowerShell):
#   & "$env:LOCALAPPDATA\Programs\Julia-1.13.1\bin\julia.exe" src\julia\etapa10_modelos.jl
# Saída: results/etapa10_resultados.txt  (+ resumo no stdout; exit 1 se alguma
# linha [TEOREMA] falhar)
#
# Conformidade com o protocolo §9.4 (registro obrigatório (i)-(vi)):
#   (i)  definição de cada modelo: seção MODELOS + coluna [DADO];
#   (ii) objetos enumerados: impressos por modelo (nº de fórmulas, 2^n entradas,
#        nº de pares de orçamento, nº de limiares testados);
#   (iii) algoritmo: Form_n(u) = prefixo livre de tamanho ≤ ⌊log n⌋;
#        J(c) = min{j : ℓ_j > c} com sentinela k_Φ; registros j < j*;
#        Γ = Σ 2^{-|Φ|} 1[B_T(Φ) ∩ I ≠ ∅]; D_n por enumeração direta;
#   (iv) limite: n ≤ 16 (65.536 entradas), L ≤ 4, k_Φ ≤ 32, c ≤ Rmax+2;
#   (v)  reprodutível: determinístico; seed 20260927 no modelo aleatório;
#   (vi) [DADO] e [TEOREMA] em linhas separadas; buscas truncadas: nenhuma
#        (os comprimentos ℓ são DADOS pelo modelo — sem busca de provas;
#        registrado no rodapé do arquivo de resultados).
#
# CRITÉRIO DE FALSIFICAÇÃO GLOBAL: qualquer linha [TEOREMA] com FAIL refuta o
# teorema correspondente — ou o script, se o erro for de implementação; a
# distinção é feita reproduzindo à mão a configuração indicada no detalhe.
# =============================================================================
using Random, Dates

const INF = typemax(Int)

# ---------------- registos de teste ----------------
const REG = Dict{String, Tuple{Int,Int}}()
const FALHAS = String[]

function checa(id::String, cond::Bool, detalhe::String)::Bool
    p, t = get(REG, id, (0, 0))
    REG[id] = (p + (cond ? 1 : 0), t + 1)
    cond || push!(FALHAS, "$id >>> $detalhe")
    return cond
end

const CRIT = Dict{String,String}(
    "T0a-prefixo"    => "existe par de códigos em que um é prefixo do outro (código inválido)",
    "T0b-kraft"      => "Σ_{Φ∈F_n} 2^{-|Φ|} > 1 (violação de Kraft) — refuta lem:cilindros-n(iii)",
    "T1a-Fn"         => "F_enum(u) ≠ {Φ : |Φ| ≤ ⌊log n⌋} — refuta lem:cilindros-n(i)",
    "T1b-U"          => "|U_n(Φ)| ≠ 2^{n-|Φ|} — refuta lem:cilindros-n(ii)",
    "T2-cobertura"   => "D_n(b₁,b₂) ≠ Γ((b₁(n),b₂(n)]) — refuta thm:cobertura",
    "T2s-strings"    => "diff por J (def:gen) difere de diff por strings (Out) na amostra — refuta eq:71b/lem:outinj",
    "T3-intensidade" => "D_n(r-1,r) ≠ λ(r) para r ≥ 1 — refuta cor:intensidade",
    "T4-suporte"     => "r ∈ C_T(L_n) XOR D_n(r-1,r) > 0 — refuta cor:suporte-dinamico",
    "T5-estab"       => "R^glob_n ≠ R_T(L_n) — refuta thm:estab-global",
    "T6-equiv"       => "g^c = g^{c'} ≠⟺ V(c) = V(c') — refuta o passo vetorial de thm:regimes",
    "T6-regimes"     => "|𝒢_n| ≠ |C_T(L_n)∖{0}|+1 — refuta thm:regimes (corrigido)",
    "T7-sandbox"     => "limite de prop:limites violado (N > 2^{2L+2}, Δ > R_T, A > N, K > min(2^{|Φ|+1},ρ+1))",
    "T7-conv"        => "convenção D-geo-1 violada (Δ ≠ 0 para m ≤ 1)",
    "T8-supp"        => "supp(μ_{T,L}) ≠ C_T(L) — refuta lem:mult-suporte",
    "T8-NZ"          => "N_T > Z_T — refuta lem:mult-suporte",
    "T8-Atilde"      => "A_T > Ã_T > Z — refuta lem:atividade(ii)",
    "T8-DT"          => "D_T(L,R) ≠ A_T(L,R)/(R+1) — refuta lem:identidades",
    "T8-telesc"      => "A_T(L;b₁,b₂) ≠ A_T(L,B_{b₂}) - A_T(L,B_{b₁}) — refuta lem:identidades",
    "T9-traj"        => "D_n(0,m) > Σ_{r=1}^m D_n(r-1,r) — refuta rem:trajetoria (triangular)",
    "T10-perfil"     => "D_n(c,c*) ≠ H_T(L_n,c) com c* ≥ R_T — refuta rem:perfil-global",
    "T11-env"        => "par Env1/Env2: R_T(L) difere — o par não serve como ataque P-1",
    "T12-lambda"     => "par Env1/Env2: mesmo R_T mas vetores λ idênticos — ataque Q1 falha",
    "T12-D03"        => "par Env1/Env2: D_n(0,3) idêntico — ataque Q1 falha",
    "T13-pos"        => "A_T(L_n;2,9) > 0 ≠⟺ D_n(2,9) > 0 — refuta cor:atividade",
    "T13-ativ"       => "D_n(2,9) < A_T(L_n;2,9)/((9-2)·2^{L_n}) — refuta limite inferior de cor:atividade",
)

# ---------------- tamanho e códigos ----------------
Lfun(n::Int)::Int = ndigits(n; base=2) - 1          # ⌊log₂ n⌋

# códigos livres de prefixo (alvorecer canônico); erro explícito se Kraft > 1
function canon_codes(a::Vector{Int})::Vector{Vector{String}}
    livres = [""]                                    # invariantes: nenhum prefixo de outro
    res = [String[] for _ in eachindex(a)]
    for ℓ in eachindex(a)
        while length(res[ℓ]) < a[ℓ]
            idx = findfirst(v -> length(v) <= ℓ, livres)
            idx === nothing && error("perfil a=$a viola Kraft em ℓ=$ℓ")
            v = livres[idx]; deleteat!(livres, idx)
            cur = v
            while length(cur) < ℓ
                push!(livres, cur * "1")
                cur = cur * "0"
            end
            push!(res[ℓ], cur)
        end
    end
    foreach(sort!, res)
    return res
end

# ---------------- sistema abstrato (equivale ao núcleo do artigo) ----------------
struct Formula
    code::String
    size::Int                       # |Φ| = comprimento do código
    lens::Vector{Int}               # ℓ_j; INF = não demonstrável (∞); k_Φ = 2^{|Φ|+1}
end

kphi(f::Formula)::Int = length(f.lens)

# todos finitos (j* = k_Φ); pares (j, ℓ_j), resto 0
lf(k::Int, pares::Vector{Pair{Int,Int}})::Vector{Int} = begin
    v = zeros(Int, k)
    for (j, val) in pares; v[j+1] = val; end
    v
end
# pares finitos explícitos; resto ∞ (j* = primeiro índice não listado; [] → j*=0)
lv(k::Int, pares::Vector{Pair{Int,Int}})::Vector{Int} = begin
    v = fill(INF, k)
    for (j, val) in pares; v[j+1] = val; end
    v
end

Jsel(c::Int, lens::Vector{Int})::Int = begin        # eq:J com sentinela k_Φ
    for j in 0:(length(lens)-1)
        lens[j+1] > c && return j
    end
    length(lens)
end

function Bconj(f::Formula)::Vector{Int}             # valores de registro (estr. crescente)
    vals = Int[]; mx = -1
    for j in 0:(kphi(f)-1)
        ℓ = f.lens[j+1]
        ℓ == INF && break                            # j*: só candidatos prováveis contam
        if ℓ > mx; push!(vals, ℓ); mx = ℓ; end
    end
    return vals
end
rho(f::Formula)::Int = (b = Bconj(f); isempty(b) ? 0 : b[end])   # máx ∅ = 0

struct Modelo
    nome::String
    perfil::Vector{Int}
    cods::Vector{Vector{String}}
    fs::Dict{String,Formula}
    nota::String
    seed::Int
end

function Modelo(nome::String, perfil::Vector{Int},
                regras::Vector{Vector{Vector{Int}}}, nota::String, seed::Int = 0)::Modelo
    cods = canon_codes(perfil)
    fs = Dict{String,Formula}()
    for ℓ in eachindex(perfil)
        length(regras[ℓ]) == perfil[ℓ] ||
            error("regras[$ℓ] incompatível com perfil[$ℓ] em $nome")
        for i in 1:perfil[ℓ]
            c = cods[ℓ][i]; lens = regras[ℓ][i]
            length(lens) == 2^(ℓ+1) ||
                error("k_Φ errado em $nome/$c: esperado $(2^(ℓ+1)), obtido $(length(lens))")
            fs[c] = Formula(c, ℓ, lens)
        end
    end
    return Modelo(nome, perfil, cods, fs, nota, seed)
end

# ---------------- Form_n e gerador ----------------
function form(u::String, m::Modelo)::Union{String,Nothing}
    Ln = Lfun(length(u))
    for ℓ in 1:min(Ln, length(m.perfil)), c in m.cods[ℓ]
        startswith(u, c) && return c
    end
    return nothing
end

# saídas de g^[c] sobre todas as entradas (def:gen + def:out; ⊥ quando J = k_Φ)
function saida_vec(c::Int, U::Vector{String}, fv::Vector{Union{String,Nothing}},
                   m::Modelo)::Vector{String}
    out = Vector{String}(undef, length(U))
    for i in eachindex(U)
        φ = fv[i]
        if φ === nothing
            out[i] = repeat("0", length(U[i]) + 1)
        else
            lens_ = m.fs[φ].lens
            j = Jsel(c, lens_)
            out[i] = j == length(lens_) ? "\u22a5" :
                     string(j; base = 2, pad = length(φ) + 1) * U[i][length(φ)+1:end]
        end
    end
    return out
end

# ---------------- invariantes ----------------
function CT(m::Modelo, L::Int)::Vector{Int}
    s = Set{Int}()
    for f in values(m.fs); f.size <= L && union!(s, Bconj(f)); end
    return sort!(collect(s))
end
Aint(C::Vector{Int}, i1::Int, i2::Int)::Int = count(r -> r > i1 && r <= i2, C)
Alim(C::Vector{Int}, r::Int)::Int = count(<=(r), C)             # A_T(L, r)
Delta(C::Vector{Int})::Int = length(C) < 2 ? 0 : maximum(diff(C))
function mT(m::Modelo, L::Int, r::Int)::Int
    t = 0
    for f in values(m.fs)
        f.size <= L || continue
        t += count(==(r), Bconj(f))
    end
    return t
end
Zt(m::Modelo, L::Int)::Int = sum(length(Bconj(f)) for f in values(m.fs) if f.size <= L)

# ---------------- D_n, Γ, λ ----------------
function Denum(m::Modelo, fv::Vector{Union{String,Nothing}}, n::Int, b1, b2)::Float64
    d = 0
    for φ in fv
        φ === nothing && continue                    # ramo indefinido é independente do orçamento
        lens_ = m.fs[φ].lens
        Jsel(b1(n), lens_) != Jsel(b2(n), lens_) && (d += 1)
    end
    return d / 2.0^n
end
konst(β::Int) = (n::Int) -> β

function Gamma(m::Modelo, Ln::Int, i1::Int, i2::Int)::Float64
    s = 0.0
    for f in values(m.fs)
        f.size <= Ln || continue
        B = Bconj(f)
        any(r -> r > i1 && r <= i2, B) && (s += 2.0^-f.size)
    end
    return s
end
function lambda_(m::Modelo, Ln::Int, r::Int)::Float64
    s = 0.0
    for f in values(m.fs)
        f.size <= Ln || continue
        r in Bconj(f) && (s += 2.0^-f.size)
    end
    return s
end
function Hperc(m::Modelo, Ln::Int, c::Int)::Float64
    s = 0.0
    for f in values(m.fs)
        f.size <= Ln || continue
        rho(f) > c && (s += 2.0^-f.size)
    end
    return s
end

const UCACHE = Dict{Int,Vector{String}}()
Uof(n::Int) = get!(UCACHE, n) do
    [string(i; base = 2, pad = n) for i in 0:(2^n - 1)]
end

# ---------------- MODELOS (registro (i)) ----------------
function constroi_modelos()::Vector{Modelo}
    a4 = [1, 1, 1, 2]     # 5 fórmulas: tamanhos 1,2,3,4 (Kraft = 1)
    a41 = [1, 1, 1, 1]    # 4 fórmulas (Kraft = 15/16)
    modelos = Modelo[]

    push!(modelos, Modelo("CadeiaL", a4, [
        [lf(4,  [0=>1])],
        [lf(8,  [0=>2])],
        [lf(16, [0=>3])],
        [lf(32, [0=>4]), lf(32, [0=>4])]
    ], "cadeia aritmética R_T(L)=L; Φ₄a/Φ₄b compartilham o limiar 4 (m(4)=2)"))

    push!(modelos, Modelo("CadeiaL2", a4, [
        [lf(4,  [0=>1])],
        [lf(8,  [0=>4])],
        [lf(16, [0=>6, 1=>9])],
        [lf(32, [0=>16]), lf(32, [0=>12, 1=>16])]
    ], "cadeia R_T(L)=1,4,9,16 (≍ L²); multiplicidade m(16)=2; Δ(4)=4"))

    push!(modelos, Modelo("CadeiaExp", a4, [
        [lf(4,  [0=>2])],
        [lf(8,  [0=>4])],
        [lf(16, [0=>8])],
        [lf(32, [0=>16]), lf(32, [0=>16])]
    ], "cadeia R_T(L)=2,4,8,16 (≍ 2^L); multiplicidade m(16)=2"))

    push!(modelos, Modelo("Derivacao", a4, [
        [lf(4,  [0=>1])],
        [lf(8,  [0=>3])],
        [lf(16, [0=>5, 1=>12])],
        [lf(32, [0=>2]), lf(32, [0=>2, 1=>4])]
    ], "átalho/speed-up: ρ(Φ₃)=12 > ρ(Φ₄a)=2, ρ(Φ₄b)=4 (fórmula maior estabiliza antes); R_T=1,3,12,12"))

    push!(modelos, Modelo("Env1", a41, [
        [lf(4,  [0=>8])],
        [lf(8,  [0=>8])],
        [lf(16, [0=>8])],
        [lf(32, [0=>8])]
    ], "C₁: C_T(L)={8} para todo L; envoltória R_T(L)=8 constante; N=1"))

    push!(modelos, Modelo("Env2", a41, [
        [lf(4,  [0=>8])],
        [lf(8,  [0=>7])],
        [lf(16, [0=>5])],
        [lf(32, [0=>1, 1=>2, 2=>3, 3=>4, 4=>6])]
    ], "C₂: mesma envoltória R_T(L)=8; C_T(4)={1,...,8}; N(4)=8 — geometria oposta a Env1"))

    push!(modelos, Modelo("Bordas", a4, [
        [lv(4,  Pair{Int,Int}[])],                  # j*=0, B=∅, ρ=0
        [lv(8,  [0=>0])],                           # B={0}: 0 ∈ C_T, ρ=0
        [lv(16, [0=>2, 1=>9, 2=>4])],               # ℓ não-monótono: B={2,9}
        [lf(32, [0=>5]), lf(32, [0=>5, 1=>7])]      # j*=k (todos prováveis); m(5)=2
    ], "bordas de 02 §2: j*=0 (B=∅), ρ=0 com 0∈C_T, ℓ não-monótono, j*=k; ATENÇÃO: viola (P4′) no Φ de tamanho 1"))

    rng = MersenneTwister(20260927)
    regras = Vector{Vector{Vector{Int}}}(undef, 4)
    for ℓ in 1:4
        k = 2^(ℓ + 1)
        regras[ℓ] = [begin
            pos = rand(rng, 0:k)                    # j* = pos (0 → B=∅; k → todos prováveis)
            v = fill(INF, k)
            for j in 0:(pos-1); v[j+1] = rand(rng, 0:20); end
            v
        end for _ in 1:a4[ℓ]]
    end
    push!(modelos, Modelo("Aleatorio", a4, regras,
        "ℓ aleatórios (j* ~ U{0..k}, valores ~ U{0..20}); estresse cego da bateria", 20260927))

    return modelos
end

# ---------------- execução ----------------
function principal()::Nothing
    modelos = constroi_modelos()
    buf = IOBuffer()
    ns = [4, 8, 16]

    println(buf, "=== ETAPA 10 — resultados (gerado por src/julia/etapa10_modelos.jl) ===")
    println(buf, "Execução: ", Dates.format(now(), "yyyy-mm-dd HH:MM:SS"), " | Julia ", VERSION)
    println(buf, "Comando: julia src/julia/etapa10_modelos.jl | determinístico (seed 20260927)")
    println(buf)

    # ---------------- [DADO] por modelo ----------------
    objs = 0
    for m in modelos
        println(buf, "[DADO] Modelo ", m.nome, " — perfil a=", m.perfil, ", ",
                    length(m.fs), " fórmulas; ", m.nota,
                    m.seed > 0 ? "; seed=$(m.seed)" : "")
        for L in 1:4
            C = CT(m, L)
            N = length(C); R = isempty(C) ? -1 : C[end]; Δ = Delta(C); Z = Zt(m, L)
            println(buf, "[DADO]   L=$L: C={", join(C, ","), "} R=", R, " N=", N,
                    " Δ=", Δ, " Z=", Z)
            objs += 1
        end
        R4 = CT(m, 4); Rmax = isempty(R4) ? 0 : R4[end]
        lam = [round(lambda_(m, 4, r); digits = 6) for r in 0:Rmax]
        println(buf, "[DADO]   λ(0..$Rmax) em L=4: ", join(lam, ", "))
        println(buf, "[DADO]   objetos: ", length(m.fs), " fórmulas; por n∈{4,8,16}: 2^n entradas, 8 pares de orçamento, limiares r≤$(Rmax+3), orçamentos c≤$(Rmax+2)")
        println(buf)
    end

    # ---------------- T0: códigos ----------------
    for m in modelos
        todos = [c for v in m.cods for c in v]
        for c in todos, d in todos
            c == d && continue
            checa("T0a-prefixo", !startswith(c, d) && !startswith(d, c),
                  "$(m.nome): código '$c' é prefixo de '$d'")
        end
        for n in ns
            Ln = Lfun(n)
            Fn = [f for f in values(m.fs) if f.size <= Ln]
            s = sum(2.0^-f.size for f in Fn; init = 0.0)
            checa("T0b-kraft", s <= 1.0 + 1e-15,
                  "$(m.nome) n=$n: Σ2^{|Φ|}=$(s) > 1")
        end
    end

    # ---------------- bateria por (modelo, n) ----------------
    for m in modelos
        R4 = CT(m, 4); Rmax = isempty(R4) ? 0 : R4[end]
        for n in ns
            Ln = Lfun(n)
            U = Uof(n)
            fv = Union{String,Nothing}[form(u, m) for u in U]
            Fn = sort!([c for (c, f) in m.fs if f.size <= Ln])
            Cn = CT(m, Ln)
            Rn = isempty(Cn) ? 0 : Cn[end]
            cmax = Rn + 2

            # T1: cilindros
            Fenum = unique(filter(!isnothing, fv))
            checa("T1a-Fn", Set(Fenum) == Set(Fn),
                  "$(m.nome) n=$n: F_enum={$(join(sort(Fenum),","))} ≠ F_tamanho={$(join(Fn,","))}")
            for φ in Fenum
                cnt = count(==(φ), fv)
                checa("T1b-U", cnt == 2^(n - length(φ)),
                      "$(m.nome) n=$n: |U(φ=$φ)|=$cnt ≠ 2^{$(n)-$(length(φ))}=$(2^(n-length(φ)))")
            end

            # T2: identidade de cobertura + spot-check de strings
            pares = Tuple{Function,Function,String}[
                (konst(0), konst(0), "(0,0)"),
                (konst(0), konst(1), "(0,1)"),
                (konst(0), konst(3), "(0,3)"),
                (konst(2), konst(9), "(2,9)"),
                (konst(0), konst(Rn + 2), "(0,R+2)"),
                (konst(Rn + 1), konst(Rn + 5), "(R+1,R+5)"),
                (x -> div(x, 8), x -> div(x, 4), "(⌊n/8⌋,⌊n/4⌋)"),
                (x -> div(x, 2), identity, "(⌊n/2⌋,n)"),
            ]
            idxs = n == 16 ? collect(1:16:65536) : collect(1:(2^n))   # índices Julia (1-based)
            for (b1, b2, rot) in pares
                d = Denum(m, fv, n, b1, b2)
                g = Gamma(m, Ln, b1(n), b2(n))
                checa("T2-cobertura", abs(d - g) < 1e-12,
                      "$(m.nome) n=$n par $rot: D_n=$(d) ≠ Γ=$(g)")
                # spot-check independente com strings reais (def:gen + Out)
                mism = 0
                for i in idxs
                    φ = fv[i]; u = U[i]
                    s1 = φ === nothing ? repeat("0", n + 1) :
                         (let j = Jsel(b1(n), m.fs[φ].lens)
                              j == length(m.fs[φ].lens) ? "\u22a5" :
                              string(j; base = 2, pad = length(φ) + 1) * u[length(φ)+1:end]
                          end)
                    s2 = φ === nothing ? repeat("0", n + 1) :
                         (let j = Jsel(b2(n), m.fs[φ].lens)
                              j == length(m.fs[φ].lens) ? "\u22a5" :
                              string(j; base = 2, pad = length(φ) + 1) * u[length(φ)+1:end]
                          end)
                    struct_d = φ === nothing ? false :
                               Jsel(b1(n), m.fs[φ].lens) != Jsel(b2(n), m.fs[φ].lens)
                    struct_d != (s1 != s2) && (mism += 1)
                end
                checa("T2s-strings", mism == 0,
                      "$(m.nome) n=$n par $rot: $mism entradas com diff(J) ≠ diff(strings)")
            end

            # T3 + T4 (r ≥ 1) e T9 (guarda triangular) e T10 (perfil)
            Dstep = Dict{Int,Float64}()
            for r in 1:(Rn + 3)
                d = Denum(m, fv, n, konst(r - 1), konst(r))
                Dstep[r] = d
                λ = lambda_(m, Ln, r)
                checa("T3-intensidade", abs(d - λ) < 1e-12,
                      "$(m.nome) n=$n r=$r: D(r-1,r)=$(d) ≠ λ=$(λ)")
                checa("T4-suporte", (r in Set(Cn)) == (d > 1e-12),
                      "$(m.nome) n=$n r=$r: r∈C=$(r in Set(Cn)) mas D>0=$(d > 1e-12)")
            end
            for m0 in 1:(Rn + 3)
                esq = Denum(m, fv, n, konst(0), konst(m0))
                dir = sum(get(Dstep, r, 0.0) for r in 1:m0; init = 0.0)
                checa("T9-traj", esq <= dir + 1e-12,
                      "$(m.nome) n=$n m=$m0: D(0,m)=$(esq) > ΣD=$(dir)")
            end
            cstar = Rn + 2
            for c in 0:(cstar + 1)
                d = Denum(m, fv, n, konst(c), konst(cstar))
                H = Hperc(m, Ln, c)
                checa("T10-perfil", abs(d - H) < 1e-12,
                      "$(m.nome) n=$n c=$c c*=$cstar: D=$(d) ≠ H=$(H)")
            end

            # T13: atividade (positividade + limite inferior)
            d29 = Denum(m, fv, n, konst(2), konst(9))
            A29 = Aint(Cn, 2, 9)
            checa("T13-pos", (d29 > 1e-12) == (A29 > 0),
                  "$(m.nome) n=$n: A_T(L;2,9)=$A29 mas D(2,9)=$(d29)")
            lim13 = A29 / (7.0 * 2.0^Ln)
            checa("T13-ativ", d29 + 1e-12 >= lim13,
                  "$(m.nome) n=$n: D(2,9)=$(d29) < A/(7·2^L)=$(lim13)")

            # T5 + T6: estabilização e regimes (strings completas)
            sigs = [saida_vec(c, U, fv, m) for c in 0:cmax]
            vs = [[Jsel(c, m.fs[φ].lens) for φ in Fn] for c in 0:cmax]
            for c1 in 0:cmax, c2 in (c1+1):cmax
                checa("T6-equiv", (sigs[c1+1] == sigs[c2+1]) == (vs[c1+1] == vs[c2+1]),
                      "$(m.nome) n=$n c=$c1 c'=$c2: igualdade de saídas ≠ igualdade de vetores J")
            end
            ng = length(unique(sigs))
            esp = count(!=(0), Cn) + 1
            checa("T6-regimes", ng == esp,
                  "$(m.nome) n=$n: |𝒢|=$(ng) ≠ |C∖{0}|+1=$(esp) (|C|+1=$(length(Cn)+1))")
            rglob = 0
            for c in 0:cmax
                if all(c2 -> sigs[c2+1] == sigs[c+1], c:cmax)
                    rglob = c; break
                end
            end
            if isempty(Cn)
                checa("T5-estab", rglob == 0,
                      "$(m.nome) n=$n: C vazio mas Rglob=$(rglob) ≠ 0")
            else
                checa("T5-estab", rglob == Rn,
                      "$(m.nome) n=$n: Rglob=$(rglob) ≠ R_T=$(Rn)")
            end
            if 0 in Cn
                println(buf, "[DADO]   indicador (0 ∈ C_T) em $(m.nome) n=$n: |𝒢|=$ng = |C∖{0}|+1=$(length(Cn)-1+1); a versão NÃO corrigida |𝒢|=|C|+1=$(length(Cn)+1) seria REFUTADA aqui")
            end
        end
    end

    # ---------------- T7/T8: invariantes por modelo ----------------
    for m in modelos
        for L in 1:4
            C = CT(m, L); N = length(C); R = isempty(C) ? -1 : C[end]
            Z = Zt(m, L); Δ = Delta(C)
            checa("T7-sandbox", N <= 2^(2 * L + 2) && Δ <= max(R, 0) &&
                  all(f -> length(Bconj(f)) <= min(2^(f.size + 1), rho(f) + 1), values(m.fs)),
                  "$(m.nome) L=$L: N=$N, Δ=$Δ, R=$R, Z=$Z")
            checa("T7-conv", (length(C) < 2) == (Δ == 0),
                  "$(m.nome) L=$L: Δ=$Δ para m=$N (D-geo-1)")
            checa("T8-supp", Set(r for f in values(m.fs) if f.size <= L for r in Bconj(f)) == Set(C),
                  "$(m.nome) L=$L: supp(m) ≠ C")
            checa("T8-NZ", N <= Z, "$(m.nome) L=$L: N=$N > Z=$Z")
            A29 = Aint(C, 2, 9)
            At29 = sum(mT(m, L, r) for r in 3:9; init = 0)
            checa("T8-Atilde", A29 <= At29 <= Z,
                  "$(m.nome) L=$L: A=$A29, Ã=$At29, Z=$Z")
            if !isempty(C)
                Rv = C[end]
                # D_T(L,r) = A_T(L,r)/(r+1): cruza duas fontes independentes
                # (contagem por conjunto C × contagem pela multiplicidade m_T ≥ 1)
                cnt_m = count(r -> mT(m, L, r) >= 1, 0:Rv)
                DT2 = cnt_m / (Rv + 1)
                AT = Alim(C, Rv)
                checa("T8-DT", cnt_m == AT && abs(DT2 - AT / (Rv + 1)) < 1e-12,
                      "$(m.nome) L=$L: #{r: m≥1}=$cnt_m ≠ |C|=$AT ou normalização falha")
                # telescópio com orçamento variável b(n)=⌊n/2⌋ (B_b(L) = 2^{L-1})
                B1 = 2; B2 = L >= 1 ? 2^(L - 1) : 0
                if B2 >= B1
                    lhs = Aint(C, B1, B2)
                    rhs = Alim(C, B2) - Alim(C, B1)
                    checa("T8-telesc", lhs == rhs,
                          "$(m.nome) L=$L: A(($B1,$B2])=$lhs ≠ A(≤$B2)-A(≤$B1)=$rhs")
                end
            end
        end
    end

    # ---------------- T11/T12: ataques P-1 e Q1 no par Env1/Env2 ----------------
    e1 = modelos[5]; e2 = modelos[6]
    for L in 1:4
        C1 = CT(e1, L); C2 = CT(e2, L)
        R1 = isempty(C1) ? -1 : C1[end]; R2 = isempty(C2) ? -1 : C2[end]
        checa("T11-env", R1 == R2, "L=$L: R(Env1)=$R1 ≠ R(Env2)=$R2")
    end
    N1 = length(CT(e1, 4)); N2 = length(CT(e2, 4))
    Δ1 = Delta(CT(e1, 4)); Δ2 = Delta(CT(e2, 4))
    checa("T11-env", N1 != N2 || Δ1 != Δ2,
          "N ou Δ iguais (N: $N1/$N2, Δ: $Δ1/$Δ2) — sem separação P-1")
    lam1 = [lambda_(e1, 4, r) for r in 0:8]
    lam2 = [lambda_(e2, 4, r) for r in 0:8]
    checa("T12-lambda", lam1 != lam2, "vetores λ idênticos: $lam1")
    n = 16; U = Uof(n)
    d1 = Denum(e1, Union{String,Nothing}[form(u, e1) for u in U], n, konst(0), konst(3))
    d2 = Denum(e2, Union{String,Nothing}[form(u, e2) for u in U], n, konst(0), konst(3))
    checa("T12-D03", abs(d1 - d2) > 1e-12, "D_n(0,3) igual: Env1=$d1, Env2=$d2")

    println(buf, "[DADO] ATAQUE P-1 (par de envelope): Env1 vs Env2 — R_T(L)=8 para ambos (L=1..4); N(4): $N1 vs $N2; Δ(4): $Δ1 vs $Δ2")
    println(buf, "[DADO] ATAQUE Q1 (mesmo R_T, distinta atividade): λ(0..8) Env1=$(join(round.(lam1; digits=6), ",")) | Env2=$(join(round.(lam2; digits=6), ",")); D₁₆(0,3)=$(round(d1; digits=6)) vs $(round(d2; digits=6))")
    println(buf)

    # ---------------- [TEOREMA] ----------------
    println(buf, "[TEOREMA] bateria de falsificação (cada critério em CRIT):")
    for id in sort!(collect(keys(REG)))
        p, t = REG[id]
        println(buf, "[TEOREMA]   ", p == t ? "PASS" : "FAIL", " ", id, " ", p, "/", t,
                " — refuta se: ", get(CRIT, id, "?"))
    end
    println(buf)
    println(buf, "[TEOREMA] buscas truncadas: NENHUMA — os comprimentos ℓ são dados pelo modelo")
    println(buf, "[TEOREMA] (limite, ĵ, Φ) não se aplica (sem busca de provas); limite de enumeração: n ≤ 16, L ≤ 4, k_Φ ≤ 32, c ≤ Rmax+2.")
    println(buf, "=== fim ===")

    dir = normpath(joinpath(@__DIR__, "..", "..", "results"))
    mkpath(dir)
    path = joinpath(dir, "etapa10_resultados.txt")
    write(path, String(take!(buf)))
    println("Resultados: $path")
    for id in sort!(collect(keys(REG)))
        p, t = REG[id]
        println(rpad(p == t ? "PASS" : "FAIL", 5), " ", rpad(id, 14), " ", p, "/", t)
    end
    if isempty(FALHAS)
        println("RESULTADO: todas as ", sum(first, values(REG)), " verificações passaram.")
    else
        println("RESULTADO: ", length(FALHAS), " FALHA(S):")
        foreach(println, FALHAS)
        exit(1)
    end
    return nothing
end

principal()
