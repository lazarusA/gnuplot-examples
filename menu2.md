@def title = "3d plots"
@def hascode = true

\tableofcontents <!-- you can use \toc as well -->

## Basic plot from data

\input{julia}{/assets/menu2/ex3d_1.jl}
\fig{plt3d_ex1}

More options 
\input{julia}{/assets/menu2/ex3d_2.jl}

\fig{plt3d_ex2}


## 3D from a function, wire and surface plots
3D plot from a function 
\input{julia}{/assets/menu2/ex3d_3.jl}
\fig{plt3d_ex3}

\input{julia}{/assets/menu2/ex3d_3_1.jl}
\fig{plt3d_ex3_1}


## Countour plot
And with few more options we can get a countour plot. 

\input{julia}{/assets/menu2/ex3d_4.jl}
\fig{plt3d_ex4}

### egg 
An egg shape
\input{julia}{/assets/menu2/egg.jl}
\fig{egg}

## Lorenz attractor
\input{julia}{/assets/menu2/lorenz.jl}
\fig{lorenz}

See the feature section for the animation. 

## Heat map
A heat map from data or a matrix can be easily plotted as
\input{julia}{/assets/menu2/ex3d_5.jl}
\fig{plt3d_ex5}
### Example 1
\input{julia}{/assets/menu2/heatmap1.jl}
\fig{heatmap1}
### Example 2
\input{julia}{/assets/menu2/heatmap2.jl}
\fig{heatmap2}

or real data with a custom colormap

\input{julia}{/assets/menu2/ex3d_6.jl}

\fig{plt3d_ex6}

## Tubes

\input{julia}{/assets/menu2/tubes1.jl}
\fig{tubes1}

\input{julia}{/assets/menu2/tubes2.jl}
\fig{tubes2}

## Spheres

\input{julia}{/assets/menu2/sphere1.jl}
\fig{sphere1}

\input{julia}{/assets/menu2/sphere2.jl}
\fig{sphere2}

\input{julia}{/assets/menu2/sphere3.jl}
\fig{sphere3}

\input{julia}{/assets/menu2/sphere4.jl}
\fig{sphere4}
## Torus

\input{julia}{/assets/menu2/torus1.jl}
\fig{torus1}

\input{julia}{/assets/menu2/torus2.jl}
\fig{torus2}

\input{julia}{/assets/menu2/torus3.jl}
\fig{torus3}


Note: with the pdf terminal all outputs are much better.  

