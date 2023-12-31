```@meta
EditURL = "../../../examples/2d/contours/contour.jl"
```

````@example contour
using Gnuplot#hide
Gnuplot.quitall()#hide
mkpath("assets")#hide
Gnuplot.options.term = "unknown"#hide
empty!(Gnuplot.options.init)#hide
push!( Gnuplot.options.init, linetypes(:Set1_5, lw=1.5, ps=1.5))#hide
saveas(file) = Gnuplot.save(term="svg size 550,350 fontscale 0.8", "assets/$(file).svg")#hide

using Gnuplot, Random
Random.seed!(123)
let
    x = y = -15:0.33:15
    fz(x,y) = sin.(sqrt.(x.^2 + y.^2))./sqrt.(x.^2+y.^2)
    fxy = [fz(x,y) for x in x, y in y]
    @gsp x y fxy "w l lc palette" "set view map"
    @gsp :- "set contour base;set key off" "set auto fix"
    @gsp :- "set cntrparam levels 15" "unset surface"
    @gsp :- xlab = "x" ylab = "y"
    saveas("contour001") # hide
end
````

![](assets/contour001.svg)

