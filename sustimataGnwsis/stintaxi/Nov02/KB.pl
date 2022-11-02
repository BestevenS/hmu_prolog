:- dynamic rules/1, max_ruleId/1, rule/3.

rules([rid1, rid2, rid3, rid4, rid7]).

max_ruleId(7).

rule(rid1,values(yes, [BOD, Oxidability,DOC_TOC,[Cloudy,Colour]]),Answer) :- 
    number(BOD), BOD =<7,
    Answer='ΒΑΟ(BOD): Μέτριο πρόβλημα με ΜΟΥ.'.

rule(rid2, values(yes, [BOD, Oxidability,DOC_TOC,[Cloudy,Colour]]),Answer) :-
    number(BOD), BOD >7, BOD =< 15,
    Answer='ΒΑΟ(BOD): Έντονο πρόβλημα ΜΟΥ.'.

rule(rid3, values(yes, [BOD, Oxidability,DOC_TOC,[Cloudy,Colour]]),Answer) :-
    number(BOD),BOD >15,
    Answer= 'ΒΑΟ(BOD): Πολύ Έντονο πρόβλημα ΜΟΥ.'.

rule(rid4, values(yes, [BOD, Oxidability,DOC_TOC,[Cloudy,Colour]]),Answer) :-
    number(Oxidability), Oxidability =< 3,
    Answer='Οξείδωση (Oxidability): Έντονο πρόβλημα ΜΟΥ.'.

rule(rid7, values(yes, [BOD, Oxidability,DOC_TOC,[Cloudy,Colour]]),Answer) :-
    number(Oxidability), Oxidability >3,
    Oxidability =<7, Answer='Οξείδωση (Oxidability): Μέτριο πρόβλημα με ΜΟΥ.'. 