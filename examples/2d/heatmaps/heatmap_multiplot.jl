using Gnuplot
Gnuplot.quitall()#hide
Gnuplot.options.term = "unknown"#hide
empty!(Gnuplot.options.init)
push!( Gnuplot.options.init, linetypes(:Set1_5, lw=1.5, ps=1.5))
function saveas(file; sx=550, sy=350, fs=0.8, term="svg")
    Gnuplot.save(term="$(term) size $(sx),$(sy) fontscale $(fs)", "$(file).svg")
end;
# ## Heatmaps: multiplots

using Random
Random.seed!(123)
test = rand(50,50)
@gp "set multiplot layout 1,2"
## on top
@gp :- 1 "set auto fix" "set size square" :-
@gp :- test "w image pixels notit"  """set cblabel "CBTitle \\n (my unit)" """ :-
@gp :- "set cblabel offset -6.5, 10 font ',8' textcolor lt 3 rotate by 0" :-
@gp :- "set tmargin at screen 0.8" :-
## on the side
@gp :- 2 "set auto fix" "set size square" :-
@gp :- test "w image pixels notit"  """set cblabel "CBTitle (my unit)" """
@gp :- "set cblabel offset 0, 0 font ',8' textcolor lt 4 rotate by 90" :-
@gp :- palette(:viridis) :-
@gp :- "set rmargin at screen 0.85"
saveas("heatmap005");

# ![](heatmap005.svg)