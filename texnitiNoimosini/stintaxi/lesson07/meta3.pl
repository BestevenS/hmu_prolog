:- dynamic ordered/1, member/2, p/2, q/2.
solve(true) :- !.
solve( (A, B) ) :- !,
solve(A), 
solve(B).
solve(Goal) :-
\+ predicate_property(Goal,built_in), 
clause( Goal, Body ), solve(Body).
solve(Goal) :-
predicate_property(Goal, built_in),
call(Goal).

% compiler

p(X, Z) :- q(X, Y), p(Y, Z).
p(X, Y) :- q(X, Y).
q(a, b).
q(b, c).
member(X, [X | T] ).
member(X, [H | T] ) :- member(X, T).
ordered( [H1] ).
ordered( [H1a, H1b|T] ) :-
H1a =< H1b, ordered( [H1b|T] ).
