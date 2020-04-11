using Gnuplot
x = y = -15:0.33:15
fz(x,y) = sin.(sqrt.(x.^2 + y.^2))./sqrt.(x.^2+y.^2)
fxy = [fz(x,y) for x in x, y in y]


@gsp(x, y, fxy, "w pm3d", "set ylabel 'y' textcolor rgb 'red'",
     "set xlabel 'x' textcolor rgb 'blue'", "set key off")

# Draw contours using the same palette as the surface plot
z = -2.5  # z coordinate at which contours are drawn
@gsp :- "set cbrange [$(minimum(fxy)):$(maximum(fxy))]"
@gsp :- "set xyplane 0"
levels = contourlines(x, y, fxy)
for i in 1:length(levels)
    @gsp :- levels[i].data "u 1:2:($z):($(levels[i].z)) w l notit lc pal" :-
end
@gsp
