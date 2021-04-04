using DynamicGrids, DynamicGridsInteract, ColorSchemes, Colors, Blink

include("GibbsSim.jl")

init = rand([-1,0,1], 200, 200)

GREY = colorant"red"
WHITE = colorant"white"
BLACK = colorant"black"

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


output = ElectronOutput(init;
                        ruleset=Ruleset(GibbsSim.rule),
                        tspan=1:5000,
                        font="sans",
                        text=nothing,
                        scheme=RWB(),
                        zerocolor=nothing)
