using Gnuplot#hide
Gnuplot.quitall()#hide
mkpath("assets")#hide
Gnuplot.options.term = "unknown"#hide
empty!(Gnuplot.options.init)#hide
push!( Gnuplot.options.init, linetypes(:Set1_5, lw=1.5, ps=1.5))#hide
saveas(file) = Gnuplot.save(term="svg size 550,350 fontscale 0.8", "assets/$(file).svg")#hide

using Gnuplot, Random
let
    x = y = -5:1:5
    z = [x^2 + y^2 for x in x, y in y]
    @gsp x y z "w pm3d notit" "set view map" "set auto fix" "set size square"
    @gsp :- xlab = "x" ylab = "y" "set cblabel 'z'" palette(:plasma)
    @gsp :- title = "3D Heatmap"
    saveas("heatmap002") # hide
end

# ![](assets/heatmap002.svg)