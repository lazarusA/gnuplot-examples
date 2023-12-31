```@meta
EditURL = "../../../examples/2d/heatmaps/heatmap.jl"
```

````@example heatmap
using Gnuplot#hide
Gnuplot.quitall()#hide
mkpath("assets")#hide
Gnuplot.options.term = "unknown"#hide
empty!(Gnuplot.options.init)#hide
push!( Gnuplot.options.init, linetypes(:Set1_5, lw=1.5, ps=1.5))#hide
saveas(file) = Gnuplot.save(term="svg size 550,350 fontscale 0.8", "assets/$(file).svg")#hide

using Gnuplot, Random
Random.seed!(1234)
matrix = randn(50,60)
@gp matrix "w image pixels notit" "set auto fix"
saveas("heatmap001") # hide
````

![](assets/heatmap001.svg)

