
list_check(X, 0) :- 
	is_list(X).

is_number(X, 0) :- 
	not(number(X)).

sum_list([], 0).
sum_list([H|T], Sum) :-
	sum_list(T, Rest),
	not(is_list(H)),
	is_number(H, 0),
	Sum is H + Rest.

% check_val([], 0).
% check_val()