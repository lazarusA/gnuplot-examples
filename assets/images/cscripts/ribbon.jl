using Gnuplot
function ribbon(x, y, yerr; scolor = "black", linecolor = "black", leg = "y")
    @gp x y "w l lw 1 lc '$(linecolor)' t '$(leg)'"
    @gp :- x y y .+ yerr "w filledcu lc '$(scolor)' t ''"
    @gp :- "set style fill transparent solid 0.2 noborder"
    @gp :- x y y .- yerr "w filledcu lc '$(scolor)' t ''"
end
# example
x = LinRange(-π,3π,100)
y = sin.(x)
yerr =0.15
ribbon(x, y, yerr; scolor = "orange", linecolor = "red")
save(term ="pngcairo size 600,400", output ="ribbon.png")
