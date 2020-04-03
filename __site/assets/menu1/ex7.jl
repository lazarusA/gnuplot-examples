# This file was generated, do not modify it. # hide
using Gnuplot, ColorSchemes, Colors
x = -2π:0.001:2π
function circShape(h,k,r)
    θ = LinRange(0,2π,500)
    h .+ r*sin.(θ), k .+ r*cos.(θ)
end
bgcp1 = "set object rectangle from screen 0,0 to screen 1,1"
bgcp2 = " behind fillcolor rgb 'black' fillstyle solid noborder"
bgcolor = bgcp1*bgcp2
cmap = get(colorschemes[:viridis], LinRange(0,1,15))
@gp circShape(0,0,1)... "w l notit lw 2 lc '#$(hex(cmap[3]))'"
@gp :- "set auto fix" "set size square"
@gp :- "set offsets graph .05, graph .05, graph .05, graph .05"
@gp :- "set border lw 1 lc rgb 'white'"
@gp :- "set ylabel 'y' textcolor rgb 'white'"
@gp :- "set xlabel 'x' textcolor rgb 'white'"
@gp :- "set xzeroaxis linetype 3 linewidth 1"
@gp :- "set yzeroaxis linetype 3 linewidth 1"
@gp :- bgcolor 
for (indx, r) in enumerate(0.9:-0.1:0.1)
    @gp :- circShape(0,0,r)... "w l notit lw 2 lc '#$(hex(cmap[indx+3]))'" :-
end
@gp
save(term="pngcairo size 400,400 ", output="./code/plt2_ex7.png") # hide
