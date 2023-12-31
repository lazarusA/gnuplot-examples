


```julia
using Gnuplot, ColorSchemes
@gp key="left" linetypes(:mk_12, dashed=true, ps=0.85)
for i in 1:10
    @gp :- i .* (0:10) "w lp t '$i'"
end
```


```
"assets/scatter003.svg"
```


![](assets/scatter003.svg)

