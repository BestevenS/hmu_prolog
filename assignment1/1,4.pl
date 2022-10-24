pateras(kostas,anna).
pateras(kostas,aris).
antras(kostas,soula).
filo_aren(kostas).
filo_aren(aris).
filo_thiliko(soula).
filo_thiliko(anna).

/*if antras(X,Y) then ginaika(Y,X);
if pateras(X,Y) then paidi(Y,X);
if pateras(X,Y) and ginaika(Z,X)then mitera(Z,Y);
if mitera(X,Y) then paidi(Y,X);
if pateras(X,Y) and pateras(X,Z)and filo_aren(Y) and \+(Y==Z)then adelfos(Y,Z);
if mitera(X,Y) and mitera(X,Z) and filo_aren(Y) and \+(Y==Z)then adelfos(Y,Z);
if pateras(X,Y) and pateras(X,Z) and filo_thiliko(Y) and \+(Y==Z) then adelfi(Y,Z);
if mitera((X,Y) and mitera (X,Z) and filo_thiliko(Y) and \+(Y==Z) then adelfi(Y,Z);*/


ginaika(X,Y):-
    antras(Y,X).

paidi(Y,X):-
    pateras(X,Y).

mitera(Z,Y):-
    pateras(X,Y),
    ginaika(Z,X).

paidi(Y,X):-
    mitera(X,Y).

adelfos(Y,Z):-
    pateras(X,Y),
    pateras(X,Z),
    filo_aren(Y),
    \+(Y==Z).

adelfos(Y,Z):-
    mitera(X,Y),
    mitera(X,Z),
    filo_aren(Y),
    \+(Y==Z).

adelfi(Y,Z):-
    pateras(X,Y),
    pateras(X,Z),
    filo_thiliko(Y),
    \+(Y==Z).

adelfi(Y,Z):-
    mitera(X,Z),
    mitera(X,Y),
    filo_thiliko(Y),
    \+(Y==Z).


%STOXOI
/*
mitera(X,Y).
pateras(X,Y).
ginaika(X,Y).
adelfos(X,Y).
adelfi(X,Y).
mitera(X,anna).
pateras(X,aris).
ginaika(X,kostas).
adelfos(X,anna).
adelfi(X,aris).
*/