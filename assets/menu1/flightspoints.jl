using HTTP, CSV, DataFrames, Gnuplot, Random
using ColorSchemes, Colors, DataFramesMeta
url = "https://raw.githubusercontent.com/alstat/Julia-Data-Query/master/data-raw/flights.csv"
data = HTTP.download(url)
flights = CSV.read(data)
# @df flights plot(:Day, :NumFlights, group=:City)
#this is all the help you need
daily = groupby(flights, [:day, :dest]) # :origin, only 3 (boring)
per_day = @based_on(daily, flights = length(:day))
byCat = per_day.dest
categ = unique(byCat)
#some color
cmap = get(colorschemes[:plasma], LinRange(0,1,length(categ)))
# aesthetics
@gp xlab ="day" ylab = "number of flights" "set auto fix"
@gp :- title = "Flights" :-
@gp :- "set offsets graph .05, graph .05, graph .05, graph .05" :-
@gp :- "set key outside font ',8' title 'destination'" :-
@gp :- "set logscale y 2" yrange = (0.8,700)
# the actual plot
Random.seed!(213)
for (i,c) in enumerate(categ)
    indc = findall(x->x == c, byCat)
    x, y = per_day.day[indc], per_day.flights[indc]
    @gp :- x y "w p tit '$(c)' lc '#B3$(hex(cmap[i]))' pt $(rand(5:2:13)) ps 0.5"
end
save(term ="pdf size 4,5", output ="flights_points.pdf")
