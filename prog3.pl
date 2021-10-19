posneg :- write('Digite um número'), read(X), calc(X).
calc(X):- X>0, write(X), write('é positivo'), !.
calc(X):- X<0, write(X), write('é negativo'), !.
calc(X):- write(X), write('zero').

% tab(N) imprime N espaços em branco na tela
% nl, sem argumentos, inicia uma nova linha.

classe(a,vog).
classe(b,con).
classe(c,con).
classe(d,con).
classe(e,vog).

containteiros([],0).
containteiros([X|T,L):- integer(X),!,containteiros(T,N),L is N+1.
containteiros([X|T,N):- containteiros(T,N).

retang(0):-!.
retang(N):-N1 is N-1, write('*'),retang(N1).