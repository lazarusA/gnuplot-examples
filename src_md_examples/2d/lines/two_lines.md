```@meta
EditURL = "../../../examples/2d/lines/two_lines.jl"
```

````@example two_lines
using Gnuplot#hide
Gnuplot.quitall()#hide
Gnuplot.options.term = "unknown"#hide
empty!(Gnuplot.options.init)#hide
push!( Gnuplot.options.init, linetypes(:Set1_5, lw=1.5, ps=1.5))#hide
saveas(file) = Gnuplot.save(term="svg size 550,350 fontscale 0.8", "assets/$(file).svg")#hide

using Gnuplot
x = -2π:0.001:2π
@gp x sin.(x) "w l t 'sin' lw 2 lc '#56B4E9'" "set grid"
@gp :- xrange = (-2π - 0.3, 2π + 0.3) yrange = (-1.1,1.1)
@gp :- x cos.(x) "w l t 'cos' lw 2 lc rgb '#E69F00'"
saveas("lines002") # hide
````

![](assets/lines002.svg)

