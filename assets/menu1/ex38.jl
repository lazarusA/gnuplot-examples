# This file was generated, do not modify it. # hide
using Gnuplot,Random
Random.seed!(124)
n = 30
x, y, z = randn(n), randn(n), randn(n)
@gp x y 5z z "with points notit pt 7 ps var lc palette" palette(:ice)
@gp :- xrange = (-2.2,2.5) yrange = (-2.2,2.2)
save(term="pngcairo size 600,400", output="./code/burbuja3.png") # hide
