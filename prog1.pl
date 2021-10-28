

par([]).
par([_|T]):- impar(T).
impar([_|T]):- par(T).

qi(1,1).
qi(N,Q):- Q is 2*N-1.

min(X,Y,X) :- X=<Y, ! .
min(X,Y,Y).

pai(abraao,ismael).
pai(abraao,isaac).
pai(isaac,esau).
pai(isaac,jaco).

avo(X,Y):-pai(X,Filho), pai(Filho,Y).
irmaos(X,Y):-pai(Pai,X), pai(Pai,Y), X/=Y.
descendente(X,Y):-pai(X,Y).
descendente(X,Y):-pai(Z,Y), descendente(X,Z).

baskara(A,B,C,R1,R2):-
	Delta is B*B-4*A*C,
	R1 is (-B+sqrt(Delta)/2*A),
	R2 is ((-B-sqrt(Delta)/2*A).

funcao(X,0):- X<3, !.
funcao(X,2):- X>=3, X<6, !.
funcao(X,4):- X>=6.

mdc(X,0,X).
mdc(A,B,D):- R is A mod B, mdc (B,R,D).


fib(1,1):-!.
fib(2,1):-!.
fib(N,F):- N1 is N-1, fib(N1,F1), N2 is N-2, fib(N2,F2), F is F1+F2.

lucas(1,1).
lucas(2,3).
lucas(N,L):- N>=3, N1 is N-1, N2 is N-2, lucas(N1,L1), lucas(N2,L2), L is L1+L2.

iRenda(S,0):- S=< 1058,!.
iRenda(S,I):- S>=1058, S=<2115, 
D is 15/100, D1 is D * S, A is D1 - 158.70,
arredonda(A,I,2),!.
iRenda(S,I):- D is 27.5/100,D1 is  D * S, A is D1 - 423.08, arredonda(A,I,2).

arredonda(X,Y,D) :- Z is X * 10^D, round(Z, ZA), Y is ZA / 10^D.
