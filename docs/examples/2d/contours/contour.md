


```julia
using Gnuplot, Random
Random.seed!(123)
let
    x = y = -15:0.33:15
    fz(x,y) = sin.(sqrt.(x.^2 + y.^2))./sqrt.(x.^2+y.^2)
    fxy = [fz(x,y) for x in x, y in y]
    @gsp x y fxy "w l lc palette" "set view map"
    @gsp :- "set contour base;set key off" "set auto fix"
    @gsp :- "set cntrparam levels 15" "unset surface"
    @gsp :- xlab = "x" ylab = "y"
end
```


```
"assets/contour001.svg"
```


![](assets/contour001.svg)

