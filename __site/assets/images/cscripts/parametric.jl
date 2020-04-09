using Gnuplot
t = -3.1:0.01:3.1
u = 16*sin.(t).^3
v = 13*cos.(t) .- 5*cos.(2t) .- 2*cos.(3t) .- cos.(4t)
@gp xlab = "u" ylab = "v" :-
@gp :- u v "w filledcu tit 'heart' lc 'black'" "set size square"
@gp :- "set style fill transparent solid 0.8"
save(term = "pngcairo size 600,400", output = "heart.png")
