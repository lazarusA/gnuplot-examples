@def title = "3d plots"
@def hascode = true
@def rss = "3d plots... ![](https://upload.wikimedia.org/wikipedia/en/b/b0/Rick_and_Morty_characters.jpg)"
@def rss_title = "More goodies"
@def rss_pubdate = Date(2019, 5, 1)

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

## Heat map
A heat map from data or a matrix can be easily plotted as
\input{julia}{/assets/menu2/ex3d_5.jl}
\fig{plt3d_ex5}

or real data with a custom colormap

\input{julia}{/assets/menu2/ex3d_6.jl}

\fig{plt3d_ex6}

to be continued...




