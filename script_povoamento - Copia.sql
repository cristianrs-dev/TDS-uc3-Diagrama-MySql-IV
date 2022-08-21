USE hospital;

INSERT INTO clinica(id,nome,endereco) 
VALUES(1,'Gilberto Mestrinho','rua iça, 500');
SELECT * FROM clinica;


INSERT INTO convenio(nome, cnpj, carencia, id_clinica)
VALUES		('MedMais','80.690.127/0001-19','2016-01-01',1),
			('UniSaude','44.661.758/0001-46','2018-01-01',1),
            ('ProHealth','94.375.424/0001-84','2020-01-01',1),
            ('HupSaúde','37.356.783/0001-50','2022-01-01',1);
SELECT * FROM convenio;

       
INSERT INTO medico(nome, crm, id_clinica) 
VALUES ('Anny Quintanilha','120935',1),
	   ('Suéli Simão Pegado','15891',1),
       ('Alisson Sacramento','178105',1),
       ('Lívia Veloso','17897',1),
       ('Gael Milheiro Lemes','9826',1),
       ('Gisela Espinosa','34548',1),
       ('Nelson Anjos Palmeira','344789',1),
       ('Ezequiel Pestana Henriques','9756',1),
       ('Tito Carqueijeiro','14777',1),
       ('Fabiano Gomide ','65765',1),
       ('Cristovão Xavier','67432',1),
       ('Alberto Veríssimo','13548',1),
       ('Júlia Camarinho','24654',1);
SELECT * FROM medico;



INSERT INTO especialidade(descricao)
VALUES		('clinica geral'),
			('pediatria'),
			('gastroenterologia'),
            ('dermatologista'),
            ('fonoaudiologia'),
            ('cardiologia'),
            ('fisioterapia'),
            ('anestesiologia'),
            ('pneumologia'),
            ('urologia');
SELECT * FROM especialidade;


INSERT INTO medico_especialidade(id_medico,id_especialidade)
VALUES		(1,1),
			(1,2),
			(2,1),
			(3,3),
            (4,2),
			(4,3),
            (5,4),
            (6,1),
            (7,2),
            (8,2),
            (9,1),
            (10,1),
            (11,4),
			(11,2),
            (12,2),
            (13,1),
            (13,3);
SELECT * FROM medico_especialidade;

INSERT INTO paciente(nome, rg, cpf, carteira, data_nasc, endereco, telefone, email, id_convenio)
VALUES		('Karine Macena Porciúncula','46.461.993-2','938.188.862-02','77869534','1923-04-05','rua Bela Vista 5981','(55) 3126-4116','karine@hotmail.com',1),
			('Zilda Gomide Osório','47.793.239-3','417.799.765-00','55643215','1935-05-08','rua Dom Pedro II 6911','(53) 3650-9681','zilda@hotmail.com',2),
			('Karine kessia Porciúncula','26.922.453-1','687.273.564-34','58978963','1950-04-10','rua Paraná 4647','(51) 3634-0528','kessia@hotmail.com',3),
			('Fabrício Norões Xavier','37.252.773-5','748.285.275-16','21484234','1960-12-21','rua Ceará 2193','(53) 2622-4160','fabricio@hotmail.com',4),
            ('Fabrício Marques Xavier','13.726.685-6','343.278.862-20','14162115','1970-03-22','rua Santa Catarina 6240','(53) 3659-3858','marques@hotmail.com',4),
            ('César Sítima Faria','34.067.753-3','333.823.561-55','25045879','1937-02-02','rua Vinte e Três 382','(51) 3869-3417','cesar@hotmail.com',3),
            ('Silvana Fartaria Nazário','35.798.496-1','391.423.425-38','487335564','1945-01-06','rua Dom Pedro II 477','(53) 2370-2569','Silvana@hotmail.com',2),
            ('Evandro Trindade Bouça','32.237.459-5','661.753.403-45','312564783','1993-09-09','rua São Jorge 5505','(53) 2962-1674','Evandro@hotmail.com',1),
            ('Carla Macena Porciúncula','45.240.645-6','347.562.768-06','12341234','1993-09-14','rua Dois 8239','(55) 3227-7855','carla@hotmail.com',2),
            ('Ivo Brandão Palos','45.614.475-4','227.454.146-90','12342342','1994-08-21','rua São Paulo 9117','(55) 3554-7754','ivo@hotmail.com',2),
			('Armindo Moreira Azeredo','44.718.663-2','517.211.422-07','2221475568','1954-05-23','rua Paraná 5195','(53) 2966-8546','armindo@hotmail.com',4),
			('Geysa Gomide Osório','37.257.146-3','217.543.663-25','55569824','2009-05-23','rua Vinte e Um 2312','(54) 2744-8353','geysa@hotmail.com',4),
            ('Mark Festas Santana','38.232.277-0','333.186.873-67','4351315','2010-08-25','rua Vinte e Dois 8473','(54) 3186-8336','mark@hotmail.com',1),
			('Ricardo Moreira Azeredo','39.506.612-8','783.351.667-81','993594867','2012-01-23','rua Santa Luzia 7558','(55) 3452-2653','ricardo@hotmail.com',1),
			('Mark Festas Santana','15.324.338-7','032.583.169-61','333587977','1966-02-04','rua São Francisco 3304','(51) 2757-8091','mark@hotmail.com',1),
            ('Bernardo Carlos Azeredo','14.544.503-3','657.965.566-65','34214124','2008-01-01','rua Treze de Maio 138','(55) 2311-1936','bernardo@hotmail.com',2);
