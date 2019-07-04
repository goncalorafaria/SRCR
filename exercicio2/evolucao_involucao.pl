%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolução/Involução de conhecimento

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolução de conhecimento perfeito (positivo e negativo)

% Insere novo conhecimento na base de conhecimento
evolucao(T) :-
    solucoes(I, +T::I, Linv),
    insercao(T),
    teste(Linv).

% Insere conhecimento perfeito positivo na base de conhecimento
evolucao(T, positivo) :-
    solucoes(I, +T::I, Linv),
    insercao(T),
    teste(Linv).

% Insere conhecimento perfeito negativo na base de conhecimento
evolucao(T, negativo) :-
    solucoes(I, +(-T)::I, Linv),
    insercao(-T),
    teste(Linv).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolução de conhecimento imperfeito incerto

%--- Utente

% Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do utente com nome desconhecido
evolucao(utente(Id,Nome_desconhecido,I,G,M), utente, incerto, nome) :-
    evolucao(utente(Id,Nome_desconhecido,I,G,M), positivo),
    insercao((excecao(utente(IdUt,Nome,Idade,Genero,Morada)) :-
                    utente(IdUt,Nome_desconhecido,Idade,Genero,Morada))).

% Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do utente com idade desconhecida
evolucao(utente(Id,N,Idade_desconhecida,G,M), utente, incerto, idade) :-
    evolucao(utente(Id,N,Idade_desconhecida,G,M), positivo),
    insercao((excecao(utente(IdUt,Nome,Idade,Genero,Morada)) :-
                    utente(IdUt,Nome,Idade_desconhecida,Genero,Morada))).

% Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do utente com genero desconhecido
evolucao(utente(Id,N,I,Genero_desconhecido,M), utente, incerto, genero) :-
    evolucao(utente(Id,N,I,Genero_desconhecido,M), positivo),
    insercao((excecao(utente(IdUt,Nome,Idade,Genero,Morada)) :-
                    utente(IdUt,Nome,Idade,Genero_desconhecido,Morada))).

% Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do utente com morada desconhecida
evolucao(utente(Id,N,I,G,Morada_desconhecida), utente, incerto, morada) :-
    evolucao(utente(Id,N,I,G,Morada_desconhecida), positivo),
    insercao((excecao(utente(IdUt,Nome,Idade,Genero,Morada)) :-
                    utente(IdUt,Nome,Idade,Genero,Morada_desconhecida))).

%--- Prestador

% Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do prestador com nome desconhecido
evolucao(prestador(Id,Nome_desconhecido,I,G,E,Inst), prestador, incerto, nome) :-
    evolucao(prestador(Id,Nome_desconhecido,I,G,E,Inst), positivo),
    insercao((excecao(prestador(IdPrest,Nome,Idade,Genero,Especialidade,Instituicao)) :-
                    prestador(IdPrest,Nome_desconhecido,Idade,Genero,Especialidade,Instituicao))).

% Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do prestador com idade desconhecida
evolucao(prestador(Id,N,Idade_desconhecida,G,E,Inst), prestador, incerto, idade) :-
    evolucao(prestador(Id,N,Idade_desconhecida,G,E,Inst), positivo),
    insercao((excecao(prestador(IdPrest,Nome,Idade,Genero,Especialidade,Instituicao)) :-
                    prestador(IdPrest,Nome,Idade_desconhecida,Genero,Especialidade,Instituicao))).

% Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do prestador com genero desconhecido
evolucao(prestador(Id,N,I,Genero_desconhecido,E,Inst), prestador, incerto, genero) :-
    evolucao(prestador(Id,N,I,Genero_desconhecido,E,Inst), positivo),
    insercao((excecao(prestador(IdPrest,Nome,Idade,Genero,Especialidade,Instituicao)) :-
                    prestador(IdPrest,Nome,Idade,Genero_desconhecido,Especialidade,Instituicao))).

% Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do prestador com especialidade desconhecida
evolucao(prestador(Id,N,I,G,Especialidade_desconhecida,Inst), prestador, incerto, especialidade) :-
    evolucao(prestador(Id,N,I,G,Especialidade_desconhecida,Inst), positivo),
    insercao((excecao(prestador(IdPrest,Nome,Idade,Genero,Especialidade,Instituicao)) :-
                    prestador(IdPrest,Nome,Idade,Genero,Especialidade_desconhecida,Instituicao))).

% Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do prestador com instituicao desconhecida
evolucao(prestador(Id,N,I,G,E,Instituicao_desconhecida), prestador, incerto, instituicao) :-
    evolucao(prestador(Id,N,I,G,E,Instituicao_desconhecida), positivo),
    insercao((excecao(prestador(IdPrest,Nome,Idade,Genero,Especialidade,Instituicao)) :-
                    prestador(IdPrest,Nome,Idade,Genero,Especialidade,Instituicao_desconhecida))).

%--- Cuidado

% Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do cuidado com data desconhecida
evolucao(cuidado(Data_desconhecida,IdUt,IdPrest,Desc,C), cuidado, incerto, data) :-
    evolucao(cuidado(Data_desconhecida,IdUt,IdPrest,Desc,C), positivo),
    insercao((excecao(cuidado(Data,IdUtente,IdPrestador,Descricao,Custo)) :-
                    cuidado(Data_desconhecida,IdUtente,IdPrestador,Descricao,Custo))).

% Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do cuidado com id de utente desconhecido
evolucao(cuidado(D,IdUtente_desconhecido,IdPrest,Desc,C), cuidado, incerto, idutente) :-
    evolucao(cuidado(D,IdUtente_desconhecido,IdPrest,Desc,C), positivo),
    insercao((excecao(cuidado(Data,IdUtente,IdPrestador,Descricao,Custo)) :-
                    cuidado(Data,IdUtente_desconhecido,IdPrestador,Descricao,Custo))).

% Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do cuidado com id de prestador desconhecido
evolucao(cuidado(D,IdUt,IdPrestador_desconhecido,Desc,C), cuidado, incerto, idprestador) :-
    evolucao(cuidado(D,IdUt,IdPrestador_desconhecido,Desc,C), positivo),
    insercao((excecao(cuidado(Data,IdUtente,IdPrestador,Descricao,Custo)) :-
                    cuidado(Data,IdUtente,IdPrestador_desconhecido,Descricao,Custo))).

% Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do cuidado com descrição desconhecida
evolucao(cuidado(D,IdUt,IdPrest,Descricao_desconhecida,C), cuidado, incerto, descricao) :-
    evolucao(cuidado(D,IdUt,IdPrest,Descricao_desconhecida,C), positivo),
    insercao((excecao(cuidado(Data,IdUtente,IdPrestador,Descricao,Custo)) :-
                    cuidado(Data,IdUtente,IdPrestador,Descricao_desconhecida,Custo))).

% Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do cuidado com custo desconhecido
evolucao(cuidado(D,IdUt,IdPrest,Desc,Custo_desconhecido), cuidado, incerto, custo) :-
    evolucao(cuidado(D,IdUt,IdPrest,Desc,Custo_desconhecido), positivo),
    insercao((excecao(cuidado(Data,IdUtente,IdPrestador,Descricao,Custo)) :-
                    cuidado(Data,IdUtente,IdPrestador,Descricao,Custo_desconhecido))).

%--- Exame

% Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do cuidado com id de utente desconhecido
evolucao(exame(IdUtente_desconhecido,IdPrest,Desc), exame, incerto, idutente) :-
    evolucao(exame(IdUtente_desconhecido,IdPrest,Desc), positivo),
    insercao((excecao(exame(IdUtente,IdPrestador,Descricao)) :-
                    exame(IdUtente_desconhecido,IdPrestador,Descricao))).

% Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do exame com id de prestador desconhecido
evolucao(exame(IdUt,IdPrestador_desconhecido,Desc), exame, incerto, idprestador) :-
    evolucao(exame(IdUt,IdPrestador_desconhecido,Desc), positivo),
    insercao((excecao(exame(IdUtente,IdPrestador,Descricao)) :-
                    exame(IdUtente,IdPrestador_desconhecido,Descricao))).

% Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do exame com descrição desconhecida
evolucao(exame(IdUt,IdPrest,Descricao_desconhecida), exame, incerto, descricao) :-
    evolucao(exame(IdUt,IdPrest,Descricao_desconhecida), positivo),
    insercao((excecao(exame(IdUtente,IdPrestador,Descricao)) :-
                    exame(IdUtente,IdPrestador,Descricao_desconhecida))).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolução de conhecimento imperfeito impreciso

% Insere conhecimento imperfeito impreciso na base de conhecimento
% seja de utente, prestador, cuidado ou exame
evolucao(T, impreciso) :-
    solucoes(I, +(excecao(T))::I, Lint),
    insercao(excecao(T)),
    teste(Lint).

% Insere conhecimento imperfeito impreciso na base de conhecimento
% no caso de utente com idade contida dentro de um intervalo finito de valores
evolucao(utente(Id,N,Idade_imprecisa,G,M), utente, impreciso, idade, LimiteInferior, LimiteSuperior) :-
    insercao((excecao(utente(Id,N,Idade_imprecisa,G,M)) :-
                    Idade_imprecisa >= LimiteInferior, Idade_imprecisa =< LimiteSuperior)).

% Insere conhecimento imperfeito impreciso na base de conhecimento
% no caso de prestador com idade contida dentro de um intervalo finito de valores
evolucao(prestador(Id,N,Idade_imprecisa,G,E,Inst), prestador, impreciso, idade, LimiteInferior, LimiteSuperior) :-
    insercao((excecao(prestador(Id,N,Idade_imprecisa,G,E,Inst)) :-
                    Idade_imprecisa >= LimiteInferior, Idade_imprecisa =< LimiteSuperior)).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolução de conhecimento imperfeito interdito

% Insere conhecimento imperfeito interdito na base de conhecimento
% no caso de utente com nome interdito
 evolucao(utente(Id,Nome_impossivel,I,G,M), utente, interdito, nome) :-
    evolucao(utente(Id,Nome_impossivel,I,G,M), positivo),
    insercao((excecao(utente(IdUt,Nome,Idade,Genero,Morada)) :-
                utente(IdUt,Nome_impossivel,Idade,Genero,Morada))),
    insercao((nulointerdito(Nome_impossivel))).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Involução de conhecimento perfeito (positivo e negativo)

% Retira conhecimento da base de conhecimento
involucao(T) :-
    solucoes(I, -T::I, Linv),
    remocao(T),
    teste(Linv).

% Retira conhecimento perfeito positivo na base de conhecimento
involucao(T, positivo) :-
    solucoes(I, -T::I, Linv),
    remocao(T),
    teste(Linv).

% Retira conhecimento perfeito negativo na base de conhecimento
involucao(T, negativo) :-
    solucoes(I, -(-T)::I, Linv),
    remocao(-T),
    teste(Linv).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Involução de conhecimento imperfeito incerto

%--- Utente

% Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do utente com nome desconhecido
involucao(utente(Id,Nome_desconhecido,I,G,M), utente, incerto, nome) :-
    involucao(utente(Id,Nome_desconhecido,I,G,M), positivo),
    remocao((excecao(utente(IdUt,Nome,Idade,Genero,Morada)) :-
                     utente(IdUt,Nome_desconhecido,Idade,Genero,Morada))).

% Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do utente com morada desconhecida
involucao(utente(Id,N,I,G,Morada_desconhecida), utente, incerto, morada) :-
    involucao(utente(Id,N,I,G,Morada_desconhecida), positivo),
    remocao((excecao(utente(IdUt,Nome,Idade,Genero,Morada)) :-
                     utente(IdUt,Nome,Idade,Genero,Morada_desconhecida))).

% Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do utente com idade desconhecida
involucao(utente(Id,N,Idade_desconhecida,G,M), utente, incerto, idade) :-
    involucao(utente(Id,N,Idade_desconhecida,G,M), positivo),
    remocao((excecao(utente(IdUt,Nome,Idade,Genero,Morada)) :-
                    utente(IdUt,Nome,Idade_desconhecida,Genero,Morada))).

% Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do utente com genero desconhecido
involucao(utente(Id,N,I,Genero_desconhecido,M), utente, incerto, genero) :-
    involucao(utente(Id,N,I,Genero_desconhecido,M), positivo),
    remocao((excecao(utente(IdUt,Nome,Idade,Genero,Morada)) :-
                     utente(IdUt,Nome,Idade,Genero_desconhecido,Morada))).

%--- Prestador

% Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do prestador com nome desconhecido
involucao(prestador(Id,Nome_desconhecido,I,G,E,Inst), prestador, incerto, nome) :-
    involucao(prestador(Id,Nome_desconhecido,I,G,E,Inst), positivo),
    remocao((excecao(prestador(IdPrest,Nome,Idade,Genero,Especialidade,Instituicao)) :-
                     prestador(IdPrest,Nome_desconhecido,Idade,Genero,Especialidade,Instituicao))).

% Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do prestador com idade desconhecida
involucao(prestador(Id,N,Idade_desconhecida,G,E,Inst), prestador, incerto, idade) :-
    involucao(prestador(Id,N,Idade_desconhecida,G,E,Inst), positivo),
    remocao((excecao(prestador(IdPrest,Nome,Idade,Genero,Especialidade,Instituicao)) :-
                     prestador(IdPrest,Nome,Idade_desconhecida,Genero,Especialidade,Instituicao))).

% Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do prestador com genero desconhecido
involucao(prestador(Id,N,I,Genero_desconhecido,E,Inst), prestador, incerto, genero) :-
    involucao(prestador(Id,N,I,Genero_desconhecido,E,Inst), positivo),
    remocao((excecao(prestador(IdPrest,Nome,Idade,Genero,Especialidade,Instituicao)) :-
                     prestador(IdPrest,Nome,Idade,Genero_desconhecido,Especialidade,Instituicao))).

% Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do prestador com especialidade desconhecida
involucao(prestador(Id,N,I,G,Especialidade_desconhecida,Inst), prestador, incerto, especialidade) :-
    involucao(prestador(Id,N,I,G,Especialidade_desconhecida,Inst), positivo),
    remocao((excecao(prestador(IdPrest,Nome,Idade,Genero,Especialidade,Instituicao)) :-
                     prestador(IdPrest,Nome,Idade,Genero,Especialidade_desconhecida,Instituicao))).

% Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do prestador com instituicao desconhecida
involucao(prestador(Id,N,I,G,E,Instituicao_desconhecida), prestador, incerto, instituicao) :-
    involucao(prestador(Id,N,I,G,E,Instituicao_desconhecida), positivo),
    remocao((excecao(prestador(IdPrest,Nome,Idade,Genero,Especialidade,Instituicao)) :-
                     prestador(IdPrest,Nome,Idade,Genero,Especialidade,Instituicao_desconhecida))).

%--- Cuidado

% Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do cuidado com data desconhecida
involucao(cuidado(Data_desconhecida,IdUt,IdPrest,Desc,C), cuidado, incerto, data) :-
    involucao(cuidado(Data_desconhecida,IdUt,IdPrest,Desc,C), positivo),
    remocao((excecao(cuidado(Data,IdUtente,IdPrestador,Descricao,Custo)) :-
                     cuidado(Data_desconhecida,IdUtente,IdPrestador,Descricao,Custo))).

% Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do cuidado com id de utente desconhecido
involucao(cuidado(D,IdUtente_desconhecido,IdPrest,Desc,C), cuidado, incerto, idutente) :-
    involucao(cuidado(D,IdUtente_desconhecido,IdPrest,Desc,C), positivo),
    remocao((excecao(cuidado(Data,IdUtente,IdPrestador,Descricao,Custo)) :-
                     cuidado(Data,IdUtente_desconhecido,IdPrestador,Descricao,Custo))).

% Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do cuidado com id de prestador desconhecido
involucao(cuidado(D,IdUt,IdPrestador_desconhecido,Desc,C), cuidado, incerto, idprestador) :-
    involucao(cuidado(D,IdUt,IdPrestador_desconhecido,Desc,C), positivo),
    remocao((excecao(cuidado(Data,IdUtente,IdPrestador,Descricao,Custo)) :-
                     cuidado(Data,IdUtente,IdPrestador_desconhecido,Descricao,Custo))).

% Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do cuidado com descrição desconhecida
involucao(cuidado(D,IdUt,IdPrest,Descricao_desconhecida,C), cuidado, incerto, descricao) :-
    involucao(cuidado(D,IdUt,IdPrest,Descricao_desconhecida,C), positivo),
    remocao((excecao(cuidado(Data,IdUtente,IdPrestador,Descricao,Custo)) :-
                     cuidado(Data,IdUtente,IdPrestador,Descricao_desconhecida,Custo))).

% Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do cuidado com custo desconhecido
involucao(cuidado(D,IdUt,IdPrest,Desc,Custo_desconhecido), cuidado, incerto, custo) :-
    involucao(cuidado(D,IdUt,IdPrest,Desc,Custo_desconhecido), positivo),
    remocao((excecao(cuidado(Data,IdUtente,IdPrestador,Descricao,Custo)) :-
                     cuidado(Data,IdUtente,IdPrestador,Descricao,Custo_desconhecido))).

%--- Exame

% Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do cuidado com id de utente desconhecido
involucao(exame(IdUtente_desconhecido,IdPrest,Desc), exame, incerto, idutente) :-
    involucao(exame(IdUtente_desconhecido,IdPrest,Desc), positivo),
    remocao((excecao(exame(IdUtente,IdPrestador,Descricao)) :-
                    exame(IdUtente_desconhecido,IdPrestador,Descricao))).

% Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do exame com id de prestador desconhecido
involucao(exame(IdUt,IdPrestador_desconhecido,Desc), exame, incerto, idprestador) :-
    involucao(exame(IdUt,IdPrestador_desconhecido,Desc), positivo),
    remocao((excecao(exame(IdUtente,IdPrestador,Descricao)) :-
                    exame(IdUtente,IdPrestador_desconhecido,Descricao))).

% Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do exame com descrição desconhecida
involucao(exame(IdUt,IdPrest,Descricao_desconhecida), exame, incerto, descricao) :-
    involucao(exame(IdUt,IdPrest,Descricao_desconhecida), positivo),
    remocao((excecao(exame(IdUtente,IdPrestador,Descricao)) :-
                    exame(IdUtente,IdPrestador,Descricao_desconhecida))).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Involução de conhecimento imperfeito impreciso

% Retira conhecimento imperfeito impreciso na base de conhecimento
% seja de utente, prestador, cuidado ou exame
involucao(T, impreciso) :-
    solucoes(I, -(excecao(T))::I, Lint),
    remocao(excecao(T)),
    teste(Lint).

% Retira conhecimento imperfeito impreciso na base de conhecimento
% no caso de utente com idade contida dentro de um intervalo finito de valores
involucao(utente(Id,N,Idade_imprecisa,G,M), utente, impreciso, idade, LimiteInferior, LimiteSuperior) :-
    remocao((excecao(utente(Id,N,Idade_imprecisa,G,M)) :-
                    Idade_imprecisa >= LimiteInferior, Idade_imprecisa =< LimiteSuperior)).

% Retira conhecimento imperfeito impreciso na base de conhecimento
% no caso de prestador com idade contida dentro de um intervalo finito de valores
involucao(prestador(Id,N,Idade_imprecisa,G,E,Inst), prestador, impreciso, idade, LimiteInferior, LimiteSuperior) :-
    remocao((excecao(prestador(Id,N,Idade_imprecisa,G,E,Inst)) :-
                    Idade_imprecisa >= LimiteInferior, Idade_imprecisa =< LimiteSuperior)).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Involução de conhecimento imperfeito interdito

% Retira conhecimento imperfeito interdito na base de conhecimento
% no caso de utente com nome interdito
 involucao(utente(Id,Nome_impossivel,I,G,M), utente, interdito, nome) :-
    involucao(utente(Id,Nome_impossivel,I,G,M), positivo),
    remocao((excecao(utente(IdUt,Nome,Idade,Genero,Morada)) :-
                utente(IdUt,Nome_impossivel,Idade,Genero,Morada))),
    remocao((nulointerdito(Nome_impossivel))).
