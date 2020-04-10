using Gnuplot, Colors, ColorSchemes
# function definitions
χ0(xs, Ωs) = (Ωs/π)^(1/4) .* exp.(- Ωs*xs.^2.0./2)
χ1(xs, Ωs) = (4Ωs^3/π)^(1/4) .* xs .* exp.(- Ωs*xs.^2.0./2)
function χn(x; m = 2, t0 = 3, ω₀ = 0.57, Eα0 = -0.9)
    nr = m - 1
    T0 = 41.34*t0
    Ωs = T0^2/(4*log(2))
    x₀ = Eα0 .+ 2ω₀
    xs = (x .- x₀)
    a, b = χ1(xs, Ωs), χ0(xs, Ωs)
    if m<0
        return println("m must be greater than zero")
    elseif m==0
        return b
    elseif  m==1
        return a
    else
        for n in 1:nr
            a, b = √(2Ωs/(n+1)) .* xs .* a .-  √(n/(n+1)) .* b, a
        end
    end
    return a
end
# actual code for plotting...
bgcp1 = "set object rectangle from screen 0,0 to screen 1,1"
bgcp2 = " behind fillcolor rgb '#212946' fillstyle solid noborder"
bgcolor = bgcp1*bgcp2
x = LinRange(0,1,1000)
cmap = get(colorschemes[:matter], LinRange(0,1,30))
@gp(x, χn(x; ω₀ = 0.77), "w l lc '#$(hex(cmap[1]))'",
    "set key off", "set xrange [0.4:0.74]", bgcolor,
    "unset ytics; unset xtics; unset border")
for n in 0:15
    @gp :- x χn(x; m = n, ω₀ = 0.77)  "w l lw 0.5 lc '#$(hex(cmap[n+2]))'" :-
    # glow effect
    if n<7
        for i  in 1:8-n
            @gp :- x χn(x; m = n, ω₀ = 0.77) "w l lw $(0.5 + 1.05*i) lc '#F5$(hex(cmap[n+2]))' t ''"
            @gp :- x χn(x; m = n, ω₀ = 0.77) "w l lw $(0.5 + 1.05*i) lc '#F5$(hex(cmap[n+2]))' t ''" :-
        end
    else
        for i  in 1:3
            @gp :- x χn(x; m = n, ω₀ = 0.77) "w l lw $(0.5 + 1.05*i) lc '#F5$(hex(cmap[n+2]))' t ''"
            @gp :- x χn(x; m = n, ω₀ = 0.77) "w l lw $(0.5 + 1.05*i) lc '#F5$(hex(cmap[n+2]))' t ''" :-
        end

    end
end
@gp
save(term="pngcairo size 1200,400", output="bannerGlow.png")
#save(term="pdf size 7,1.8", output="bannerGlow.pdf") # hide
