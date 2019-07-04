%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Calcular o custo total dos cuidados de saúde por utente/serviço/instituição/data

totalUtente(IdUtente, Total) :-
    solucoes(Custo, consulta(_,_,IdUtente,_,Custo), Lista),
    soma(Lista, Total).


totalServico(IdServ, Total) :-
    solucoes(Custo, consulta(_,_,_,IdServ,Custo), Lista),
    soma(Lista, Total).


somaServicos([], 0).
somaServicos([X|XS], Total) :-
    somaServicos(XS, Acumulada),
    totalServico(X, TotalServico),
    Total is TotalServico + Acumulada.

totalInstituicao(NomeInstituicao, Total) :-
    solucoes(IdServico, servico(IdServico,_,NomeInstituicao,_), Lista),
    somaServicos(Lista, Total).


totalData(Data, Total) :-
    solucoes(Custo, consulta(_,Data,_,_,Custo), Lista),
    soma(Lista, Total).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Ordenar por quem gastou mais dinheiro

utentesComMaisDinheiroGasto(Tamanho, Resultado) :-
    solucoes(Id, utente(Id,N,I,G,F,C), I1),
    utenteParaParUtenteGastoTotal(I1, I2),
    mergeSortKeyValuePairASC(I2,I3),
    take(I3,Tamanho,I4),
    idUtenteParaUtente(I4,Resultado).

utenteParaParUtenteGastoTotal([],[]).
utenteParaParUtenteGastoTotal([X|XS], [(X,U)|I]) :-
    utenteParaParUtenteGastoTotal(XS,I),
    totalUtente(X, U).

idUtenteParaUtente([],[]).
idUtenteParaUtente([(Y0,Y1)|XS], [(U,Y1)|I]) :- idUtenteParaUtente(XS, I), utenteID(Y0,[U]).
