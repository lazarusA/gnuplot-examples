


```julia
using Gnuplot, Random
let
    x = y = -5:1:5
    z = [x^2 + y^2 for x in x, y in y]
    @gp x y z "w image pixels notit" "set auto fix" "set size square"
    @gp :- xlab = "x" ylab = "y" "set cblabel 'z'" palette(:dense)
    @gp :- title = "Heatmap Discrete"
end
```


```
"assets/heatmap003.svg"
```


![](assets/heatmap003.svg)

