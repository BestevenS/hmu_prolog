% Kiniseis alogou se mia skakiera 3*3

% goals
% ?- PositionKnight = 2, X2 = 1, monopati([[0, X2, 0, 0, 0, 0, 0, 0, 0], PositionKnight], [[1, 1, 1, 1, 0, 1, 1, 1, 1], FinalPositionKnight], Path).
% ?- PositionKnight = 1, X1 = 1, monopati([[X1, 0, 0, 0, 0, 0, 0, 0, 0], PositionKnight], [[1, 1, 1, 1, 0, 1, 1, 1, 1], FinalPositionKnight], Path).

% oles oi kiniseis pou mporoun na ginoun
move(1, 8).
move(1, 6).
move(2, 9).
move(2, 7).
move(3, 4).
move(3, 8).
move(4, 9).
move(4, 3).
move(6, 1).
move(6, 7).
move(7, 2).
move(7, 6).
move(8, 3).
move(8, 1).
move(9, 2).
move(9, 4).


efarmogi_telesti([State, PosKnight], [NewState, NewPosKnight]):-
    move(PosKnight, NewPosKnight),
    validMove_updateChess(State, NewPosKnight, NewState).

validMove_updateChess([H1|T1], 1, [1|T1]):-
    H1==0.

validMove_updateChess([H1|T1], Counter, [H1|T2]) :-
    Counter > 1,
    NewCounter is Counter -1,
    validMove_updateChess(T1, NewCounter, T2).


monopati([X, InitPosKnight], [Y, FinalPosKnight], Monopati):-
    monopati1([X, InitPosKnight], [Y, FinalPosKnight], [InitPosKnight], Monopati).

monopati1([X, PosKnight], [Y, FinalPosKnight], Monopati, Monopati):-
    X == Y,
    PosKnight = FinalPosKnight.

monopati1([X, PosKnight], [Z, FinalPosKnight], Monopati, Teliko_monopati):-
    efarmogi_telesti([X, PosKnight], [Y, NewPosKnight]),
    \+ member(NewPosKnight, Monopati),
    append(Monopati, [NewPosKnight], Neo_monopati),
    monopati1([Y, NewPosKnight], [Z, FinalPosKnight], Neo_monopati, Teliko_monopati).
