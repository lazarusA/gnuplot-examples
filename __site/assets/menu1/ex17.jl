using Gnuplot, Random
Random.seed!(145)
x, y, yerr = 1:2:20, 5*rand(10), 0.4*abs.(randn(10))
@gp x y yerr "w boxerrorbars t 'test' lc 'black'"
@gp :- xrange= (0,22) yrange = (0,6)
save(term="pngcairo size 600,400", output="./code/plt_errs1.png") # hide
