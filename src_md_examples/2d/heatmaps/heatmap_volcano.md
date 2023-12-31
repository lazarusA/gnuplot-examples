```@meta
EditURL = "../../../examples/2d/heatmaps/heatmap_volcano.jl"
```

````@example heatmap_volcano
using Gnuplot#hide
Gnuplot.quitall()#hide
mkpath("assets")#hide
Gnuplot.options.term = "unknown"#hide
empty!(Gnuplot.options.init)#hide
push!( Gnuplot.options.init, linetypes(:Set1_5, lw=1.5, ps=1.5))#hide
saveas(file) = Gnuplot.save(term="svg size 550,350 fontscale 0.8", "assets/$(file).svg")#hide

using Gnuplot, ColorSchemes, RDatasets
let
    volcano = Matrix{Float64}(dataset("datasets", "volcano"))
    @gp title = "Auckland s Maunga Whau Volcano" :-
    @gp :- volcano "w image pixels notit" "set auto fix" "set size ratio -1" palette(:inferno)
    saveas("heatmap006") # hide
end
````

![](assets/heatmap006.svg)

