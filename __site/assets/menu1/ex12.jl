# This file was generated, do not modify it. # hide
using Gnuplot, ColorSchemes, Random
Random.seed!(123)
n = 15
x, y, color = rand(n), rand(n), rand(n)
cmaps = [:cool, :viridis, :plasma, :inferno, :thermal,
    :leonardo, :winter, :spring, :ice]
@gp "set multiplot layout 3,3; set key off" :-
for i in 1:9
    @gp :- i title = "$(cmaps[i]), pt $(i)" "set size square" :-
    @gp :- x y color "w p pt $(i) ps 3 lc palette" palette(cmaps[i]) :-
    @gp :- "set cbtics out nomirror" "set xtics 0,1" "set ytics 0,1" :-
    @gp :- "set cbtics 0.0,0.2,1.0" xrange= (-0.1,1.1) yrange= (-0.1,1.1) :-
end
@gp
save(term="pngcairo size 900,800", output="./code/plt_ex12.png") # hide
