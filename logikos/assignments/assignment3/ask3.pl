mkd(X, Y, Z):-
	X =:= Y, !, Z is X.

mkd(X, Y, Z):-
    X < Y, !, mkd(X, Y-X, Z).

mkd(X, Y, Z):-
    mkd(X - Y, Y, Z).

/*

    mkd(15, 15, Z).
    mkd(50, 15, Z).
    mkd(15, 50, Z).

*/