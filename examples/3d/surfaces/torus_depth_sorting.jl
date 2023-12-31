using Gnuplot#hide
Gnuplot.quitall()#hide
mkpath("assets")#hide
Gnuplot.options.term = "unknown"#hide
empty!(Gnuplot.options.init)#hide
push!( Gnuplot.options.init, linetypes(:Set1_5, lw=1.5, ps=1.5))#hide
saveas(file) = Gnuplot.save(term="svg size 550,350 fontscale 0.8", "assets/$(file).svg")#hide

using Gnuplot
let
    @gsp "set multiplot title 'Interlocking Tori'"
    U = LinRange(-pi, pi, 100)
    V = LinRange(-pi, pi, 20)
    @gsp :- "unset key" "unset xtics" "unset ytics" "unset ztics"
    @gsp :- "set border 0" "set view 60, 30, 1.5, 0.9"
    @gsp :- "set style fill transparent solid 0.7"

    for loop in 1:2
        if loop == 1
            @gsp :- 1 title="PM3D surface\\nno depth sorting"
            @gsp :- "set origin -0.02,0.0"
            @gsp :- "set size 0.55, 0.9"
            @gsp :- palette(:dense)
            @gsp :- "set colorbox vertical user origin 0.005, 0.15 size 0.02, 0.50"
            @gsp :- "set pm3d scansforward" :-  ## scansbackward
        else
            @gsp :- 2 title="PM3D surface\\ndepth sorting"
            @gsp :- "set origin 0.40,0.0"
            @gsp :- "set size 0.55, 0.9"
            @gsp :- palette(:plasma)
            @gsp :- "set colorbox vertical user origin 0.9, 0.15 size 0.02, 0.50"
            @gsp :- "set pm3d depthorder"
        end
        x = [cos(u) + .5 * cos(u) * cos(v)      for u in U, v in V]
        y = [sin(u) + .5 * sin(u) * cos(v)      for u in U, v in V]
        z = [.5 * sin(v)                        for u in U, v in V]
        @gsp :-  x' y' z' "w pm3d"

        x = [1 + cos(u) + .5 * cos(u) * cos(v)  for u in U, v in V]
        y = [.5 * sin(v)                        for u in U, v in V]
        z = [sin(u) + .5 * sin(u) * cos(v)      for u in U, v in V]
        @gsp :- x' y' z' "w pm3d"
    end
    saveas("surface005") # hide
end

# ![](assets/surface005.svg)