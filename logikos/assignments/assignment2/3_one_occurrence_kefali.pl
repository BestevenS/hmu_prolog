% void list
one_occurrence([], []).

% if the head of the list is not in the tail, add it to the result
one_occurrence([H|T], [H|T1]):-
    \+ member(H, T),        % if the head is not in the tail
    one_occurrence(T, T1).  % continue with the tail

% if the head of the list is in the tail, skip it
one_occurrence([H|T], T1):-
    member(H, T),           % if the head is in the tail
    one_occurrence(T, T1).  % continue with the tail

/*

one_occurrence([a, b, a, a, b, c, d, c], L).
->  
L = [a, b, c, d].

&

one_occurrence([a, b, a, a, b, c, d, c], [a, b, c, d]).
->
yes.

*/