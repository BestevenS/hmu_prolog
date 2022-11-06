
one_occurrence(L1, L2):-
    one_occurrence_1(L1, L2, []).

one_occurrence_1([], L2, L3):-
    L2 = L3.

one_occurrence_1([H1|T1], L2, L3):-
    \+ member(H1, L3),      % H1 is not in L3
    append(L3, [H1], L4),   % L4 is L3 with H1 appended
    one_occurrence_1(T1, L2, L4).

one_occurrence_1([H1|T1], L2, L3):-
    member(H1, L3),                 % H1 is in L3
    one_occurrence_1(T1, L2, L3).   % L3 is not changed

/*

one_occurrence([a, b, a, a, b, c, d, c], L).
->  
L = [a, b, c, d].

&

one_occurrence([a, b, a, a, b, c, d, c], [a, b, c, d]).
->
yes.

*/