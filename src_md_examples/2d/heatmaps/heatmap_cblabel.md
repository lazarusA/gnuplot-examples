```@meta
EditURL = "../../../examples/2d/heatmaps/heatmap_cblabel.jl"
```

````@example heatmap_cblabel
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

## Heatmap: colorbar

````@example heatmap_cblabel
using Random
Random.seed!(123)

test = rand(50,50)
@gp "set auto fix" "set size square" :-
@gp :- test "w image pixels notit"  """set cblabel "CBTitle \\n (my unit)" """ :-
@gp :- "set cblabel  offset -6.5, 10 font ',8' textcolor lt 3 rotate by 0" :-
@gp :- palette(:plasma) :-
@gp :- "set tmargin at screen 0.80"
saveas("heatmap004");
nothing #hide
````

![](heatmap004.svg)

