using Gnuplot
Θ = LinRange(0, 2π, 100) # 50
Φ = LinRange(0, π, 20)
r = 0.8
x = [r * cos(θ) * sin(ϕ)      for θ in Θ, ϕ in Φ]
y = [r * sin(θ) * sin(ϕ)      for θ in Θ, ϕ in Φ]
z = [r * cos(ϕ) for θ in Θ, ϕ in Φ]
@gsp "set pm3d depthorder" :-
@gsp :- x y z "w l" "set view equal xyz"
save(term="pngcairo size 600,600", output="sphere1.png") # hide
