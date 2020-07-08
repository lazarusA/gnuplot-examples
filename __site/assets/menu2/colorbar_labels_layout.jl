using Gnuplot, Random
Random.seed!(123)
test = rand(50,50)
@gp "set multiplot layout 1,2"
# on top
@gp :- 1 "set auto fix" "set size square" :-
@gp :- test "w image notit"  """set cblabel "CBTitle \\n (my unit)" """ :-
@gp :- "set cblabel offset -6.5, 10 font ',8' textcolor lt 3 rotate by 0" :-
@gp :- "set tmargin at screen 0.85" :-
# on the side
@gp :- 2 "set auto fix" "set size square" :-
@gp :- test "w image notit"  """set cblabel "CBTitle (my unit)" """
@gp :- "set cblabel offset 0, 0 font ',8' textcolor lt 4 rotate by 90" :-
@gp :- palette(:viridis) :-
@gp :- "set rmargin at screen 0.9"
save(term = "pngcairo size 800,400", output = "colorbar_labels_layout.png")
