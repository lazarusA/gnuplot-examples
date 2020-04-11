using Gnuplot, ColorSchemes
#first plot
ψ1 = ψ2 = LinRange(0, 4π, 100)
function tα_qubit(β, ψ1, ψ2, fα, f)
    term1 = 2 .+ 2 .*β .- cos.(ψ1) .- cos.(ψ2)
    term2 = 2*β*cos.(π*fα) .* cos.(2*π*f .+ π*fα .- ψ1 .- ψ2)
    
    term1 .- term2
end
zq = [tα_qubit(0.61, i, j, 0.2, 0.1) for i in ψ1, j in ψ2]

@gsp xlabel = "ψ1" ylabel = "ψ2" title = "tunnel α_{q}" :-
@gsp :- "set size square" "set auto fix" :-
@gsp :- ψ1 ψ2 zq "w pm3d notit" palette(:thermal)
@gsp :- "set cbrange [$(minimum(zq)):$(maximum(zq))]"
@gsp :- "set xyplane 0"
levels = contourlines(ψ1, ψ2, zq, cntrparam="levels 30")
zp = -8
for i in 1:length(levels)
    @gsp :- levels[i].data "u 1:2:($zp):($(levels[i].z)) w l notit lc pal" :-
end
@gsp
