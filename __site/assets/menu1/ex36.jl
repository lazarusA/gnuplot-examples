# This file was generated, do not modify it. # hide
using Gnuplot,Random
Random.seed!(124)
n = 30
x, y, z = randn(n), randn(n), randn(n)
@gp x y 5z "with points notit lt 1 pt 4 ps var "
save(term="pngcairo size 600,400", output="./code/burbuja1.png") # hide
