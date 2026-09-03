# Personal Finance

Projeto de controle financeiro pessoal criado para transformar uma planilha em uma solução estruturada de dados.

O objetivo é desenvolver um projeto completo de portfólio, passando por banco de dados, ETL em Python, consultas, dashboard e, futuramente, uma API.

> **Status:** estrutura inicial do banco criada. Os relacionamentos entre as tabelas serão desenvolvidos na próxima etapa.

## Objetivo

Centralizar dados de receitas, despesas, parcelas, financiamentos e dívidas para facilitar o acompanhamento financeiro e a criação de análises.

O fluxo planejado é:

```text
Planilha → PostgreSQL → ETL com Python → Consultas → Dashboard/API
```

## Tecnologias

| Tecnologia | Uso no projeto |
| --- | --- |
| Google Sheets | Fonte inicial do controle financeiro. |
| PostgreSQL | Armazenamento e organização dos dados. |
| SQL | Criação das tabelas e futuras consultas. |
| pgAdmin 4 | Execução e validação das queries. |
| GitHub | Versionamento e documentação do projeto. |
| Python | Planejado para ETL e automações. |

## O que foi desenvolvido

Nesta primeira etapa:

- analisei as informações existentes na planilha;
- criei o banco de dados no PostgreSQL;
- modelei as entidades iniciais;
- escrevi manualmente os comandos `CREATE TABLE`;
- defini chaves primárias, campos obrigatórios e tipos de dados;
- executei e validei cada tabela pelo Query Tool do pgAdmin.

Foram criadas quatro tabelas iniciais:

| Tabela | Finalidade |
| --- | --- |
| `CATEGORIA` | Padronizar a classificação dos lançamentos. |
| `LANCAMENTOS` | Centralizar receitas, despesas e parcelas. |
| `FINANCIAMENTOS` | Armazenar informações de valores financiados. |
| `DIVIDAS` | Acompanhar dívidas, parcelas e adiantamentos. |

## Principais decisões

### Categoria separada dos lançamentos

A tabela `CATEGORIA` evita que o nome de uma categoria seja digitado de formas diferentes em vários registros. O campo `id_categoria` foi incluído em `LANCAMENTOS` para preparar o relacionamento entre as tabelas.

### Lançamentos como tabela central

A tabela `LANCAMENTOS` reúne os eventos financeiros que serão utilizados nas análises. Ela contém informações como descrição, categoria, datas, valores, status, forma de pagamento, responsável e competência.

### Uma linha para cada parcela

Cada parcela será registrada como um lançamento. Essa escolha permitirá identificar quanto vence em cada mês e criar projeções mais confiáveis.

### Separação entre previsão e realização

Foram criados campos diferentes para valor previsto e valor pago. Também foram separadas as datas de vencimento, efetivação e competência.

Com isso, será possível comparar o planejamento com o que realmente aconteceu.

### Financiamentos e dívidas em tabelas próprias

Essas informações possuem características específicas, como valor total, valor da parcela e adiantamento. A separação evita sobrecarregar a tabela de lançamentos com campos que não seriam utilizados em todos os registros.

### Relacionamentos como próxima etapa

Primeiro foram validados os nomes, campos e tipos de dados. As chaves estrangeiras serão adicionadas após a criação do diagrama e a revisão dos relacionamentos.

O primeiro relacionamento previsto é:

```text
CATEGORIA (1) ──── (N) LANCAMENTOS
```

Uma categoria poderá possuir vários lançamentos, enquanto cada lançamento deverá pertencer a uma categoria.

## Conceitos praticados

- modelagem inicial de banco de dados;
- criação de tabelas com SQL;
- `PRIMARY KEY` e `GENERATED ALWAYS AS IDENTITY`;
- campos obrigatórios com `NOT NULL`;
- tipos `INTEGER`, `VARCHAR`, `DATE` e `NUMERIC`;
- separação de dados por responsabilidade;
- preparação para chaves estrangeiras;
- execução e validação incremental de queries;
- documentação e versionamento do projeto.

Esse processo contribui para o objetivo final porque cria uma base organizada para o ETL, as consultas financeiras, o dashboard e uma possível API.

## Como executar

1. Crie um banco de dados no PostgreSQL.
2. Abra o Query Tool no pgAdmin.
3. Abra o arquivo `sql/01_criacao_tabelas.sql`.
4. Execute os comandos.
5. Atualize a lista de tabelas no pgAdmin.

Para conferir as tabelas criadas:

```sql
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;
```

## Estrutura do repositório

```text
personal-finance/
├── README.md
└── sql/
    └── 01_criacao_tabelas.sql
```

Novas pastas serão adicionadas quando as etapas de ETL e dashboard forem iniciadas.

## Próximos passos

- [x] Criar a estrutura inicial do banco.
- [x] Validar as tabelas no PostgreSQL.
- [ ] Criar o diagrama entidade-relacionamento.
- [ ] Definir as chaves estrangeiras.
- [ ] Revisar as regras de integridade.
- [ ] Inserir dados fictícios para testes.
- [ ] Criar consultas de análise.
- [ ] Desenvolver o ETL em Python.
- [ ] Criar o dashboard.

O projeto está em desenvolvimento e este README será atualizado conforme novas etapas forem concluídas.
