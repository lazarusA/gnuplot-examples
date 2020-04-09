using Gnuplot
function vline_at(x; color="black", lw = 2)
    "set arrow from $(x), graph 0 to $(x), graph 1 nohead lc rgb '$(color)' lw $(lw)"
end
@gp [3,3] [0,5] "w impulse notit lc 'red'" # vertical line from 0 to 5 at x=3
@gp :- xrange =(0,4) yrange=(-1,6)
# full vertical line at x = 2
@gp :- vline_at(2; lw = 3)
@gp :- vline_at(1; color = "orange")
save(term ="pngcairo size 600,400", output ="vlines.png")
