% Kiniseis alogou se mia skakiera 3*3

% goal
% ?- PositionKnight=2, X2=1,monopati([[0,X2,0,0,0,0,0,0,0], PositionKnight], [[1, 1, 1, 1, 0, 1, 1, 1, 1], FinalPositionKnight],Path).

% oles oi kiniseis pou mporoun na ginoun
akme(a, c).
akme(c, a).
akme(c, e).
akme(c, f).
akme(b, c).
akme(b, d).
akme(d, f).
akme(d, g).

telike_katastase([[1, 1, 1, 1, 0, 1, 1, 1, 1]]).

% dinoume monopati(teliko-monopati[[1, 1, 1, 1, 0, 1, 1, 1, 1], [teliki_thesi]], Xrisimopoieitai san Bima parakatw, Monopati[tha ftiaxtei mono toy])
monopati(X, Y, Monopati):-
    monopati1(X, Y, [X], Monopati).

% an ftasei teliki katastasi na teleiwsei
monopati1(X, X, Monopati, Monopati) :- 
    telike_katastase(X).

monopati1(X, Z, Monopati, Teliko_monopati) :-
    % gia X oti akme uparxei tha tin parei i metabliti Y
    akme(X, Y),
    % an den uparxei to Y sto Monopati
    \+ member(Y, Monopati),
    % tote tha prosthesoume to Y sto Monopati
    append(Monopati, [Y], Neo_monopati),
    % anadromika 
    monopati1(Y, Z, Neo_monopati, Teliko_monopati).
