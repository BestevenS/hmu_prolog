:- consult('KB.pl').

menu:-
    write('1. Delete rule'),nl,
    write('2. Add new rule'),nl,
    write('3. Modify rule'),nl,
    write('4. Exit'),nl,
    read(Option),
    (
        Option =:= 1 -> deleteRule;
        Option =:= 2 -> addNewRule;
        Option =:= 3 -> modifyRule;
        Option =:= 4 -> exit
    ),nl.

deleteRule:-
    write('You pressed 1'),nl,
    write('Enter rule to delete: '),nl,
    read(RuleId),
    retractall(rule(RuleId,_,_)),
    write('Rule deleted'),nl,
    menu.

addNewRule:-
    write('Give the rule Id:'),
    read(NewRuleId),
    shareFunc(NewRuleId).

modifyRule:-
    write('You pressed 3'),nl,
    write('Enter rule to modify: '),nl,
    read(RuleId),
    retractall(rule(RuleId,_,_)),
    shareFunc(RuleId).

shareFunc(NewRuleId):-
    write('You pressed 2'),nl,
    nl, write('Add new rule'), nl,
    write('Give the data of the problem:'),
    read(Data),
    write('Give the rule conditions:'),
    read(RuleCondition),
    write('Give the rule results:'),
    read(RuleAnswer),
    assertz(
        (rule(NewRuleId, Data, Answer):- RuleCondition,Answer=RuleAnswer)
    ),
    menu.

exit:-
    write('You pressed 4'),nl,
    % Να αποθηκεύω τους κανόνες σε ένα αρχείο
    tell('myFile.txt'),
    listing(rule/3),    
    told,
    write('Exiting...'),nl.