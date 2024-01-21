```@meta
EditURL = "../../../examples/2d/lines/line.jl"
```

````@example line
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

## line

````@example line
using Gnuplot
t = 0:0.001:1
@gp t sin.(10π*t) "w l tit 'sin' lc 'gray'"
saveas("lines001");
nothing #hide
````

![](lines001.svg)

