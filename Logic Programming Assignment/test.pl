
min([X], X).
min([], 0).

min([X, Y | R], Min) :-
    X < Y,
    min([X | R], Min).

min([X, Y | R], Min) :-
   min([Y | R], Min).


get_min([X], X).

get_min([X, Y | Rest], Min) :- 
	X < Y,
	get_min([X | Rest], Min).

get_min([X, Y | Rest], Min) :- 
	get_min([Y | Rest], Min).


delete_gt([], _, []).

delete_gt([Head|Rest], X, L) :-
  Head > X,
  delete_gt(Rest, X, L).

delete_gt([Head|Rest], X, [Head|L]) :-
  delete_gt(Rest, X, L).

d_n([], []).
d_n([H|R], L) :- 
	not(number(H)),
	d_n(R, L).

d_n([H|R], [H|L]) :- 
	d_n(R, L).



