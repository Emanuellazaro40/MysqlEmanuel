/* Criação de base de dados, inserção de dados, consultas */
CREATE DATABASE Escola;
USE Escola;

CREATE TABLE Estudantes (
	Id_Estudante INT PRIMARY KEY NOT NULL,
	Nome VARCHAR(30) NOT NULL,
    Idade INT NOT NULL,
    Data_Nascimento DATE NOT NULL
    );
    
INSERT INTO Estudantes (Id_Estudante, Nome, Idade, Data_Nascimento) VALUES
    (1, 'Emanuel Lázaro', 20, '2003-10-12'),
    (2, 'Ismael Lázaro', 21, '2003-11-10'),
    (3, 'Celso Ramos', 18, '2006-06-10'),
    (4, 'Carlos Santos', 19, '2005-02-15'),
    (5, 'Awelde Jesus', 20, '2004-04-26');
    
SELECT * FROM Escola.Estudantes;

# Mostrar todos estudantes
SELECT Estudantes.Nome
FROM Estudantes;

# Mostrar os todos estudantes mais velhos
SELECT Estudantes.Nome
FROM Estudantes
WHERE Estudantes.Idade > 18;

# Ordenar por idade 
SELECT Estudantes.Nome
FROM Estudantes
ORDER BY Estudantes.Idade DESC;

# Mostrar os três alunos mais velhos
SELECT * FROM Estudantes
ORDER BY Estudantes.Idade DESC
LIMIT 3;

# Contar o numero de estudantes
SELECT COUNT(Estudantes.Nome) AS Total_estudante
FROM Estudantes;

# Media dos alunos 
SELECT AVG(Estudantes.Idade) AS Media_idade 
FROM Estudantes;

# Encontrar o mais velho e o mais novo dos estudantes
SELECT MIN(Estudantes.Idade) AS Idade_minima, 
MAX(Estudantes.Idade) AS Idade_maxima
FROM Estudantes;
