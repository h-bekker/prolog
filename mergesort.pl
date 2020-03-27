splitlist(L, [], L, 0).
splitlist([X|T], [X|A], B, N) :- Nminus1 is N-1, splitlist(T, A, B, Nminus1).

halfhalf(L, A, B) :- length(L, Len), Half is Len//2, splitlist(L, A, B, Half).

merge(A, [], A).
merge([], B, B).
merge([Xa|Ta], [Xb|Tb], R) :- Xa =< Xb, merge(Ta, [Xb|Tb], M), R = [Xa|M].
merge([Xa|Ta], [Xb|Tb], R) :- Xa > Xb, merge(Tb, [Xa|Ta], M), R = [Xb|M].

merge_sort([], []).
merge_sort([E], [E]).
merge_sort([X1, X2], [X1, X2]) :- X1 =< X2.
merge_sort([X1, X2], [X2, X1]) :- X1 > X2.
merge_sort(L, R) :- halfhalf(L, A, B), merge_sort(A, Asort), merge_sort(B, Bsort), merge(Asort, Bsort, R).
