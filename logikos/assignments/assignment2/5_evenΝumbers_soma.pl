evenNumbers(L1, L2):-
    evenNumbers_1(L1, L2, []). 

evenNumbers_1([], L2, L3):-
    L2 = L3.

evenNumbers_1([H1|T1], L2, L3):-
    (H1 mod 2) =:= 0,           % if H1 is even
    append(L3, [H1], L4),       % append H1 to L3
    evenNumbers_1(T1, L2, L4).  % continue with T1

evenNumbers_1([H1|T1], L2, L3):-
    (H1 mod 2) =:= 1,           % if H1 is odd
    evenNumbers_1(T1, L2, L3).  % continue with T1

/*

evenNumbers([2,1,-3,6,8,9], L2).
->
L2 = [2,6,8].

*/