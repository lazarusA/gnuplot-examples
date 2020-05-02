using Gnuplot, ColorSchemes
@gp key="left" linetypes(:seaborn_colorblind, dashed=true, ps=2)
for i in 1:10
    @gp :- i .* (0:10) "w lp t '$i'"
end
save(term ="pngcairo size 600,400", output ="./code/lineSmarkers.png") # hide
