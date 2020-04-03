# This file was generated, do not modify it. # hide
using Gnuplot, Random
Random.seed!(145)
x, y = 1:2:20, 5*rand(10)
yerr, xerr = 0.4*abs.(randn(10)), abs.(randn(10))
@gp x y yerr 1.5xerr "w boxerrorbars t 'test' lc 'black'"
@gp :- xrange= (0,22) yrange = (0,6)
save(term="pngcairo size 600,400", output="./code/plt_errs2.png") #hide
