
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
list_sum([], P).
list_sum([100, 200], P).
list_sum([a, b, c], P).
list_sum([100, a], P).
list_sum([a, 100], P).
list_sum([a, 100, b, 200, c, 300, d], P).
list_sum([[]], P).
list_sum([[100]], P).
list_sum([100, [200]], P).
list_sum([a, 100, b, [200], c, 300, d], P).