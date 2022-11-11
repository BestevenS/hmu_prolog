% from assignment1

consult('KB.pl').

problem_diagnosis(Results):-
    write('Dwse timi koresmou (>=20, <20, no)'),nl,
    read(Koresmos),
    omp_Values(Koresmos, Values),
    bagof(Answer, rule(_, (Koresmos, Values), Answer), Results).

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
    write('Murizei?(yes, no)'), nl,
    read(Times_Nerou).