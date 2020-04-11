@def title = "feature"
@def hascode = true


\tableofcontents <!-- you can use \toc as well -->

## Mixed 2D and 3D plots 
\input{julia}{/assets/menu3/exf_1.jl}
\fig{pltf_ex1}

The code for Interlocking Tori works with the latest dev version of Gnuplot. 
[original code](https://github.com/gcalderone/Gnuplot.jl/blob/master/examples/hidden2.3.jl)

## depth sorting
\input{julia}{/assets/menu3/tori.jl}
\fig{tori}

## Banner code 
\input{julia}{/assets/menu3/bannerGlow.jl}
\fig{bannerGlow}
## Animations 
A basic animation can be coded as follows 
\input{julia}{/assets/menu3/basicAnim.jl}
\fig{basicAnim}

If you want to save an animation with a better quality this can be done as follows:
\input{julia}{/assets/menu3/advancedAnim.jl}
\fig{advancedAnim}

A more efficient way to do an animation is shown with the Lorenz attractor
\input{julia}{/assets/menu3/lorenzAnim.jl}
\fig{lorenzAnim}

\input{julia}{/assets/menu3/archimedean.jl}
\fig{archimedean}
