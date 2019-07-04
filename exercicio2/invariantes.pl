%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariantes Estruturais e Referenciais

%- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
% Invariantes Universais

% Invariante que garante que não existe conhecimento
% perfeito positivo repetido
+T :: (solucoes(T, T, R),
       comprimento(R, 1)).

% Invariante que garante que não existe conhecimento
% perfeito negativo repetido
+(-T) :: (solucoes(T, -T, R),
          comprimento(R, 1)).

% Invariante que não permite adicionar conhecimento
% perfeito positivo que contradiz conhecimento perfeito negativo
+T :: nao(-T).

% Invariante que não permite adicionar conhecimento
% perfeito negativo que contradiz conhecimento perfeito positivo
+(-T) :: nao(T).

% Invariante que garante que não existem excecoes repetidas
+(excecao(T)) :: (solucoes(T, excecao(T), R),
                  comprimento(R, 1)).

%- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
% Invariantes Estruturais e Referenciais: Utente

% Invariante que garante que o id de cada utente é único
% para conhecimento perfeito positivo
+utente(Id,N,I,G,M) :: (solucoes(Id, utente(Id,_,_,_,_), R),
                        comprimento(R, 1)).

% Invariante que garante que o id de cada utente é único
% para conhecimento perfeito negativo
+(-utente(Id,N,I,G,M)) :: (solucoes(Id, -utente(Id,_,_,_,_), R),
                           comprimento(R, 1)).

% Garantir que utentes com ids diferentes têm diferente informação
% para conhecimento perfeito positivo
+utente(Id,N,I,G,M) :: (solucoes((N,I,G,M), utente(_,N,I,G,M), R),
                        comprimento(R, 1)).

% Garantir que utentes com ids diferentes têm diferente informação
% para conhecimento perfeito negativo
+(-utente(Id,N,I,G,M)) :: (solucoes((N,I,G,M), -utente(_,N,I,G,M), R),
                           comprimento(R, 1)).

% Garantir que a idade do utente é válida (>= 0)
% para conhecimento perfeito positivo
+utente(_,_,I,_,_) :: idadeValida(I).

% Garantir que a idade do utente é válida (>= 0)
% para conhecimento perfeito negativo
+(-utente(_,_,I,_,_)) :: idadeValida(I).

% Garantir que o género do utente é 'M' ou 'F'
% para conhecimento perfeito positivo
+utente(_,_,_,G,_) :: generoValido(G).

% Garantir que o género do utente é 'M' ou 'F'
% para conhecimento perfeito negativo
+(-utente(_,_,_,G,_)) :: generoValido(G).

% Invariante que impede a inserção de conhecimento perfeito positivo relativo
% a um utente com nome interdito (conhecimento imperfeito interdito)
+utente(Id,N,I,G,M) :: (solucoes((Id,Nint,I,G,M), (utente(Id,Nint,I,G,M), nulointerdito(Nint)), R),
                        comprimento(R,0)).

% Garantir que não é possível remover um utente com cuidados
-utente(Id,_,_,_,_) :: (solucoes(Id, cuidado(_,Id,_,_,_), R),
                        comprimento(R, 0)).

%- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
% Invariantes Estruturais e Referenciais: Prestador

% Invariante que garante que o id de cada prestador é único
% para conhecimento perfeito positivo
+prestador(Id,N,I,G,E,Inst) :: (solucoes(Id, prestador(Id,_,_,_,_,_), R),
                                comprimento(R, 1)).

% Invariante que garante que o id de cada prestador é único
% para conhecimento perfeito negativo
+(-prestador(Id,N,I,G,E,Inst)) :: (solucoes(Id, -prestador(Id,_,_,_,_,_), R),
                                   comprimento(R, 1)).

% Garantir que prestadores com ids diferentes têm diferente informação
% para conhecimento perfeito positivo
+prestador(Id,N,I,G,E,Inst) :: (solucoes((N,I,G,E,Inst), prestador(_,N,I,G,E,Inst), R),
                                comprimento(R, 1)).

% Garantir que prestadores com ids diferentes têm diferente informação
% para conhecimento perfeito negativo
+(-prestador(Id,N,I,G,E,Inst)) :: (solucoes((N,I,G,E,Inst), -prestador(_,N,I,G,E,Inst), R),
                                   comprimento(R, 1)).

% Garantir que a idade do prestador é válida (>= 0)
% para conhecimento perfeito positivo
+prestador(_,_,I,_,_,_) :: idadeValida(I).

% Garantir que a idade do prestador é válida (>= 0)
% para conhecimento perfeito negativo
+(-prestador(_,_,I,_,_,_)) :: idadeValida(I).

% Garantir que o género do prestador é 'M' ou 'F'
% para conhecimento perfeito positivo
+prestador(_,_,_,G,_,_) :: generoValido(G).

% Garantir que o género do prestador é 'M' ou 'F'
% para conhecimento perfeito negativo
+(-prestador(_,_,_,G,_,_)) :: generoValido(G).

% Garantir que não é possível remover um prestador com cuidados
-prestador(Id,_,_,_,_,_) :: (solucoes(Id, cuidado(_,_,Id,_,_), R),
                             comprimento(R, 0)).

%- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
% Invariantes Estruturais e Referenciais: Cuidado

% Garantir que o id do utente associado cuidado existe
+cuidado(_,IdUt,_,_,_) :: (solucoes(IdUt, utente(IdUt,_,_,_,_), R),
                           comprimento(R, 1)).

% Garantir que o id do prestador associado cuidado existe
+cuidado(_,_,IdPrest,_,_) :: (solucoes(IdPrest, prestador(IdPrest,_,_,_,_,_), R),
                              comprimento(R, 1)).

% Garantir que o custo de cada cuidado é válido (>= 0)
% para conhecimento perfeito positivo
+cuidado(_,_,_,_,C) :: custoValido(C).

% Garantir que o custo de cada cuidado é válido (>= 0)
% para conhecimento perfeito negativo
+(-cuidado(_,_,_,_,C)) :: custoValido(C).

%- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
% Invariantes Estruturais e Referenciais: Exame

% Garantir que o id do utente associado ao exame existe
+exame(IdUt,_,_) :: (solucoes(IdUt, utente(IdUt,_,_,_,_), R),
                     comprimento(R, 1)).

% Garantir que o id do prestador associado ao exame existe
+exame(_,IdPrest,_) :: (solucoes(IdPrest, prestador(IdPrest,_,_,_,_,_), R),
                        comprimento(R, 1)).
