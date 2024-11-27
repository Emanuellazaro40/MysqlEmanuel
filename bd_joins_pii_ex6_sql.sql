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

CREATE TABLE Estacionamentos (
	Num INT,
    Piso INT,
    Capacidade INT,
    PRIMARY KEY(Num)
);

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
('20-29-PT', 3, 323193641, 'Vermelho'),
('12-20-PT', 1, 323177646, 'Azul'),
('32-40-PT', 2, 323193923, 'Preto');

INSERT INTO Estacionamentos VALUES
(1, 0, 10),
(2, 1, 15),
(3, 2, 20);

INSERT INTO Estacionar VALUES
(1, 2, '20-29-PT', '2024-10-16', '2024-10-19', '12:20', '13:40'),
(2, 2, '12-20-PT', '2024-10-14', '2024-10-15', '08:15', '12:00'),
(3, 1, '32-40-PT', '2024-10-12', '2024-10-12', '09:00', '15:30');


# Exercicio 1
SELECT Clientes.Nome, Veiculo.Matricula
FROM Clientes
LEFT JOIN Veiculo
ON Clientes.NIF = Veiculo.Cliente_NIF;

SET SQL_SAFE_UPDATES = 0;

update Veiculo 
SET Matricula = '21-FC-41'
WHERE Veiculo.Matricula = '32-40-PT';

# Exercicio 2

