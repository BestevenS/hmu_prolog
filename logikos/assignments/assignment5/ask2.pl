/*
Πολλα στοιχεια τα εχω παρει απο τη σελιδα 271+ του βιβλιου
*/


%Αφαίρεση στοιχειου απο στοιβα
pop([H], []).
pop([H|T], [H|Rest]):- pop(T, Rest).


%Κορυφή στοιχειων στοιβας
top([H], H).

%Α. Η Κορυφή top ειναι το τελευταιο στοιχειο (Last)
top([H|T], Last):- 
    top(T, Last).

%B. Η Κορυφή top ειναι το πρωτο στοιχειο(head)
top1([H|T], H).


%Καταχώρηση στοιχιου σε στοιβα
push([], Elem, [Elem]).

push([H|T], Elem, [H|Rest]):-
    push(T, Elem, Rest).


%Αδεια στοιβα
empty_stack([]).

parenthesis_LR_same(S):-
    empty_stack(S).

parenthesis_LR_same(S):-
    name(S, Ns), ftry(Ns, Cs).


ftry(Ns, Cs):-
    empty_stack(Cs),
    top(Ns, H),
    pop(Ns, PoppedNS),
    push(Cs, H, PushedCS),
    ftry(PoppedNS, PushedCS).

ftry(Ns, Cs):-
    \+ empty_stack(Cs),
    stry(Ns, Cs).

stry(Ns, Cs):-
    empty_stack(Ns),
    empty_stack(Cs).

stry(Ns, Cs):-
    \+ empty_stack(Ns),
    top(Ns, H),
    pop(Ns, PoppedNS),
    top1(Cs, H2),
    H =:= H2,
    push(Cs, H, PushedCS),
    stry(PoppedNS, PushedCS).

stry(Ns, Cs):-
    \+ empty_stack(Ns),
    top(Ns, H),
    pop(Ns, PoppedNS),
    top1(Cs, H2),
    H =\= H2, pop(Cs, PoppedCS),
    stry(PoppedNS, PoppedCS).

%   Τρεχω
%   parenthesis_LR_same(')))(()((').
%   parenthesis_LR_same('(((())').