CREATE DATABASE Super_KDO;

USE Super_KDO;

CREATE TABLE Clientes (
    ID_Cliente INT,
    Nome_cliente VARCHAR(20),
    PRIMARY KEY(ID_Cliente)
    );

CREATE TABLE Pedidos (
	ID_Pedido INT,
    ID_Cliente INT,
    Data_pedido DATE,
    PRIMARY KEY(ID_Pedido),
    FOREIGN KEY(ID_Cliente) REFERENCES Clientes(ID_Cliente)
    );
    
INSERT INTO Clientes
 VALUES (1, 'João Santos'),
 (2, 'Gabriel Reis'),
 (3, 'João Sousa'),
 (4, 'João Anjos'),
 (5, 'Elisa Gomes');
 
 INSERT INTO Pedidos
 VALUES (1, 1, '2024-10-02'),
 (2, 2, '2024-09-06'),
 (3, 3, '2024-07-25'),
 (4, 2, '2024-08-10'),
 (5, 4, '2024-11-28');
 
 
SELECT Clientes.Nome_cliente, Pedidos.Data_pedido, Pedidos.ID_Pedido
FROM Clientes
INNER JOIN Pedidos
ON Clientes.Id_Cliente = Pedidos.ID_Cliente;

# Listar todos os clientes incluindo os que não fizeram pedidos
SELECT Clientes.Nome_Cliente, Pedidos.ID_Pedido
From Clientes
LEFT OUTER JOIN Pedidos 
ON Clientes.ID_CLiente = Pedidos.ID_Cliente;
