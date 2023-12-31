```@meta
EditURL = "../../../examples/2d/lines/line.jl"
```

````@example line
using Gnuplot#hide
Gnuplot.quitall()#hide
mkpath("assets")#hide
Gnuplot.options.term = "unknown"#hide
empty!(Gnuplot.options.init)#hide
push!( Gnuplot.options.init, linetypes(:Set1_5, lw=1.5, ps=1.5))#hide
saveas(file) = Gnuplot.save(term="svg size 550,350 fontscale 0.8", "assets/$(file).svg")#hide

using Gnuplot
t = 0:0.001:1
@gp t sin.(10π*t) "w l tit 'sin' lc 'gray'"
saveas("lines001") # hide
````

![](assets/lines001.svg)

