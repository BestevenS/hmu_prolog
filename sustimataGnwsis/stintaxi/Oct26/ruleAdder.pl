addNewRule:- 
    nl,	write('Add new rule'), nl,
    write('Give the data of the problem:'),  		
    read(Data),
    write('Give the rule conditions:'), 		
    read(RuleCondition),
    write('Give the rule results:'), 			
    read(RuleAnswer),
    write('Give the rule Id:'),
    read(NewRuleId),
    assertz( (rule(NewRuleId, Data, Answer):- RuleCondition,Answer=RuleAnswer) ).

getWorkingDirectory(WorkingDirectory):- 
    WorkingDirectory = '/home/besteven/git-repos/prolog/sustimataGnwsis/stintaxi/Oct26/'.

getKBFileName(KBFileName):- 
    KBFileName = 'KB.pl'.

getKBFilePath(KBFilePath):-
    getWorkingDirectory(WorkingDirectory),
    getKBFileName(KBFileName),
    atom_concat(WorkingDirectory, KBFileName, KBFilePath).


:- dynamic  rule/3.
addKBnewRule:-
    getKBFilePath(KBFilePath),    
	consult(KBFilePath),
	addNewRule,nl,nl, 	
	listing(rule/3).
