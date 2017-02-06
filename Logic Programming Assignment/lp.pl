
% 1 sum-up-numbers-simple(L, N).
# sum-up-numbers-simple(L, N).

# sum-up-numbers-simple(L, N) :- 

list_check(X, 0) :- 
	is_list(X).

is_number(X, 0) :- 
	not(number(X)).

list_sum([], 0).
list_sum([Head | Tail], Sum) :-
	not(number(Head)),
    list_sum(Tail, RestSum),
    Sum is 0 + RestSum.

