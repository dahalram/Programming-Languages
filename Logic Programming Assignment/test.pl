
sum_list2([], 0).

sum_list2([H|T], Sum) :- 
	not(number(H)),
	not(is_list(H)),
	sum_list2(T, Rest),
	Sum is 0 + Rest.

sum_list2([H|T], Sum) :- 
	not(number(H)),
	is_list(H),
	sum_list2(H, Hrest),
	sum_list2(T, Rest),
	Sum is Hrest + Rest.

sum_list2([H|T], Sum) :- 
	number(H),
	not(is_list(H)),
	sum_list2(T, Rest),
	Sum is H + Rest.

