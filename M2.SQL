CREATE TABLE Livro (
Nome VARCHAR(255) NOT NULL
, Copia TINYINT NOT NULL
, Status VARCHAR(30) NULL
, CONSTRAINT PK_Livro PRIMARY KEY ( Nome, Copia )
)
GO
CREATE TABLE Cliente (
ID INT NOT NULL
, Nome VARCHAR(50) NOT NULL
, Telefone INT NULL
, CONSTRAINT PK_Cliente PRIMARY KEY ( ID )
)
GO

CREATE TABLE Emprestimo(
ID INT NOT NULL IDENTITY(1,1)
, Livro VARCHAR(255) NOT NULL
, Copia TINYINT NOT NULL
, ID_Cliente INT NOT NULL
, DataEmprestimo DATETIME NOT NULL
, DataDevolucaoProposta DATETIME NULL
, DataDevolucaoEfetiva DATETIME NULL
, Multa Decimal(6,2)
, CONSTRAINT PK_Emprestimo PRIMARY KEY (ID)
, CONSTRAINT FK_EmprestimoLivro FOREIGN KEY (Livro, Copia) REFERENCES Livro (Nome, Copia)
, CONSTRAINT FK_EmprestimoCliente FOREIGN KEY (ID_cliente) REFERENCES Cliente (ID)
)
GO

select * from Livro
select * from Cliente
select * from Emprestimo

insert into Livro values('A Arte da Guerra', 1, 'Atrasado'),
						('A Arte da Guerra', 2, 'Livre'),
						('O Pequeno Príncipe', 1, 'Emprestado');

insert into Cliente values(1, 'José da Silva', 991235344),
							(2, 'Igor Pereira', 33120123);

insert into Emprestimo values('A Arte da Guerra', 1, 1, '10/08/2017', NULL, '10/09/2017', 11.00),
								('O Pequeno Príncipe', 1, 2, '15/09/2017', NULL, '15/10/2017', NULL);


delete from Emprestimo where Livro = 'O Pequeno Príncipe' and Copia = 1 

delete from Livro where nome = 'O Pequeno Príncipe' and Copia = 1 

update Livro set Status = 'Emprestado' 
insert into Emprestimo values('A Arte da Guerra', 2, 2, '13/09/2022', '13/10/2022', '13/10/2022', null);


