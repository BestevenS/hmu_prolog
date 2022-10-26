%sigenia(kostas,maria,paidi).
%sigenia(kostas,soula,sizigos).
%sigenia(kostas,manos,paidi).
%sigenia(nikos,anna,sizigos).
%sigenia(nikos,manos,paidi).
%sigenia(nikos,eleni,goneas).


kalipsi_ip_pe(kostas,nosokomeiaki).
kalipsi_ip_pe(nikos,nosokomeiaki).
%kalipsi_asf(kostas,pliris).
%kalipsi_asf(nikos,meriki).


eidos_asf(kostas,oikogeniaki).
eidos_asf(nikos,oikogeniaki).


apozimiosi(Asfalismenos, Asthenis, Nosokomeiaki, Poso, Eidos_syggeneias, pliris):- 
    kalipsi_asth(Asfalismenos,Asthenis, Eidos_syggeneias),
    kalipsi_ip_pe(Asfalismenos,Nosokomeiaki).
    %eidos_ip_pe(Asthenis,nosokomeiaki),
    %aitoum_apoz(Asfalismenos,Poso),
    %kalipsi_asf(Asfalismenos,pliris).

apozimiosi(Asfalismenos, Asthenis, Nosokomeiaki, Poso, Eidos_syggeneias, meriki):-
    kalipsi_asth(Asfalismenos,Asthenis, Eidos_syggeneias),
    kalipsi_ip_pe(Asfalismenos,Nosokomeiaki),
    %eidos_ip_pe(Asthenis,nosokomeiaki),
    %aitoum_apoz(Asfalismenos,Poso),
    Poso=<5000.
    %kalipsi_asf(Asfalismenos,meriki).

kalipsi_asth(Asfalismenos,Asthenis, paidi):-
    %sigenia(Asfalismenos,Asthenis,paidi),
    eidos_asf(Asfalismenos,oikogeniaki).

kalipsi_asth(Asfalismenos,Asthenis, sizigos):-
    %sigenia(Asfalismenos,Asthenis,sizigos),
    eidos_asf(Asfalismenos,oikogeniaki).

main:-
write('Grapse onoma'),nl,
read(Asfalismenos),nl,
write('Grapse poso'),nl,
read(Poso),nl,
write('Onoma astheni'),nl,
read(Asthenis),nl
write('eidos syggeneias me astheni'),nl,
read(Eidos_syggeneias),nl
write('Pliris/Meriki'),nl
read(Pliris_meriki),nl

%assert(eidos_ip_pe(Asthenis,nosokomeiaki)),
%assert(aitoum_apoz(Asfalismenos,Poso)),
apozimiosi(Asfalismenos, Asthenis, nosokomeiaki, Poso, Eidos_syggeneias, Pliris_meriki).

