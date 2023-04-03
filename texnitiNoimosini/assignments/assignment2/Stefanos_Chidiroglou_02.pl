% Ορίζουμε την αρχική κατάσταση και την τελική κατάσταση
initial_state([on(a, c), on(c, t), on(b, t)]).
final_state([on(a, b), on(b, c), on(c, t)]).


% Υλοποιούμε τον κανόνα breadthFirstSearch/2
breadthFirstSearch(InitialState, FinalState, Path) :-
    initial_state(InitialState),
    bfs([[InitialState]], [], FinalState, ReversedPath),
    reverse(ReversedPath, Path).

% Κανόνες για τη διαχείριση των λιστών L1 και L2
bfs([[CurrentState | Path]|_], _, FinalState, Path) :-
    final_state(FinalState),
    same_state(CurrentState, FinalState).

bfs([[CurrentState | Path]|Queue], Closed, FinalState, Solution) :-
    findall([NewState, CurrentState | Path],
            (move(CurrentState, _, NewState),
            \+ member(NewState, Closed),
            \+ member([NewState | _], Queue)),
            Children),
    append(Queue, Children, NewQueue),
    bfs(NewQueue, [CurrentState | Closed], FinalState, Solution).


% Κανόνες για τη μετακίνηση των κουτιών και την εφαρμογή των περιορισμών
move(State, move(X, Y), NewState) :-
    select(on(X, Z), State, Rest),
    Z \== t,
    select(on(Y, _), Rest, NewRest),
    (Y == t; \+ (select(on(_, Y), NewRest, _))),
    NewState = [on(X, Y), on(Y, Z) | NewRest].

same_state(State1, State2) :-
	sort(State1, SortedState1),
	sort(State2, SortedState2),
	SortedState1 == SortedState2.

% Στόχος
% breadthFirstSearch(InitialState, FinalState, Path).
