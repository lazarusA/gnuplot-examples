


```julia
using Gnuplot, Random
Random.seed!(1234)
matrix = randn(50,60)
@gp matrix "w image pixels notit" "set auto fix"
```


```
"assets/heatmap001.svg"
```


![](assets/heatmap001.svg)

