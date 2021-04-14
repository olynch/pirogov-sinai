using DynamicGrids, DynamicGridsInteract, ColorSchemes, Colors, Blink

include("GibbsSim.jl")

init = (
  lattice = rand([-1,0,1], 150, 150),
  boundaries = zeros(Int, 150, 150)
)

GREY = colorant"red"
WHITE = colorant"purple"
BLACK = colorant"green"

struct RWB
end

function Base.get(::RWB,i)
  if i==-1
    WHITE
  elseif i==0
    GREY
  else
    BLACK
  end
end


output = ElectronOutput(init,
                        ruleset=Ruleset(GibbsSim.rule1, GibbsSim.rule2; boundary=Wrap()),
                        tspan=1:5000,
                        font="sans",
                        text=nothing,
                        scheme=RWB(),
                        zerocolor=nothing)
