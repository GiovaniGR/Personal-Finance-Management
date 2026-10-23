INSERT INTO CATEGORIA (descricao_ct, tipo)
VALUES ('Apartamento', 'FIXA')
RETURNING id_categoria;

INSERT INTO LANCAMENTOS ( id_categoria, descricao_lan, competencia)
VALUES (2,'Parcela Apto', '2026-09-01')
RETURNING id_lancamentos;

SELECT * FROM CATEGORIA;