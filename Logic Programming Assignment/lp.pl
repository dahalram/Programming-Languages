
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

% Pseudo-code
% Check if the list is empty
% Check if the element is a number
% Check if the element is a list
% Check if the element is neither a number nor a list
% Add the sum and recurse according to what the element is.

% Return 0 for empty list
sum-up-numbers-general([], 0).

% If the element is not a number and not a list, then return 0
sum-up-numbers-general([Head | Tail], Sum) :- 
	not(number(Head)),
	not(is_list(Head)),
	sum-up-numbers-general(Tail, RestSum),
	Sum is 0 + RestSum.

% If the element is not a number but a list, do a recursion to get the sum from that list element
sum-up-numbers-general([Head | Tail], Sum) :- 
	not(number(Head)),
	is_list(Head),
	sum-up-numbers-general(Head, HeadSum),
	sum-up-numbers-general(Tail, TailSum),
	Sum is HeadSum + TailSum.

% If the element is just a number, add it to the sum
sum-up-numbers-general([Head | Tail], Sum) :- 
	number(Head),
	not(is_list(Head)),
	sum-up-numbers-general(Tail, RestSum),
	Sum is Head + RestSum.


