```@meta
EditURL = "../../../examples/2d/filledcu/glow.jl"
```

````@example glow
using Gnuplot
Gnuplot.quitall()#hide
Gnuplot.options.term = "unknown"#hide
empty!(Gnuplot.options.init)
push!( Gnuplot.options.init, linetypes(:Set1_5, lw=1.5, ps=1.5))
function saveas(file; sx=550, sy=350, fs=0.8, term="svg")
    Gnuplot.save(term="$(term) size $(sx),$(sy) fontscale $(fs)", "$(file).svg")
end;
nothing #hide
````

## Filled Between curves: glow effect

````@example glow
x = 0:0.3:4
a = exp.(- x)
b =  exp.(- x.^2)
# theme
function gp_theme(bgcolor = "#212946"; borderc ="white",
        ticsc = "white", ylabc = "white", gridst = 4,
        xlabc = "white", gridc = "#2A3459", labc = "white")
    bgcp1 = "set object rectangle from screen 0,0 to screen 1,1"
    bgcp2 = " behind fc '$(bgcolor)' fs solid noborder"
    bgcolor = bgcp1*bgcp2
    @gp :- "set border lw 1 lc '$(borderc)'"
    @gp :- "set tics textcolor rgb '$(ticsc)'"
    @gp :- bgcolor
    @gp :- "set ylabel 'y' textcolor '$(ylabc)'"
    @gp :- "set xlabel 'x' textcolor '$(xlabc)'"
    @gp :- "set grid ls 1 lc '$(gridc)' dt $(gridst)"
    @gp :- "set key t r textcolor '$(labc)'"
end

# plot
@gp x a "w linespoints lw 1 lc '#08F7FE' pt 7 t 'e^{-x}'"
@gp :- x b "w linespoints lw 1 lc '#FFE64D' pt 7 t 'e^{-x^2}'"
# glow effect
for i  in 1:10
    @gp :- x a "w l lw $(1 + 1.05*i) lc '#F508F7FE' t ''"
    @gp :- x b "w l lw $(1 + 1.05*i) lc '#F5FFE64D' t ''" :-
end
# fill between
@gp(:-,x, a, "w filledcu y=0 lw 1 lc '#08F7FE' t ''",
    "set style fill transparent solid 0.08 noborder")
@gp(:-, x, a, b, "w filledcu lw 1 lc '#FFE64D' t ''")
gp_theme("black")
saveas("filled003");
nothing #hide
````

![](filled003.svg)

