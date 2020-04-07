using Gnuplot
Θ = LinRange(0, 2π, 100) # 50
Φ = LinRange(0, π, 100)
r = 0.8
x = [r * cos(θ) * sin(ϕ) for θ in Θ, ϕ in Φ]
y = [r * sin(θ) * sin(ϕ) for θ in Θ, ϕ in Φ]
z = [r * cos(ϕ) for θ in Θ, ϕ in Φ]

@gsp "set pm3d depthorder" :-
@gsp :- "set style fill solid 1.0 noborder"
@gsp :- "set format ''"
@gsp :- "set pm3d lighting primary 0.5 specular 0.6"
@gsp :- "unset key" "set multi layout 2,2 title 'Lighting colors'" :-
@gsp :- 1 x y z "w pm3d" "set xyplane 0" palette(:viridis) :-
@gsp :- 2 x y z "w pm3d" "set xyplane 0" palette(:plasma) :-
@gsp :- 3 x y z "w pm3d" "set xyplane 0" palette(:cool) :-
@gsp :- 4 x y z "w pm3d" "set xyplane 0" palette(:devon)
save(term="pngcairo size 1200,1200", output="sphere4.png") # hide