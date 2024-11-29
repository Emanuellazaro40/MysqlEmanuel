CREATE DATABASE JOINS_PII_Ex6;

USE JOINS_PII_Ex6;

CREATE TABLE Clientes (
	NIF INT,
    Nome VARCHAR(20),
    Data_nascimento DATE,
    PRIMARY KEY(NIF)
);

CREATE TABLE Modelo (
	cod_Mod INT,
    Nome VARCHAR(10),
    Marca VARCHAR(10),
    PRIMARY KEY(cod_Mod)
);

CREATE TABLE Veiculo (
    Matricula VARCHAR(8),
    Modelo_codMod INT,
	Cliente_NIF INT,
    Cor VARCHAR(10),
    PRIMARY KEY(Matricula),
    FOREIGN KEY(Cliente_NIF) REFERENCES Clientes(NIF),
    FOREIGN KEY(Modelo_codMod) REFERENCES Modelo(cod_Mod)
);

ALTER TABLE Veiculo
ADD COLUMN Ano_veiculo INT;

UPDATE Veiculo
SET Ano_veiculo = 2012
WHERE Veiculo.Matricula  = '12-20-PS';

UPDATE Veiculo
SET Ano_veiculo = 2008
WHERE Veiculo.Matricula  = '21-FC-41';

UPDATE Veiculo
SET Ano_veiculo = 2022
WHERE Veiculo.Matricula  = '70-20-ZH';

CREATE TABLE Estacionamentos (
	Num INT,
    Piso INT,
    Capacidade INT,
    PRIMARY KEY(Num)
);

 ALTER TABLE Estacionamentos
 ADD COLUMN Veic_Matricula VARCHAR(8);
 
UPDATE estacionamentos
 SET Veic_Matricula = '12-20-PS'
 WHERE Estacionamentos.num = 1;
 
 UPDATE estacionamentos
 SET Veic_Matricula = '21-FC-41'
 WHERE Estacionamentos.num = 2;
 
  UPDATE estacionamentos
 SET Veic_Matricula = '70-20-ZH'
 WHERE Estacionamentos.num = 3;
 
 ALTER TABLE Estacionamentos
 ADD CONSTRAINT Veic_Matricula
 FOREIGN KEY(Veic_Matricula) REFERENCES Veiculo(Matricula);
 
 

CREATE TABLE Estacionar (
	cod INT,
    Estacionamento_Num INT,
    Veiculo_Matricula VARCHAR(8),
    DataEntrada DATE,
    DataSaida DATE,
    HoraEntrada TIME,
    HoraSaida TIME,
    PRIMARY KEY(cod),
    FOREIGN KEY(Estacionamento_Num) REFERENCES Estacionamentos(Num),
    FOREIGN KEY(Veiculo_Matricula) REFERENCES Veiculo(Matricula)
    
);

INSERT INTO Clientes VALUES
(323193641, 'Emanuel Lázaro', '2002-10-14'),
(323193923, 'Jailton Gomes', '2003-06-23'),
(323177646, 'Ediley Gomes', '2002-08-24');

INSERT INTO Modelo VALUES
(1, 'Corsa', 'Opel'),
(2, 'TX', 'Queeway'),
(3, 'Focus', 'Ford');

INSERT INTO Veiculo VALUES
('21-FC-41', 3, 323193641, 'Vermelho'),
('12-20-PS', 1, 323177646, 'Verde'),
('70-20-ZH', 2, 323193923, 'Preto');

INSERT INTO Estacionamentos VALUES
(1, 0, 10),
(2, 1, 15),
(3, 2, 20);

INSERT INTO Estacionar VALUES
(1, 2, '21-FC-41', '2024-10-16', '2024-10-19', '12:20', '13:40'),
(2, 2, '12-20-PS', '2024-10-14', '2024-10-15', '08:15', '12:00'),
(3, 1, '70-20-ZH', '2024-10-12', '2024-10-12', '09:00', '15:30');


# Exercicio 1
SELECT Clientes.Nome, Veiculo.Matricula
FROM Clientes
INNER JOIN Veiculo
ON Clientes.NIF = Veiculo.Cliente_NIF;

# Exercicio 2
SELECT Clientes.Nome, Clientes.NIF
FROM Clientes 
LEFT JOIN Veiculo
ON Clientes.NIF = Veiculo.Cliente_NIF
WHERE Veiculo.Matricula = '21-FC-41';

# Exercicio 3
SELECT Veiculo.Matricula, Veiculo.Cor
FROM Veiculo
LEFT JOIN Estacionamentos 
ON Veiculo.Matricula = Estacionamentos.Veic_Matricula
WHERE Estacionamentos.Num = 1;

# Exercicio 4
SELECT Veiculo.Matricula, Veiculo.Ano_veiculo
FROM Veiculo
LEFT JOIN Estacionamentos
ON Veiculo.Matricula = Estacionamentos.Veic_Matricula
WHERE Estacionamentos.Num = 1;

# Exercicio 5
SELECT Estacionar.DataEntrada, Estacionar.DataSaida 
FROM Estacionar
LEFT JOIN Veiculo
ON Estacionar.Veiculo_Matricula = Veiculo.Matricula
WHERE Veiculo.Matricula = '70-20-ZH';