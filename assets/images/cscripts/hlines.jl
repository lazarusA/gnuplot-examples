using Gnuplot
function hline_at(y; color = "black", lw = 2)
    "set arrow from graph 0, first $(y) to graph 1, first $(y) nohead lc rgb '$(color)' lw $(lw)"
end
@gp [2,3] [3,3] "w l notit lc 'red'" # horizontal line from 2 to 3 at 1
@gp :- xrange =(0,4) yrange=(0,4)
# full horizontal line at y = 1
@gp :- hline_at(1; lw = 3)
@gp :- hline_at(2; color = "blue")
save(term ="pngcairo size 600,400", output ="hlines.png")
