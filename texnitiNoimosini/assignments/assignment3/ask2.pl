det([the|X]-X).
det([a|X]-X).
det([τίποτα|X]-X).

n([dog|X]-X).
n([cat|X]-X).
n([boy|X]-X).
n([girl|X]-X).

v([chased|X]-X).
v([saw|X]-X).
v([said|X]-X).
v([believed|X]-X).

np(IP1-OP1) :-
    det(IP1-TempPhrase1),
    n(TempPhrase1-OP1).

vp(IP2-OP2) :-
    v(IP2-TempPhrase2),
    np(TempPhrase2-OP2).
vp(IP2-OP2) :-
    v(IP2-OP2).

s(InputPhrase-OutputPhrase) :-
    np(InputPhrase-TempPhrase),
    vp(TempPhrase-OutputPhrase).

sentence(S, A) :-
    s(S-A).
