using Gnuplot
function ngonShape(h, k, r, n)
    x = [h .+ r*sin.(m*2π/n) for m in 1:n]
    y = [k .+ r*cos.(m*2π/n) for m in 1:n]
    x, y
end
function strpolygon(x, y)
    pt0 = "$(x[1]),$(y[1]) to"
    for p in 2:length(x)
       pt0=pt0*" $(x[p]),$(y[p]) to"
    end
    pt0[1:end-3]
end
#rectangle with filledcu
x1 = [-0.5,0.5,0.5,-0.5]
y1 = [0.55,0.55,3.45,3.45]
@gp x1 y1 "w filledcu notit lc 'grey'" yrange=(0.5,3.5) xrange=(-0.7,6.5)
@gp :- "set style fill transparent solid 0.5" "set size ratio -1"
#polygon from gnuplot
c = 1
for i in 1:6, j in 1:3
    global c
    x, y = ngonShape(i, j, 0.45, 2 + c)
    @gp :- "set obj $(c) polygon from $(strpolygon(x, y))" :-
    @gp :- "set obj $(c) fc lt $(c) fill transparent solid 0.3" :-
    @gp :- "set label font ',12' '$(2+c)' at $(i-0.05), $(j)" :-
    c += 1
end
@gp
save(term ="pngcairo size 600,400", output ="polygons.png")
