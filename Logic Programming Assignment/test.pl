
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


d_n([], []).
d_n([H|R], L) :- 
	not(number(H)),
	d_n(R, L).

d_n([H|R], [H|L]) :- 
	d_n(R, L).


delete_gt([], _, []).

delete_gt([Head|Rest], X, L) :-
  Head > X,
  delete_gt(Rest, X, L).

delete_gt([Head|Rest], X, [Head|L]) :-
  delete_gt(Rest, X, L).


min_above_min(L1, L2, N) :- 
	get_nums(L2, Res2),
	get_min(Res2, Min2),
	get_nums(L1, Res1),
	get_larger(Res1, Min2, Larger),
	get_min(Larger, N).


flatten2([], []) :- !.
flatten2([L|Ls], FlatL) :-
    !,
    flatten2(L, NewL),
    flatten2(Ls, NewLs),
    append(NewL, NewLs, FlatL).
flatten2(L, [L]).

flatten_list([], []).

flatten_list([Head | Tail], Flat) :-
	flatten_list(Head, Fl1),
	flatten_list(Tail, Fl2),
	append(Fl1, Fl2, Flat).
	
flatten_list(Head, [Head]).

