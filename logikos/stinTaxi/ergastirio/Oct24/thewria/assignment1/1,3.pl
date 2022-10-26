edge(a,b).
edge(a,d).
edge(b,c).
edge(b,e).
edge(c,d).
edge(d,e).

connected(A,B):-
    edge(A,B);(A=B).

connected(A,B):-
    edge(A,Z),connected(Z,B).
