/*

TP4916 Stefanos Chidiroglou

*/

calc(Request):-
	reply_html_page(
	    title('Ises parentheseis / Oxi ises parentheseis'), 
	[]), member(method(post), Request), !, 
	http_read_data(Request, Data, []),
	(
		(
			idiaParenthesi(Data.parenthesis),
			write('Einai ises oi parentheseis')
		);
		(
			\+ idiaParenthesi(Data.parenthesis),
			write('Den einai ises oi parentheseis')
		)
	).


idiaParenthesi(L):-
	name(L, Q),
	idiaParenthesi2(Q, []). 

idiaParenthesi2([], []).  

idiaParenthesi2([H|T], E):-
	empty_stack(E),
	push_(E, H, E1),
	idiaParenthesi2(T, E1).


idiaParenthesi2([H|T], [H1|T1]):-
	\+ empty_stack([H1|T1]),
	H == H1,
	push_([H1|T1], H, E1),   
	idiaParenthesi2(T, E1).

idiaParenthesi2([H|T], [H1|T1]):-
	\+empty_stack([H1|T1]),
	H1 \= H,         
	pop_([H1|T1], K), 
	idiaParenthesi2(T, K).
