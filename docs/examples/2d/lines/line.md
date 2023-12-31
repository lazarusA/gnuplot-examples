


```julia
using Gnuplot
t = 0:0.001:1
@gp t sin.(10π*t) "w l tit 'sin' lc 'gray'"
```


```
"assets/lines001.svg"
```


![](assets/lines001.svg)

