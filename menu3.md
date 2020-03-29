@def title = "feature"
@def hascode = true
@def rss = "3d plots... ![](https://upload.wikimedia.org/wikipedia/en/b/b0/Rick_and_Morty_characters.jpg)"
@def rss_title = "More goodies"
@def rss_pubdate = Date(2019, 5, 1)

\tableofcontents <!-- you can use \toc as well -->

# First example
```julia:./exf_1.jl
using Gnuplot, ColorSchemes, Colors
function gp_palette(colormap=:viridis)
    cmap = get(colorschemes[colormap], LinRange(0,1,256))
    ctmp = "0 '#$(hex(cmap[1]))',"
    for i in 2:256; ctmp = ctmp*"$(i-1) '#$(hex(cmap[i]))'," end;
    "set palette defined("*ctmp[1:end-1]*")"
end

#first plot
ψ1 = ψ2 = LinRange(0, 4π, 100)
function tα_qubit(β, ψ1, ψ2, fα, f)
    term1 = 2 .+ 2 .*β .- cos.(ψ1) .- cos.(ψ2)
    term2 = 2*β*cos.(π*fα) .* cos.(2*π*f .+ π*fα .- ψ1 .- ψ2)
    term1 .- term2
end
tα_qubitarr = [tα_qubit(0.61, i, j, 0.2, 0.1) 
    for i in ψ1, j in ψ2]
#second plot
x = y = -15:0.33:15
fz(x,y) = sin.(sqrt.(x.^2 + y.^2))./sqrt.(x.^2+y.^2)
fxy = [fz(x,y) for x in x, y in y]


@gsp " " :- 

@gsp(ψ1, ψ2, tα_qubitarr, "w pm3d", "set view map", xlabel = "ψ1",
    ylabel = "ψ2", title = "tunnel α_{q}", 
    gp_palette(:viridis), "set size square", "set auto fix",:-) 
@gsp :- "set multiplot layout 1,2 title 'multiplot layout'" :-
@gsp :- 2 xlab="x" ylab="y" :-
@gsp(:-, x, y, fxy, "w l lc palette","unset view", "set key off",
    "set view 65,30",gp_palette(:lajolla),"set size square", 
    "set auto fix", title = "Mexican hat")
save(term="pngcairo size 1200,800", output="pltf_ex1.png") #hide
```
\fig{pltf_ex1}

The code for Interlocking Tori works with the latest dev version of Gnuplot. 
[original code](https://github.com/gcalderone/Gnuplot.jl/blob/master/examples/hidden2.3.jl)
```julia
using Gnuplot
@gsp "set multiplot title 'Interlocking Tori'"
U = LinRange(-pi, pi, 100) # 50
V = LinRange(-pi, pi, 20)
@gsp :- "unset key" "unset xtics" "unset ytics" "unset ztics"
@gsp :- "set border 0" "set view 60, 30, 1.5, 0.9"
@gsp :- "set style fill transparent solid 0.7"

for loop in 1:2
    if loop == 1
        @gsp :- 1 title="PM3D surface\\nno depth sorting"
        @gsp :- "set origin -0.02,0.0"
        @gsp :- "set size 0.55, 0.9"
        @gsp :- palette(:dense)
        @gsp :- "set colorbox vertical user origin 0.005, 0.15 size 0.02, 0.50"
        @gsp :- "set pm3d scansforward" :-  # scansbackward
    else
        @gsp :- 2 title="PM3D surface\\ndepth sorting"
        @gsp :- "set origin 0.40,0.0"
        @gsp :- "set size 0.55, 0.9"
        @gsp :- palette(:plasma)
        @gsp :- "set colorbox vertical user origin 0.9, 0.15 size 0.02, 0.50"
        @gsp :- "set pm3d depthorder"
    end
    x = [cos(u) + .5 * cos(u) * cos(v)      for u in U, v in V]
    y = [sin(u) + .5 * sin(u) * cos(v)      for u in U, v in V]
    z = [.5 * sin(v)                        for u in U, v in V]
    @gsp :-  x y z "w pm3d"

    x = [1 + cos(u) + .5 * cos(u) * cos(v)  for u in U, v in V]
    y = [.5 * sin(v)                        for u in U, v in V]
    z = [sin(u) + .5 * sin(u) * cos(v)      for u in U, v in V]
    @gsp :- x y z "w pm3d"
end
```
- Klein bottle
- Kuen's Surface

```julia
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
# plot
@gsp "set xyplane at -3" "set auto fix" "set grid" :-
@gsp :- x y z tempo "w l notit lc palette" #palette(:plasma)
@gsp :- "set title 'Lorenz attractor'" "set cblabel 'time'" 
@gsp :- xlab = "x" ylab = "y" zlab = "z" 
save(term="pngcairo size 1200,800", output="lorenz.png")
```
Banner code... 
```julia
using Gnuplot

```
