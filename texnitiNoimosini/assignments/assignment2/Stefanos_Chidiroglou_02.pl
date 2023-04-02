% Ορίζουμε την αρχική κατάσταση και την τελική κατάσταση
initial_state([a_on_c, c_on_t, b_on_t]).
final_state([a_on_b, b_on_c, c_on_t]).

% Υλοποιούμε τον κανόνα breadthFirstSearch/2
breadthFirstSearch(InitialState, FinalState) :-
    initial_state(InitialState),
    final_state(FinalState),
    bfs([[InitialState, []]], [], Solution),
    print_solution(Solution).

% Κανόνες για τη διαχείριση των λιστών L1 και L2
bfs([[State, Path]|_], _, Solution) :-
    final_state(State),
    reverse(Path, Solution).

bfs([[State, Path]|Tail], Closed, Solution) :-
    findall(
		[NextState, [Move|Path]],
		(move(State, Move, NextState), \+ member(NextState, Closed), \+ member([NextState, _], Tail)),
		Children
	),
	append(Tail, Children, NewTail),
	bfs(NewTail, [State | Closed], Solution).

% Κανόνες για τη μετακίνηση των κουτιών και την εφαρμογή των περιορισμών
move(State, move(X, Y), NewState) :-
	select(X_on_Z, State, Remaining1),
	atom_concat(X, 'on', X_on),
	atom_concat(X_on, Z, X_on_Z),
	select(Y_on_t, Remaining1, Remaining2),
	atom_concat(Y, 'on_t', Y_on_t),
	Z == Y,
	\+ (atom_concat(_, 'on', Prefix), 
	atom_concat(Prefix, X, _)),
	(
		Y == t; \+ (atom_concat(_, 'on', YPrefix), 
		atom_concat(YPrefix, Y, _))
	),
	append([X_on_Y], Remaining2, NewState),
	atom_concat(X_on, Y, X_on_Y).
	
% Εκτυπώνει τη λύση
print_solution([]).
print_solution([Move | Rest]) :-
	writeln(Move),
	print_solution(Rest).
	
% Στόχος
% breadthFirstSearch(InitialState, FinalState).
			