rule(rid1, values(Koresmos, [Yparxi_NO3, Kokkina_oligochate, Yparxi_Izhmatwn, 
Yparxi_H2S, Tupos_upostromatos, Yparxi_CH4, Murodia_Nerou]), Answer):-
number(Koresmos),Koresmos >= 20,!,
Answer = 'Kanena provlima anoxias'.

rule(rid2, values(Koresmos, [Yparxi_NO3, Kokkina_oligochate, Yparxi_Izhmatwn, 
Yparxi_H2S, Tupos_upostromatos, Yparxi_CH4, Murodia_Nerou]), Answer):-
number(Koresmos),Koresmos < 20,
Yparxi_NO3 == yes,!,
Answer = 'Sovaro provlima anoxias'.

rule(rid3, values(Koresmos, [Yparxi_NO3, Kokkina_oligochate, Yparxi_Izhmatwn, 
Yparxi_H2S, Tupos_upostromatos, Yparxi_CH4, Murodia_Nerou]), Answer):-
number(Koresmos),Koresmos < 20,
Yparxi_NO3 == no,!,
Answer ='Poli sovaro provlima anoxias'.

rule(rid4, values(Koresmos, [Yparxi_NO3, Kokkina_oligochate, Yparxi_Izhmatwn, 
Yparxi_H2S, Tupos_upostromatos, Yparxi_CH4, Murodia_Nerou]), Answer):-
Koresmos == no,
Kokkina_oligochate == Arketa,!,
Answer = 'Metria anoxias'.

rule(rid5, values(Koresmos, [Yparxi_NO3, Kokkina_oligochate, Yparxi_Izhmatwn, 
Yparxi_H2S, Tupos_upostromatos, Yparxi_CH4, Murodia_Nerou]), Answer):-
Koresmos == no,write('yes'),
Kokkina_oligochate == liga,!,
Answer = 'Poli sovaro provlima anoxias'.

rule(rid6, values(Koresmos, [Yparxi_NO3, Kokkina_oligochate, Yparxi_Izhmatwn, 
Yparxi_H2S, Tupos_upostromatos, Yparxi_CH4, Murodia_Nerou]), Answer):-
Koresmos == no,
Kokkina_oligochate == no,
(Yparxi_Izhmatwn == maura; Yparxi_Izhmatwn == skoura),
Yparxi_H2S == yes,!,
Answer = 'Poli sovaro provlima anoxias'.

rule(rid7, values(Koresmos, [Yparxi_NO3, Kokkina_oligochate, Yparxi_Izhmatwn, 
Yparxi_H2S, Tupos_upostromatos, Yparxi_CH4, Murodia_Nerou]), Answer):-
Koresmos == no,
Kokkina_oligochate == no,
(Yparxi_Izhmatwn == maura; Yparxi_Izhmatwn == skoura),
Yparxi_H2S == no,
Yparxi_CH4 == yes,!,
Answer = 'Poli savro provlima anoxias'.

rule(rid8, values(Koresmos, [Yparxi_NO3, Kokkina_oligochate, Yparxi_Izhmatwn, 
Yparxi_H2S, Tupos_upostromatos, Yparxi_CH4, Murodia_Nerou]), Answer):-
Koresmos == no,
Kokkina_oligochate == no,
(Yparxi_Izhmatwn == maura; Yparxi_Izhmatwn == skoura),
Yparxi_H2S == no,
Yparxi_CH4 == no,!,
Answer = 'Sovaro provlima anoxias'.

rule(rid9, values(Koresmos, [Yparxi_NO3, Kokkina_oligochate, Yparxi_Izhmatwn, 
Yparxi_H2S, Tupos_upostromatos, Yparxi_CH4, Murodia_Nerou]), Answer):-
Koresmos == no,
Kokkina_oligochate == no,
Yparxi_Izhmatwn == anoixta,
(Tupos_upostromatos == mesaio; Tupos_upostromatos == megalo),!,
Answer = 'Kanena provlima anoxias'.


rule(rid10, values(Koresmos, [Yparxi_NO3, Kokkina_oligochate, Yparxi_Izhmatwn, 
Yparxi_H2S, Tupos_upostromatos, Yparxi_CH4, Murodia_Nerou]), Answer):-
Koresmos == no,
Kokkina_oligochate == no,
Yparxi_Izhmatwn == anoixta,
Tupos_upostromatos == kanonikos,
Murodia_Nerou == no,!,
Answer = 'Kanena provlima anoxias'.


rule(rid11, values(Koresmos, [Yparxi_NO3, Kokkina_oligochate, Yparxi_Izhmatwn, 
Yparxi_H2S, Tupos_upostromatos, Yparxi_CH4, Murodia_Nerou]), Answer):-
Koresmos == no,
Kokkina_oligochate == no,
Yparxi_Izhmatwn == anoixta,
Tupos_upostromatos == kanonikos,
Murodia_Nerou == yes,!,
Answer = 'Metria anoxia'.
