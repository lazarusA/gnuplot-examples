# This file was generated, do not modify it. # hide
using Gnuplot, Random
Random.seed!(145)
x = 1:2:20
y = 5*rand(10)
yerr = 0.4*abs.(randn(10))
lcval = 1:10
@gp(x, y, yerr, lcval, "w boxerrorbars notit lc palette", 
    "set xrange [0:22]","set yrange [0:6]")
    save(term="pngcairo size 600,400", output="plt_errs3.png") # hide