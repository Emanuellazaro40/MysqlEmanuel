CREATE DATABASE bd_produto;
CREATE TABLE Dados_produto (
	ID_NF INT NOT NULL,
    ID_ITEM INT NOT NULL, 
    COD_PROD INT NOT NULL,
    VALOR_UNIT DECIMAL(4, 2) NOT NULL,
    QUANTIDADE INT NOT NULL,
    DESCONTO INT NULL
    );
    
INSERT INTO Dados_produto (
    ID_NF,
    ID_ITEM,
    COD_PROD, 
    VALOR_UNIT,
    QUANTIDADE,
    DESCONTO) values 
    (4, 1, 5, 30.00, 10, 15), 
    (4, 2, 4, 10.00, 12, 5),
    (4, 3, 1, 25.00, 13, 5), 
    (4, 4, 2, 13.50, 15, 5),
    (5, 1, 3, 15.00, 3),
    (5, 2, 5, 30.00, 6),
    (6, 1, 1, 25.00, 22, 15),
    (6, 2, 3, 15.00, 25, 20), 
    (7, 1, 1, 25.00, 10, 3),
    (7, 2, 2, 13.50, 10, 4),
    (7, 3, 3, 15.00, 10, 4),
    (7, 4, 5, 30.00, 10, 1);