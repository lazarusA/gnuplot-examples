# This file was generated, do not modify it. # hide
using Gnuplot, Colors, ColorSchemes
x = LinRange(-2π,2π,200)
#colorbar tricks... # hide
cbwt = 0.02 # hide
rightmargin = 0.875 # hide
cboxp="set colorbox user origin graph 1.01, graph 0 size $cbwt, graph 1" # hide
addmargin="set rmargin at screen $rightmargin" # hide
goffset="set offsets graph .05, graph .05, graph .05, graph .05" # hide
@gp x -0.65sin.(3x) x  "w l notit lw 3 dt 1 lc palette" palette(:ice)
    #goffset, cboxp, addmargin) # hide
save(term="pngcairo size 600,400", output="./code/plt_ex8.png") # hide
