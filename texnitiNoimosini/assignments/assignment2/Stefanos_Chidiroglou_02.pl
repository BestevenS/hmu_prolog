% Αρχική κατάσταση και τελική κατάσταση
InitialState ([on(a, c), on(c, t), on(b, t)]).
FinalState ([on(a, b), on(b, c), on(c, t)]).

% Υλοποίηση ουράς
empty_queue([]).

member_queue(X, Q):- 
    member(X, Q).

get_elem_queue(X, [X|T]).

dequeue(X, [X|T], T).

enqueue(X, [], [X]).
enqueue(X, [H|T], [H|T1]):-
    enqueue(X, T, T1).

% Έλεγχος νομιμότητας κίνησης
legal_move(State, move(X, Y)) :-
    X \== Y,
    member(on(X, Z), State), Z \== Y,
    \+ (member(on(_, X), State)),
    (Y == t; \+ (member(on(_, Y), State))).

% Εφαρμογή κίνησης
apply_move(State, move(X, Y), NewState) :-
    legal_move(State, move(X, Y)),
    select(on(X, _), State, TempState),
    NewState = [on(X, Y) | TempState].

% Αναζήτηση πλάτους-πρώτα
breadthFirstSearch(InitialState, FinalState) :-
    empty_queue(EmptyQueue),
    enqueue(node(InitialState, []), EmptyQueue, StartQueue),
    breadthFirstSearchHelper(StartQueue, [], FinalState).

% Βοηθητική συνάρτηση για την αναζήτηση πλάτους-πρώτα
breadthFirstSearchHelper(Queue, _, _) :-
    empty_queue(Queue),
    write("No solution found."), nl, !, fail.

breadthFirstSearchHelper(Queue, ClosedSet, FinalState) :-
    get_elem_queue(node(State, Path), Queue),
    ( isFinalState(State, FinalState) ->
        reverse(Path, Moves),
        write("Moves:"), nl,
        write(Moves), nl,
        write("Final State:"), nl,
        write(State), nl
    ;
        findall(
            node(NewState, [Move|Path]),
            (apply_move(State, Move, NewState), \+ member_queue(node(NewState, _), ClosedSet)),
            Children
        ),
        dequeue(_, Queue, TempQueue),
        append(TempQueue, Children, NewQueue),
        enqueue(node(State, Path), ClosedSet, NewClosedSet),
        breadthFirstSearchHelper(NewQueue, NewClosedSet, FinalState)
    ).

% Έλεγχος για τελική κατάσταση
isFinalState(State, FinalState) :-
    subset(FinalState, State).

% breadthFirstSearch(InitialState, FinalState).
