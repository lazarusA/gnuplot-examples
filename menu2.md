@def title = "3d plots"
@def hascode = true
@def rss = "3d plots... ![](https://upload.wikimedia.org/wikipedia/en/b/b0/Rick_and_Morty_characters.jpg)"
@def rss_title = "More goodies"
@def rss_pubdate = Date(2019, 5, 1)

\tableofcontents <!-- you can use \toc as well -->

## Basic plot from data

```julia:./ex3d_1.jl
using Gnuplot
x=[0,1,2]
y=[0,1,2]
Z=[10 10 10; 10 3 10; 10 2 10]
@gsp x y Z "w l lc 'red'"
save(term="png", output="plt3d_ex1.png")
```
\fig{plt3d_ex1}

More options 
```julia:./ex3d_2_1.jl
using Gnuplot
@gsp " " :-  # reset session
@gsp "unset key" "set multi layout 2,2 title 'Multiplot title'" :-
@gsp :- 1 x y Z "w linespoints pt 4 ps 2" :-
@gsp :- 2 x y Z "w points pt 3 ps 3" :-
@gsp :- 3 x y Z "w l palette" "set view 55, 65" :-
@gsp :- 4 x y Z "w pm3d" "set view 55, 65" "set key off" :-
@gsp :- x y Z "w l lc 'white'" 
save(term="pngcairo size 1200,800", output="plt3d_ex2.png")
```
\fig{plt3d_ex2}


## 3D from a function, wire and surface plots
3D plot from a function 

```julia:./ex3d_3.jl
using Gnuplot
x = y = -15:0.33:15
fz(x,y) = sin.(sqrt.(x.^2 + y.^2))./sqrt.(x.^2+y.^2)
fxy = [fz(x,y) for x in x, y in y]
@gsp " " :-  # reset session
@gsp :- x y fxy "w l lc 'orange'"
save(term="pngcairo size 800,800", output="plt3d_ex3.png")
```
\fig{plt3d_ex3}

```julia:./ex3d_3_1.jl
using Gnuplot
x = y = -15:0.33:15
fz(x,y) = sin.(sqrt.(x.^2 + y.^2))./sqrt.(x.^2+y.^2)
fxy = [fz(x,y) for x in x, y in y]
@gsp " " :-  # reset session
@gsp(:-,x, y, fxy, "w pm3d", "set ylabel 'y' textcolor rgb 'red'",
    "set xlabel 'x' textcolor rgb 'blue'")
save(term="pngcairo size 800,800", output="plt3d_ex3_1.png")
```
\fig{plt3d_ex3_1}


## Countour plot
And with few more options we can get a countour plot. 

```julia:./ex3d_4.jl
using Gnuplot
x = y = -15:0.33:15
fz(x,y) = sin.(sqrt.(x.^2 + y.^2))./sqrt.(x.^2+y.^2)
fxy = [fz(x,y) for x in x, y in y]
@gsp " " :-  # reset session
@gsp(x, y, fxy, "w l lc palette", "set view map",
    "set contour base;set key off","set auto fix",
    "set cntrparam levels 15", "unset surface",
    xlab = "x", ylab = "y")
save(term="pngcairo size 800,800", output="plt3d_ex4.png")
```
\fig{plt3d_ex4}

## Heat map
A heat map from data or a matrix can be easily plotted as
```julia:./ex3d_5.jl
using Gnuplot, Random
Random.seed!(1234)
matrix = randn(50,60)
@gsp " " :-  # reset session
@gsp matrix "w image" "set view map" "set auto fix"
save(term="pngcairo size 800,800", output="plt3d_ex5.png")
```
\fig{plt3d_ex5}

or real data with a custom colormap

```julia:./ex3d_6.jl
using Gnuplot, ColorSchemes, RDatasets, Colors
function gp_palette(colormap=:viridis)
    cmap = get(colorschemes[colormap], LinRange(0,1,256))
    ctmp = "0 '#$(hex(cmap[1]))',"
    for i in 2:256; ctmp = ctmp*"$(i-1) '#$(hex(cmap[i]))'," end;
    "set palette defined("*ctmp[1:end-1]*")"
end

volcano = Matrix{Float64}(dataset("datasets", "volcano"))
@gsp(volcano, "w image", "set view map", "set auto fix",
    gp_palette(:inferno), title = "Auckland s Maunga Whau Volcano")
save(term="pngcairo size 900,600", output="plt3d_ex6.png")
```

\fig{plt3d_ex6}

to be continued.....




