<TeXmacs|1.99.18>

<style|generic>

<\body>
  <doc-data|<doc-title|Pirogov-Sinai Theory>|<doc-author|<author-data|<author-name|Owen
  Lynch>>>>

  <section|Idea>

  We want to understand the behavior of lattice systems at very low
  temperatures. The basic idea is a typical state consists of

  <\itemize>
    <item>regions of periodic stability

    <item>separated by boundaries
  </itemize>

  In the case of the Ising model, a region of periodic stability is a region
  of all up spins/all down spins. More specifically, the stable regions
  consists of all lattice elements who agree with all of their neighbors.
  Then boundaries between these regions consist of the lattice elements who
  disagree with at least one neighbor.

  At low temperatures, the regions of periodic stability are large compared
  to the boundaries, so we can perform a cluster expansion with polymers the
  boundary elements to understand the system.

  <section|Definitions>

  For the remainder of this presentation, we assume that we work with a
  system on a lattice <math|\<bbb-Z\><rsup|d>>, with finite single-spin space
  <math|\<Omega\><rsub|0>>, and <math|\<Omega\><rsub|\<Lambda\>>\<assign\>\<Omega\><rsub|0><rsup|\<Lambda\>>>,
  <math|\<Omega\>\<assign\>\<Omega\><rsub|0><rsup|\<bbb-Z\><rsup|d>>>. The
  Hamiltonian

  <\equation*>
    \<cal-H\><rsub|\<Lambda\>><around*|(|\<omega\>|)>=<big|sum><rsub|B\<cap\>\<Lambda\>\<neq\>\<emptyset\>>\<Phi\><rsub|B><around*|(|\<omega\>|)>
  </equation*>

  on this system is given by a set of potentials
  <math|<around*|{|\<Phi\><rsub|B>|}><rsub|B\<subset\>\<bbb-Z\><rsup|d>>>,
  which are of <strong|finite range> (<math|<around*|\||B|\|>> is bounded)
  and are <strong|invariant under translation>
  (<math|\<Phi\><rsub|B>\<circ\>\<theta\><rsub|j>=\<Phi\><rsub|B>>, for
  <math|\<theta\><rsub|j>> a translation). Thus, for finite
  <math|\<Lambda\>>, the sum for <math|\<cal-H\><rsub|\<Lambda\>><around*|(|\<omega\>|)>>
  is always finite.

  We want to characterize minima of the Hamiltonian on the infinite lattice.
  However, the Hamiltonian is not defined on the infinite lattice. To solve
  this problem, we introduce the <strong|relative Hamiltonian>. Say that a
  pair of states <math|<wide|\<omega\>|~>,\<omega\>\<in\>\<Omega\>> are
  \Pequal at infinity\Q, written <math|<wide|\<omega\>|~><long-arrow|\<rubber-equal\>|\<infty\>>\<omega\>>,
  if <math|<around*|{|i\<in\>\<bbb-Z\><rsup|d><mid|\|><wide|\<omega\>|~><rsub|i>\<neq\>\<omega\><rsub|i>|}>>
  is finite. Then for such a pair, define

  <\equation*>
    \<cal-H\><rsub|\<Phi\>><around*|(|<wide|\<omega\>|~><mid|\|>\<omega\>|)>\<assign\><big|sum><rsub|B\<in\>\<bbb-Z\>><around*|{|\<Phi\><rsub|B><around*|(|<wide|\<omega\>|~>|)>-\<Phi\><rsub|B><around*|(|\<omega\>|)>|}>
  </equation*>

  Note that this sum is finite. A <strong|ground state> <math|\<eta\>> is
  then a local minimum in the sense that \ <math|\<cal-H\><rsub|\<Phi\>><around*|(|\<omega\>\|\<eta\>|)>\<geq\>0>
  for all <math|w<long-arrow|\<rubber-equal\>|\<infty\>>\<eta\>>.

  We are mostly interested in <em|periodic> ground states, which are ground
  states that are tilings of a finite <math|n>-rectangle.

  <\example>
    The Ising model with zero magnetization has ground states
    <math|\<eta\><rsup|+>> and <math|\<eta\><rsup|->>, which are constantly
    <math|+1> and <math|-1>, respectively.
  </example>

  <\example>
    The <strong|Blume-Capel> model has <math|\<Omega\><rsub|0>=<around*|{|-1,0,1|}>>
    and formal Hamiltonian

    <\equation*>
      <big|sum><rsub|<around*|{|i,j|}>\<in\>\<cal-E\><rsub|\<bbb-Z\><rsup|d>>><around*|(|\<omega\><rsub|i>-\<omega\><rsub|j>|)><rsup|2>-h*<big|sum><rsub|i\<in\>\<bbb-Z\><rsup|d>>\<omega\><rsub|i>-\<lambda\>*<big|sum><rsub|i\<in\>\<bbb-Z\><rsup|d>>\<omega\><rsub|i><rsup|2><rsub|>
    </equation*>

    This has three possible ground states, depending on the values for
    <math|h> and <math|\<lambda\>>.
  </example>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
    <associate|prog-scripts|scheme>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Idea>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Definitions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>