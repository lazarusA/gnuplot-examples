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
    fg(x,μ,σ) = exp.(.-(x.-μ).^2 ./(2σ^2))./(σ*√(2π))
    @gp x fg(x, 0.25, 1.5) "w filledcurves lc '#E69F00' t '0.25,1.5'"
    @gp :- "set style fill transparent solid 0.5 noborder"
    @gp :- "set key title 'μ,σ' box 3" xlab = "x" ylab = "P(x)"
    @gp :- x fg(x, 2, 1) "w filledcu lc rgb '#56B4E9' t '2,1' fs transparent solid 0.25"
    @gp :- x fg(x, -1, 2) "w filledcu lc '#009E73' t '-1,2' fs transparent solid 0.1"
    saveas("filled001") # hide
end

# ![](assets/filled001.svg)