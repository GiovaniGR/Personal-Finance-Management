CREATE TABLE CATEGORIA(
	id_categoria INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	descricao_ct VARCHAR(100) NOT NULL,
	tipo VARCHAR(20) NOT NULL
);

CREATE TABLE LANCAMENTOS(
	id_lancamentos INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	id_categoria INTEGER NOT NULL,
	descricao_lan VARCHAR (100) NOT NULL,
	data_vencimento_lan DATE,
	data_recebimento_lan DATE,
	numero_parcelas INT,
	total_parcela INT,
	valor_prev NUMERIC(12,2),
	valor_pago NUMERIC(12,2),
	status_lanc_pg VARCHAR(20),
	forma_pg VARCHAR(20),
	resp_pg VARCHAR (20),
	competencia DATE NOT NULL,
	obs VARCHAR (100)
);

CREATE TABLE FINANCIAMENTOS (
	id_financiamento INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	valor_total NUMERIC(12,2),
	valor_parcela NUMERIC (12,2),
	vl_adiantamento_parcela_fc NUMERIC(12,2),
	qtd_adiantamento_parcela_fc INT,
	fin_vencimento DATE  NOT NULL,
	data_pg DATE,
	status_fin VARCHAR (20)
);

CREATE TABLE DIVIDAS (
	id_dividas INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	valor_total_div NUMERIC(12,2),
	valor_parcela_dv NUMERIC (12,2),
	vl_adiantamento_parcela_dv NUMERIC(12,2),
	qtd_adiantamento_parcela_dv INT,
	status_div VARCHAR(20),
	data_pg DATE 
);

CREATE TABLE METAS (
	id_meta INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	descricao_meta VARCHAR(30),
	valor_meta NUMERIC (12,2),
	valor_acumulado NUMERIC(12,2),
	prazo DATE 
);
