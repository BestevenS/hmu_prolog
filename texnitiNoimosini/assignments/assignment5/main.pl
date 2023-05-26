:- consult('diagnosticSystem.pl').

% Main menu
menu:-
    write('1. Analysi symptomaton'), nl,
    write('2. Prosthiki symptomaton'), nl,
    write('3. Afairese symptomaton'), nl,
    write('4. Exodos'), nl,
    read(Choice),
    process(Choice).

% Process user choices
process(1):-
    write('Eisagete ta symptomata me ti morfi [symptoma1, symptoma2, ...]: '), nl,
    read(Symptoms),
    diagnose(Symptoms, Diagnosis, Probability),
    write('Diagnosis: '), write(Diagnosis), write(' me pithanotita '), write(Probability), nl,
    menu.
process(2):-
    write('Eisagete tin diagnosis, ta symptomata kai ti pithanotita me ti morfi diagnosis, [symptom1, symptom2, ...], probability: '), nl,
    read(Diagnosis, Symptoms, Probability),
    addSymptom(Diagnosis, Symptoms, Probability),
    menu.
process(3):-
    write('Eisagete tin diagnosis, ta symptomata kai ti pithanotita pou thelete na afairesete me ti morfi diagnosis, [symptom1, symptom2, ...], probability: '), nl,
    read(Diagnosis, Symptoms, Probability),
    removeSymptom(Diagnosis, Symptoms, Probability),
    menu.
process(4).

% Start the program
:- initialization(menu).
