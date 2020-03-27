mypred([X|T], [X|T1]):- mypred(T,T1).
mypred([X|L], [X,X|L]).
