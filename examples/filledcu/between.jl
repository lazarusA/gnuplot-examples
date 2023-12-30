using Gnuplot#hide
Gnuplot.quitall()#hide
mkpath("assets")#hide
Gnuplot.options.term = "unknown"#hide
empty!(Gnuplot.options.init)#hide
push!( Gnuplot.options.init, linetypes(:Set1_5, lw=1.5, ps=1.5))#hide
saveas(file) = Gnuplot.save(term="svg size 550,350 fontscale 0.8", "assets/$(file).svg")#hide

using Gnuplot
let
    x = LinRange(-10,10,200)
    @gp x sin.(x) sin.(x) .+ 1 "with filledcu lc '#56B4E9' fs transparent solid 0.3"
    @gp :- x cos.(x) 1 .+ cos.(x) "with filledcu lc 'red' fs transparent solid 0.5"
    saveas("filled002") # hide
end

# ![](assets/filled002.svg)