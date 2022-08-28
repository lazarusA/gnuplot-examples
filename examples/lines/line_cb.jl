using Gnuplot#hide
Gnuplot.quitall()#hide
mkpath("assets")#hide
Gnuplot.options.term = "unknown"#hide
empty!(Gnuplot.options.init)#hide
push!( Gnuplot.options.init, linetypes(:Set1_5, lw=1.5, ps=1.5))#hide
saveas(file) = save(term="svg size 550,350 fontscale 0.8", output="assets/$(file).svg")#hide

using Gnuplot, ColorSchemes
x = LinRange(-2π,2π,200)
@gp x -0.65sin.(3x) x  "w l notit lw 3 dt 1 lc palette" palette(:plasma)
saveas("lines005") # hide

# ![](assets/lines005.svg)