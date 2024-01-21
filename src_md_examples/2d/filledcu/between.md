```@meta
EditURL = "../../../examples/2d/filledcu/between.jl"
```

````@example between
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

## Filled Between curves

````@example between
x = LinRange(-10,10,200)
@gp x sin.(x) sin.(x) .+ 1 "with filledcu lc '#56B4E9' fs transparent solid 0.3"
@gp :- x cos.(x) 1 .+ cos.(x) "with filledcu lc 'red' fs transparent solid 0.5"
saveas("filled002");
nothing #hide
````

![](filled002.svg)

