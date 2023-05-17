DROP DATABASE BdEscolaIdioma --Se Precisar
CREATE DATABASE bdEscolaIdioma
GO

USE bdEscolaIdioma

CREATE TABLE tbAluno (
	codAluno INT PRIMARY KEY IDENTITY(1,1)
	,nomeAluno VARCHAR (50)NOT NULL
	,rgAluno VARCHAR (15) NOT NULL
	,cpfAluno VARCHAR(14) NOT NULL
	,logradouro VARCHAR (50) NOT NULL
	,numero INT NOT NULL
	,complemento VARCHAR(10) NOT NULL
	,cep VARCHAR(9)NOT NULL
	,bairro VARCHAR(50) NOT NULL
	,cidade VARCHAR(50) NOT NULL
	,dataNascimento SMALLDATETIME NOT NULL
)

CREATE TABLE tbTelefoneAluno(
	codTel INT PRIMARY KEY IDENTITY (1,1)
	,numTelAluno VARCHAR(10) NOT NULL
	,codAluno INT FOREIGN KEY REFERENCES tbAluno(codAluno)
)

CREATE TABLE tbCurso (
	codCurso INT PRIMARY KEY IDENTITY(1,1)
	,nomeCurso varchar (50) NOT NULL
	,valorCurso SMALLMONEY NOT NULL
)

CREATE TABLE tbNivel (
	codNivel INT PRIMARY KEY IDENTITY (1,1)
	,descricaoNivel VARCHAR(50) NOT NULL
)

CREATE TABLE tbPeriodo (
	codPeriodo INT PRIMARY KEY IDENTITY (1,1)
	,descricaoPeriodo VARCHAR(50) NOT NULL
)

CREATE TABLE tbTurma (
	codTurma INT PRIMARY KEY IDENTITY (1,1)
	,descricaoTurma varchar (50) NOT NULL
	,codCurso INT FOREIGN KEY REFERENCES tbCurso (codCurso)
	,codNivel INT FOREIGN KEY REFERENCES tbNivel (codNivel)
	,codPeriodo INT FOREIGN KEY REFERENCES tbPeriodo (codPeriodo)
	,horario TIME NOT NULL
	,diaDaSemana varchar(7) NOT NULL
)

CREATE TABLE tbMatricula (
	codMatricula INT PRIMARY KEY IDENTITY (1,1)
	,dataMatricula SMALLDATETIME NOT NULL
	,codAluno INT FOREIGN KEY REFERENCES tbAluno (codAluno)
	,codTurma INT FOREIGN KEY REFERENCES tbTurma (codTurma)
)