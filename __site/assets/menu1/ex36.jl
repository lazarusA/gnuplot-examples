# This file was generated, do not modify it. # hide
using Gnuplot,Random
Random.seed!(124)
n = 30
x= randn(n)
y = rand(n)
z=randn(n)
@gp x y 2z "with points notit lt 1 pt 4 ps var "
save(term="pngcairo size 600,400", output="burbuja1.png") # hide