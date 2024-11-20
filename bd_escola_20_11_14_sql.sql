CREATE DATABASE Escola_1;

USE Escola_1;

CREATE TABLE Estudantes (
	id_estudante INT,
    nome VARCHAR(20),
    idade INT,
    data_nascimento DATE,
    PRIMARY KEY(id_estudante)
);

INSERT INTO Estudantes VALUES
(1, 'Edmilson dos Reis', 20, '2004-04-15'),
(2, 'Miguel Anjos', 35, '1989-07-22'),
(3, 'Gabriel Ramos', 12, '2012-03-13'),
(4, 'Ediley Lázaro', 22, '2003-04-18');

SET SQL_SAFE_UPDATES = 0;
UPDATE Estudantes 
SET Estudantes.idade = 12 , Estudantes.data_nascimento = '2012-03-13'
WHERE Estudantes.id_estudante = 4;

DELETE FROM Estudantes
WHERE Estudantes.idade > 35;

CREATE TABLE Sum (
	Pedido_id INT,
    Empresa VARCHAR(20),
    Quantidade INT
);

INSERT INTO Sum VALUES
(1, 'A', 20),
(2, 'B', 50),
(3, 'B', 50);

SELECT SUM(Sum.Quantidade) AS SUM_Total
FROM Sum;

SELECT Sum.Empresa, SUM(Sum.Quantidade) AS SUM_Total
FROM Sum
GROUP BY Sum.Empresa;

INSERT INTO Sum VALUES
(5, 'C', NULL);

SELECT SUM(Estudantes.idade) AS Idade_Total
FROM Estudantes;

SELECT SUM(Estudantes.idade) AS Idade_Total
FROM Estudantes
WHERE Estudantes.idade > 18;

SELECT COUNT(*) AS Total_Estudantes
FROM Estudantes;

SELECT COUNT(Estudantes.idade) AS Total_estudantes 
FROM Estudantes
WHERE Estudantes.idade > 20;

INSERT INTO Sum VALUES
(6, 'A', 20),
(7, 'C', 10);

SELECT AVG(Sum.Quantidade) AS Media_quantidade
FROM Sum;

SELECT Empresa,  AVG(Sum.Quantidade) AS Media_quantidade
FROM Sum
GROUP BY Sum.Empresa;

CREATE TABLE MinMax (
	pedidoId INT,
    Cliente VARCHAR(20),
    data_nascimento DATE,
);


SELECT MIN(Sum.Quantidade) AS Media_quantidade
FROM Sum; 

SELECT MAX(Sum.Quantidade) AS Media_quantidade
FROM Sum;