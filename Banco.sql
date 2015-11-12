--foi criado um banco de dados chamado BD2APS;

CREATE USER admin WITH PASSWORD '1234';

GRANT ALL PRIVILEGES ON DATABASE "BD2APS" to admin;

--comandos executados como o usu�rio admin, criado anteirormente
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
  values ('Top Gun','Tom Cruise', 'A��o',150,'filme antigo de avi�es'),
  ('Procurando Nemo','Nemo','infantil',160,'filme de um peixe palha�o que se perde');

select * from filme;
select * from filme where nomefilme = ('Top Gun');
select * from filme where nomefilme like 'T%';

insert into usuario (nome, apelido, senha, email, dataNascimento)
 values ('Marta','Marta','1234','Marta@hotmail.com','1993-03-02'),
 ('Beatriz','Bia','1234','biabibi@bol.com','1990-06-30'),
 ('Monise','Mona','1234','mona@hotmail.com','2005-02-26'),
 ('Ricardo','Rik','1234','ricardor@hotmail.com','2000-04-06'),
 ('Bruna','Bru','1234','bruna@hotmail.com','1990-06-30');

 select*from usuario where nome = 'Marta';
--ainda n�o inseridos
 insert into filme 
  (nomeFilme, atorprincipal,genero,duracao,descricao)
  values ('Miss�o Imposs�vel','Tom Cruise', 'A��o',150,'Ethan Hunt (Tom Cruise) descobre que o famoso Sindicato � real, e est� tentando destruir o IMF. Mas como combater uma na��o secreta, t�o treinada e equipada quanto eles mesmos? O agente especial tem que contar com toda a ajuda dispon�vel, incluindo de pessoas n�o muito confi�veis...'),
  ('Miss�o Imposs�vel - Protocolo Fantasma','Tom Cruise','A��o',138,'O agente secreto Ethan Hunt (Tom Cruise) � desautorizado pelo presidente dos Estados Unidos ap�s o pa�s ser acusado por um bombardeio no Kremlin. Tem in�cio o Protocolo Fantasma, que visa acabar com os agentes da IMF. Sem qualquer recurso ou apoio, Ethan precisa encontrar um meio de limpar seu nome e o da ag�ncia em que trabalha. Para tanto passa a trabalhar com Benji (Simon Pegg) e Jane (Paula Patton), agentes renegados como ele, e ainda Brandt (Jeremy Renner), um ex-agente que agora trabalha como analista.'),
  ('Miss�o Imposs�vel', 'Tom Cruise','A��o',110,'Durante uma miss�o de rotina em Praga, Ethan Hunt e seu grupo de agentes caem numa emboscada. Ethan descobre que apenas ele e uma outra agente sobreviveram. Ao ser acusado de ser o traidor que falhou a miss�o ele foge e tenta provar sua inoc�ncia, mas o verdadeiro inimigo est� dentro da pr�pria ag�ncia');

  select * from usuario;

  insert into usuario (nome,apelido,senha,email,datanascimento)values('Welington','wel','1234','wel@wel.com','1988-07-21');

  delete from usuario where nome='Welington';

update usuario set nome='Tom' where nome = 'Welington';