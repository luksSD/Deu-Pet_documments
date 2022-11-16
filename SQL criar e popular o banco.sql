--DROP DATABASE IF exists deupet;

--CREATE DATABASE deupet WITH OWNER = postgres
--ENCODING = 'UTF8' CONNECTION LIMIT = -1;

--Criando tabela usuario
CREATE TABLE usuario
(
    id BIGSERIAL primary key,
    nome VARCHAR (100) not null,
    senha VARCHAR (50) not null,
    email VARCHAR (200) unique not null,
    celular VARCHAR (20) unique not null,
    situacao BOOL not null,
    data DATE not null,
    aceite BOOL not null,
    tipo VARCHAR (50) not null
);

--Criando tabela municipio
CREATE TABLE municipio
(
    id BIGSERIAL primary key,
    uf VARCHAR (50) not null,
    nome VARCHAR (50)  not null
);

--Colocando UK entre estado e nome na tabela municipio
ALTER TABLE municipio ADD CONSTRAINT uk1_municipio unique(uf, nome);

--Criando tabela pessoa
CREATE TABLE pessoa
(
    usuario_id INTEGER primary key,
    logradouro VARCHAR (100) not null,
    numero VARCHAR (10) not null,
    cep VARCHAR (10),
    municipio_id integer not null
);

--Tornando municipio_id/usuario_id uma FK da tabela pessoa
ALTER TABLE pessoa ADD CONSTRAINT fk1_pessoa foreign key (municipio_id) references municipio(id) on update cascade on delete cascade;
ALTER TABLE pessoa ADD CONSTRAINT fk2_pessoa foreign key (usuario_id) references usuario(id) on update cascade on delete cascade;

--Criando tabela instituicao
CREATE TABLE instituicao
(
    usuario_id INTEGER primary key,
    cnpj VARCHAR (21) DEFAULT 00000000000000 not null,
    logradouro VARCHAR (100) not null,
    numero VARCHAR (10) not null,
    cep VARCHAR (10),
    cpf VARCHAR (14) DEFAULT 00000000000000 not null,
    municipio_id integer not null
);

--Tornando municipio_id/usuario_id uma FK da tabela instituicao
ALTER TABLE instituicao ADD CONSTRAINT fk1_instituicao foreign key (municipio_id) references municipio(id) on update cascade on delete cascade;
ALTER TABLE instituicao ADD CONSTRAINT fk2_instituicao foreign key (usuario_id) references usuario(id) on update cascade on delete cascade;

--Colocando UK entre cpf e cnpj na tabela instituicao
ALTER TABLE instituicao ADD CONSTRAINT uk1_instituicao unique(cnpj, cpf);

--Criando tabela animal
CREATE TABLE animal
(
    id BIGSERIAL primary key,
    nome VARCHAR (100) not null,
    tipo VARCHAR (20) not null,
    sexo VARCHAR (20) not null,
    peso DOUBLE PRECISION not null,
    porte VARCHAR (50) not null,
    raca VARCHAR (50) not null,
    situacao_adocao BOOL not null, 
    temperamento VARCHAR (100),
    pelagem_primaria VARCHAR (100) not null,
    pelagem_secundaria VARCHAR (100) not null,
	instituicao_id integer not null

);


--Tornando instituicao_id uma FK da tabela animal
ALTER TABLE animal ADD CONSTRAINT fk1_animal foreign key (instituicao_id) references instituicao(usuario_id) on update cascade on delete cascade;

--Criando tabela arquivo_animal
CREATE TABLE arquivo_animal
(
    id BIGSERIAL primary key,
    animal_id integer not null,
    fotos VARCHAR not null
    
);


--Tornando animal_id uma FK da tabela arquivo_animal
ALTER TABLE arquivo_animal ADD CONSTRAINT fk1_arquivo_animal foreign key (animal_id) references animal(id) on update cascade on delete cascade;


--Criando pessoa_interessa_animal
CREATE TABLE pessoa_interessa_animal
(
    id BIGSERIAL primary key,
	pessoa_id INTEGER not null,
	animal_id INTEGER not null,
    status VARCHAR (50) not null,
    data DATE not null
    
);


--Tornando pessoa_id/animal_id uma FK da tabela pessoa_interessa_animal
ALTER TABLE pessoa_interessa_animal ADD CONSTRAINT fk1_pessoa_interessa_animal foreign key (pessoa_id) references pessoa(usuario_id) on update cascade on delete cascade;
ALTER TABLE pessoa_interessa_animal ADD CONSTRAINT fk2_pessoa_interessa_animal foreign key (animal_id) references animal(id) on update cascade on delete cascade;

--Colocando UK entre pessoa_id e animal_id na tabela pessoa_interessa_animal
ALTER TABLE pessoa_interessa_animal ADD CONSTRAINT uk1_pessoa_interessa_animal unique(pessoa_id, animal_id);

--Criando tabela campanha
CREATE TABLE campanha
(
    id BIGSERIAL primary key,
    titulo VARCHAR (100) not null,
    descricao VARCHAR (1000) not null,
    requisitos VARCHAR (1000) not null,
    data_inicio DATE not null,
    data_fim DATE not null,
	instituicao_id integer not null,
	formulario_id integer not null

);

--Tornando instituicao_id uma FK da tabela campanha
ALTER TABLE campanha ADD CONSTRAINT fk1_campanha foreign key (instituicao_id) references instituicao(usuario_id) on update cascade on delete cascade;

