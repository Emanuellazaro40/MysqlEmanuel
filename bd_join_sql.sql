CREATE DATABASE Join_Exercicio_5;

USE Join_Exercicio_5;

CREATE TABLE Atores (
 ID_ator INT,
 Primeiro_nome VARCHAR(15),
 Ultimo_nome VARCHAR(15),
 Codigo_filme INT,
 PRIMARY KEY(ID_ator),
 FOREIGN KEY(Codigo_filme) REFERENCES Filmes(Codigo_filme)
 );

CREATE TABLE Categorias (
 Codigo_categoria INT ,
 Tipo_categoria VARCHAR(40), 
 PRIMARY KEY(Codigo_categoria)
 );

CREATE TABLE Filmes (
 Codigo_filme INT,
 Titulo VARCHAR(40),
 Codigo_categoria INT,
 PRIMARY KEY(Codigo_filme),
 FOREIGN KEY(Codigo_categoria) REFERENCES Categorias(Codigo_categoria)
 );
 
 ALTER TABLE Filmes
 ADD COLUMN id_loja INT;
 
 ALTER TABLE Filmes
 ADD CONSTRAINT id_loja
 FOREIGN KEY(id_loja) REFERENCES Lojas(id_loja);
 
 INSERT INTO Atores VALUES
 (1, 'James', 'Carter', 1),
 (2, 'Damon', 'Salvatore', 3),
 (3, 'Tyler', 'Lockwod', 4),
 (4, 'Julia', 'Roberts', 3),
 (5, 'Bonnie', 'Bennet', 2);
 
 INSERT INTO Filmes VALUES
 (1, 'Os Resgatados', 1),
 (2, 'Estranger Things', 3),
 (3, 'Guardião da Galaxia', 4),
 (4, 'TOMB RAIDER', 4),
 (5, 'Originals', 2);
 
 INSERT INTO Categorias VALUES
 (1, 'Drama'),
 (2, 'Sports'),
 (3, 'Terror'),
 (4, 'Comedia'),
 (5, 'Romance');
 
 # Exercicio 1
 SELECT Filmes.Titulo
 FROM Filmes
 LEFT JOIN Categorias
 ON Categorias.Codigo_categoria = Filmes.Codigo_categoria
 WHERE Categorias.Tipo_categoria = 'Sports'
 ORDER BY Filmes.Titulo ASC;
 
 drop database Join_Exercicio_5;
 
 # Exercico 2
 SELECT Atores.Primeiro_nome, Atores.Ultimo_nome
 FROM Atores
 INNER JOIN Filmes 
 ON Filmes.Codigo_filme = Atores.Codigo_filme
 WHERE Filmes.Titulo = 'TOMB RAIDER'
 ORDER BY Atores.Primeiro_nome, Atores.Ultimo_nome ASC;
 
 # Exercicio 3
 SELECT Atores.Primeiro_nome, Atores.Ultimo_nome
 FROM Atores
 INNER JOIN Filmes
 ON Filmes.Codigo_filme = Atores.Codigo_filme
 WHERE Filmes.Codigo_categoria = 1
 ORDER BY Atores.Primeiro_nome, Atores.Ultimo_nome ASC;
 
CREATE TABLE Lojas(
     id_loja INT,
     Nome_loja VARCHAR(20),
     codigo_filme INT,
     PRIMARY KEY(id_loja),
     FOREIGN KEY(codigo_filme) REFERENCES Filmes(codigo_filme)
);    

INSERT INTO Lojas VALUES
(1, 'Lazaro_Ld', 1),
(2, 'Reis_Ld', 2),
(3, 'Gomes_Ld', 4);


update filmes
SET id_loja = 3
WHERE codigo_filme = 1;
 
 # Exercicio 4
 SELECT Filmes.Titulo
 FROM Filmes
 WHERE Filmes.codigo_filme IN (
						    SELECT Filmes.codigo_filme
                            FROM Lojas
                            WHERE Lojas.id_loja = 1
				          )
 ORDER BY Filmes.Titulo ASC;
 
 # Exercicio 5
SELECT Atores.Primeiro_nome, Atores.Ultimo_nome
FROM Atores 
INNER JOIN Filmes 
ON Atores.Codigo_filme = Filmes.codigo_filme
    WHERE Filmes.Codigo_filme IN (
        SELECT Filmes.Codigo_filme
        FROM Filmes 
        INNER JOIN Atores 
        ON Atores.Codigo_filme = Filmes.codigo_filme
        WHERE Atores.Primeiro_nome = 'Julia' AND Atores.Ultimo_nome = 'Roberts'
    )
ORDER BY Atores.Primeiro_nome, Atores.Ultimo_nome;

 