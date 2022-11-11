% menu.

% consult the Knowledge Base
:- consult('KB.pl').

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
        Choice = 3 -> exit_program;

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
        Option =:= 4 -> save
    ),nl.

exit_program:-
    write('Exiting the program...'),nl.

deleteRule:-
    write('Enter ruleId to delete the rule: '),nl,
    read(RuleId),
    
    % retractall is the delete function
    % delete the rule with RuleId from the knowledge base
    retractall(rule1(RuleId,_,_)),

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
    retractall(rule1(RuleId,_,_)),

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
            rule1(NewRuleId, Data, Answer):- RuleCondition,Answer=RuleAnswer
        )
    ),
    % Calling the menu again
    menu.

save:-
    % is opening a file with name myFile.txt
    tell('KB1.pl'),

    % is writing all the rules from the memory to the file
    listing(rule1/3),

    % is saving & closing the file
    told,
    write('Exiting the menu'), nl, menu.


% from assignment1

problem_diagnosis(Results):-
    write('Dwse timi koresmou (>=20, <20, no)'),nl,
    read(Koresmos),
    omp_Values(Koresmos, Values),
    bagof(Answer, rule1(_, values(Koresmos, Values), Answer),Results),
    write(Results),nl, nl, menu.

omp_Values(Koresmos, Values):-
    (   
        Koresmos == no,
        write('Yparxoun times kokkinwn oligochates?'),nl,
        read(YesNo_KO),
        uparxi_kokkinwn_oligochates(YesNo_KO, Timi_KO),

        write('Yparxoun Izhmata?'),nl,
        read(YesNo_Iz),
        uparxi_izimatwn(YesNo_Iz, Timi_Iz),

        write('Yparxoun H2S?'),nl,
        read(YesNo_H2S),
        uparxi_H2S(YesNo_H2S, Timi_H2S),

        write('Yparxoun CH4?'),nl,
        read(YesNo_CH4),
        uparxi_CH4(YesNo_CH4, Timi_CH4),

        write('Yparxoun Ypostrwmata?'),nl,
        read(YesNo_Yp),
        uparxi_upostrwmatos(YesNo_Yp, Timi_Yp),

        write('Murizei?'),nl,
        read(YesNo_Murodias),
        uparxi_myrodias(YesNo_Murodias, Timi_Murodias);
        number(Koresmos),Koresmos < 20,

        write('Yparxoun times NO3?'),nl,
        read(YesNo_NO3),
        uparxi_NO3(YesNo_NO3, Timi_NO3);    
        number(Koresmos),Koresmos >= 20,
        true
    ),
    Values = [Timi_NO3, Timi_KO, Timi_Iz,Timi_H2S, Timi_Yp,Timi_CH4, Timi_Murodias].


uparxi_NO3(no, no).

uparxi_NO3(yes, Timi_NO3):-
    write('Dwse timi NO3'),nl,
    read(Timi_NO3).


uparxi_kokkinwn_oligochates(no, no).

uparxi_kokkinwn_oligochates(yes, Times_KO):-
    write('Dwse times KO (no, liga, Arketa)'),nl,
    read(Times_KO).


uparxi_izimatwn(no,no).

uparxi_izimatwn(yes, Times_Izimatwn):-
    write('Dwse times izimatwn (maura/skoura, anoixta'),nl,
    read(Times_Izimatwn).


uparxi_H2S(no, no).

uparxi_H2S(yes, Times_H2S):-
    write('Dwse times H2S'),nl,
    read(Times_H2S).


uparxi_CH4(no, no).

uparxi_CH4(yes, Times_CH4):-
    write('Dwse times CH4'),nl,
    read(Times_CH4).


uparxi_upostrwmatos(no, no).

uparxi_upostrwmatos(yes, Times_Ypostrwmatos):-
    write('Dwse times upostrwmatos(mesaio/megalo, Kanoniko)'),nl,
    read(Times_Ypostrwmatos).


uparxi_myrodias(no, no).

uparxi_myrodias(yes, Times_Nerou):-
    write('Murizei?(yes, no)'),nl,
    read(Times_Nerou).