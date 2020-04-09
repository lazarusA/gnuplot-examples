using Gnuplot
@gp 2:3 "notit"  xrange = (0,1) yrange =(0,1)
@gp :- "set object 1 circle at 0.5,0.5 size 0.2"
# 4 more circles
x, y, r = [0.2,0.8,0.8,0.2], [0.2,0.2,0.8,0.8], 0.13
color = ["#4063D8","#9558B2","#389826","#CB3C33"]
for c in 1:4
    @gp :- "set obj $(c+1) circle at $(x[c]),$(y[c]) size $(r)" :-
    @gp :- "set obj $(c+1) fc '$(color[c])' lw 0" :-
end
@gp
save(term ="pngcairo size 600,400", output ="circles.png")
