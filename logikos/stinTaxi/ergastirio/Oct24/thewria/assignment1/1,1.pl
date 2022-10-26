foititis(am(00005),
    onomateponumo(stefanos,xidiroglou),
    diefthunsi_diamoni(athitaki,23,41107,hrakleio),
    spoudes(elmepa,mixanikwn,pliroforiki,software)).

foititis(am(00004),
    onomateponumo(petros,ioannou),
    diefthunsi_diamoni(athitaki,21,41107,hrakleio),
    spoudes(elmepa,mixanikwn,pliroforiki,diktua)).

foititis(am(00003),
    onomateponumo(eustathia,xatzikallimeri),
    diefthunsi_diamoni(antistasis,22,55555,athina),
    spoudes(peiraia,peribalontos,gewponia,fusikwn_porwn)).

foititis(am(00002),
    onomateponumo(marios,manoukos),
    diefthunsi_diamoni(diamantaki,27,85103,rodos),
    spoudes(panepistimio_aigaiou,paidagwgika,mathisis,kati)).

foititis(am(00001),
    onomateponumo(swkratis,papagewrgiou),
    diefthunsi_diamoni(zilewn,96,41107,hrakleio),
    spoudes(elmepa,mixanikwn,hlektrologwn,egatastasewn)).

student(AM):-
    foititis(am(AM),_,_,_).

spoudazoun_pliroforiki(Onoma):-
    foititis(_,onomateponumo(Onoma,Eponumo),_,
    spoudes(_,_,pliroforiki,_)),
    write(Onoma),write(' '),write(Eponumo).

spoudazoun_hrakleio(Onoma):-
    foititis(_,onomateponumo(Onoma,Eponumo),
    diefthunsi_diamoni(_,_,_,hrakleio),_),
    write(Onoma),write(' '),write(Eponumo).

stoixeia_foititi(AM):-
    (AM=00001),
    foititis(am(AM),
    onomateponumo(Onoma,Eponumo),
    diefthunsi_diamoni(Odos,Arithmos,Tk,Poli),
    spoudes(Aei,Sxoli,Tmima,Kateuthinsi)),
    write(AM),write(' '),
    write(Onoma),write(' '),
    write(Eponumo),write(' '),
    write(Odos),write(' '),
    write(Arithmos),write(' '),
    write(Tk),write(' '),
    write(Poli),write(' '),
    write(Aei),write(' '),
    write(Sxoli),write(' '),
    write(Tmima),write(' '),
    write(Kateuthinsi),write(' ').