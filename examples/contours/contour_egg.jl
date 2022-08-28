using Gnuplot#hide
Gnuplot.quitall()#hide
mkpath("assets")#hide
Gnuplot.options.term = "unknown"#hide
empty!(Gnuplot.options.init)#hide
push!( Gnuplot.options.init, linetypes(:Set1_5, lw=1.5, ps=1.5))#hide
saveas(file) = save(term="svg size 550,350 fontscale 0.8", output="assets/$(file).svg")#hide

using Gnuplot, Random
Random.seed!(123)
let
    x = -1:0.05:1
    y = -1.5:0.05:2
    egg(x,y) = x^2 + y^2/(1.4 + y/5)^2
    segg = [egg(x,y) for x in x, y in y]
    @gsp x y segg "w l lc palette" palette(:thermal; rev= true) "set view map"
    @gsp :- "set contour base;set key off" "set auto fix"
    @gsp :- "set cntrparam levels incremental  0,0.01,1" "unset surface"
    @gsp :- xrange = (-1.2,1.2) yrange = (-1.5,2) cbrange =(0,1)
    @gsp :- xlab = "x" ylab = "y" "set size ratio -1"
    saveas("contour002") # hide
end

# ![](assets/contour002.svg)