@def title = "Code blocks"
@def hascode = true
@def date = Date(2019, 3, 22)
@def rss = "A short description of the page which would serve as **blurb** in a `RSS` feed; you can use basic markdown here but the whole description string must be a single line (not a multiline string). Like this one for instance. Keep in mind that styling is minimal in RSS so for instance don't expect maths or fancy styling to work; images should be ok though: ![](https://upload.wikimedia.org/wikipedia/en/3/32/Rick_and_Morty_opening_credits.jpeg)"

# @gp macro for plotting
\tableofcontents <!-- you can use \toc as well -->
## Simple plots
The simplest plot  can be generated and save it with

\input{julia}{/assets/menu1/ex1.jl}
\fig{plt2_ex1}

Here, we are plotting 10 values, from 1 to 10 and the default is to plot *points*.  We can change this by calling **with** within a string and specifying the kind of plot that we want, i.e., **lines**.  Additionally, the **legend (label)** for this plot can be called afterwards with **title** as well as the **line color**.  Namely, ` "with lines title 'sin' linecolor 'black'"`  ( ` "w l t 'sin' lc 'black'"`,  also works!). See the next example.  

Also, several options to save to a file are posible.  The usuals `pdf` and `png` can be used as in the example above. Another two options that may come in handy are 
> `file.gp`, which you can load directly afterwards in `gnuplot`  with 
 - `gnuplot> load 'file.gp'`
 and 
 > `file.tex` in which case you can include directly math-latex style equation and load afterwards in a Latex document. More on this in **advance examples**. 

\input{julia}{/assets/menu1/ex2.jl}
\fig{plt2_ex2}

Also, we can plot more than one line as  in

\input{julia}{/assets/menu1/ex3.jl}
\fig{plt2_ex3}

where the **yrange** as well as a **grid** are called with **set**.  The `xrange` and `yrange` can be called directly into the plot. Also, another way to add a new plot to a previuos one is done by using `:-`  after `@gp`. Namely, 

\input{julia}{/assets/menu1/ex4.jl}
\fig{plt2_ex4}

Note that the `linewidth` can also be called directly and a custom color can also be called, `lc 'hex'`. 
## Full customize plot
More customization, as the  `title` of the graph,  `xlabel` ,  `ylabel`  and legend(label) position can be done as follows:  

\input{julia}{/assets/menu1/ex5.jl}
\fig{plt2_ex5}

note that the `legend(label)` is specified with `"set key bottom left ..."`, here besides the usual options `top lef`,  `top right`, etc., you can also write directly the `x,y` coordinates as  `"set key at 1,-0.6"` for example.  

The `"set auto fix"`, and `"set offsets graph ...` are used to have a proper centered figure.  Note also the new `dashtype` option also called `dt`. More on that in the following.   

A set of dash styles is also available. See the next figure. 
\input{julia}{/assets/menu1/ex6.jl}
\fig{plt2_ex6}

Note how easy is to incorporate normal `Julia` code, i.e. `Strings` into `Gnuplot` commands.  Now, also the legend `set key bottom right... opaque` is used to have a rectangle with white background.  
## Default colors with lines
\input{julia}{/assets/menu1/ex6_1.jl}
\fig{plt2_ex6dot1}

## Black background, and colormaps
For a more cumbersome example, consider the following with a `black` background and colors from `ColorSchemes`. 

\input{julia}{/assets/menu1/ex7.jl}
\fig{plt2_ex7}

A more cumbersome example with a glow effect 

\input{julia}{/assets/menu1/glowbg.jl}
\fig{glow1}

## Color as a third dimension
Using as reference the previous example we can use any `colormap` in  `Gnuplot`'s `palettes` as a way to enconde a third dimension. 
\input{julia}{/assets/menu1/ex8.jl}
\fig{plt_ex8}

Here, the default colormap is used. However, if we want more customize colormaps with can use the following definition to call all posible palettes in `ColorSchemes`. 
## Several colormaps and layout 

\input{julia}{/assets/menu1/ex9.jl}
\fig{plt_ex9}

# Scatter plots  
Just for the sake of completeness, let's see several colormaps but this time for different kinds of **point types**, `pt`. 

## simple scatter plot 
\input{julia}{/assets/menu1/ex10.jl}
\fig{plt_ex10}

So, what's happening here?. Well, basically we have `x` and `y` coordinates, here `rand(30)` and `rand(30)`, then the corresponding options are specified, i.e.  ` with points pointtype 4 pointsize 3 linecolor '#0072B2' linewidth 2 title 'marker'`. All in a single line!

## Full customize scatter plot
\input{julia}{/assets/menu1/ex11.jl}
\fig{plt_ex11}


##  color as a third dimension 
\input{julia}{/assets/menu1/ex12.jl}
\fig{plt_ex12}

## Filled curves 
\input{julia}{/assets/menu1/ex13.jl}
\fig{plt_ex13}

With different transparencies 

\input{julia}{/assets/menu1/ex14.jl}
\fig{plt_ex14}

Filling between lines, two examples in one plot. The first entry is the common `x` variable, the second argument is the first curve and the third the second curve

\input{julia}{/assets/menu1/ex15.jl}
\fig{plt_ex15}

# Histograms 
Three different ways two plot histograms. 
\input{julia}{/assets/menu1/ex16.jl}
\fig{plt_ex16}

# Plot errors, box plots, error bars
\input{julia}{/assets/menu1/ex17.jl}
\fig{plt_errs1}

\input{julia}{/assets/menu1/ex18.jl}
\fig{plt_errs2}

\input{julia}{/assets/menu1/ex19.jl}
\fig{plt_errs3}

\input{julia}{/assets/menu1/ex20.jl}
\fig{plt_errs4}

\input{julia}{/assets/menu1/ex21.jl}
\fig{plt_errs5}

\input{julia}{/assets/menu1/ex22.jl}
\fig{plt_errs6}

\input{julia}{/assets/menu1/ex23.jl}
\fig{plt_errs7}

\input{julia}{/assets/menu1/ex24.jl}

\fig{plt_errs8}

\input{julia}{/assets/menu1/ex25.jl}

\fig{plt_errs9}

\input{julia}{/assets/menu1/ex26.jl}

\fig{plt_errs10}

\input{julia}{/assets/menu1/ex27.jl}

\fig{plt_errs11}

\input{julia}{/assets/menu1/ex28.jl}
\fig{plt_errs12}

\input{julia}{/assets/menu1/ex29.jl}
\fig{plt_errs13}

\input{julia}{/assets/menu1/ex30.jl}
\fig{plt_errs14}

\input{julia}{/assets/menu1/ex31.jl}
\fig{plt_errs15}

\input{julia}{/assets/menu1/ex32.jl}
\fig{plt_errs16}

\input{julia}{/assets/menu1/ex33.jl}
\fig{plt_errs17}

\input{julia}{/assets/menu1/ex34.jl}
\fig{plt_errs18}


\input{julia}{/assets/menu1/ex35.jl}
\fig{plt_errs19}
# Bubble plots

\input{julia}{/assets/menu1/ex36.jl}
\fig{burbuja1}

\input{julia}{/assets/menu1/ex37.jl}
\fig{burbuja2}

\input{julia}{/assets/menu1/ex38.jl}
\fig{burbuja3}

# Candlesticks
- financial data: date open low high close
- whisker plot: x box_min whisker_min whisker_high box_high
