
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1 sum-up-numbers-simple(L, N).

% Pseudo-code
% Check if the list is empty: return 0
% Check if the element is a number or not
% Check if the element is a list or not

% Return 0 for empty list
sum-up-numbers-simple([], 0).

% If the element is not number then put it as 0 and recurse
sum-up-numbers-simple([Head | Tail], Sum) :-
	not(number(Head)),
    sum-up-numbers-simple(Tail, RestSum),
    Sum is 0 + RestSum.

% If the number is not zero and the element is a list, put it as 0
sum-up-numbers-simple([Head | Tail], Sum) :- 
	number(Head),
	not(is_list(Head)),
	sum-up-numbers-simple(Tail, RestSum), 
	Sum is Head + RestSum.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2 sum-up-numbers-general(L, N).

sum-up-numbers-general([], 0).

sum-up-numbers-general([Head | Tail], Sum) :- 
	not(number(Head)),
	not(is_list(Head)),
	sum-up-numbers-general(Tail, RestSum),
	Sum is 0 + RestSum.

sum-up-numbers-general([Head | Tail], Sum) :- 
	not(number(Head)),
	is_list(Head),
	sum-up-numbers-general(Head, HeadSum),
	sum-up-numbers-general(Tail, TailSum),
	Sum is HeadSum + TailSum.

sum-up-numbers-general([Head | Tail], Sum) :- 
	number(Head),
	not(is_list(Head)),
	sum-up-numbers-general(Tail, RestSum),
	Sum is Head + RestSum.


