/*

Πολλα στοιχεια για τις ουρες τα πηρα απο τη σελιδα 273 του βιβλιου

*/

dequeue(X, [X|T], T).

enqueue(X, [], [X]).

enqueue(X, [H1|T1], [H1|T2]) :-
    enqueue(X, T1, T2).

empty_queue([]).


queue_element_cardinality(Q1, Q2):-
    new_queue(Q1,Q3,Q2).


new_queue(Q1,Q2,Q2):-
    empty_queue(Q1).

new_queue(Q1,Q2,Q3):-
	dequeue(H,Q1,T),
	add_elem(H,Q2,Q2new),
	new_queue(T,Q2new,Q3).


add_elem((Elem,0),Q,Q).

add_elem((Elem,C),Q,Qnew):-
	C1 is C-1,
	enqueue(Elem,Q,Q1new),
	add_elem((Elem,C1),Q1new,Qnew).


%   Τρεχω
%	queue_element_cardinality([(5,4),(-8,3),(0,2)],[5,5,5,5,-8,-8,-8,0,0]).