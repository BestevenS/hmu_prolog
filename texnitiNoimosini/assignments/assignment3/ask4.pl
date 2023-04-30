% Βασικοί κανόνες γραμματικής
sentence --> noun_phrase(N), verb_phrase(N).

noun_phrase(N) --> det, noun(N).
verb_phrase(N) --> verb(N), noun_phrase(_).
verb_phrase(N) --> verb(N).

% Ορίζοντας τα λεκτικά
det --> [a].
det --> [the].
det --> ['τίποτα'].

% Ορίζοντας τα ουσιαστικά και τις μορφές τους
noun(singular) --> [dog].
noun(singular) --> [cat].
noun(singular) --> [boy].
noun(singular) --> [girl].
noun(plural) --> [dogs].
noun(plural) --> [cats].
noun(plural) --> [boys].
noun(plural) --> [girls].

% Ορίζοντας τα ρήματα και τις μορφές τους
verb(singular) --> [chases].
verb(singular) --> [sees].
verb(singular) --> [says].
verb(singular) --> [believes].
verb(plural) --> [chase].
verb(plural) --> [see].
verb(plural) --> [say].
verb(plural) --> [believe].
