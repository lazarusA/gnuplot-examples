@def title = "Code blocks"
@def hascode = true
@def date = Date(2019, 3, 22)
@def rss = "A short description of the page which would serve as **blurb** in a `RSS` feed; you can use basic markdown here but the whole description string must be a single line (not a multiline string). Like this one for instance. Keep in mind that styling is minimal in RSS so for instance don't expect maths or fancy styling to work; images should be ok though: ![](https://upload.wikimedia.org/wikipedia/en/3/32/Rick_and_Morty_opening_credits.jpeg)"

# @gp macro for plotting
\tableofcontents <!-- you can use \toc as well -->
## Simple plots
The simplest plot  can be generated and save it with

```julia:./ex1.jl
using Gnuplot
@gp 1:10
#save("plt2_ex1.gp")
#save(term="cairolatex standalone", output="plt2_ex1.tex")
#save(term="pdf", output="plt2_ex1.pdf")
save(term="png", output="plt2_ex1.png")

```
\fig{plt2_ex1}

Here, we are plotting 10 values, from 1 to 10 and the default is to plot *points*.  We can change this by calling **with** within a string and specifying the kind of plot that we want, i.e., **lines**.  Additionally, the **legend (label)** for this plot can be called afterwards with **title** as well as the **line color**.  Namely, ` "with lines title 'sin' linecolor 'black'"`  ( ` "w l t 'sin' lc 'black'"`,  also works!). See the next example.  

Also, several options to save to a file are posible.  The usuals `pdf` and `png` can be used as in the example above. Another two options that may come in handy are 
> `file.gp`, which you can load directly afterwards in `gnuplot`  with 
 - `gnuplot> load 'file.gp'`
 and 
 > `file.tex` in which case you can include directly math-latex style equation and load afterwards in a Latex document. More on this in **advance examples**. 

```julia:./ex2.jl
using Gnuplot
t = 0:0.001:1
@gp(t, sin.(2π*5*t), "with lines title 'sin' linecolor 'black'")
#save("plt2_ex2.gp") # hide
#save(term="pdf size 5,3", output="plt2_ex2.pdf") # hide
save(term="pngcairo size 600,400", output="plt2_ex2.png") # hide
```
\fig{plt2_ex2}

Also, we can plot more than one line as  in

```julia:./ex3.jl
using Gnuplot
x = -2π:0.001:2π
@gp(x, sin.(x), "w l t 'sin'", "set yrange [-1.1:1.1]", "set grid",
    x, cos.(x), "with linespoints ls 1 t 'cos' ",
    "set style line 1 lc rgb 'black' lt 1 lw 1 pt 6 pi -200 ps 1.5")
    save(term="pngcairo size 600,400", output="plt2_ex3.png") # hide
```
\fig{plt2_ex3}

where the **yrange** as well as a **grid** are called with **set**.  The `xrange` and `yrange` can be called directly into the plot. Also, another way to add a new plot to a previuos one is done by using `:-`  after `@gp`. Namely, 

```julia:./ex4.jl
using Gnuplot
x = -2π:0.001:2π
@gp(x, sin.(x),"w l t 'sin' lw 2 lc '#56B4E9'", "set grid", 
    xrange = (-2π - 0.3, 2π + 0.3), yrange = (-1.1,1.1))
@gp(:-, x, cos.(x), "w l t 'cos' lw 2 lc rgb '#E69F00'")
save(term="pngcairo size 600,400", output="plt2_ex4.png") # hide
```
\fig{plt2_ex4}

Note that the `linewidth` can also be called directly and a custom color can also be called, `lc 'hex'`. 
## Full customize plot
More customization, as the  `title` of the graph,  `xlabel` ,  `ylabel`  and legend(label) position can be done as follows:  

```julia:./ex5.jl
using Gnuplot
x = -2π:0.001:2π
@gp(x, sin.(x), "w l t 'sin' lw 2 lc '#56B4E9'", "set grid", 
    "set auto fix",
    "set offsets graph .05, graph .05, graph .05, graph .05",
    ylabel="Y label", xlabel="X label", title = "Title",
    "set key bottom left font ',12' title 'Legend' box 2",)
@gp(:-, x, cos.(x), "w l t 'cos' lw 1.5 dashtype 2 lc '#E69F00'")
save(term="pngcairo font 'Consolas, 12' size 600,400", output="plt2_ex5.png") # hide
```
\fig{plt2_ex5}

note that the `legend(label)` is specified with `"set key bottom left ..."`, here besides the usual options `top lef`,  `top right`, etc., you can also write directly the `x,y` coordinates as  `"set key at 1,-0.6"` for example.  

The `"set auto fix"`, and `"set offsets graph ...` are used to have a proper centered figure.  Note also the new `dashtype` option also called `dt`. More on that in the following.   

