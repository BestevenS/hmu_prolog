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
    
    % retractall is the delete function
    retractall(rule(RuleId,_,_)),
    write('Rule deleted'),nl,
    menu.

addNewRule:-
    write('You pressed 2'),nl,
    write('Give the rule Id:'),
    read(NewRuleId),
    shareFunc(NewRuleId).

modifyRule:-
    write('You pressed 3'),nl,
    write('Enter rule to modify: '),nl,
    read(RuleId),

    % retractall is the delete function
    % deleting the rule with the given id
    % and then adding a new rule with the same id
    % it looks like a modification
    retractall(rule(RuleId,_,_)),
    shareFunc(RuleId).

shareFunc(NewRuleId):-
    nl, write('Add new rule'), nl,
    write('Give the data of the problem:'),
    read(Data),
    write('Give the rule conditions:'),
    read(RuleCondition),
    write('Give the rule results:'),
    read(RuleAnswer),

    % assert is adding a new rule in memory
    assertz(
        (
            rule(NewRuleId, Data, Answer):- RuleCondition,Answer=RuleAnswer
        )
    ),
    menu.

exit:-
    write('You pressed 4'),nl,

    % is opening a file with name myFile.txt
    tell('myFile.txt'),

    % is writing all the rules from the memory to the file
    listing(rule/3),

    % is saving & closing the file
    told,
    write('Exiting...'),nl.