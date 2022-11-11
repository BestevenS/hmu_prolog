% menu.

% consult the Knowledge Base
:- consult('KB.pl').

% consult assign.pl
:- consult('assign.pl').

% main menu
menu:-
    % display the main menu
    write('1. Problem diagnosis from the environmental knowledge system.'),nl,
    write('2. Update Knowledge Base(KB).'),nl,
    write('3. Exit.'),nl,
    write('Enter your choice: '),
    % Read user input
    read(Choice),
    (

        % Handle the user input
        (
            Choice = 1 -> problem_diagnosis(Answer),
            write('The problem is: '),write(Answer),nl
        ); 
        
        % display the update_kb menu
        Choice = 2 -> update_kb;

        % Create myFile.txt -> (content) new Knowledge and exiting the program
        Choice = 3 -> exit;

        % if the user input is not valid then show the menu again
        wrongChoice
    ),nl.

% problem_diagnosis:-

wrongChoice:-
    write('Invalid choice. Please try again.'),nl,

    % Show the menu again
    menu.

update_kb:-
    % Show the menu
    write('1. Delete rule'),nl,
    write('2. Add new rule'),nl,
    write('3. Modify rule'),nl,
    write('4. Exit'),nl,
    write('Enter your choice: '),
    % Read user input
    read(Option),
    (
        % Handle the user input

        % Delete rule
        Option =:= 1 -> deleteRule;

        % Add new rule
        Option =:= 2 -> addNewRule;

        % Modify rule
        Option =:= 3 -> modifyRule;

        % Exit
        Option =:= 4 -> exit
    ),nl.

deleteRule:-
    write('Enter ruleId to delete the rule: '),nl,
    read(RuleId),
    
    % retractall is the delete function
    % delete the rule with RuleId from the knowledge base
    retractall(rule(RuleId,_,_)),

    % Just showing a message that the rule is successfully deleted
    write('Rule deleted'),nl,

    % displaying the main menu
    menu.

addNewRule:-
    write('Enter ruleId to add new rule: '),
    read(NewRuleId),

    % This part is sharing with modifyRule
    shareFunc(NewRuleId).

modifyRule:-
    write('Enter ruleId to modify: '),nl,
    read(RuleId),

    % retractall is the delete function
    % deleting the rule with the given id
    % and then adding a new rule with the same id
    retractall(rule(RuleId,_,_)),

    % This part is sharing with addNewRule
    shareFunc(RuleId).

% This part is sharing with addNewRule and modifyRule
shareFunc(NewRuleId):-
    nl, write('Give the data of the problem: '),
    read(Data),
    write('Give the rule conditions: '),
    read(RuleCondition),
    write('Give the rule results: '),
    read(RuleAnswer),

    % assert is adding a new rule in memory
    assertz(
        (
            rule(NewRuleId, Data, Answer):- RuleCondition,Answer=RuleAnswer
        )
    ),
    % Calling the menu again
    menu.

exit:-
    % is opening a file with name myFile.txt
    tell('myFile.txt'),

    % is writing all the rules from the memory to the file
    listing(rule/3),

    % is saving & closing the file
    told,
    write('Exiting...'),nl.
