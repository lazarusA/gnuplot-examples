


```julia
using Gnuplot
empty!(Gnuplot.options.init)
push!( Gnuplot.options.init, linetypes(:Set1_5, lw=1.5, ps=1.5))
function saveas(file; sx=550, sy=350, fs=0.8, term="svg")
    Gnuplot.save(term="$(term) size $(sx),$(sy) fontscale $(fs)", "$(file).svg")
end;
```


<a id='Heatmap:-volcano-example'></a>

## Heatmap: volcano example


```julia
using ColorSchemes, RDatasets
volcano = Matrix{Float64}(dataset("datasets", "volcano"))
@gp title = "Auckland s Maunga Whau Volcano" :-
@gp :- volcano "w image pixels notit" "set auto fix" "set size ratio -1" palette(:inferno)
saveas("heatmap006");
```


![](heatmap006.svg)

