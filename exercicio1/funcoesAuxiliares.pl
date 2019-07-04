%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Funções Auxiliares

% Encontra todas as soluções
solucoes(X, XS, R) :- XS, assert(tmp(X)), fail.
solucoes(X, XS, R) :- solucoesAux([], R).

solucoesAux(L, R) :- retract(tmp(X)), !, solucoesAux([X|L], R).
solucoesAux(R, R).

% Comprimento de uma lista
comprimento([], 0).
comprimento([_|XS], R) :- comprimento(XS, S), R is 1 + S.

% Inserção de conhecimento
insercao(Q) :- assert(Q).
insercao(Q) :- retract(Q), !, fail.

% Remoção de conhecimento
remocao(Q) :- retract(Q).
remocao(Q) :- assert(Q), !, fail.

% Testa se todos os predicados são verdadeiros
teste([]).
teste([I|L]) :- I, teste(L).

% Insere novo conhecimento na base de conhecimento
evolucao(T) :- solucoes(I, +T::I, Linv),
               insercao(T),
               teste(Linv).

% Retira conhecimento da base de conhecimento
involucao(T) :- solucoes(I, -T::I, Linv),
                remocao(T),
                teste(Linv).

% Averigua se elemento pertence a uma lista
pertence(A,[A|XS]).
pertence(A,[X|XS]) :- pertence(A,XS).

% Elimina os elementos repetidos numa lista
eliminaRepetidos(X, R) :- eliminaRepAux(X,[],R).

eliminaRepAux([],Acc,Acc).
eliminaRepAux([X|XS],Acc,R) :- pertence(X,Acc), eliminaRepAux(XS,Acc,R).
eliminaRepAux([X|XS],Acc,R) :- eliminaRepAux(XS,[X|Acc],R).

% Somatório
soma([],0).
soma([X|XS],Total) :- soma(XS, Acumulado), Total is X + Acumulado.

% Concatenar 2 listas
concat([], R, R).
concat([X|XS1], R, [X|XS2]) :- concat(XS1, R, XS2).

% Merge Sort
splitlist(L, [], L, 0).
splitlist([H|T], [H|A], B, N) :- Nminus1 is N-1, splitlist(T, A, B, Nminus1).

halfhalf(L, A, B) :- length(L, Len), Half is Len//2, splitlist(L, A, B, Half).

merge(A, [], A).
merge([], B, B).
merge([(X0,X1)|Ta], [(Y0,Y1)|Tb], R) :- X1 > Y1, merge(Ta, [(Y0,Y1)|Tb], M), R = [(X0,X1)|M].
merge([(X0,X1)|Ta], [(Y0,Y1)|Tb], R) :- X1 =< Y1, merge(Tb, [(X0,X1)|Ta], M), R = [(Y0,Y1)|M].

mergeSortKeyValuePairASC([], []).
mergeSortKeyValuePairASC([E], [E]).
mergeSortKeyValuePairASC([(X0,X1), (Y0,Y1)], [(X0,X1), (Y0,Y1)]) :- X1 > Y1.
mergeSortKeyValuePairASC([(X0,X1), (Y0,Y1)], [(Y0,Y1), (X0,X1)]) :- X1 =< Y1.
mergeSortKeyValuePairASC(L, R) :-
    halfhalf(L, A, B),
    mergeSortKeyValuePairASC(A, Asort),
    mergeSortKeyValuePairASC(B, Bsort),
    merge(Asort, Bsort, R).

% Pega nos N primeiros de uma lista
take(Lista,0,[]).
take([X|XS], N1, [X|I]) :- N0 is N1-1, take(XS,N0,I).

% Idade válida (>= 0)
idadeValida(I) :- I >= 0.

% Custo válido (>= 0)
custoValido(C) :- C >= 0.

% Género é masculino ('M') ou feminino ('F')
generoValido('M').
generoValido('F').
