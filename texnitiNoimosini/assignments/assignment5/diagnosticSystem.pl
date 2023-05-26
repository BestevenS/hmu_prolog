:- consult('knowledgeBase.pl').

% Diagnose function
diagnose(Symptoms, Diagnosis, Probability):-
    symptom(Diagnosis, DiseaseSymptoms, Probability),
    subset(DiseaseSymptoms, Symptoms).

% Subset function to check if all elements of 1st list exist in 2nd list
subset([], _).
subset([H|T], List) :-
    member(H, List),
    subset(T, List).

% Function to add a symptom to the knowledge base
addSymptom(Diagnosis, Symptoms, Probability):-
    assertz(symptom(Diagnosis, Symptoms, Probability)).

% Function to remove a symptom from the knowledge base
removeSymptom(Diagnosis, Symptoms, Probability):-
    retract(symptom(Diagnosis, Symptoms, Probability)).
