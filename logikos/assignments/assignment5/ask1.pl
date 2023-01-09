empty_seq([]).

head([H|T],H).

tail([H|T],T).

seq_cons(Q,X,[X|Q]).


length_seq([],0).

length_seq([H|T],Len):-
    length_seq(T,Len1),
    Len is Len1 +1.


add_head_N_occ(Q,Elem,0,Q).

add_head_N_occ(Q,Elem,N,[Elem|Rest]):- 
    N1 is N-1,
    add_head_N_occ(Q,Elem,N1,Rest).


add_last_elem([],Elem,[Elem]).

add_last_elem([H|T],Elem,[H|Rest]):- 
    add_last_elem(T,Elem,Rest).


seqNth_elem([H|T],1,H).

seqNth_elem([H|T],N,Elem):-
    N1 is N-1,
    seqNth_elem(T,N1,Elem).


subsegment(Q,N,N,Last):- 
    empty_seq(Last2),
    seqNth_elem(Q,N,Elem),
    add_last_elem(Last2,Elem,Last).

subsegment(Q,M,N,R):-
    M<N,
    M1 is M+1,
    subsegment(Q,M1,N,R2),
    seqNth_elem(Q,M,Elem),
    add_head_N_occ(R2,Elem,1,R),!.


merge([],L,L).

merge([],L,L). 

merge(Q1,Q2,Q3) :- 
    empty_seq(Q1), 
    Q2=Q3.

merge([X|T1],[Y|T2],[X|T]):-
    X=<Y,

merge(T1,[Y|T2],T). 

merge(Q1,Q2,Q3):-
    head(Q1,X), 
    head(Q2,Y), 
    X=<Y, 
    tail(Q1,NewQ1), 
    merge(NewQ1,Q2,NewQ3), 
    add_head_N_occ(NewQ3,X,1,Q3).


merge_sort([],[]).
merge_sort([S],[S]).

merge_sort(Q1,Q2):- 
    length_seq(Q1,1), 
    Q1=Q2.