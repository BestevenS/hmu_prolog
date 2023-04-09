initialState([on(a, c), on(c, t), on(b, t)]).
finalState([on(a, b), on(b, c), on(c, t)]).

% Βοηθητικές συναρτήσεις για την χειρισμό των ουρών
empty_queue([]).

member_queue(X, Q):- 
    member(X, Q).

get_elem_queue(X, [X|T]).

dequeue(X, [X|T], T).

enqueue(X, [], [X]).
enqueue(X, [H|T], [H|T1]):-
    enqueue(X, T, T1).

% Βοηθητικές συναρτήσεις για την κατασταση
is_clear(X, State) :-
    \+ member(on(_, X), State).

legal_move(on(X, Y), State) :-
    member(X, [a, b, c]),
    member(Y, [a, b, c, t]),
    X \== Y,
    is_clear(X, State),
    (Y == t; is_clear(Y, State)).

% Υλοποίηση του αλγορίθμου breadth-first search
breadthFirstSearch(InitialState, FinalState) :-
    initialState(InitialState),
    finalState(FinalState),
    empty_queue(EmptyQueue),
    enqueue([InitialState, []], EmptyQueue, InitQueue),
    bfs(InitQueue, FinalState, Path),
    writeln(Path).

bfs(Queue, FinalState, Path) :-
    get_elem_queue([State, Moves], Queue),
    (State == FinalState ->
        reverse(Moves, Path)
    ;
        findall([NextState, [Move|Moves]],
                (legal_move(Move, State),
                 apply_move(Move, State, NextState),
                 \+ member_queue(NextState, Queue)),
                NewStates),
        dequeue(_, Queue, Dequeued),
        enqueue_all(NewStates, Dequeued, NewQueue),
        bfs(NewQueue, FinalState, Path)
    ).

apply_move(on(X, Y), State, NextState) :-
    select(on(X, _), State, State1),
    NextState = [on(X, Y) | State1].

enqueue_all([], Queue, Queue).
enqueue_all([H|T], Queue, NewQueue) :-
    enqueue(H, Queue, TempQueue),
    enqueue_all(T, TempQueue, NewQueue).
