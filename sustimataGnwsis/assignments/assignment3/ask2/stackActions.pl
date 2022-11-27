/*

TP4916 Stefanos Chidiroglou

*/

empty_stack([]).

pop_([_], []).

pop_([H|T], [H|Rest]):-
	pop_(T, Rest).

push_([], Elem, [Elem]).

push_([H|T], Elem, [H|Rest]):-
	push_(T, Elem, Rest).
