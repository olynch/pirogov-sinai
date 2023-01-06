using DynamicGrids, DynamicGridsInteract, ColorSchemes, Colors, Blink

include("GibbsSim.jl")

init = (
  lattice = rand([-1,0,1], 150, 150),
  boundaries = zeros(Int, 150, 150)
)

ZERO_COLOR = colorant"grey"
NEGONE_COLOR = colorant"#48ecff"
PLUSONE_COLOR = colorant"#C70039"

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
                        ruleset=Ruleset(GibbsSim.rule1, GibbsSim.rule2; boundary=Wrap()),
                        tspan=1:5000,
                        font="sans",
                        text=nothing,
                        scheme=RWB(),
                        zerocolor=nothing)
