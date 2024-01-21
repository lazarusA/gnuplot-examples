using Gnuplot
Gnuplot.quitall()#hide
Gnuplot.options.term = "unknown"#hide
empty!(Gnuplot.options.init)
push!( Gnuplot.options.init, linetypes(:Set1_5, lw=1.5, ps=1.5))
function saveas(file; sx=550, sy=350, fs=0.8, term="svg")
    Gnuplot.save(term="$(term) size $(sx),$(sy) fontscale $(fs)", "$(file).svg")
end;

# ## Lines: line styles

x = -2π:0.001:2π
linCol = ["#000000", "#E69F00", "#56B4E9", "#009E73","#F0E442"]
@gp x cos.(x) "w l t 'dt 1' lw 2 dt 1 lc '$(linCol[1])'"
@gp :- "set grid" "set auto fix"
@gp :- "set offsets graph .05, graph .05, graph .05, graph .05"
@gp :- ylabel="Y label" xlab="X label"
@gp :- "set key b r font ',10' title 'dashtype' opaque"
for (idx,ϕ) in enumerate(0.3:0.3:1.3)
    @gp :- x cos.(x .+ 2ϕ) "w l t 'dt $(idx+1)' lw 2 dt $(idx+1) lc '$(linCol[idx+1])'"
end
saveas("lines004");

# ![](lines004.svg)