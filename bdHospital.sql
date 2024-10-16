select Cursos.nome_curso, count(Inscricoes.id_aluno) as total_alunos
from Cursos
join Inscricoes on Cursos.id_curso = Inscricoes.id_curso
group by Cursos.nome_curso; 
insert into Alunos (nome, data_nascimento, sexo)
values ('Rui Mendes', '2002-10-10', 'M');
insert into Inscricoes (id_aluno, id_curso, data_inscricao)
values (last_insert_id(), 3, '2023-09-05');

select nome
from Alunos
where data_nascimento < '2001-01-01';

# Listar os Alunos do curso especifico
select Alunos.nome
from Alunos
join Inscricoes on Alunos.id_aluno = Inscricoes.id_aluno
join Cursos on Inscricoes.id_curso = Cursos.id_curso
where Cursos.nome_curso = 'Matemática';

# Exercicio 3 Contar o nº de alunos em cada curso 
select Cursos.nome_curso, count(Alunos.id_aluno) as total_alunos
from Cursos
join Inscricoes on Cursos.id_curso = Inscricoes.id_curso
join Alunos on Inscricoes.id_aluno = Alunos.id_aluno
group by Cursos.nome_curso;


## Base de dados do Hospital
create table Mae (
	id_mae int auto_increment primary key,
    nome varchar(60) not null,
    morada varchar(150) not null,
	contacto varchar(30) not null,
data_nascimento date not null,
 foreign key(id_bebe) references Bebes(id_bebe),
 foreign key(id_medico) references Medico(id_medico));
 

create table Medico (id_medico int auto_increment primary key,
    nome varchar(60) not null, 
    contacto varchar(30) not null,
	especialidade varchar(150) not null,
    foreign key(id_mae) references Mae(id_mae),
    foreign key(id_bebe) references Bebes(id_bebe));
    
create table Bebes (id_bebe int auto_increment primary key,
	nome varchar(60) not null, 
    data_nascimento date not null,
    peso double, 
    altura double,
    foreign key(id_mae) references Mae(id_mae),
    foreign key(id_medico) references Medico(id_medico));
    

