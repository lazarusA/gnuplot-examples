```@meta
EditURL = "../../../examples/2d/heatmaps/heatmap_discrete.jl"
```

````@example heatmap_discrete
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
    @gp x y z "w image pixels notit" "set auto fix" "set size square"
    @gp :- xlab = "x" ylab = "y" "set cblabel 'z'" palette(:dense)
    @gp :- title = "Heatmap Discrete"
    saveas("heatmap003") # hide
end
````

![](assets/heatmap003.svg)

