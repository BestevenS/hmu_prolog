% Ορισμός των αρχικών και τελικών καταστάσεων
initial_state([on(a, c), on(c, t), on(b, t)]).
final_state([on(a, b), on(b, c), on(c, t)]).

% Ορισμός της άδειας ουράς
empty_queue([]).

% Έλεγχος αν το στοιχείο X είναι μέλος της ουράς Q
member_queue(X, Q):- 
    member(X, Q).

% Λαμβάνει το πρώτο στοιχείο της ουράς (X) και τα υπόλοιπα στοιχεία (T)
get_elem_queue(X, [X|T]).

% Αφαίρεση του πρώτου στοιχείου της ουράς (X) και επιστροφή των υπόλοιπων (T)
dequeue(X, [X|T], T).

% Εισαγωγή στοιχείου (X) στο τέλος της ουράς
enqueue(X, [], [X]).
enqueue(X, [H|T], [H|T1]):-
    enqueue(X, T, T1).

% Κανόνας μετακίνησης κουτιού Χ στο Υ, δημιουργώντας τη νέα κατάσταση NewState
move(State, move(X, Y), NewState) :-
    select(on(X, Z), State, Rest), % Επιλογή του on(X, Z) από την κατάσταση State
    Z \== t, % Έλεγχος ώστε το Z να μην είναι το t (ελεύθερος χώρος)
    select(on(Y, _), Rest, NewRest), % Επιλογή του on(Y, _) από το Rest
    (
        Y == t;
        \+ (select(on(_, Y), NewRest, _))
    ),
    % Έλεγχος ώστε το Y να είναι το t (ελεύθερος χώρος) ή να μην υπάρχει on(_, Y) στο NewRest
    NewState = [on(X, Y), on(Y, Z) | NewRest]. % Δημιουργία της νέας κατάστασης NewState

% Έλεγχος αν δύο καταστάσεις είναι ίδιες
same_state(State1, State2) :-
    sort(State1, SortedState1), % Ταξινόμηση της State1
    sort(State2, SortedState2), % Ταξινόμηση της State2
    SortedState1 == SortedState2. % Έλεγχος αν οι ταξινομημένες καταστάσεις είναι ίδιες

% Συνάρτηση search που υλοποιεί τον αλγόριθμο αναζήτησης κατά πλάτος
search(Open, Closed, FinalState, Path) :-
    get_elem_queue([CurrentState | Path], Open), 
    % Λαμβάνει την τρέχουσα κατάσταση (CurrentState) και το μονοπάτι (Path) από την ουρά Open
    final_state(FinalState), % Λαμβάνει την τελική κατάσταση (FinalState)
    same_state(CurrentState, FinalState).
    % Έλεγχος αν η τρέχουσα κατάσταση είναι ίδια με την τελική κατάσταση

search(Open, Closed, FinalState, Solution) :-
    dequeue([CurrentState | Path], Open, NewOpen),
    % Αφαίρεση της τρέχουσας κατάστασης (CurrentState) από την ουρά Open
    findall([NewState, CurrentState | Path],
            (move(CurrentState, _, NewState),
            % Δημιουργία νέας κατάστασης (NewState) μέσω μιας κίνησης από την τρέχουσα κατάσταση (CurrentState)
            \+ member_queue(NewState, Closed),
            % Έλεγχος ώστε η νέα κατάσταση να μην είναι στη λίστα Closed
            \+ member_queue([NewState | _], NewOpen)),
            % Έλεγχος ώστε η νέα κατάσταση να μην είναι στην ουρά NewOpen
            Children), % Δημιουργία λίστας παιδιών καταστάσεων (Children)
            % Προσθήκη των παιδιών καταστάσεων (Children) στην ουρά NewOpen, δημιουργώντας την ενημερωμένη ουρά UpdatedOpen
            foldl(enqueue, Children, NewOpen, UpdatedOpen),
            % Συνεχίζει την αναζήτηση με την ενημερωμένη ουρά (UpdatedOpen) και την τρέχουσα κατάσταση προστεθειμένη στη λίστα Closed
            search(UpdatedOpen, [CurrentState | Closed], FinalState, Solution).

% Η κύρια συνάρτηση breadthFirstSearch που ξεκινάει την αναζήτηση κατά πλάτος
breadthFirstSearch(InitialState, FinalState, Path) :-
    initial_state(InitialState), % Λαμβάνει την αρχική κατάσταση (InitialState)
    search([[InitialState]], [], FinalState, ReversedPath),
    % Ξεκινάει την αναζήτηση με την αρχική κατάσταση, άδεια λίστα Closed και άδειο μονοπάτι
    reverse(ReversedPath, Path). % Αντιστροφή του ReversedPath για να πάρουμε το τελικό μονοπάτι (Path)

% breadthFirstSearch(InitialState, FinalState, Path).
