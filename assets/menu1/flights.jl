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
#msf = maximum(per_day.flights) # hide
# aesthetics
@gp xlab ="day" ylab = "number of flights" "set auto fix"
@gp :- title = "Flights" :-
@gp :- "set offsets graph .05, graph .05, graph .05, graph .05" :-
@gp :- "set key outside font ',8' title 'destination'" :-
@gp :- "set logscale y 2" yrange = (0.8,700)
cmap = get(colorschemes[:rainbow1], LinRange(0,1,length(categ)))
# the actual plot
Random.seed!(213)
for (i,c) in enumerate(categ)
    indc = findall(x->x == c, byCat)
    x, y = per_day.day[indc], per_day.flights[indc]
    @gp :- x y "w linespoints tit '$(c)' lc '#B3$(hex(cmap[i]))' pt $(rand(5:2:13)) ps 0.5"
    #fsize = 3*per_day.flights[indc]./msf # hide
    #@gp :- x y fsize "w p lc '#E6$(hex(cmap[i]))' pt 7 ps var" # hide
    lx = length(x)
    rlx = rand(1:lx)
    # you don't need this, but it looks nicer and you can follow the points. # hide
    # It might take a while. # hide
    # a clever way to put these labes might be needed. # hide
    @gp :- "set label '$(c)' at $(x[rlx]-0.4),$(y[rlx]) font ',5' front"
end
save(term ="pdf size 4,5", output ="flights_ptslines.pdf")
