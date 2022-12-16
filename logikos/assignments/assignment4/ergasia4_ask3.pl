:-	use_module(library(lists)).

kb('Giannis', likes,maths).
kb('Giannis',likes,physics).
kb('Giannis',plays,voleyball).
kb('Giannis',plays,chess).
kb('Giannis',plays,backetball).
kb('Maria',likes,maths).
kb('Maria',likes,geography).
kb('Maria',plays,chess).
kb('Maria',plays,tennis).
kb('Eleni',likes,physics).
kb('Eleni',likes,informatics).
kb('Eleni',plays,voleyball).
kb('Eleni',plays,tennis).

update_KB:-
	write('Option 1 registration change.\n'),
	write('Option 2 new registration.\n'),
	write('Option 3 delete registration.\n'),
	write('Random Option for exit.\n'),
	write('Your Option: '),
	read(X),
	option(X),
	update_KB.


update_KB:- 
	write('exit'),
	save_KB.

option(1):- 
	change_record_KB.

option(2):- 
	create_record_KB.

option(3):-
	delete_record_KB.


change_record_KB:-
	write('Change data of\nID: '),
	read(Id),
	student(Id,Stoixeia),
	write('Old data: '),
	writeln(Stoixeia),
	writeln('New data: '),
	read(NeaStoixeia),
	retract(student(Id,_)),
	assertz(student(Id,NeaStoixeia)).
			   

create_record_KB:-
	write('New registration: \n\t'),
	read(Stoixeia),
	students(List),
	last(List,Last),
	Neo_id is Last + 1,
	assertz(student(Neo_id,Stoixeia)),
	append(List,[Neo_id],NewList),
	retractall(students(_)),
	asserta(students(NewList)),
	retract(max_student_id(_)),
	asserta(max_student_id(Neo_id)).


delete_record_KB:-
	write('dwse id gia diagrafh : '),
	read(Id),
	retract(student(Id,_)),
	students(List),
	delete(List,Id,NewList),
	last(NewList,Last),
	retractall(max_student_id(_)),
	retractall(students(_)),
	asserta(students(NewList)),
	asserta(max_student_id(Last)).


save_KB:- 
	tell('kb.pl'),
	write(':-dynamic max_student_id/1,students/1,student/2.'),nl, 
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