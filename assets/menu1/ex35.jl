using Gnuplot, Random
Random.seed!(145)
x, y = 1:2:20, 5*rand(10)
xerr = abs.(randn(10))
lcval = 1:10
@gp x y xerr lcval "w xerr t 'test' lc palette" palette(:berlin)
@gp :- xrange= (0,22) yrange = (0,6)
save(term="pngcairo size 600,400", output="./code/plt_errs19.png") # hide
