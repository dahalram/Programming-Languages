
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


inter([], _, []).

inter([H1|T1], L2, [H1|Res]) :-
    member(H1, L2),
    inter(T1, L2, Res).

inter([_|T1], L2, Res) :-
    inter(T1, L2, Res).

test(X):-
        inter([1,3,5,2,4], [6,1,2], X), !.

flatten_list([], []).

flatten_list([Head | Tail], Flat) :-
	flatten_list(Head, Fl1),
	flatten_list(Tail, Fl2),
	append(Fl1, Fl2, Flat).

flatten_list(Head, [Head]).

get_common_elements([], _, []).

get_common_elements([Head | Tail], L2, [Head | Res]) :-
	member(Head, L2),
	get_common_elements(Tail, L2, Res).

get_common_elements([_|Tail], L2, Res) :-
	get_common_elements(Tail, L2, Res).


common-unique-elements(L1, L2, N) :-
	flatten_list(L1, List1),
	flatten_list(L2, List2),
	get_common_elements(List1, List2, N).




set_val([], []).

% removing anything from an empty list 
remove_duplicates(_, [], []).

remove_duplicates(X, [X | Tail], Tail1) :- 
	remove_duplicates(X, Tail, Tail1).

remove_duplicates(X, [Head | Tail], [Head | Tail1]) :-
    X \= Head,
    remove_duplicates(X, Tail, Tail1).


set_val([Head | Tail], [Head | Tail1]) :- 
    remove_duplicates(Head, Tail, Tail2),
    set_val(Tail2, Tail1).

