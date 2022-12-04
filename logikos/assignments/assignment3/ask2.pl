f(X):-
	X < 0, !, Y is 0,
	print(X, Y). 

f(X):-
	X =< 1, X >= 0, !,
	% Y is X δεν χρειαζεται η μεταβλητη Y
	print(X, X). 

f(X):-
	% X > 1, !, δεν χρειαζεται η συγκριση αυτή
	print(X, 1).

print(X, Y):-
	write(X), write(' '), write(Y), nl.


main:-
	write('Dose to X: '),
    read(X),
	f(X).
