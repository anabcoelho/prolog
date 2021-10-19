qsort([], []).
qsort([X|T], Ord) :- 
  split(X,T,Esq,Dir),
  qsort(Esq, EsqOrd),
  qsort(Dir, DirOrd),
  conc(EsqOrd, [X|DirOrd], Ord).

split(P, [], [], []).
split(P, [Y|T], [Y|TEsq], Dir) :- Y=<P, split(P, T, TEsq, Dir).
split(P, [Y|T], Esq, [Y|TDir]) :- Y>P,  split(P, T, Esq, TDir).

max(X,Y,X) :- X>=Y.
max(X,Y,Y) :- Y>X.

altura(nil, 0).
altura(t(nil,_,nil), 1).
altura(t(Esq,Raiz,Dir), A) :- 
  altura(Esq,AEsq), 
  altura(Dir,ADir), max(AEsq,ADir,M), A is M+1. 



coletaInt( nil , [] ).
coletaInt( tree( Left , Data , Right ) , L ) :-
  coletaInt( Left  , L1 ) ,
  coletaInt( Right , L2 ) ,
  append( L1 , [Data|L2] , L ).

imprime( t(nil,X,nil) ):-write (X).
imprime( t(Left,X,Right) ) :- imprime( Left ), imprime( Right ), write( X ), write( ' ' ). 

pyramid(N) :- pyramid(N, N-1).

pyramid(0, _) :- nl.
pyramid(N, K) :- N > 0, N1 is N - 1,
foreach(between(1, N1, _), write(" ")),
Q is 2 * (K - N1) + 1,
foreach(between(1, Q, _), write("*")),
foreach(between(1, N1, _), write(" ")),
nl, pyramid(N1, K).


retang(N) :-linha(N).
linha(0):-!.
linha(B):-imprima(*,B),nl,B1 is B-2,foreach(between(1,B1,_),recursao(B)),
imprima(*,B), linha(0).
recursao(B):- write('*'),tab(B),write('*'),nl.
imprima(C, 0).
imprima(C, N) :- N>0, N1 is N-1,imprima(C, N1),write(C).
