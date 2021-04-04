module GibbsSim

using DynamicGrids, StaticArrays, ModelParameters, Crayons

abstract type AbstractPotential end

Base.@kwdef struct BlumeCapel{A,B} <: AbstractPotential
  h::A = Param(0.0, bounds=(-5.0, 5.0))
  λ::B = Param(0.0, bounds=(-5.0, 5.0))
end

@inline function H(bc::BlumeCapel,hood,cell)
  sum((cell - y)^2 for y in hood) -
    bc.h * cell - 
    bc.λ * cell^2
end

Base.@kwdef struct Ising{A} <: AbstractPotential
  h::A = Param(0.0, bounds=(-5.0, 5.0))
end

@inline function H(is::Ising, hood, cell)
  - sum(cell * y for y in hood) + is.h * cell
end

struct GibbsRule{R,W,N,P <: AbstractPotential,K,B} <: NeighborhoodRule{R,W}
  neighborhood::N
  p::P
  states::SVector{K,Int}
  β::B
end

function GibbsRule{R,W}(neighborhood::N, p::P, states::SVector{K,Int}, β::B) where
    {R,W, N,P <: AbstractPotential,K,B}
  GibbsRule{R,W,N,P,K,B}(neighborhood, p, states, β)
end

function GibbsRule{R,W}(p, states) where {R,W}
  GibbsRule{R,W}(Moore(1), p, states, Param(1., bounds=(0.,1.)))
end

function _setbuffer(gr::GibbsRule{R,W,N,P,K}, buffer) where {R,W,N,P,K}
  hood = _setbuffer(gr.neighborhood, buffer)
  GibbsRule{R,W,N,P}(hood, gr.p, gr.states)
end

function DynamicGrids.applyrule(data, r::GibbsRule, state, I)
  proposal = rand(r.states)
  weight = exp(-r.β * H(r.p, neighbors(r), proposal))
  if weight >= rand()
    proposal
  else
    state
  end
end

rule = GibbsRule(Ising(), SVector{2}([-1,1]))

end
