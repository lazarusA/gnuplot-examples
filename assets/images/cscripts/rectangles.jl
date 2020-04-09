using Gnuplot
@gp 2:3 "notit"  xrange = (0,1) yrange =(0,1)
@gp :- "set obj 1 rect from 0.31,0.31 to 0.5,0.5 fc lt 1"
@gp :- "set obj 2 rect from 0.1,0.1 to 0.3,0.3 fc 'red'"
@gp :- "set obj 3 rect from 0.5,0.2 to 0.65,0.3 fs empty border rgb 'blue'"
@gp :- "set obj 4 rect at 0.6,0.62 size 0.3,0.2 fc 'orange'"
@gp :- "set obj 5 rect at 0.5,0.85 size 0.7,0.2 fc 'black'"
@gp :- "set obj 5 fill transparent solid 0.2"
save(term ="pngcairo size 600,400", output ="rectangles.png")