SELECT * FROM paciente;


INSERT INTO consulta(data_hora,valor,id_medico,id_especialidade,id_paciente,id_convenio)
VALUES		('2015-02-06 09:20',    110.00,	1,	1,	1,	2),
			('2015-02-16 09:10',	110.00,	4,	3,	2,	1),
			('2016-03-01 09:20',	110.00,	8,	2,	1,	2),
			('2015-04-04 09:20',	180.00,	3,	3,	4,	1),
			('2015-05-24 11:10',	150.00,	3,	3,	4,	1),
			('2019-07-02 16:10',	110.00,	2,	1,	6,	4),
			('2019-07-20 12:10',	180.00,	5,	4,	7,	4),
			('2019-08-03 15:20',	150.00,	2,	1,	8,	4),
			('2017-08-05 16:10',	110.00,	3,	3,	1,	2),
			('2019-10-14 09:20',	75.00,	8,	2,	10,	3),
			('2019-11-01 08:10',	150.00,	1,	1,	11,	3),
			('2015-11-05 15:10',	100.00,	4,	3,	2,	1),
			('2017-11-27 13:10',	100.00,	8,	2,	13,	2),
			('2017-02-17 10:10',	75.00,	7,	2,	11,	3),
			('2016-03-01 08:10',	75.00,	7,	2,	1,	2),
			('2019-03-07 08:20',	150.00,	1,	1,	11,	3),
			('2021-05-16 11:20',	150.00,	6,	1,	6,	4),
			('2015-05-16 09:10',	100.00,	6,	1,	4,	1),
			('2017-06-25 14:20',	100.00,	6,	1,	1,	1),
			('2019-06-26 14:20',	110.00,	2,	9,	10,	3);
SELECT * FROM consulta;        
            


INSERT INTO receita(remedio, quantidade, orientacao, id_consulta)
VALUES		('Paracetamol',  	1,	'Tomar de 8 horas',	    1),
			('Zaltrap',     	1,	'Tomar de 10 horas',	2),
			('Acetilcisteína',	2,	'Tomar de 12 horas',	3),
			('Aciclovir',	    3,	'Tomar 3 x semana',	    3),
			('Entyvio',	        1,	'Tomar 5 horas',	    5),
			('Diclofenaco',	    1,	'Tomar 5 horas',	    6),
			('Adenosina',	    1,	'Tomar 1 x dia',	    3),
			('Ibuprofeno',	    1,	'Tomar de 8 horas',	    8),
			('Remicade',	    1,	'Tomar de 5 horas',	    9),
			('Abendazol',	    1,	'Tomar de 8 horas',	   10);
SELECT * FROM receita;         

INSERT INTO quarto(numero,tipo,id_paciente,id_tipo_quarto)
VALUES		(01,'pediatrico',1,3),
			(02,'quarto operatorio',2,1),
            (03,'quarto cirgurgico',3,2);
SELECT * FROM quarto;

INSERT INTO tipo_quarto(diaria, descricao)
VALUES		(100.00,'quarto coletivo'),
			(1500.00,'quarto enfermaria'),
            (2500.00,'quarto duplo'),
            (3000.00,'quarto apartamento');
SELECT * FROM tipo_quarto;
            


INSERT INTO internacao(data_entrada, data_prev_alta, data_alta, procedimento, id_quarto, id_paciente, id_medico)
VALUES		('2015-04-05',	'2015-04-10',	'2015-04-12',	'repouso obrigatorio',	1,	1,	2),
			('2015-05-10',	'2015-05-15',	'2015-05-16',	'cirurgia',	2,	2,	1),
			('2016-06-03',	'2016-06-08',	'2016-06-09',	'medicacao',	1,	1,	2),
			('2015-07-05',	'2015-07-10',	'2015-07-11',	'observação',	2,	4,	1),
			('2017-08-20',	'2017-08-30',	'2017-09-02',	'observação',	2,	4,	1),
			('2020-08-02',	'2020-08-07',	'2020-08-08',	'cirurgia',	3,	6,	4),
			('2020-08-20',	'2020-08-27',	'2020-08-27',	'cirurgia',	3,	7,	4);
SELECT * FROM internacao;


INSERT INTO ala_internacao(id_enfermeiro, id_internacao)
VALUES		(1,1),
			(2,1),
            (3,1),
            (3,2),
            (4,2),
            (5,3),
            (6,3),
            (6,4),
            (7,4),
            (7,5),
			(8,5),
            (8,5),
            (9,6),
            (10,6),
            (9,7),
            (10,7);
SELECT * FROM ala_internacao;

INSERT INTO enfermeiro(nome,cpf,cre)
VALUES		('Josiane Oliveira Batata','483.178.148-74','141510028-0'),
			('Henzo Valgueiro Maranhão','805.365.872-56','205125687-1'),
			('Carolina Natal Carvalho','646.169.022-08','405088775-8'),
			('Nayla Temes Horta','152.725.637-51','161844899-4'),
			('Cláudio Santana Teodoro','737.489.558-55','787899657-9'),
			('Alisha Bettencourt Ginjeira','383.483.237-59','455465981-5'),
			('Cândida Ribas Ramalho','954.773.441-56','778596123-2'),
			('Brayan Catela Baía','377.467.579-10','525222334-6'),
			('Simona Aguiar Amarante','261.394.744-69','662233875-5'),
			('Iulian Silveira Laranjeira','791.673.784-12','963654521-1');
SELECT * FROM enfermeiro;

			