A set of dash styles is also available. See the next figure. 
```julia:./ex6.jl
using Gnuplot
x = -2π:0.001:2π
linCol = ["#000000", "#E69F00", "#56B4E9", "#009E73","#F0E442"]
@gp(x, cos.(x), "w l t 'dt 1' lw 2 dt 1 lc '$(linCol[1])'",
    "set grid", "set auto fix",
    "set offsets graph .05, graph .05, graph .05, graph .05",
    ylabel="Y label", xlab="X label",
    "set key b r font ',10' title 'dashtype' opaque")
for (idx,ϕ) in enumerate(0.3:0.3:1.3)
    @gp(:-, x, cos.(x .+ 2ϕ),
    "w l t 'dt $(idx+1)' lw 2 dt $(idx+1) lc '$(linCol[idx+1])'")
end
save(term="pngcairo font 'Consolas, 12' size 600,400", output="plt2_ex6.png") # hide
```
\fig{plt2_ex6}

Note how easy is to incorporate normal `Julia` code, i.e. `Strings` into `Gnuplot` commands.  Now, also the legend `set key bottom right... opaque` is used to have a rectangle with white background.  
## Default colors with lines
```julia:./ex6_1.jl
using Gnuplot
ecycl_x(r,k,θ) = r*(k .+ 1).*cos.(θ) .- r*cos.((k .+ 1) .* θ)
ecycl_y(r,k,θ) = r*(k .+ 1).*sin.(θ) .- r*sin.((k .+ 1) .* θ)
θ = LinRange(0,6.2π,1000)
@gp(ecycl_x(1,1,θ), ecycl_y(1,1,θ), "w l lw 2 t '1'",
    "set size square")
for k in 2:0.5:5.
    @gp(:-, ecycl_x(2k,k,θ), ecycl_y(2k,k,θ), "w l lw 2 t '$(k)' ", 
        "set key outside title 'k, r=2k' box opaque",
        xlabel = "x(θ) = r(k+1)cos(θ) -rcos((k+1)θ)", 
        ylabel = "y(θ) = r(k+1)cos(θ) -rcos((k+1)θ) ",
        title = "Epicycloid",:-)
end
@gp
save(term="pngcairo font 'Consolas, 12' size 600,600", output="plt2_ex6dot1.png") # hide
```
\fig{plt2_ex6dot1}

## Black background, and colormaps
For a more cumbersome example, consider the following with a `black` background and colors from `ColorSchemes`. 

```julia:./ex7.jl
using Gnuplot, ColorSchemes
x = -2π:0.001:2π
function circShape(h,k,r)
    θ = LinRange(0,2π,500)
    h .+ r*sin.(θ), k .+ r*cos.(θ)
end
bgcp1 = "set object rectangle from screen 0,0 to screen 1,1"
bgcp2 = " behind fillcolor rgb 'black' fillstyle solid noborder"
bgcolor = bgcp1*bgcp2
cmap = get(colorschemes[:viridis], LinRange(0,1,15))
@gp " " :-  # this is just to reset session
@gp(circShape(0,0,1)..., "w l lw 2 lc '#$(hex(cmap[3]))'", 
    "set key off", "set auto fix",  "set size square",
    "set offsets graph .05, graph .05, graph .05, graph .05",
    "set border lw 1 lc rgb 'white'",
    "set ylabel 'y' textcolor rgb 'white'",
    "set xlabel 'x' textcolor rgb 'white'",
    "set xzeroaxis linetype 3 linewidth 1",
    "set yzeroaxis linetype 3 linewidth 1",
    bgcolor)
for (indx,r) in enumerate(0.9:-0.1:0.1)
    @gp(:-, circShape(0,0,r)..., "w l lw 2 lc '#$(hex(cmap[indx+3]))'",
    "set key off")
end
save(term="pngcairo size 400,400 ", output="plt2_ex7.png") # hide
```
\fig{plt2_ex7}
## Color as a third dimension
Using as reference the previous example we can use any `colormap` in  `Gnuplot`'s `palettes` as a way to enconde a third dimension. 

```julia:./ex8.jl
using Gnuplot, Colors, ColorSchemes
x = LinRange(-2π,2π,200)
#colorbar tricks... # hide
cbwt = 0.02 # hide
rightmargin = 0.875 # hide
cboxp="set colorbox user origin graph 1.01, graph 0 size $cbwt, graph 1" # hide
addmargin="set rmargin at screen $rightmargin" # hide
goffset="set offsets graph .05, graph .05, graph .05, graph .05" # hide
#custom palette, colormap # hide
function custom_palette(colormap=:viridis) # hide
cmap = get(colorschemes[colormap], LinRange(0,1,256)) # hide
ctmp = "0 '#$(hex(cmap[1]))'," # hide
for i in 2:256; ctmp = ctmp*"$(i-1) '#$(hex(cmap[i]))'," end; # hide
"set palette defined("*ctmp[1:end-1]*")" # hide
end # hide
@gp(x, -0.65sin.(3x), x,  "w l lw 3 dt 1 lc palette", 
    "set key off", "set auto fix")
    #goffset, cboxp, addmargin) # hide
save(term="pngcairo size 600,400", output="plt_ex8.png") # hide
```
\fig{plt_ex8}

