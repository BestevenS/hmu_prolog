evenNumbers([], []).

evenNumbers([H1|T1], L2):-
    (H1 mod 2) =:= 0,   % if H1 is even
    evenNumbers(T1, T2),% call evenNumbers on the tail of the list
    L2 = [H1|T2].       % add H1 to the front of the list

evenNumbers([H1|T1], L2):-
    (H1 mod 2) =:= 1,   % if H1 is odd
    evenNumbers(T1, L2).% call evenNumbers on the tail of the list

/*

evenNumbers([2,1,-3,6,8,9], L2).
->
L2 = [2,6,8].

*/