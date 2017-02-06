
list_check(X, 0) :- 
	is_list(X).

is_number(X, 0) :- 
	not(number(X)).

%ret_val(X, X) :- 


sum_list([], 0).

sum_list([H|T], Sum) :- 
	not(number(H)),
	sum_list(T, Rest),
	Sum is 0 + Rest.

sum_list([H|T], Sum) :-
	number(H),
	not(is_list(H)),
	sum_list(T, Rest),
	Sum is H + Rest.

% check_val([], 0).
% check_val()