using Gnuplot
# archimedean spiral
a, m, z₀ = 1, 2.1, 0
φ = LinRange(0,20π,500)
r = a*φ
x, y, z = r .* cos.(φ), r .* sin.(φ), m .* r .+ z₀
function theme(bgcolor = "#212946"; borderc ="white",
        ticsc = "white", ylabc = "white", gridst = 4,
        xlabc = "white", gridc = "#2A3459", labc = "white")
    bgcp1 = "set object rectangle from screen 0,0 to screen 1,1"
    bgcp2 = " behind fc '$(bgcolor)' fs solid noborder"
    bgcolor = bgcp1*bgcp2
    @gp :- "set border lw 1 lc '$(borderc)'"
    @gp :- "set tics textcolor rgb '$(ticsc)'"
    @gp :- bgcolor
    @gp :- "set ylabel textcolor '$(ylabc)'"
    @gp :- "set xlabel textcolor '$(xlabc)'"
    @gp :- "set grid ls 1 lc '$(gridc)' dt $(gridst)"
    @gp :- "set key t r textcolor '$(labc)'"
end


@gsp "set xyplane 0" "set view equal xyz" "set auto fix" :-
theme("black")
@gsp :- xlab = "x" ylab = "y"
@gsp :- xr=extrema(x) yr=extrema(y) zr=extrema(z)
@gsp :- "i=2"
# line and point
@gsp :- x y z "every ::1::i w l notit lc palette" palette(:Wistia)
@gsp :- x y z "every ::i::i w points notit lc 'red'"
@gsp :- x y 0*z z "every ::1::i w l notit lc palette lt 2"
# animation
for frame in 2:5:length(x)
  @gsp :- frame "i=$frame" "replot" :-
end
@gsp # show animation
save(term="gif animate size 900,600 delay 1", output="archimedean.gif") # hide
