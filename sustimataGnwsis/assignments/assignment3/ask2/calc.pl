/*

TP4916 Stefanos Chidiroglou

*/

calc(Request):-
	reply_html_page(
	    title('Ises parentheseis / Oxi ises parentheseis'), 
	[]), 
	member(method(post), Request), !, 
	http_read_data(Request, Data, []),
    % get the values from the form
	(
		(
			isesParenthesis(Data.parenthesis),
			write('Einai ises oi parentheseis')
		);
		(
			\+ isesParenthesis(Data.parenthesis),
			write('Den einai ises oi parentheseis')
		)
	).


isesParenthesis(L):-
	name(L, Q),
	isesParenthesis2(Q, []). 

isesParenthesis2([], []).  

isesParenthesis2([H|T], E):-
	empty_stack(E),
	push_(E, H, E1),
	isesParenthesis2(T, E1).


isesParenthesis2([H|T], [H1|T1]):-
	\+ empty_stack([H1|T1]),
	H == H1,
	push_([H1|T1], H, E1),   
	isesParenthesis2(T, E1).

isesParenthesis2([H|T], [H1|T1]):-
	\+ empty_stack([H1|T1]),
	H1 \= H,         
	pop_([H1|T1], K), 
	isesParenthesis2(T, K).
