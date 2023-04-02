move(s1,s2).
move(s1,s3).
move(s1,s4).
move(s2,s5).
move(s2,s6).
move(s2,s7).
move(s3,s8).
move(s4,s9).
move(s4,s10).
move(s6,s11).
move(s6,s12).
move(s7,s13).
move(s9,s14).
move(s9,s15).
goal(s8).
goal(s12).
goal(s15).

empty_set([]).
member_set(X,[H|T]) :- X = H.
member_set(X,[H|T]) :- X \= H, member_set(X,T).
	
union([],S2,S2).
union([Head1|T1] , S2 , [Head1|Tail3]) :- 
	\+ member_set(Head1 ,S2), union(T1,S2,Tail3).	
	
union([Head1|T1] , S2 , S3) :- 
	member_set(Head1 , S2), union(T1,S2,S3).
														 
pushElementsToQueue([],Q1,Q1).
pushElementsToQueue([Elem|Rest],Q1,FQ):- 
	enqueue(Elem,Q1,NQ), pushElementsToQueue(Rest,NQ,FQ).
empty_queue([]). 
dequeue(X,[X|T],T).
enqueue(X,[],[X]).
enqueue(X,[H|T1],[H|T2]):- 
	X \= H,
	enqueue(X,T1,T2).
						
add_list_to_queue(Child, Q1, NQ) :- add_list_to_queue1(Child,Q1,NQ).
add_list_to_queue1([],FQ,FQ).
add_list_to_queue1([Child|RestChildren],Q1,FQ):- 
	append(Q1,[Child],NQ),
	add_list_to_queue1(RestChildren,NQ,FQ).

print_path([Kat, met], _):-
	write(Kat).

print_path([Kat, Par], S1) :- member_set([Par, Par2], S1),
											   print_path([Par, Par2], S1),
											   write('--> '), 
											   write(Kat) . 

get_children(Kat,Rest, S1,Children) :- bagof(Child, moves(Kat, Rest, S1, Child), Children).

get_children(Kat,Rest,Closed_set,[]).

moves(Kat,Rest,S1, [Next,Kat]) :- move(Kat, Next), \+(member([Next,Node], Rest)),  \+(member_set([Next,_NodeY], S1)). 	  
												  
% BFS

breadthFirstSearch(Arxi,Goal) :- empty_queue(EmptyQueue), enqueue([Arxi,met],EmptyQueue,Q2),
								  empty_set(S1),  path(Q2, S1, Goal).

path(Q2, _, _) :- empty_queue(Q2), write('xoris lisi').

path(Q2, S1, Goal) :- dequeue([Kat, Par], Q2, NQ2), goal(Kat), Kat = Goal, write('monopati lisis:'), 
											   nl, 
											   print_path([Kat, Par], S1).

path(Q2, S1, Goal) :- dequeue([Kat, Par], Q2, Rest), 
											   get_children(Kat, Rest,S1,Children),
											   add_list_to_queue(Children, Rest, NQ2),
											   union([[Kat,Par]],S1,NS),
											   path(NQ2, NS, Goal). 

