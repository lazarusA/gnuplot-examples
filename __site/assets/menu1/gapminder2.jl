using CSV, Gnuplot, DataFrames, ColorSchemes
# https://vega.github.io/vega-lite/examples/circle_bubble_health_income.html
#https://vega.github.io/vega-datasets/
#link = "https://vega.github.io/vega-datasets/data/gapminder-health-income.cvs"
# load file
data = CSV.read("gapminder-health-income.csv")
# selecting and plotting
x, y, popsize = data.income, data.health, data.population
mxs = maximum(popsize)
#
# aesthetics
@gp xlab ="income" ylab = "health" "set auto fix" :-
@gp :- title = "gapminder" :-
@gp :- "set offsets graph .1, graph .1, graph .1, graph .1" :-
@gp :- "set key off"
# the actual plot
@gp :- palette(:viridis)
@gp :- x y 2*(popsize./mxs).^(0.4) popsize./1e6 "w p pt 7 ps var lc pal z notit"
@gp :- "set logscale x" "set cblabel 'population x million'"
@gp :- "set logscale cb"
for i in 1:length(x)
    if data.population[i] > 2.5e8
        @gp :- "set label '$(data.country[i])' at $(x[i]),$(y[i]-1) font ',11' front"
    end
end
save(term ="pdf size 5,3", output ="gapminder2.pdf")
