
% 1 sum-up-numbers-simple(L, N).
# sum-up-numbers-simple(L, N).

# sum-up-numbers-simple(L, N) :- 

is_number(X, 0) :- 
	not(number(X)).

list_sum([], 0).
list_sum([Head | Tail], Sum) :-
    list_sum(Tail, RestSum),
    Sum is Head + RestSum.

