# This file was generated, do not modify it. # hide
using Gnuplot, ColorSchemes
# using Random, Colors # hide
#Random.seed!(123) # hide
#function custom_palette(colormap=:viridis) # hide
#    cmap = get(colorschemes[colormap], LinRange(0,1,256)) # hide
#    ctmp = "0 '#$(hex(cmap[1]))'," # hide
#    for i in 2:256; ctmp = ctmp*"$(i-1) '#$(hex(cmap[i]))'," end; # hide
#    "set palette defined("*ctmp[1:end-1]*")" # hide
#end # hide
# Archimedes spiral
a = 1.5
b = -2.4
t = LinRange(0,5*π,500)
x = (a .+ b*t) .* cos.(t)
y = (a .+ b*t) .* sin.(t)
cmaps = [:magma, :viridis, :plasma, :inferno, :berlin,
    :leonardo, :devon, :spring, :ice]
@gp :- "set multiplot layout 3,3; set key off;
    unset ytics; unset xtics; unset border" :-
for i in 1:9
    @gp :- i title = "$(cmaps[i])" "set size square" :-
    @gp :- x y t "w l lw 3 dt 1 lc palette" palette(cmaps[i]) :-
    @gp :- "set cbtics out nomirror" :-
end
@gp
save(term="pngcairo size 900,800", output="./code/plt_ex9.png") # hide
