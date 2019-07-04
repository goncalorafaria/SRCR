%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

% Sistema de Representação de Conhecimento e Raciocínio com capacidade para
% caracterizar um universo de discurso na área da prestação de cuidados de
% saúde pela realização de serviços de atos médicos

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag(discontiguous_warnings,off).
:- set_prolog_flag(single_var_warnings,off).
:- set_prolog_flag(unknown,fail).

:- op(900,xfy,'::').
:- op(1100,xfy,'??').

:- dynamic '-'/1.
:- dynamic utente/5.
:- dynamic prestador/6.
:- dynamic cuidado/5.
:- dynamic exame/3.

:- dynamic excecao/1.
:- dynamic nulointerdito/1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Carregar predicados do ficheiro no qual é guardado o estado

:- include('state.pl').

:- include('evolucao_involucao.pl').
:- include('predicadosAuxiliares.pl').
:- include('invariantes.pl').

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Pressuposto do Mundo Fechado
% para o predicado utente e para o predicado prestador

-utente(Id,N,I,G,M) :-
    nao(utente(Id,N,I,G,M)),
    nao(excecao(utente(Id,N,I,G,M))).

-prestador(Id,N,I,G,E,Inst) :-
    nao(prestador(Id,N,I,G,E,Inst)),
    nao(excecao(prestador(Id,N,I,G,E,Inst))).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Sistema de Inferência

%- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado si: Questao,Resposta
%                                Resposta = {verdadeiro,falso,desconhecido}
% capaz de responder a uma única questão
si(Q,verdadeiro) :- Q.
si(Q,falso) :- -Q.
si(Q,desconhecido) :- nao(Q),
                      nao(-Q).

%- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado siLista: [Questao],[Resposta] -> {V,F,D}
% capaz de responder a várias questões em simultâneo
siLista([],[]).
siLista([Q|Qs],[R|Rs]) :- si(Q,R),
                          siLista(Qs,Rs).

%- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado queryConjuncao: [Questao],Resposta -> {V,F,D}
% capaz de fazer a conjunção de uma lista de questões
% produzindo um resultado final
queryConjuncao([],R).
queryConjuncao([Q],R) :- si(Q,R).
queryConjuncao([Q|Qs], R) :- si(Q, R1), queryConjuncao(Qs,R2), conjuncao(R1,R2,R).

% Extensao do predicado queryDisjuncao: [Questao],Resposta -> {V,F,D}
% capaz de fazer a disjunção de uma lista de questões
% produzindo um resultado final
queryDisjuncao([],R).
queryDisjuncao([Q],R) :- si(Q,R).
queryDisjuncao([Q|Qs], R) :- si(Q, R1), queryDisjuncao(Qs,R2), disjuncao(R1,R2,R).

%- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado query: (Operador, Questao1, Questao2),Resposta -> {V,F,D}
% capaz de fazer a conjunção ou a disjunção de duas questões
% produzindo um resultado final
query(('OR',Q1,Q2),R) :- query(Q1,R1), query(Q2,R2), disjuncao(R1,R2,R).
query(('AND',Q1,Q2),R) :- query(Q1,R1), query(Q2,R2), conjuncao(R1,R2,R).
query(Q,R) :- si(Q,R).

%- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado queries: [Questao], Resposta -> {V,F,D}
% capaz de fazer a conjunção e/ou disjunção de uma lista de questões
% produzindo um resultado final
queries([],verdadeiro).
queries([Q],R) :- si(Q,R).
queries([Q1,'AND'|Qs],R) :- si(Q1,R1),
                            queries(Qs,R2),
                            conjuncao(R1,R2,R).
queries([Q1,'OR'|Qs],R) :- si(Q1,R1),
                           queries(Qs,R2),
                           disjuncao(R1,R2,R).

%- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado conjuncao: X,Y -> {V,F,D}
conjuncao(verdadeiro,verdadeiro,verdadeiro).
conjuncao(verdadeiro,desconhecido,desconhecido).
conjuncao(desconhecido,verdadeiro,desconhecido).
conjuncao(desconhecido,desconhecido,desconhecido).
conjuncao(falso,_,falso).
conjuncao(_,falso,falso).

% Extensao do predicado disjuncao: X,Y -> {V,F,D}
disjuncao(verdadeiro,_,verdadeiro).
disjuncao(_,verdadeiro,verdadeiro).
disjuncao(falso,falso,falso).
disjuncao(falso,desconhecido,desconhecido).
disjuncao(desconhecido,falso,desconhecido).
disjuncao(desconhecido,desconhecido,desconhecido).
