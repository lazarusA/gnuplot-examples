


```julia
using Gnuplot
let
    x = -2π:0.001:2π
    linCol = ["#000000", "#E69F00", "#56B4E9", "#009E73","#F0E442"]
    @gp x cos.(x) "w l t 'dt 1' lw 2 dt 1 lc '$(linCol[1])'"
    @gp :- "set grid" "set auto fix"
    @gp :- "set offsets graph .05, graph .05, graph .05, graph .05"
    @gp :- ylabel="Y label" xlab="X label"
    @gp :- "set key b r font ',10' title 'dashtype' opaque"
    for (idx,ϕ) in enumerate(0.3:0.3:1.3)
        @gp :- x cos.(x .+ 2ϕ) "w l t 'dt $(idx+1)' lw 2 dt $(idx+1) lc '$(linCol[idx+1])'"
    end
end
```


```
"assets/lines004.svg"
```


![](assets/lines004.svg)
