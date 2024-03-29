
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3 min-above-min(L1, L2, N).

% Pseudo-code 
% First get the numbers from L1 and L2
% Then, get the minimum from L2, call it X
% Get values larger than X in L1
% Return the smallest value from L1 greater than X

% Get minimum value from a list
% If empty, return 0, if single element, return that element
get_min([X], X).
get_min([], 0).

get_min([X, Y | Rest], Min) :- 
	!, 
	X < Y,
	get_min([X | Rest], Min).

get_min([X, Y | Rest], Min) :- 
	get_min([Y | Rest], Min).


% Get the numbers from the list 
% If empty list, return empty list 
get_nums([], []).

get_nums([Head | Rest], List) :- 
	not(number(Head)),
	get_nums(Rest, List).

get_nums([Head | Rest], [Head | List]) :- 
	number(Head),
	get_nums(Rest, List).

% Get values larger than a given number (i.e. larger than the minimum from L2)
get_larger([], _, []).

get_larger([Head | Rest], X, List) :- 
	Head =< X,
	get_larger(Rest, X, List).

get_larger([Head | Rest], X, [Head | List]) :- 
	get_larger(Rest, X, List).


min-above-min(L1, L2, N) :- 
	get_nums(L2, Nums2),
	get_min(Nums2, Min2),
	get_nums(L1, Nums1),
	get_larger(Nums1, Min2, Larger),
	get_min(Larger, N1),
	N is N1.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4 common-unique-elements(L1,L2,N). 

% Pseudo-code
% First flatten both the lists so that you get a list of all elements
% Now, for each element in list1, check if it exists in list2
% Remove the duplicates

% Remove the nested and flatten the list 
flatten_list([], []).

flatten_list([Head | Tail], Flat) :-
	flatten_list(Head, Fl1),
	flatten_list(Tail, Fl2),
	append(Fl1, Fl2, Flat).

flatten_list(Head, [Head]).

% Get common elements from the two lists
get_common_elements([], _, []).

get_common_elements([Head | Tail], L2, [Head | Res]) :-
	!,
	member(Head, L2),
	get_common_elements(Tail, L2, Res).

get_common_elements([_|Tail], L2, Res) :-
	get_common_elements(Tail, L2, Res).


% Remove the duplicates from the list

% removing anything from an empty list 
remove_duplicates(_, [], []).

remove_duplicates(X, [X | Tail], Tail1) :- 
	remove_duplicates(X, Tail, Tail1).

remove_duplicates(X, [Head | Tail], [Head | Tail1]) :-
    X \= Head,
    remove_duplicates(X, Tail, Tail1).

set_val([], []).

set_val([Head | Tail], [Head | Tail1]) :- 
	!,
    remove_duplicates(Head, Tail, Tail2),
    set_val(Tail2, Tail1).


% Get the common unique elements
common-unique-elements(L1, L2, N) :-
	flatten_list(L1, List1),
	flatten_list(L2, List2),
	get_common_elements(List1, List2, N1),
	set_val(N1, N).




