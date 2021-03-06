# This file was generated, do not modify it. # hide
using Gnuplot
x = -2π:0.001:2π
@gp x sin.(x) "w l t 'sin' lw 2 lc '#56B4E9'" "set grid"
@gp :- "set auto fix"
@gp :- "set offsets graph .05, graph .05, graph .05, graph .05"
@gp :- ylabel="Y label" xlabel="X label" title = "Title"
@gp :- "set key bottom left font ',12' title 'Legend' box 2"
@gp :- x cos.(x) "w l t 'cos' lw 1.5 dashtype 2 lc '#E69F00'"
save(term="pngcairo font 'Consolas, 12' size 600,400", #hide
    output="./code/plt2_ex5.png") # hide
