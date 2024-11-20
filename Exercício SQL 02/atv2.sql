/*Questão 1*/
SELECT Nome 
FROM EMPREGADO 
WHERE Depto = (SELECT Numero FROM DEPARTAMENTO WHERE Nome = 'Engenharia Civil');

/*Questão 2*/
SELECT PROJETO.Numero AS Numero_Projeto, DEPARTAMENTO.Numero AS Numero_Departamento, EMPREGADO.Nome AS Nome_Gerente 
FROM PROJETO
JOIN DEPARTAMENTO_PROJETO ON PROJETO.Numero = DEPARTAMENTO_PROJETO.Numero_Projeto
JOIN DEPARTAMENTO ON DEPARTAMENTO_PROJETO.Numero_Depto = DEPARTAMENTO.Numero
JOIN EMPREGADO ON DEPARTAMENTO.RG_Gerente = EMPREGADO.RG
WHERE PROJETO.Localizacao = 'São Paulo';

/*Questão 3*/
SELECT e.Nome
FROM EMPREGADO e
JOIN EMPREGADO_PROJETO ep ON e.RG = ep.RG_Empregado
WHERE NOT EXISTS (
    SELECT 1 
    FROM DEPARTAMENTO_PROJETO dp
    WHERE dp.Numero_Depto = 3
    AND dp.Numero_Projeto NOT IN (SELECT ep.Numero_Projeto FROM EMPREGADO_PROJETO ep WHERE ep.RG_Empregado = e.RG)
);

/*Questão 4*/
SELECT DISTINCT ep.Numero_Projeto
FROM EMPREGADO e
LEFT JOIN EMPREGADO_PROJETO ep ON e.RG = ep.RG_Empregado
LEFT JOIN DEPARTAMENTO d ON e.Depto = d.Numero
LEFT JOIN DEPARTAMENTO_PROJETO dp ON d.Numero = dp.Numero_Depto
WHERE e.Nome = 'Fernando';

/*Questão 5*/
SELECT Nome 
FROM EMPREGADO 
WHERE RG NOT IN (SELECT RG_Responsavel FROM DEPENDENTES);

/*Questão 6*/
SELECT e.Nome
FROM EMPREGADO e
JOIN DEPARTAMENTO d ON e.RG = d.RG_Gerente
WHERE e.RG IN (SELECT RG_Responsavel FROM DEPENDENTES);

/*Questão 7*/
SELECT DISTINCT Numero_Depto
FROM DEPARTAMENTO_PROJETO
JOIN PROJETO ON DEPARTAMENTO_PROJETO.Numero_Projeto = PROJETO.Numero
WHERE PROJETO.Localizacao = 'Rio Claro';

/*Questão 8*/
SELECT DISTINCT e.Nome, e.RG 
FROM EMPREGADO e
WHERE e.RG IN (SELECT RG_Supervisor FROM EMPREGADO WHERE RG_Supervisor IS NOT NULL);

/*Questão 9*/
SELECT Nome 
FROM EMPREGADO 
WHERE Salario >= 2000;

/*Questão 10*/
SELECT Nome 
FROM EMPREGADO 
WHERE Nome LIKE 'J%';

/*Questão 11*/
SELECT Nome 
FROM EMPREGADO 
WHERE Nome LIKE '%Luiz%' OR Nome LIKE '%Luis%';

/*Questão 12*/
SELECT Nome 
FROM EMPREGADO 
WHERE Depto = (SELECT Numero FROM DEPARTAMENTO WHERE Nome = 'Engenharia Civil');

/*Questão 13*/
SELECT DISTINCT d.Nome 
FROM DEPARTAMENTO d
JOIN DEPARTAMENTO_PROJETO dp ON d.Numero = dp.Numero_Depto
JOIN PROJETO p ON dp.Numero_Projeto = p.Numero
WHERE p.Nome = 'Motor 3';

/*Questão 14*/
SELECT e.Nome
FROM EMPREGADO e
JOIN EMPREGADO_PROJETO ep ON e.RG = ep.RG_Empregado
JOIN PROJETO p ON ep.Numero_Projeto = p.Numero
WHERE p.Nome = 'Financeiro 1';

/*Questão 15*/
SELECT e.Nome 
FROM EMPREGADO e
JOIN EMPREGADO supervisor ON e.RG_Supervisor = supervisor.RG
WHERE supervisor.Salario BETWEEN 2000 AND 2500;

/*Questão 16*/
SELECT DISTINCT e.Nome 
FROM EMPREGADO e
JOIN DEPARTAMENTO d ON e.RG = d.RG_Gerente
WHERE e.RG IN (SELECT RG_Responsavel FROM DEPENDENTES);

/*Questão 17*/
UPDATE EMPREGADO 
SET Salario = 3000.00 
WHERE Depto = 2;

/*Questão 18*/
UPDATE EMPREGADO 
SET Salario = Salario * 1.10;

/*Questão 19*/
SELECT AVG(Salario) AS Media_Salarial 
FROM EMPREGADO;

/*Questão 20*/
SELECT Nome 
FROM EMPREGADO 
WHERE Salario > (SELECT AVG(Salario) FROM EMPREGADO)
ORDER BY Nome;
