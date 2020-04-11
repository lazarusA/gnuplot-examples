using Gnuplot
x = -2π:0.05:2π
cbwidth = 0.02
rightmargin = 0.875
@gp x sin.(x) "with linespoints ls 1 t 'sin' "
@gp :- "set style line 1 lc rgb 'black' lt 1 lw 1 pt 7 pi -4 ps 1.0"
@gp :- "set grid" "set auto fix"
@gp :- "set offsets graph .05, graph .05, graph .05, graph .05"
@gp :- "set key bottom left font ',10' box opaque"
# end of general propierties for first line and some general styling
@gp :- x[1:5:end] 0.3cos.(x)[1:5:end] "w p t '0.3cos' pt 6 ps 1 lc rgb 'black'"
@gp :- x -0.5cos.(x) "w l t '-0.5cos' lw 1.5 dashtype 1 lc rgb 'red' "
@gp :- x -0.65sin.(x) x  "w l t '-0.65sin' lw 5 lc palette " palette(:ice)
#colorbar style
@gp :- "set palette rgb '7,5,15' " "set cbtics out nomirror"
@gp :- "set colorbox user origin graph 1.01, graph 0 size $cbwidth, graph 1"
@gp :- "set rmargin at screen $rightmargin"
@gp :- "set colorbox noborder"
save(term="pngcairo size 700,400", output="mixlines.png") # hide
