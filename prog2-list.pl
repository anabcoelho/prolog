membro(X, [X|_]).
membro(X, [Y|T]):- Y \= X, membro(X,T).


ultimo(A,[A]).
ultimo(X,[_|T]):- ultimo(X,T).

inverte([],[]).
inverte([X|T],L1):- inverte(T,L2), conc(L2,[X],L1).

palindromo(L):-inverte(L,L).

insere(X,L,[X|L]).

insere2(X,L,L):- membro(X,L),!.
insere2(X,L,[X|L]).

insere3(X,L,R):-del(X,R,L).

tamanho([_|L],N):-tamanho(L,N1), N is N1+1.

lshift([],[]).
lshift([L1|T],R):-conc(T,[L1],R).

rshift(L1,[X|T]):-conc(T,[X],L1).

del(X,[X|T],T). 
del(X,[Y|T1],[Y|T2]) :- del(X,T1,T2).

replace(_,_,[],[]).
replace(X,Y,[X|L1],[Y|L2]) :- !, replace(X,Y,L1,L2).
replace(X,Y,[Z|L1],[Z|L2]) :- replace(X,Y,L1,L2).

replace2(_, _, [], []).
replace2(X, R, [X|T], [R|T2]) :- replace(X, R, T, T2).
replace2(X, R, [H|T], [H|T2]) :- H\=X, replace(X, R, T, T2).

insere4(X,[],X).
insere4(X,[T|H],[T|L]):-insere4(X,H,L).

permutacao2([],[]).
permutacao2([X],[X]):- !.
permutacao2([H|T],P):- permutacao2(T,T1), insere4(L1,L2,T1), insere4(L1,[H],P1), insere4(P1,L2,P).

par([]).
par([_|T]):- impar(T).
impar([_|T]):- par(T).

permutacao([],[]).
permutacao([X],[X]):-!.
permutacao([X|T],P):- insere3(X,T,P).
permutacao([X|T],P):-permutacao(T,T2),insere3(X,T2,P).

prodescalar([],[],0).
prodescalar([X1|T1],[X2|T2],P):- Y is X1*X2, prodescalar(T1,T2,R), P is Y+R.  

vogal(X):- membro(X,[a,e,i,o,u]).
nvogais([],0).
nvogais([H|T],N):- vogal(H), nvogais(T,N1), N is N1 + 1,!.
nvogais([_|T],N):- nvogais(T,N).

inserttail(N,[],[N]).
inserttail(N,[H|T],[H|R]):-inserttail(N,T,R).

split([],[],[]).
split([H|T],[H|P],N):- H>=0, split(T,P,N).
split([H|T],P,[H|N]):- H<0, split(T,P,N).

removedup([],[]).
removedup([H|T],L2) :- membro(H,T),!,removedup(T,L2).
removedup([H|T],[H|L2]):-removedup(T,L2).

del2(_,[],[]).
del2(X,[X|T],L2) :- del2(X,T,L2),!.
del2(X,[H|T],[H|L2]):- del2(X,T,L2).

intersect([], _, []).
intersect([H1|T1], L2, [H1|R]):- membro(H1, L2), intersect(T1, L2, R), !.
intersect([_|T1], L2, R):- intersect(T1, L2, R).


membro2(X,L):- conc(_,[X|_],L).



%sublista([],_).
%sublista([X|T],Y) :- membro(X,Y) , sublista(T,Y).

%sublista(Prefix, [_|Ys]) :- sublista(Prefix, Ys).

sublista([],[]).
sublista([X|L],[X|S]) :- sublista(L,S).
sublista([X,Y|L],[X,Y|S]) :- sublista(L,S).
sublista(L, [_|S]) :- sublista(L,S).



sublist([],[]).
sublist(X,L):-append(_,S,L), append(X,_,S).

sublista([],[]).
sublista(X,L):- conc(L1,[X|L2],L),membro(X,L).


conc([],L,L).
conc([X|T1],L2,[X,T2]):- conc(T1,L2,T2).


vizinhos([],_,[]):-fail.
vizinhos(_,[],[]):-fail.
vizinhos(X,Y,[X,Y|_]).
vizinhos(X,Y,[Y,X|_]).
vizinhos(X,Y,[_|T]) :- vizinhos(X,Y,T).


vizinhos1([],_,[]).
vizinhos1([X],X,[]).
vizinhos1(X,Y,[X,Y|_]).
vizinhos1(X,Y,[_|T]) :- vizinhos(X,Y,T).

