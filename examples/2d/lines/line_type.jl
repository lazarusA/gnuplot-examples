using Gnuplot#hide
Gnuplot.quitall()#hide
mkpath("assets")#hide
Gnuplot.options.term = "unknown"#hide
empty!(Gnuplot.options.init)#hide
push!( Gnuplot.options.init, linetypes(:Set1_5, lw=1.5, ps=1.5))#hide
saveas(file) = Gnuplot.save(term="svg size 550,350 fontscale 0.8", "assets/$(file).svg")#hide

using Gnuplot
let 
    x = -2π:0.001:2π
    @gp x sin.(x) "w l t 'sin' lw 2 lc '#56B4E9'" "set grid"
    @gp :- "set auto fix"
    @gp :- "set offsets graph .05, graph .05, graph .05, graph .05"
    @gp :- ylabel="Y label" xlabel="X label" title = "Title"
    @gp :- "set key bottom left font ',12' title 'Legend' box 2"
    @gp :- x cos.(x) "w l t 'cos' lw 1.5 dashtype 2 lc '#E69F00'"
    saveas("lines003") # hide
end


# ![](assets/lines003.svg)