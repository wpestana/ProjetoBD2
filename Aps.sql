--foi criado um banco de dados chamado BD2APS;

CREATE USER admin WITH PASSWORD '1234';

GRANT ALL PRIVILEGES ON DATABASE "BD2APS" to admin;

--comandos executados como o usuário admin, criado anteirormente
--contato foi mudado para e-mail e telefone

CREATE TABLE usuario(
	idUsuario serial,
	senha text,
	nome text,
	apelido text,
	email text,
	dataNascimento date,
	CONSTRAINT PK_Usuario PRIMARY KEY (idUsuario),
	CONSTRAINT UniqueId UNIQUE (apelido,email)
);
alter table usuario alter column senha set not null;
alter table usuario alter column apelido set not null;
alter table usuario alter column email set not null;
alter table usuario alter column nome set not null;

CREATE TABLE filme(
	idFilme SERIAL,
	nomeFilme text,
	atorPrincipal text,
	genero varchar,
	duracao int,
	descricao text,
	CONSTRAINT PK_Filme PRIMARY KEY (idFilme)
);

ALTER TABLE filme ALTER COLUMN atorPrincipal SET NOT NULL;
ALTER TABLE filme ALTER COLUMN genero SET NOT NULL;
ALTER TABLE filme ALTER COLUMN duracao set NOT NULL;

create table amigo(
	idUsuario int,
	idAmigo int,
	CONSTRAINT FK_Usuario FOREIGN KEY (idUsuario) 
		REFERENCES usuario(idUsuario),
	CONSTRAINT FK_Amigo FOREIGN KEY (idAmigo)
		REFERENCES usuario(idUsuario)
);

CREATE TABLE ListaDePreferencia(
	idFilme int,
	idUsuario int,
	CONSTRAINT FK_Usuario FOREIGN KEY (idUsuario)
		REFERENCES usuario(idUsuario),
	CONSTRAINT FK_Filme FOREIGN KEY (idFilme)
		REFERENCES Filme(idFilme)
);

insert into usuario 
	(nome, apelido, senha, email, dataNascimento)
	values ('Arnold','terminator','1234','arnold@arn','2000-12-01');
select * from usuario;
delete from usuario;

insert into filme 
	(nomeFilme, atorprincipal,genero,duracao,descricao)
	values ('Top Gun','Tom Cruise', 'Ação',150,'filme antigo de aviões'),
	('Procurando Nemo','Nemo','infantil',160,'filme de um peixe palhaço que se perde');

select * from filme;
select * from filme where nomefilme = ('Top Gun');
select * from filme where nomefilme like 'T%';
