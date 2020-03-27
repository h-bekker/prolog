member(E, [E|_]).
member(E, [_|T]):- member(E,T).
append([], L, L).
append([X|T], L, [X|Res]):- append(T, L, Res).
length1([], 0).
length1([_|T], N):- length1(T, M), N is M+1.
len(L, N):- len(L, N, 0).
len([], N, N).
len([_|T], N, Acc):- Acc1 is Acc+1, len(T, N, Acc1).
reverse([], []).
reverse([X|T], Res):- reverse(T, T1), append(T1, [X], Res).
rev(L1, L2):- rev([], L1, L2).
rev(Ac, [], Ac).
rev(Ac, [X|T], L2):- rev([X|Ac], T, L2).
delete_one(E, [E|T], T).
delete_one(E, [X|T], [X|Res]):- delete_one(E, T, Res).
insert(E, L, Res):- delete_one(E, Res, L).
delete_first(E, [E|T], T):- !.
delete_first(E, [X|T], [X|Res]):- delete_first(E, T, Res).
delete_last(E, [X|T], [X|Res]):- delete_last(E, T, Res), !.
delete_last(E, [E|T], T).
dif(X, X):- !, fail.
dif(_, _).
not(G):- G, !, fail.
not(_).
delete_all(_, [], []).
delete_all(E, [E|T], S):- !, delete_all(E, T, S).
delete_all(E, [X|T], [X|S]):- delete_all(E, T, S).
no_dub([], []).
no_dub([X|T], Res):- member(X,T), !, no_dub(T, Res).
no_dub([X|T], [X|Res]):- no_dub(T, Res).
per([], []).
per([X|T], T2):- per(T, T1), insert(X, T1, T2).
union([], M, M).
union([X|T], M2, M3):- member(X, M2), !, union(T, M2, M3).
union([X|T], M2, [X|M3]):- union(T, M2, M3).
myunion(M1, M2, M3):- union(M1, M2, M), per(M, M3), !.
intercept([], _, []).
intercept([X|T], M2, [X|M3]):- member(X, M2), !, intercept(T, M2, M3).
intercept([_|T], M2, M3):- intercept(T, M2, M3).
interception(M1, M2, M3):- intercept(M1, M2, M), per(M, M3), !.
range(M, N, [M|Ns]):- M<N, M1 is M+1, range(M1, N, Ns).
range(N, N, [N]).
domain([X], [Y], [pair(X,Y)]):- !.
domain([X|Xs], L2, [pair(X,Y)|Res]):- member(Y, L2), delete_first(Y, L2, NewL2), domain(Xs, NewL2, Res).
check([_]):- !.
check([X|Xs]):- check(Xs, X), check(Xs).
check([], _):- !.
check([pair(X1, Y1)|Xs], pair(X2, Y2)):- X2 - X1 =\= Y1 - Y2, X2 - X1 =\= Y2 - Y1, check(Xs, pair(X2, Y2)).
queen_solution(N, Res):- range(1, N, L), domain(L, L, Res), check(Res).
len_queen_solution(K, N):- findall(Res, queen_solution(K, Res), ListRes), len(ListRes, N).
rowNew(X, Y, Z):- row(X, Y, Z); row(Y, X, Z).
path(From, To, Res):- path(From, To, [From], Res).
path(From, To, ListCity, TotalRes):- rowNew(From, To, _), !, reverse([To|ListCity], TotalRes).
path(From, To, ListCity, TotalRes):- rowNew(From, City, _), not(member(City, ListCity)), path(City, To, [City|ListCity], TotalRes).

check_head(X, [X|_]).
has_dbl([X|T]):- check_head(X, T); has_dbl(T).

similar([], []).
similar([X|T1], [X|T2]):- similar(T1, T2).
similar([[_|_]|T1], [[_|_]|T2]):- similar(T1, T2).

shrink(L, R):- shrink(L, R, 0).
shrink(L, [], N):- len(L, K), N+K < 3.
shrink([X|T1], [X|T2], N):- shrink(T1, T2, N).
shrink([X|T1], [Y|T2], N):- N < 3, M is N+1, shrink(T1, [Y|T2], M).

strike([_,_|T], T).
strike([X|T1], [X|T2]):- strike(T1, T2).
