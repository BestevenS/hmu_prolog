/*Κανω consult ενα αρχειο προχωραω και φτιαχνω 
ενα καινουργιο αρχειο στο οποιο κατασκευαζω την 
ιδια βαση γνωσης*/

consult('kb_old.pl').

save_KB:-
	tell('kb.pl'),
    write(':-dynamic max_student_id/1,students/1,student/2.\n'),
	Head=max_student_id(X),
	clause(Head,Body),
	write(Head),
	write('.\n'),
	Head2=students(List),
	clause(Head2,Body),
	write(Head2),
	write('.\n'),
	save_students(List),
	told.

save_students([]).

save_students([H|T]):-
	Head = student(H, List),
	clause(Head, Body),
	write(Head), write('.\n'),
	save_students(T).