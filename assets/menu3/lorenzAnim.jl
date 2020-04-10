using Gnuplot, LinearAlgebra
using ParameterizedFunctions, DifferentialEquations
g = @ode_def begin
  dx = σ*(y - x)
  dy = x*(ρ - z) - y
  dz = x*y - β*z
end σ ρ β
u0 = [1.0; 0.0; 0.0]
tspan = (0.0, 80.0)
p = [10.0,28.0,8/3]
prob = ODEProblem(g, u0, tspan, p)
sol = solve(prob, Tsit5(), saveat = 0.01)
x, y, z = sol[1,:], sol[2,:], sol[3,:]
tempo = sol.t

@gsp "set xyplane at -3" "set auto fix" "set grid" :-
@gsp :- "set title 'Lorenz attractor'" "set cblabel 'time'"
@gsp :- xlab = "x" ylab = "y"
@gsp :- xr=extrema(x) yr=extrema(y) zr=extrema(z)
# animation
@gsp :- "i=2"
@gsp :- x y z tempo "every ::1::i w l notit lc palette" :-
for frame in 2:40:length(x)
  @gsp :- frame "i=$frame" "replot" :-
end
@gsp # display animation
save(term="gif animate size 1000,800 delay 1", output="lorenzAnim.gif")
