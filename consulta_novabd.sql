-- Exercicio 1 --
ALTER TABLE cidades RENAME TO Codigo_postal; 

-- Exercicio 2 --
SELECT * FROM novadb.Codigo_postal;

-- Exercicio 3
ALTER TABLE Codigo_postal 
RENAME COLUMN AREA TO Area_KM2;

-- Exercicio 4 -- 
SELECT AVG(Area_KM2) as Media_Area
FROM Codigo_postal;

-- Exercicio 5 --
SELECT Nome, Codigo_Postal
FROM Codigo_postal
WHERE Area_KM2 > 80;

-- Exercicio 6 --
SELECT * FROM Codigo_postal 
WHERE Codigo_Postal = 7830; 
 