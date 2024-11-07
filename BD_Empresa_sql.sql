CREATE DATABASE Empresa;

USE Empresa;

CREATE TABLE Funcionarios (
	ID_Funcionaro INT,
     Nome VARCHAR(20),
     Morada VARCHAR(40),
     Contacto INT,
     PRIMARY KEY(ID_Funcionaro)
	);

CREATE TABLE Clientes (
	ID_Clinete INT AUTO_INCREMENT,
    Nome VARCHAR(20),
    Morada VARCHAR(40),
    Contacto INT,
    ID_Funcionaro INT,
    PRIMARY KEY(ID_Clinete),
    FOREIGN KEY(ID_Funcionaro) REFERENCES Funcionarios(ID_Funcionaro)
    );
     
SELECT * FROM Funcionarios, Clientes;

INSERT INTO Funcionarios
 VALUES (1, 'João Santos', 'Figueira', 924480172),
 (2, 'Gabriel Reis', 'Lisboa', 926440972),
 (3, 'João Sousa', 'Gaia', 923680102),
 (4, 'João Anjos', 'Barreiro', 922490172);
 
 INSERT INTO Clientes
 VALUES (1, 'Carlos Santos', 'Figueira', 924483172, 2),
 (2, 'Susana Reis', 'Lisboa', 926440472, 2),
 (3, 'Luís Sousa', 'Gaia', 923688102, 4),
 (4, 'Daniel Anjos', 'Barreiro', 922590172, 1);