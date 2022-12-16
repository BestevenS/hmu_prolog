/*Τα παρακατω δεδομενα ειναι ετοιμα απο 
την εκφώνηση*/

kb('Giannis', likes,maths).
kb('Giannis',likes,physics).
kb('Giannis',plays,voleyball).
kb('Giannis',plays,chess).
kb('Giannis',plays,backetball).
kb('Maria',likes,maths).
kb('Maria',likes,geography).
kb('Maria',plays,chess).
kb('Maria',plays,tennis).
kb('Eleni',likes,physics).
kb('Eleni',likes,informatics).
kb('Eleni',plays,voleyball).
kb('Eleni',plays,tennis).

%Φτιαχνεται σαν ενα μικρο μενου στο οποιο ζηταω
%απο τον χρηστη να μου δωσει μια επιλογη και την
%χρησιμοποιω για να κανω πραγματα, οπως
% 1. ζηταω ονομα, 2. ζηταω μαθημα κ.ο.κ.

collect_results:-                        
	write('Menu\n'),
	write('Option 1. Name.\n'),
	write('Option 2. Lesson.\n'),
	write('Option 3. Game.\n'),
	write('Option 4. Action.\n'),
	write('Option 5. Exit.\n'),
	read(Choice),
	choice(Choice).

%στην επιλογη 1 ζηταω ενα ονομα και καλω ch1
%στην συνεχεια καλώ ξανα το μενου

choice(1):-
	write('Name: \n\t'),
	read(Fname),
	ch1(Fname), 
	collect_results.

%στην 2 ζηταω ενα μαθημα και καλω ch2 και 
%επειτα το μενου

choice(2):-
	write('Lesson: \n\t'),
	read(Maths),
	ch2(Maths), 
	collect_results.

%στην 3η ζηταω παιχνιδι, καλω ch3, μενου

choice(3):-
	write('Game: \n\t'),
	read(G),
	ch3(G), 
	collect_results.

%4η. ζηταω Action, καλω ch4 και τελος μενου

choice(4):-
	write('Action: ( likes or plays).\n\t'),
	read(V),
	ch4(V), 
	collect_results.

%Στην 5η απλα σταματαω να καλω το μενου(collect_results)

choice(5):-
	write('exit').

%Αυτο καλειται απο την 1η και με χαρη στο ονομα
%αναζητουμε για ποια μαθηματα και ποια παιχνιδια
%αντιστοιχουνται στο ατομο με ονομα Fname

ch1(Fname):-
		findall((Fname,Y,Z,'\n'),
		kb(Fname,Y,Z),L),
		writeln(L).

%Ερχομενος απο την 2η επιλογη εχουμε στηδιαθεση μας
%το μαθημα, χαρη σε αυτο ψαχνουμε σε ποιους φοιτητες
%αρεσει αυτο το μαθημα

ch2(Maths):-
		Y=likes,
		findall((X,Y,Maths,'\n'),
		kb(X,Y,Maths),L),
		writeln(L).

%βρισκουμε σε ποιους αρεσει το παιχνιδι που εχει 
%καταχωρηθει στην μεταβλητη G

ch3(G):-	
		Y=plays,
		Z=G,
		findall((X,Y,Z,'\n'),
		kb(X,Y,Z),L),
		writeln(L).

%Στην 4η εαν διαβαστει το ρημα plays θα επιστρεψει
%τα παιχνιδια, εαν διαβαστει το ρημα likes θα επιστρεψει
%τα μαθηματα...

ch4(V):-
		findall((X,V,Z,'\n'),
		kb(X,V,Z),L),
		writeln(L).