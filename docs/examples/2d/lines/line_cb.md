


```julia
using Gnuplot, ColorSchemes
x = LinRange(-2π,2π,200)
@gp x -0.65sin.(3x) x  "w l notit lw 3 dt 1 lc palette" palette(:plasma)
```


```
"assets/lines005.svg"
```


![](assets/lines005.svg)

