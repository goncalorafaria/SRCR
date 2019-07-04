saveUtente(Stream) :- utente(A,B,C,D,E,F),
        write(Stream, 'utente('),write(Stream, A), write(Stream, ',\''),
        write(Stream, B), write(Stream, '\','), write(Stream, C),
        write(Stream, ',\''), write(Stream, D), write(Stream, '\','),
        write(Stream, E), write(Stream, ',\''),
        write(Stream, F), write(Stream, '\').\n'),
    fail; true.

saveServico(Stream) :- servico(A,B,C,D),
        write(Stream, 'servico('), write(Stream, A), write(Stream, ',\''),
        write(Stream, B), write(Stream, '\',\''), write(Stream, C),
        write(Stream, '\',\''), write(Stream, D), write(Stream, '\').\n'),
    fail; true.

saveConsulta(Stream) :- consulta(A,B,C,D,E),
        write(Stream, 'consulta('), write(Stream, A),
        write(Stream, ',\''), write(Stream, B), write(Stream, '\','),
        write(Stream, C), write(Stream, ','), write(Stream, D),
        write(Stream, ','), write(Stream, E), write(Stream, ').\n'),
    fail; true.

saveMedico(Stream) :- medico(A,B,C,D,E),
        write(Stream, 'medico('), write(Stream, A), write(Stream, ',\''),
        write(Stream, B), write(Stream, '\','), write(Stream, C),
        write(Stream, ',\''), write(Stream, D), write(Stream, '\','),
        write(Stream, E), write(Stream, ').\n'),
    fail; true.

saveEnfermeiro(Stream) :- enfermeiro(A,B,C,D,E),
        write(Stream, 'enfermeiro('),write(Stream, A), write(Stream, ',\''),
        write(Stream, B), write(Stream, '\','), write(Stream, C),
        write(Stream, ',\''), write(Stream, D), write(Stream, '\','),
        write(Stream, E), write(Stream, ').\n'),
    fail; true.

saveMedEnfFamilia(Stream) :- medEnfFamilia(A,B,C),
        write(Stream, 'medEnfFamilia('),write(Stream, A), write(Stream, ','),
        write(Stream, B), write(Stream, ','), write(Stream, C),
        write(Stream, ').\n'),
    fail; true.

saveExame(Stream) :- exame(A,B),
        write(Stream, 'exame('),write(Stream, A), write(Stream, ',\''),
        write(Stream, B), write(Stream, ').\n'),
    fail; true.

saveState :-
    open('state.pl', write, Stream),
    write(Stream, '% utente: #IdUt,Nome,Idade,Género,#IdFamilia,Cidade -> {V,F}\n'),
    saveUtente(Stream),
    write(Stream, '\n% serviço: #IdServ,Descrição,Instituição,Cidade -> {V,F}\n'),
    saveServico(Stream),
    write(Stream, '\n% consulta: #IdConsulta,Data,#IdUt,#IdServ,Custo -> {V,F}\n'),
    saveConsulta(Stream),
    write(Stream, '\n% medico: #IdMedico,Nome,Idade,Género,#IdServ -> {V,F}\n'),
    saveMedico(Stream),
    write(Stream, '\n% enfermeiro: #IdEnfermeiro,Nome,Idade,Género,#IdServ -> {V,F}\n'),
    saveEnfermeiro(Stream),
    write(Stream, '\n% medEnfFamilia: #IdFamilia,#IdMedico,#IdEnfermeiro -> {V,F}\n'),
    saveMedEnfFamilia(Stream),
    write(Stream, '\n% exame: #IdConsulta,Descrição -> {V,F}\n'),
    saveExame(Stream),
    close(Stream).
