# This file was generated, do not modify it. # hide
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