Here, the default colormap is used. However, if we want more customize colormaps with can use the following definition to call all posible palettes in `ColorSchemes`. 
## Several colormaps and layout 

```julia:./ex9.jl
using Gnuplot, Colors, ColorSchemes, Random
Random.seed!(123)
function custom_palette(colormap=:viridis)
    cmap = get(colorschemes[colormap], LinRange(0,1,256))
    ctmp = "0 '#$(hex(cmap[1]))',"
    for i in 2:256; ctmp = ctmp*"$(i-1) '#$(hex(cmap[i]))'," end;
    "set palette defined("*ctmp[1:end-1]*")"
end
# Archimedes spiral
a = 1.5
b = -2.4
t = LinRange(0,5*π,500)
x = (a .+ b*t) .* cos.(t)
y = (a .+ b*t) .* sin.(t)
@gp " " :-  # this is just to reset session
@gp :- "set multiplot layout 3,3; set key off; 
    unset ytics; unset xtics; unset border" :-
colormaps = [:magma, :viridis, :plasma, :inferno, :berlin, 
    :leonardo, :devon, :spring, :ice]
for i in 1:9
    @gp :- i title = "$(colormaps[i])" "set size square" :-
    @gp(:-, x, y, t, "w l lw 3 dt 1 lc palette", 
        custom_palette(colormaps[i]),"set cbtics out nomirror", :-)
end
@gp
save(term="pngcairo size 900,800", output="plt_ex9.png") # hide
```
\fig{plt_ex9}

# Scatter plots  
Just for the sake of completeness, let's see several colormaps but this time for different kinds of **point types**, `pt`. 

## simple scatter plot 
```julia:./ex10.jl
using Gnuplot, Random
Random.seed!(123)
goffset = "set offsets graph .05, graph .05, graph .05, graph .05"
@gp rand(30) rand(30) "w p pt 4 ps 3 lc '#0072B2' lw 2 t 'marker'" goffset
save(term="pngcairo size 600,400", output="plt_ex10.png") # hide
```
\fig{plt_ex10}

So, what's happening here?. Well, basically we have `x` and `y` coordinates, here `rand(30)` and `rand(30)`, then the corresponding options are specified, i.e.  ` with points pointtype 4 pointsize 3 linecolor '#0072B2' linewidth 2 title 'marker'`. All in a single line!

## Full customize scatter plot
```julia:./ex11.jl
using Gnuplot, Random
Random.seed!(123)
goffset = "set offsets graph .05, graph .05, graph .05, graph .05"
@gp(rand(30), rand(30), "w p pt 6 ps 2 lc '#D55E00' lw 2 t 'marker'",
    goffset, title = "scatter plot", xlabel ="X", ylabel = "Y",
    "set key b l box opaque")
    save(term="pngcairo size 600,400", output="plt_ex11.png") # hide
```
\fig{plt_ex11}


##  color as a third dimension 
```julia:./ex12.jl
using Gnuplot, Colors, ColorSchemes, Random
Random.seed!(123)
function custom_palette(colormap=:viridis)
    cmap = get(colorschemes[colormap], LinRange(0,1,256))
    ctmp = "0 '#$(hex(cmap[1]))',"
    for i in 2:256; ctmp = ctmp*"$(i-1) '#$(hex(cmap[i]))'," end;
    "set palette defined("*ctmp[1:end-1]*")"
end
@gp " " :-  # this is just to reset session
@gp :- "set multiplot layout 3,3; set key off" :-
cmaps = [:magma, :viridis, :plasma, :inferno, :berlin, :leonardo,
    :devon, :spring, :ice]
for i in 1:9
    @gp :- i title = "$(cmaps[i]), pt $(i)" "set size square" :-
    @gp(:-, rand(15), rand(15), rand(15), 
    "w p pt $(i) ps 3 lc palette", custom_palette(cmaps[i]), 
    "set cbtics out nomirror", "set xtics 0,1", "set ytics 0,1", 
    "set cbtics 0.0,0.2,1.0", xrange= (-0.1,1.1), 
    yrange= (-0.1,1.1), :-)
end
@gp
save(term="pngcairo size 900,800", output="plt_ex12.png") # hide
```
\fig{plt_ex12}

to be continued... 




