


```julia
using Gnuplot
empty!(Gnuplot.options.init)
push!( Gnuplot.options.init, linetypes(:Set1_5, lw=1.5, ps=1.5))
function saveas(file; sx=550, sy=350, fs=0.8, term="svg")
    Gnuplot.save(term="$(term) size $(sx),$(sy) fontscale $(fs)", "$(file).svg")
end;
```


<a id='Contour-plot'></a>

## Contour plot


```julia
x = y = -15:0.33:15
fz(x,y) = sin.(sqrt.(x.^2 + y.^2))./sqrt.(x.^2+y.^2)
fxy = [fz(x,y) for x in x, y in y]
@gsp x y fxy "w l lc palette" "set view map"
@gsp :- "set contour base;set key off" "set auto fix"
@gsp :- "set cntrparam levels 15" "unset surface"
@gsp :- xlab = "x" ylab = "y"
```


![](contour001.svg)

