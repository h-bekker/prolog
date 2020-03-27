mypred([X,Y|L], [X|L]).
mypred([X|T], [X|T1]):- mypred(T,T1).
