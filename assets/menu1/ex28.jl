# This file was generated, do not modify it. # hide
using Gnuplot, Random
Random.seed!(145)
x, y = 1:2:20, 5*rand(10)
yerr = 0.4*abs.(randn(10))
xerr = abs.(randn(10))
@gp x y yerr xerr "w xyerrorbars t 'test' lc 'black'"
@gp :- xrange= (0,22) yrange = (0,6)
save(term="pngcairo size 600,400", output="./code/plt_errs12.png") # hide
