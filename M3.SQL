CREATE TABLE Paciente (
ID INT NOT NULL IDENTITY(1,1)
, Nome VARCHAR(50) NOT NULL
, Telefone INT NULL
, CONSTRAINT PK_Paciente PRIMARY KEY ( ID )
)
GO
CREATE TABLE Sala (
Numero INT NOT NULL
, CONSTRAINT PK_Sala PRIMARY KEY ( Numero )
)
GO
CREATE TABLE Medico (
ID INT NOT NULL IDENTITY(1,1)
, CRM VARCHAR(10) NOT NULL
, Nome VARCHAR(50) NOT NULL
, Especialidade VARCHAR(30) NULL
, CONSTRAINT PK_Medico PRIMARY KEY ( ID )
)
GO
CREATE TABLE Consulta (
ID INT NOT NULL IDENTITY(1,1)
, ID_Paciente INT NOT NULL
, ID_Medico INT NOT NULL
, Numero_Sala INT NOT NULL
, DataHora DATETIME NOT NULL
, Duracao TINYINT NOT NULL
, CONSTRAINT PK_Consulta PRIMARY KEY ( ID )
, CONSTRAINT FK_ConsultaMedico FOREIGN KEY ( Id_medico ) REFERENCES Medico( ID )
, CONSTRAINT FK_ConsultaPaciente FOREIGN KEY ( Id_paciente ) REFERENCES paciente( ID )
, CONSTRAINT FK_ConsultaSala FOREIGN KEY ( Numero_Sala ) REFERENCES Sala( Numero )
)
GO



select * from Sala
select * from Medico
select * from Consulta
select * from Paciente

insert into Paciente values('Almir dos Santos', 99923232),
							('Adamastor Silva', 32324414);

insert into Sala values(9),(12);

insert into Medico values(12345, 'Creusa', 'Dentista'), (678910, 'Juvenal', 'Psicólogo');

insert into Consulta values(1, 1, 9, '21/10/2017 15:00', 30), 
							(1, 2, 9, '23/10/2017 15:00', 15), 
							(2, 1, 12, '26/10/2017 15:00', 60);

delete from Consulta where ID_Medico = 2 

delete from Medico where ID = 2 and Nome = 'Juvenal' 

update Consulta set Numero_Sala = 12 where Numero_Sala = 9 and ID_Paciente = 1 