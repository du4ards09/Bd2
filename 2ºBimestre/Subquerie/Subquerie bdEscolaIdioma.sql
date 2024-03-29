USE bdEscolaIdioma

--Maria Eduarda
--b)Criar uma consulta que retorne o nome e o rg do aluno mais novo
SELECT rgAluno AS 'RG:' , nomeAluno AS 'Nome;' FROM tbAluno WHERE nomeAluno = (Select Min(nomeAluno) FROM tbAluno)
	
--Maria Eduarda
--c)Criar uma consulta que retorne o nome do aluno mais velho
SELECT nomeAluno AS 'Aluno mais velho:' FROM tbAluno WHERE nomeAluno IN (Select Max(nomeAluno) FROM tbAluno)

--Maria Eduarda
--d)Criar uma consulta que retorne o nome e o valor do curso mais caro
SELECT nomeCurso AS 'Curso:' , valorCurso AS 'Valor:'  FROM tbCurso WHERE valorCurso = (Select Max(valorCurso) FROM tbCurso)

--Maria Eduarda
--Criar uma consulta que retorne o nome do aluno e o nome do curso, do aluno que fez a �ltima matr�cula
SELECT nomeAluno AS 'Nome:' , nomeCurso AS 'Curso:' FROM tbAluno 
	INNER JOIN tbCurso ON tbCurso.codCurso = tbAluno.codAluno 
		WHERE nomeAluno  = (Select MAX(nomeAluno) FROM tbAluno)
	
--Maria Eduarda
--f)Criar uma consulta que retorne o nome do primeiro aluno a ser matriculado na escola de Idiomas
SELECT nomeAluno AS 'Nome:' FROM tbAluno 
	WHERE nomeAluno  = (Select MIN(nomeAluno) FROM tbAluno)

--Maria Eduarda
--g)Criar uma consulta que retorne o nome, rg e data de nascimento de todos os alunos que estejam matriculados no curso de ingl�s
SELECT rgAluno AS 'RG:' , nomeAluno AS 'Nome;' , dataNascimento AS 'Data de Nascimento:' FROM tbAluno
	INNER JOIN tbCurso ON tbCurso.codCurso = tbAluno.codAluno
		WHERE nomeCurso IN (SELECT nomeCurso FROM tbCurso WHERE codCurso IN (SELECT codCurso =1))
