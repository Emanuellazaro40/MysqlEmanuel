create database BD_Portugal;
create table Cidades (
	id_cidade int auto_increment primary key,
    nome_cidade varchar(15) not null,
    codigo_postal varchar(15) not null
    );
    
select *from Cidades;