--Criando tabela arquivo_campanha
CREATE TABLE arquivo_campanha
(
    id BIGSERIAL primary key,
    campanha_id integer not null,
    fotos VARCHAR not null
    
);


--Tornando campanha_id uma FK da tabela arquivo_campanha
ALTER TABLE arquivo_campanha ADD CONSTRAINT fk1_arquivo_campanha foreign key (campanha_id) references campanha(id) on update cascade on delete cascade;

--Criando pessoa_cadastra_campanha
CREATE TABLE pessoa_cadastra_campanha
(
    id BIGSERIAL primary key,
	pessoa_id INTEGER not null,
	campanha_id INTEGER not null,
	situacao VARCHAR (50) not null,
    data DATE not null
    
);

--Tornando pessoa_id/campanha_id uma FK da tabela pessoa_cadastra_campanha
ALTER TABLE pessoa_cadastra_campanha ADD CONSTRAINT fk1_pessoa_cadastra_campanha foreign key (pessoa_id) references pessoa(usuario_id) on update cascade on delete cascade;
ALTER TABLE pessoa_cadastra_campanha ADD CONSTRAINT fk2_pessoa_cadastra_campanha foreign key (campanha_id) references campanha(id) on update cascade on delete cascade;

--Colocando UK entre pessoa_id e campanha_id na tabela pessoa_cadastra_campanha
ALTER TABLE pessoa_cadastra_campanha ADD CONSTRAINT uk1_pessoa_cadastra_campanha unique(pessoa_id, campanha_id);


--Criando tabela formulario
CREATE TABLE formulario
(
    id BIGSERIAL primary key,
    url VARCHAR (300) not null
    
);


--Tornando formulario_id uma FK da tabela campanha
ALTER TABLE campanha ADD CONSTRAINT fk2_campanha foreign key (formulario_id) references formulario(id) on update cascade on delete cascade;





--Adicionando cidades que o projeto vai atender inicialmente
-----------------------------------------------------------
INSERT INTO municipio (id , uf, nome) 
values ('1' , 'Minas Gerais' , 'Pouso Alegre');

INSERT INTO municipio (id , uf, nome) 
values ('2' , 'Minas Gerais' , 'Santa Rita do Sapucai');


--Adicionando usuarios do tipo pessoa 
-----------------------------------------------------------
INSERT INTO usuario (id , nome, senha,email,celular,situacao,data,aceite,tipo) 
values ('1' , 'Vinicius Almeida' , '123', 'vinicius@gmail.com','9','true','01/09/2022','true','pessoa');

INSERT INTO usuario (id , nome, senha,email,celular,situacao,data,aceite,tipo) 
values ('2' , 'Lucas Dias' , '123', 'lucas@gmail.com','99','true','01/09/2022','true','pessoa');

INSERT INTO usuario (id , nome, senha,email,celular,situacao,data,aceite,tipo) 
values ('3' , 'Matheus Souza' , '123', 'matheus@gmail.com','999','true','01/09/2022','true','pessoa');


--Adicionando usuarios do tipo instituicao 
-----------------------------------------------------------
INSERT INTO usuario (id , nome, senha,email,celular,situacao,data,aceite,tipo) 
values ('4' , 'Sociedade Protetora dos Animais' , '123', 'spa@gmail.com','99999','true','01/09/2022','true','instituicao');



--Adicionando pessoas
-----------------------------------------------------------
INSERT INTO pessoa (usuario_id , logradouro,numero,cep,municipio_id) 
values ('1' , 'Rua 1', '1', '375540000','1');

INSERT INTO pessoa (usuario_id , logradouro,numero,cep,municipio_id) 
values ('2' , 'Rua 2' , '2', '375540000','1');

INSERT INTO pessoa (usuario_id , logradouro,numero,cep,municipio_id) 
values ('3' , 'Rua 3' , '3', '375540000','1');


--Adicionando instituicao
-----------------------------------------------------------
INSERT INTO instituicao (usuario_id,cnpj,logradouro,numero,cep,cpf,municipio_id) 
values ('4' , '00000000000000', 'Rua 5', '10','375540000','00000000000','1');


--Adicionando animal
-----------------------------------------------------------
INSERT INTO animal (id ,nome, tipo,sexo,peso,porte,raca,situacao_adocao,temperamento,pelagem_primaria,pelagem_secundaria,instituicao_id) 
values ('1' , 'Tibursio','cachorro', 'masculino', '5','médio','Sem raça','true','Calmo', 'Branco', 'Marrom', '4');


--Adicionando formulario
-----------------------------------------------------------
INSERT INTO formulario (id , url)
values ('1' , 'vacinas.com.br');


--Adicionando campanha
-----------------------------------------------------------
INSERT INTO campanha (id , titulo,descricao,requisitos,data_inicio,data_fim,instituicao_id,formulario_id)
values ('1' , 'Vacinação', 'Vacinação de cachorros e gatos', 'Sem requisitos','01/09/2022','01/09/2023','4','1');





--Adicionando arquivo_animal
-----------------------------------------------------------
INSERT INTO arquivo_animal (id , animal_id,fotos)
values ('1' , '1', 'fotos_no_futuro');


--Adicionando pessoa_interessa_animal
-----------------------------------------------------------
INSERT INTO pessoa_interessa_animal (id , pessoa_id,animal_id,status,data)
values ('1' , '1', '1','Aprovado', '01/09/2022');


--Adicionando arquivo_campanha
-----------------------------------------------------------
INSERT INTO arquivo_campanha (id , campanha_id,fotos)
values ('1' , '1', 'fotos_no_futuro');
