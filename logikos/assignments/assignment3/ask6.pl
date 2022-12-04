likes(yannis,X):-
	course(X), teaches(yannis,X).

likes(anna,X):-
    teaches(yannis,X),
    \+ X = geometry.

likes(anna, physics).

teaches(yannis,algebra).
teaches(yannis,geometry).
teaches(yannis,logic).

course(physics).
course(chemistry).
course(geometry).
course(algebra).
course(logic).