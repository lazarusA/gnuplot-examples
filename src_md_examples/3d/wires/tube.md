```@meta
EditURL = "../../../examples/3d/wires/tube.jl"
```

````@example tube
using Gnuplot#hide
Gnuplot.quitall()#hide
mkpath("assets")#hide
Gnuplot.options.term = "unknown"#hide
empty!(Gnuplot.options.init)#hide
push!( Gnuplot.options.init, linetypes(:Set1_5, lw=1.5, ps=1.5))#hide
saveas(file) = Gnuplot.save(term="svg size 550,350 fontscale 0.8", "assets/$(file).svg")#hide

using Gnuplot
let
    U  = LinRange(0,10π, 80)
    V = LinRange(0,2π, 20)
    x = [(1-0.1*cos(v))*cos(u) for u in U, v in V]
    y = [(1-0.1*cos(v))*sin(u) for u in U, v in V]
    z = [0.1*(sin(v) + u/1.7 - 10) for u in U, v in V]
    @gsp x y z "w l notit lc 'orange'" "set xyplane -0.05"
    saveas("wires004") # hide
end
````

![](assets/wires004.svg)

