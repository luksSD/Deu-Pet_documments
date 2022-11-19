--Adicionando cidades que o projeto vai atender inicialmente
-----------------------------------------------------------
INSERT INTO municipio (id , uf, nome) 
values ('1' , 'Minas Gerais' , 'Pouso Alegre');


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
values ('4' , 'Sociedade Protetora dos Animais' , '123', 'spa@gmail.com','123','true','01/09/2022','true','instituicao');


--Adicionando cidades que o projeto vai atender inicialmente
-----------------------------------------------------------
INSERT INTO municipio (id , uf, nome) 
values ('2' , 'Minas Gerais' , 'Santa Rita do Sapucai');


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
INSERT INTO animal (id , tipo,sexo,peso,porte,raca,situacao_adocao,temperamento,pelagem_primaria,pelagem_secundaria,instituicao_id) 
values ('1' , 'cachorro', 'masculino', '5','médio','Sem raça','true','Calmo', 'Branco', 'Marrom', '4');


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
INSERT INTO pessoa_interessa_animal (id , pessoa_id,animal_id,data)
values ('1' , '1', '1','01/09/2022');


--Adicionando arquivo_campanha
-----------------------------------------------------------
INSERT INTO arquivo_campanha (id , campanha_id,fotos)
values ('1' , '1', 'fotos_no_futuro');