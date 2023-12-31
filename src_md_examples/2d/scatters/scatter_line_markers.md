```@meta
EditURL = "../../../examples/2d/scatters/scatter_line_markers.jl"
```

````@example scatter_line_markers
using Gnuplot#hide
Gnuplot.quitall()#hide
mkpath("assets")#hide
Gnuplot.options.term = "unknown"#hide
empty!(Gnuplot.options.init)#hide
push!( Gnuplot.options.init, linetypes(:Set1_5, lw=1.5, ps=1.5))#hide
saveas(file) = Gnuplot.save(term="svg size 550,350 fontscale 0.8", "assets/$(file).svg")#hide

using Gnuplot, ColorSchemes
@gp key="left" linetypes(:mk_12, dashed=true, ps=0.85)
for i in 1:10
    @gp :- i .* (0:10) "w lp t '$i'"
end
saveas("scatter003") # hide
````

![](assets/scatter003.svg)

