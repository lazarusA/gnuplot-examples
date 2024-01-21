```@meta
EditURL = "../../../examples/2d/heatmaps/heatmap_continuous.jl"
```

````@example heatmap_continuous
using Gnuplot
Gnuplot.quitall()#hide
Gnuplot.options.term = "unknown"#hide
empty!(Gnuplot.options.init)
push!( Gnuplot.options.init, linetypes(:Set1_5, lw=1.5, ps=1.5))
function saveas(file; sx=550, sy=350, fs=0.8, term="svg")
    Gnuplot.save(term="$(term) size $(sx),$(sy) fontscale $(fs)", "$(file).svg")
end;
nothing #hide
````

## Heatmap: continuous

````@example heatmap_continuous
x = y = -5:1:5
z = [x^2 + y^2 for x in x, y in y]
@gsp x y z "w pm3d notit" "set view map" "set auto fix" "set size square"
@gsp :- xlab = "x" ylab = "y" "set cblabel 'z'" palette(:plasma)
@gsp :- title = "3D Heatmap"
saveas("heatmap002");
nothing #hide
````

![](heatmap002.svg)

