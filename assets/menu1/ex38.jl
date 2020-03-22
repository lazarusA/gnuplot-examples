# This file was generated, do not modify it. # hide
using Gnuplot,Random
Random.seed!(124)
n = 30
x= randn(n)
y = rand(n)
z=randn(n)
@gp(x, y, 2z, z, "with points notit pt 7 ps var lc palette",
    "set xrange [-2.2:2]", "set yrange [-0.1:1.1]", 
    #palette(:viridis)
    )
save(term="pngcairo size 600,400", output="burbuja3.png") # hide