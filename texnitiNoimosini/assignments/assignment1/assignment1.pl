arxi(kosmos(3, 3, left, 0, 0)).

teliko(kosmos(0, 0, right, 3, 3)).

orthotita(CL, ML, CR, MR) :-
	ML >= 0, CL >= 0, MR >= 0, CR >= 0,
	(ML >= CL ; ML = 0),
	(MR >= CR ; MR = 0).

% Πιθανη Κινηση
movement(kosmos(CL, ML, left, CR, MR),
kosmos(CL, ML2, right, CR, MR2)):-
	% 2 ιεραποστόλοι διασχιζουν αριστερα->δεξια
	MR2 is MR + 2,
	ML2 is ML - 2,
	orthotita(CL, ML2, CR, MR2).

movement(kosmos(CL, ML, left, CR, MR),
kosmos(CL2, ML, right, CR2, MR)):-
	% 2 κανιβαλοι διασχιζουν αριστερα->δεξια
	CR2 is CR + 2,
	CL2 is CL - 2,
	orthotita(CL2, ML, CR2, MR).

movement(kosmos(CL, ML, left, CR, MR),
kosmos(CL2, ML2, right, CR2, MR2)):-
	% 1 ιεραποστολος και ενας κανιβαλος διασχιζουν αριστερα->δεξια
	CR2 is CR + 1,
	CL2 is CL - 1,
	MR2 is MR + 1,
	ML2 is ML - 1,
	orthotita(CL2, ML2, CR2, MR2).

movement(kosmos(CL, ML, left, CR, MR),
kosmos(CL, ML2, right, CR, MR2)):-
	% 1 ιεραποστολος διασχιζει αριστερα->δεξια
	MR2 is MR + 1,
	ML2 is ML - 1,
	orthotita(CL, ML2, CR, MR2).

movement(kosmos(CL, ML, left, CR, MR),
kosmos(CL2, ML, right, CR2, MR)):-
	% 1 κανιβαλος διασχιζει αριστερα->δεξια
	CR2 is CR + 1,
	CL2 is CL - 1,
	orthotita(CL2, ML, CR2, MR).

movement(kosmos(CL, ML, right, CR, MR),
kosmos(CL, ML2, left, CR, MR2)):-
	% 2 ιεραποστόλοι διασχιζουν δεξια->αριστερα
	MR2 is MR - 2,
	ML2 is ML + 2,
	orthotita(CL, ML2, CR, MR2).

movement(kosmos(CL, ML, right, CR, MR),
kosmos(CL2, ML, left, CR2, MR)):-
	% 2 κανιβαλοι διασχιζουν αριστερα->δεξια
	CR2 is CR - 2,
	CL2 is CL + 2,
	orthotita(CL2, ML, CR2, MR).

movement(
	kosmos(CL, ML, right, CR, MR),
	kosmos(CL2,ML2,left,CR2,MR2)
):-
	%  1 ιεραποστολος και ενας κανιβαλος διασχιζει δεξια->αριστερα
	CR2 is CR - 1,
	CL2 is CL + 1,
	MR2 is MR - 1,
	ML2 is ML + 1,
	orthotita(CL2, ML2, CR2, MR2).

movement(
	kosmos(CL, ML, right, CR, MR),
	kosmos(CL, ML2, left, CR, MR2)
):-
	% 1 ιεραποστολος διασχιζει δεξια->αριστερα
	MR2 is MR - 1,
	ML2 is ML + 1,
	orthotita(CL, ML2, CR, MR2).

movement(
	kosmos(CL, ML, right, CR, MR),
	kosmos(CL2, ML, left, CR2, MR)
):-
	% 1 κανιβαλος διασχιζει δεξια->αριστερα
	CR2 is CR - 1,
	CL2 is CL + 1,
	orthotita(CL2, ML, CR2, MR).