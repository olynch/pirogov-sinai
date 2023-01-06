module PCAs

using DynamicGrids, DynamicGridsInteract, StaticArrays, ModelParameters, Crayons, Blink
using ColorSchemes, Colors

Base.@kwdef struct PCA{A,B,C,D}
  k0::A = Param(0.0, bounds=(-5.0, 5.0))
  ke1::B = Param(-1.0, bounds=(-5.0, 5.0))
  ke2::C = Param(-1.0, bounds=(-5.0, 5.0))
  β::D = Param(0.5, bounds=(0, 1.0))
end

@inline function sumk(p::PCA, hood, cell)
  p.k0 * cell +
    p.ke2 * hood[1] + 
    p.ke1 * hood[2] + 
    p.ke1 * hood[3] + 
    p.ke2 * hood[4]
end

@inline function (p::PCA)(hood,cell)
  p_plus = 0.5 * (1 + tanh(p.β * sumk(p,hood,cell)))
  rand() < p_plus ? +1 : -1
end

rule = Neighbors(PCA(), VonNeumann(1))

init = ones(Int, 200,200)

ZERO_COLOR = colorant"grey"
NEGONE_COLOR = colorant"lightblue"
PLUSONE_COLOR = colorant"darkred"

struct RWB
end

function Base.get(::RWB,i)
  if i==-1
    NEGONE_COLOR
  elseif i==0
    ZERO_COLOR
  else
    PLUSONE_COLOR
  end
end

output = ElectronOutput(init,
                        ruleset=Ruleset(rule; boundary=Wrap()),
                        tspan=1:5000,
                        font="sans",
                        scheme=RWB(),
                        text=nothing)

end
