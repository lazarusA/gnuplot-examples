```@meta
EditURL = "../../../examples/2d/scatters/scatter_line.jl"
```

````@example scatter_line
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

## scatter lines

````@example scatter_line
using Gnuplot
x = -2π:0.001:2π
@gp(x, sin.(x), "w l t 'sin'", "set yrange [-1.1:1.1]", "set grid",
    x, cos.(x), "with linespoints ls 1 t 'cos' ",
    "set style line 1 lc rgb 'black' lt 1 lw 1 pt 6 pi -200 ps 1.15")
saveas("scatter001");
nothing #hide
````

![](scatter001.svg)

