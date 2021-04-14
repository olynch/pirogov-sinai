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

struct GibbsRule{P <: AbstractPotential,K,B}
  p::P
  states::SVector{K,Int}
  β::B
end

@inline function (r::GibbsRule)(hood,cell)
  proposal = rand(r.states)
  weight = exp(-r.β * H(r.p, hood, proposal))
  if weight >= rand()
    proposal
  else
    cell
  end
end

rule1 = Neighbors{:lattice, :lattice}(
  GibbsRule(BlumeCapel(),SVector{3}([-1,0,1]),Param(0.5; bounds=(0.0,1.0))))

rule2 = Neighbors{:lattice, :boundaries}() do hood, cell
  if all(hood .== cell)
    0
  else
    1
  end
end

end
