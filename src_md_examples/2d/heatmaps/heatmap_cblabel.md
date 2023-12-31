```@meta
EditURL = "../../../examples/2d/heatmaps/heatmap_cblabel.jl"
```

````@example heatmap_cblabel
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
    test = rand(50,50)
    @gp "set auto fix" "set size square" :-
    @gp :- test "w image pixels notit"  """set cblabel "CBTitle \\n (my unit)" """ :-
    @gp :- "set cblabel  offset -6.5, 10 font ',8' textcolor lt 3 rotate by 0" :-
    @gp :- palette(:plasma) :-
    @gp :- "set tmargin at screen 0.80"
    saveas("heatmap004") # hide
end
````

![](assets/heatmap004.svg)

