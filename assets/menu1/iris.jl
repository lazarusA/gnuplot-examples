using Gnuplot, RDatasets
dset = dataset("datasets", "iris")
byCat = dset.Species
categ = unique(byCat)
# aesthetics
@gp linetypes(:tab10) :-
@gp :- xlab ="Sepal Length" ylab = "Sepal Width" "set auto fix"
@gp :- title = "Iris dataset" :-
@gp :- "set offsets graph .05, graph .05, graph .05, graph .05" :-
@gp :- "set key b r font ',12' tit 'Species' box" :-
# the actual plot
for c in categ
    indc = findall(x->x == c, byCat)
    @gp :-  dset.SepalLength[indc] dset.SepalWidth[indc]  "w p tit '$(c)' pt 7 ps 1.4 "
end
save(term ="pngcairo size 600,400", output ="Categorical_iris.png")
