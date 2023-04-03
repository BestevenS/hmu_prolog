initial_state([on(a, c), on(c, t), on(b, t)]).
final_state([on(a, b), on(b, c), on(c, t)]).

empty_queue([]).

member_queue(X, Q):- 
    member(X, Q).

get_elem_queue(X, [X|T]).

dequeue(X, [X|T], T).

enqueue(X, [], [X]).
enqueue(X, [H|T], [H|T1]):-
    enqueue(X, T, T1).

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

search(Open, Closed, FinalState, Path) :-
    get_elem_queue([CurrentState | Path], Open),
    final_state(FinalState),
    same_state(CurrentState, FinalState).

search(Open, Closed, FinalState, Solution) :-
    dequeue([CurrentState | Path], Open, NewOpen),
    findall([NewState, CurrentState | Path],
            (move(CurrentState, _, NewState),
            \+ member_queue(NewState, Closed),
            \+ member_queue([NewState | _], NewOpen)),
            Children),
    foldl(enqueue, Children, NewOpen, UpdatedOpen),
    search(UpdatedOpen, [CurrentState | Closed], FinalState, Solution).

breadthFirstSearch(InitialState, FinalState, Path) :-
    initial_state(InitialState),
    search([[InitialState]], [], FinalState, ReversedPath),
    reverse(ReversedPath, Path).

% breadthFirstSearch(InitialState, FinalState, Path).
