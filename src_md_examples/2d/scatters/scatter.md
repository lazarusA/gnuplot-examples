```@meta
EditURL = "../../../examples/2d/scatters/scatter.jl"
```

````@example scatter
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

## scatter

````@example scatter
using Gnuplot
@gp 1:10
saveas("scatter000");
nothing #hide
````

![](scatter000.svg)

