sentence --> noun_phrase(Number), verb_phrase(Number).

noun_phrase(Number) --> det, noun(Number).

verb_phrase(Number) --> verb(Number), noun_phrase(_).
verb_phrase(Number) --> verb(Number).

det --> [a].
det --> [the].
det --> ['τίποτα'].

noun(singular) --> [dog].
noun(singular) --> [cat].
noun(singular) --> [boy].
noun(singular) --> [girl].
noun(plural) --> [dogs].
noun(plural) --> [cats].
noun(plural) --> [boys].
noun(plural) --> [girls].

verb(singular) --> [chases].
verb(plural) --> [chase].
verb(singular) --> [sees].
verb(plural) --> [see].
verb(singular) --> [says].
verb(plural) --> [say].
verb(singular) --> [believes].
verb(plural) --> [believe].
