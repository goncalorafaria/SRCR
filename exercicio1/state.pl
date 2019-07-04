% utente: #IdUt,Nome,Idade,Género,#IdFamilia,Cidade -> {V,F}
utente(1,'Carlos',2,'M',1,'Porto').
utente(2,'Joao',20,'M',1,'Braga').
utente(3,'Vilaca',20,'M',2,'Braga').
utente(4,'Catarina',20,'F',3,'Braga').
utente(5,'Eva',0,'F',3,'Braga').
utente(6,'Maria Jose',56,'F',1,'Guimaraes').
utente(7,'Gustavo',28,'M',2,'Lisboa').
utente(8,'Helena',25,'F',5,'Lisboa').
utente(9,'Guilherme',58,'M',1,'Porto').
utente(10,'Ana',34,'F',6,'Guimaraes').

% serviço: #IdServ,Descrição,Instituição,Cidade -> {V,F}
servico(1,'Pediatria','Hospital Santa Maria','Porto').
servico(2,'Ortopedia','Hospital de Braga','Braga').
servico(3,'Oftalmologia','Hospital Santa Maria','Porto').
servico(4,'Cardiologia','Hospital de Braga','Braga').
servico(5,'Cirurgia Geral','Hospital Egas Moniz','Lisboa').
servico(6,'Estomatologia','Hospital Egas Moniz','Lisboa').
servico(7,'Genetica Medica','Hospital Pulido Valente','Lisboa').
servico(8,'Medicina Nuclear','Hospital Pulido Valente','Lisboa').
servico(9,'Curativo','Hospital Egas Moniz','Lisboa').
servico(10,'Vacina','Hospital de Braga','Braga').
servico(11,'Preparar para exame','Hospital Santa Maria','Porto').

% consulta: #IdConsulta,Data,#IdUt,#IdServ,Custo -> {V,F}
consulta(1,'01-01-2018',1,1,10).
consulta(2,'23-05-2016',1,1,14).
consulta(3,'05-02-2019',2,4,15).
consulta(4,'13-12-2018',2,1,20).
consulta(5,'09-09-2017',3,5,10).
consulta(6,'26-10-2016',1,3,15).
consulta(7,'29-02-2017',3,3,30).
consulta(8,'10-03-2016',4,6,20).
consulta(9,'02-04-2017',2,2,40).
consulta(10,'04-04-2017',5,7,10).
consulta(11,'12-12-2017',10,8,0).

% medico: #IdMedico,Nome,Idade,Género,#IdServ -> {V,F}
medico(1,'Josefa',47,'F',1).
medico(2,'Manuel',29,'M',6).
medico(3,'Gaspar',38,'M',4).
medico(4,'Catia',43,'F',8).
medico(5,'Luisa',40,'F',2).
medico(6,'Marta',38,'F',5).

% enfermeiro: #IdEnfermeiro,Nome,Idade,Género,#IdServ -> {V,F}
enfermeiro(1,'Soraia',27,'F',9).
enfermeiro(2,'Jacinta',41,'F',10).
enfermeiro(3,'Luisa',50,'F',11).
enfermeiro(4,'Fabio',30,'M',9).
enfermeiro(5,'Sandra',50,'F',11).

% medEnfFamilia: #IdFamilia,#IdMedico,#IdEnfermeiro -> {V,F}
medEnfFamilia(1,2,3).
medEnfFamilia(2,1,2).
medEnfFamilia(3,3,4).
medEnfFamilia(4,4,1).
medEnfFamilia(5,6,5).

% exame: #IdConsulta,Descrição -> {V,F}
exame(3,'Prova de Esforco').
exame(5,'Biopsia').
exame(8,'Endoscopia').
exame(10,'Exame de Sangue').
exame(11,'Exame a urina').
