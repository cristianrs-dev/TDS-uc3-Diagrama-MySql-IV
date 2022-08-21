USE hospital;

/*1.Todos os dados e o valor médio das consultas do ano de 2020 e das que foram feitas sob convênio.*/
SELECT *FROM consulta;
UPDATE consulta SET data_hora='2020-03-01 9:20:00' WHERE id=3;
UPDATE consulta SET data_hora='2020-02-10 8:10:00' WHERE id=15;

SELECT *,(SELECT AVG(valor)) AS media_total
FROM consulta 
WHERE data_hora BETWEEN '2020-01-01' AND '2020-12-31';



/*2 DADOS DAS INTERNACOES QUE TIVERAM ALTA MAIOR QUE A DATA PREVISTA*/
SELECT * FROM internacao;
SELECT * FROM internacao WHERE data_alta > data_prev_alta;

/*3 PRIMEIRA CONSULTA COM RECEITUARIO ASSOCIADO*/
SELECT * FROM consulta;
SELECT * FROM receita;
SELECT *, r.remedio,r.quantidade, r.orientacao FROM consulta as c, receita as r
WHERE r.id_consulta=c.id and c.id=1;


/*4 CONSULTA DE MAIOR VALOR E CONSULTA DE MENOR VALOR E NAO FORAM REALIZADAS SOB CONVENIO*/
SELECT * FROM consulta;
ALTER TABLE consulta DROP FOREIGN KEY consulta_ibfk_1;
ALTER TABLE consulta DROP FOREIGN KEY consulta_ibfk_4;
ALTER TABLE consulta DROP FOREIGN KEY consulta_ibfk_2;
ALTER TABLE consulta DROP FOREIGN KEY consulta_ibfk_3;
ALTER TABLE consulta MODIFY id_convenio INT;
UPDATE consulta SET id_convenio=null WHERE id=4 OR id=7;
UPDATE consulta SET id_convenio=null WHERE id=10 OR id=14 OR id=15;
ALTER TABLE consulta ADD FOREIGN KEY(id_convenio) REFERENCES convenio(id);
SELECT * FROM consulta WHERE valor=(SELECT MAX(valor) FROM consulta);
SELECT * FROM consulta WHERE valor=(SELECT MIN(valor) FROM consulta);

/*5.Todos os dados das internações em seus respectivos quartos, calculando o total da internação
 a partir do valor de diária do quarto e o número de dias entre a entrada e a alta.*/
 SELECT * FROM internacao;
 SELECT * FROM quarto;
 SELECT * FROM tipo_quarto;
 UPDATE quarto SET id_tipo_quarto=4 WHERE id=3;
 ALTER TABLE quarto ADD FOREIGN KEY(id_tipo_quarto) REFERENCES tipo_quarto(id);

 SELECT I.id, I.data_entrada AS entrada, I.data_prev_alta AS alta,
 I.data_alta AS alta, I.procedimento,
 I.id_quarto AS numQuarto, I.id_paciente, I.id_medico, T.diaria,
(SELECT(I.data_alta - I.data_entrada)) AS dias,
 (SELECT (SELECT (T.diaria*(I.data_alta - I.data_entrada)))) AS total_diaria 
 FROM internacao AS I JOIN quarto AS Q JOIN tipo_quarto AS T
 ON I.id_quarto=Q.id AND Q.id_tipo_quarto=T.id ORDER BY id ASC;

/*6 Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”.*/
SELECT * FROM quarto;
SELECT * FROM tipo_quarto;
SELECT * FROM internacao;
SELECT I.id, I.data_entrada, I.procedimento, Q.numero numeroQuarto, T.descricao
 FROM internacao AS I JOIN quarto AS Q JOIN tipo_quarto AS T
 ON I.id_quarto=Q.id AND Q.id_tipo_quarto=T.id AND T.descricao='quarto apartamento';
 /*I.id_quarto=Q.id AND T.id=4 AND Q.numero=3;*/
 
 /*7.	Nome do paciente, data da consulta e especialidade de todas as 
 consultas em que os pacientes eram menores de 18 anos na data da consulta
 e cuja especialidade não seja “pediatria”, ordenando por data de realização da consulta.*/
SELECT * FROM paciente;
SELECT * FROM consulta;

 SELECT P.nome as nomePaciente, DATE(C.data_hora) AS data, E.descricao especialista,
 /*DATEDIFF(data_hora,data_nasc) as idade*/
 YEAR(DATE(data_hora)) - YEAR(data_nasc) AS idade
 FROM paciente AS P JOIN consulta AS C JOIN especialidade AS E
 ON C.id_paciente=C.id AND C.id_especialidade = E.id AND 
 YEAR(DATE(data_hora)) - YEAR(data_nasc)<18 AND 
 E.descricao<>'pediatria' ORDER BY DATE(data) ASC;

/*8.	Nome do paciente, nome do médico, data da internação e procedimentos 
das internações realizadas por médicos da especialidade “gastroenterologia”, 
que tenham acontecido em “enfermaria”.*/

SELECT P.nome AS nomePaciente, M.nome AS nomeMedico, 
 I.data_entrada AS dataInternacao, I.procedimento
FROM paciente AS P JOIN medico AS M JOIN especialidade AS E 
JOIN internacao AS I JOIN quarto AS Q JOIN tipo_quarto AS T JOIN medico_especialidade ME
ON I.id_paciente=P.id and I.id_medico=M.id and I.id_medico=ME.id and T.id=Q.id_tipo_quarto
WHERE E.descricao='gastroenterologia' and T.descricao='quarto enfermaria'
GROUP BY P.id;


ALTER TABLE quarto DROP FOREIGN KEY quarto_ibfk_2;
UPDATE quarto SET id_tipo_quarto=2 WHERE id=1;
ALTER TABLE quarto ADD FOREIGN KEY(id_tipo_quarto)REFERENCES tipo_quarto(id);
SELECT *FROM quarto;
select*from tipo_quarto; 
select*from internacao;

SELECT P.id, P.nome AS nomePaciente, M.nome AS nomeMedico, 
E.descricao especialidade, I.data_entrada AS dataInternacao, 
I.procedimento, Q.numero numQuarto, T.descricao tipo
FROM paciente AS P JOIN medico AS M JOIN especialidade AS E 
JOIN internacao AS I JOIN quarto AS Q JOIN tipo_quarto AS T
ON  Q.id_tipo_quarto=T.id AND Q.id=I.id_quarto AND
E.descricao='gastroenterologia' AND T.descricao='quarto enfermaria';

 /*9.	Os nomes dos médicos, seus CRMs e a quantidade de consultas que cada um realizou.*/
SELECT M.nome, M.crm,COUNT(C.id_medico) AS quantidade_consultas 
FROM consulta as C INNER JOIN medico as M 
WHERE M.em_atividade<>'inativo' AND M.id=C.id_medico
GROUP BY M.id
ORDER BY M.id asc;


/*10. Os nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação.*/
SELECT*from internacao;
SELECT*from ala_internacao;
SELECT*FROM enfermeiro;

SELECT ENF.nome, ENF.cre, COUNT(ALA.id_enfermeiro) AS quantidade
FROM enfermeiro AS ENF INNER JOIN ala_internacao AS ALA
WHERE ENF.id = ALA.id_enfermeiro
GROUP BY ENF.id;

/*3,6,7,8,9,10*/