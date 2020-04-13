using HTTP, JSON, Gnuplot, DataFrames, ColorSchemes, Colors
# getting data
data = HTTP.download("https://vega.github.io/vega-datasets/data/gapminder.json")
data = JSON.parse(String(read(data)));
cols = reduce(∩, keys.(data));
df = DataFrame((Symbol(c)=>getindex.(data, c) for c ∈ cols)...)
# selecting and plotting
byCat = df.country
categ = unique(byCat)
# aesthetics
@gp xlab ="Sepal Length" ylab = "Sepal Width" "set auto fix" :-
@gp :- title = "Iris dataset" :-
@gp :- "set offsets graph .05, graph .05, graph .05, graph .05" :-
@gp :- "set key off" :-
# the actual plot
cmap = get(colorschemes[:plasma], LinRange(0,1,length(categ)))
for (i,c) in enumerate(categ)
    indc = findall(x->x == c, byCat)
    x, y, size = df.year[indc], df.life_expect[indc], df.pop[indc]
    @gp :- x y 3*size./maximum(size)  "w p lc '#E6$(hex(cmap[i]))' pt 7 ps var"
end
save(term ="pdf 5,3", output ="gapminder.pdf")
