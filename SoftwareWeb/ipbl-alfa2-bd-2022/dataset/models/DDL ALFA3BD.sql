-- --------------------------------------------------------
-- Servidor:                     localhost
-- Versão do servidor:           PostgreSQL 13.10 on x86_64-pc-linux-musl, compiled by gcc (Alpine 12.2.1_git20220924-r4) 12.2.1 20220924, 64-bit
-- OS do Servidor:               
-- HeidiSQL Versão:              12.4.0.6659
-- --------------------------------------------------------
-- --------------------------------------------------------
-- PRINCIPAIS ALTERAÇÕES
-- Tabela Avaliação eu removi a coluna professor pois pelo aluno podemos obter turma e professor
-- Tabela aluno eu removi a coluna alu_tipo pois já temos a coluna tip_alu
-- Criei tabela tipo_aluno e relacionei com aluno
-- Criei tabela tipo_frase e relacionei com frase
-- Criei tabela tipo_contrato e relacionei com contrato
-- Criei as tabelas tipo_escola e categoria_escolar e relacionei com unidade_escolar
-- Criei tabela tipo_avaliacao e relacionei com avaliacao
-- --------------------------------------------------------

-- Copiando estrutura para tabela public.categoria_escolar
CREATE TABLE IF NOT EXISTS "categoria_escolar" (
	"cat_escola_id" SERIAL NOT NULL,
	"cat_escola_desc" VARCHAR NOT NULL,
	PRIMARY KEY ("cat_escola_id")
);

-- Copiando dados para a tabela public.categoria_escolar: 2 rows
/*!40000 ALTER TABLE "categoria_escolar" DISABLE KEYS */;
INSERT INTO "categoria_escolar" ("cat_escola_id", "cat_escola_desc") VALUES
	(1, 'Pública'),
	(2, 'Privada');
/*!40000 ALTER TABLE "categoria_escolar" ENABLE KEYS */;

-- Copiando estrutura para tabela public.tipo_avaliacao
CREATE TABLE IF NOT EXISTS "tipo_avaliacao" (
	"tip_aval_id" SERIAL NOT NULL,
	"tip_aval_desc" VARCHAR NOT NULL,
	PRIMARY KEY ("tip_aval_id")
);

-- Copiando dados para a tabela public.tipo_avaliacao: 3 rows
/*!40000 ALTER TABLE "tipo_avaliacao" DISABLE KEYS */;
INSERT INTO "tipo_avaliacao" ("tip_aval_id", "tip_aval_desc") VALUES
	(1, 'Avaliação Diagnóstica'),
	(2, 'Avaliação Formativa de Processo'),
	(3, 'Avaliação Formativa de Saída');
/*!40000 ALTER TABLE "tipo_avaliacao" ENABLE KEYS */;

-- Copiando estrutura para tabela public.tipo_contrato
CREATE TABLE IF NOT EXISTS "tipo_contrato" (
	"tip_contrato_id" SERIAL NOT NULL,
	"tip_contrato_desc" VARCHAR NOT NULL,
	PRIMARY KEY ("tip_contrato_id")
);

-- Copiando dados para a tabela public.tipo_contrato: 3 rows
/*!40000 ALTER TABLE "tipo_contrato" DISABLE KEYS */;
INSERT INTO "tipo_contrato" ("tip_contrato_id", "tip_contrato_desc") VALUES
	(1, 'Anual'),
	(2, 'Mensal'),
	(3, 'Exclusivo');
/*!40000 ALTER TABLE "tipo_contrato" ENABLE KEYS */;

-- Copiando estrutura para tabela public.tipo_escola
CREATE TABLE IF NOT EXISTS "tipo_escola" (
	"tip_escola_id" SERIAL NOT NULL,
	"tip_escola_desc" VARCHAR NULL DEFAULT NULL,
	PRIMARY KEY ("tip_escola_id")
);

-- Copiando dados para a tabela public.tipo_escola: 3 rows
/*!40000 ALTER TABLE "tipo_escola" DISABLE KEYS */;
INSERT INTO "tipo_escola" ("tip_escola_id", "tip_escola_desc") VALUES
	(1, 'Federal'),
	(2, 'Estadual'),
	(3, 'Municipal');
/*!40000 ALTER TABLE "tipo_escola" ENABLE KEYS */;

-- Copiando estrutura para tabela public.tipo_frase
CREATE TABLE IF NOT EXISTS "tipo_frase" (
	"tip_frase_id" SERIAL NOT NULL,
	"tip_frase_desc" VARCHAR NOT NULL,
	PRIMARY KEY ("tip_frase_id")
);

-- Copiando dados para a tabela public.tipo_frase: 3 rows
/*!40000 ALTER TABLE "tipo_frase" DISABLE KEYS */;
INSERT INTO "tipo_frase" ("tip_frase_id", "tip_frase_desc") VALUES
	(1, 'Palavras Aleatórias'),
	(2, 'Pseudo Palavras'),
	(3, 'Palavras Simples');
/*!40000 ALTER TABLE "tipo_frase" ENABLE KEYS */;

-- Copiando estrutura para tabela public.frase
CREATE TABLE IF NOT EXISTS "frase" (
	"fra_id" SERIAL NOT NULL,
	"fra_frase" VARCHAR(256) NOT NULL,
	"tip_frase" INTEGER NOT NULL,
	PRIMARY KEY ("fra_id"),
	CONSTRAINT "FRASE_Tipo" FOREIGN KEY ("tip_frase") REFERENCES "tipo_frase" ("tip_frase_id") ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Copiando dados para a tabela public.frase: 10 rows
/*!40000 ALTER TABLE "frase" DISABLE KEYS */;
INSERT INTO "frase" ("fra_id", "fra_frase", "tip_frase") VALUES
	(1, 'A certeza de inovar de maneira eficaz', 1),
	(2, 'O poder de realizar seus sonhos direto da fonte', 2),
	(3, 'A segurança de conseguir antes de tudo', 2),
	(4, 'A certeza de avançar com força total', 3),
	(5, 'O prazer de inovar em estado puro', 1),
	(6, 'A liberdade de avançar em estado puro', 1),
	(7, 'O prazer de concretizar seus projetos sem preocupação', 1),
	(8, 'A arte de evoluir simplesmente', 3),
	(9, 'O poder de ganhar com toda a tranquilidade', 2),
	(10, 'O prazer de concretizar seus projetos de maneira eficaz', 2);
/*!40000 ALTER TABLE "frase" ENABLE KEYS */;

-- Copiando estrutura para tabela public.cidade
CREATE TABLE IF NOT EXISTS "cidade" (
	"cid_id" SERIAL NOT NULL,
	"cid_nome" VARCHAR(255) NOT NULL,
	"cid_uf" VARCHAR(2) NOT NULL,
	"cid_pais" VARCHAR(50) NOT NULL,
	PRIMARY KEY ("cid_id")
);

-- Copiando dados para a tabela public.cidade: 5 rows
/*!40000 ALTER TABLE "cidade" DISABLE KEYS */;
INSERT INTO "cidade" ("cid_id", "cid_nome", "cid_uf", "cid_pais") VALUES
	(1, 'São Paulo', 'SP', 'Brasil'),
	(2, 'Rio de Janeiro', 'RJ', 'Brasil'),
	(3, 'Belo Horizonte', 'MG', 'Brasil'),
	(4, 'Salvador', 'BA', 'Brasil'),
	(5, 'Santa Catarina', 'SC', 'Brasil');
/*!40000 ALTER TABLE "cidade" ENABLE KEYS */;

-- Copiando estrutura para tabela public.endereco
CREATE TABLE IF NOT EXISTS "endereco" (
	"end_id" SERIAL NOT NULL,
	"end_rua" VARCHAR(255) NOT NULL,
	"end_numero" INTEGER NOT NULL,
	"end_cep" VARCHAR(9) NOT NULL,
	"cid_id" INTEGER NOT NULL,
	PRIMARY KEY ("end_id"),
	CONSTRAINT "endereco_cidade" FOREIGN KEY ("cid_id") REFERENCES "cidade" ("cid_id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Copiando dados para a tabela public.endereco: 7 rows
/*!40000 ALTER TABLE "endereco" DISABLE KEYS */;
INSERT INTO "endereco" ("end_id", "end_rua", "end_numero", "end_cep", "cid_id") VALUES
	(1, 'Rua das Flores', 123, '01000-000', 1),
	(2, 'Avenida dos Bandeirantes', 456, '04500-000', 1),
	(3, 'Rua Copacabana', 234, '22000-000', 2),
	(4, 'Rua Maracanã', 890, '20500-000', 2),
	(5, 'Avenida Afonso Pena', 123, '30130-000', 3),
	(6, 'Rua Pelourinho', 234, '40000-000', 4),
	(7, 'Avenida Beira-Mar', 456, '88050-000', 5);
/*!40000 ALTER TABLE "endereco" ENABLE KEYS */;


-- Copiando estrutura para tabela public.professor
CREATE TABLE IF NOT EXISTS "professor" (
	"pro_id" SERIAL NOT NULL,
	"pro_identificador" VARCHAR(256) NOT NULL,
	"pro_primeiro_nome" VARCHAR(255) NOT NULL,
	"pro_segundo_nome" VARCHAR(255) NOT NULL,
	"pro_senha" VARCHAR(256) NOT NULL,
	PRIMARY KEY ("pro_id")
);

-- Copiando dados para a tabela public.professor: 10 rows
/*!40000 ALTER TABLE "professor" DISABLE KEYS */;
INSERT INTO "professor" ("pro_id", "pro_identificador", "pro_primeiro_nome", "pro_segundo_nome", "pro_senha") VALUES
	(1, '555-12-3456', 'Royall', 'Adams', 'gAAAAABkaPztyZ5W2nWs6hW8U4bozfk-Ah4CsoX5AlzmI5-yjoa6eNmkgXNNd1tJRpd9So5CEm1Oquozvz9eGuQQBvIgBKNJlA=='),
	(2, '321-98-7654', 'Shawna', 'Parslow', 'gAAAAABkaPztyZ5W2nWs6hW8U4bozfk-Ah4CsoX5AlzmI5-yjoa6eNmkgXNNd1tJRpd9So5CEm1Oquozvz9eGuQQBvIgBKNJlA=='),
	(3, '876-54-3210', 'Blanca', 'Shotton', 'gAAAAABkaPztyZ5W2nWs6hW8U4bozfk-Ah4CsoX5AlzmI5-yjoa6eNmkgXNNd1tJRpd9So5CEm1Oquozvz9eGuQQBvIgBKNJlA=='),
	(4, '321-98-7654', 'Guillermo', 'Belf', 'gAAAAABkaPztyZ5W2nWs6hW8U4bozfk-Ah4CsoX5AlzmI5-yjoa6eNmkgXNNd1tJRpd9So5CEm1Oquozvz9eGuQQBvIgBKNJlA=='),
	(5, '321-98-7654', 'Sayre', 'Wisker', 'gAAAAABkaPztyZ5W2nWs6hW8U4bozfk-Ah4CsoX5AlzmI5-yjoa6eNmkgXNNd1tJRpd9So5CEm1Oquozvz9eGuQQBvIgBKNJlA=='),
	(6, '789-01-2345', 'Melodie', 'Keggins', 'gAAAAABkaPztyZ5W2nWs6hW8U4bozfk-Ah4CsoX5AlzmI5-yjoa6eNmkgXNNd1tJRpd9So5CEm1Oquozvz9eGuQQBvIgBKNJlA=='),
	(7, '234-56-7890', 'Nicky', 'Ivey', 'gAAAAABkaPztyZ5W2nWs6hW8U4bozfk-Ah4CsoX5AlzmI5-yjoa6eNmkgXNNd1tJRpd9So5CEm1Oquozvz9eGuQQBvIgBKNJlA=='),
	(8, '012-34-5678', 'Moria', 'Tilliards', 'gAAAAABkaPztyZ5W2nWs6hW8U4bozfk-Ah4CsoX5AlzmI5-yjoa6eNmkgXNNd1tJRpd9So5CEm1Oquozvz9eGuQQBvIgBKNJlA=='),
	(9, '987-65-4321', 'Jake', 'Austing', 'gAAAAABkaPztyZ5W2nWs6hW8U4bozfk-Ah4CsoX5AlzmI5-yjoa6eNmkgXNNd1tJRpd9So5CEm1Oquozvz9eGuQQBvIgBKNJlA=='),
	(10, '876-54-3210', 'Joelynn', 'Rodie', 'gAAAAABkaPztyZ5W2nWs6hW8U4bozfk-Ah4CsoX5AlzmI5-yjoa6eNmkgXNNd1tJRpd9So5CEm1Oquozvz9eGuQQBvIgBKNJlA==');
/*!40000 ALTER TABLE "professor" ENABLE KEYS */;

-- Copiando estrutura para tabela public.gestor_admin
CREATE TABLE IF NOT EXISTS "gestor_admin" (
	"ges_adm_id" SERIAL NOT NULL,
	"ges_adm_primeiro_nome" VARCHAR(256) NOT NULL,
	"ges_adm_segundo_nome" VARCHAR(256) NOT NULL,
	"ges_adm_senha" VARCHAR(256) NOT NULL,
	PRIMARY KEY ("ges_adm_id")
);

-- Copiando dados para a tabela public.gestor_admin: 4 rows
/*!40000 ALTER TABLE "gestor_admin" DISABLE KEYS */;
INSERT INTO "gestor_admin" ("ges_adm_id", "ges_adm_primeiro_nome", "ges_adm_segundo_nome", "ges_adm_senha") VALUES
	(1, 'Lucas', 'Silva', 'gAAAAABkaPztyZ5W2nWs6hW8U4bozfk-Ah4CsoX5AlzmI5-yjoa6eNmkgXNNd1tJRpd9So5CEm1Oquozvz9eGuQQBvIgBKNJlA=='),
	(2, 'Paula', 'Moraes', 'gAAAAABkaPztyZ5W2nWs6hW8U4bozfk-Ah4CsoX5AlzmI5-yjoa6eNmkgXNNd1tJRpd9So5CEm1Oquozvz9eGuQQBvIgBKNJlA=='),
	(3, 'Cristiano', 'de Paula', 'gAAAAABkaPztyZ5W2nWs6hW8U4bozfk-Ah4CsoX5AlzmI5-yjoa6eNmkgXNNd1tJRpd9So5CEm1Oquozvz9eGuQQBvIgBKNJlA=='),
	(4, 'Sofia', 'Magalhães', 'gAAAAABkaPztyZ5W2nWs6hW8U4bozfk-Ah4CsoX5AlzmI5-yjoa6eNmkgXNNd1tJRpd9So5CEm1Oquozvz9eGuQQBvIgBKNJlA==');
/*!40000 ALTER TABLE "gestor_admin" ENABLE KEYS */;

-- Copiando estrutura para tabela public.gestor_escola
CREATE TABLE IF NOT EXISTS "gestor_escola" (
	"ges_id" SERIAL NOT NULL,
	"ges_identificador" VARCHAR(256) NOT NULL,
	"ges_primeiro_nome" VARCHAR(256) NOT NULL,
	"ges_segundo_nome" VARCHAR(256) NOT NULL,
	"ges_senha" VARCHAR(256) NOT NULL,
	"ges_ges_id" INTEGER NOT NULL,
	PRIMARY KEY ("ges_id"),
	CONSTRAINT "gestor_escola_gestor_gestor" FOREIGN KEY ("ges_ges_id") REFERENCES "gestor_admin" ("ges_adm_id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Copiando dados para a tabela public.gestor_escola: 4 rows
/*!40000 ALTER TABLE "gestor_escola" DISABLE KEYS */;
INSERT INTO "gestor_escola" ("ges_id", "ges_identificador", "ges_primeiro_nome", "ges_segundo_nome", "ges_senha", "ges_ges_id") VALUES
	(1, '119.876.543-21', 'João', 'Silva ', 'gAAAAABkaPztyZ5W2nWs6hW8U4bozfk-Ah4CsoX5AlzmI5-yjoa6eNmkgXNNd1tJRpd9So5CEm1Oquozvz9eGuQQBvIgBKNJlA==', 1),
	(2, '119.876.543-22', 'Pedro', 'Almeida', 'gAAAAABkaPztyZ5W2nWs6hW8U4bozfk-Ah4CsoX5AlzmI5-yjoa6eNmkgXNNd1tJRpd9So5CEm1Oquozvz9eGuQQBvIgBKNJlA==', 3),
	(3, '119.012.345-67', 'Maria', 'Santos ', 'gAAAAABkaPztyZ5W2nWs6hW8U4bozfk-Ah4CsoX5AlzmI5-yjoa6eNmkgXNNd1tJRpd9So5CEm1Oquozvz9eGuQQBvIgBKNJlA==', 2),
	(4, '119.012.345-68', 'Ana', 'Oliveira', 'gAAAAABkaPztyZ5W2nWs6hW8U4bozfk-Ah4CsoX5AlzmI5-yjoa6eNmkgXNNd1tJRpd9So5CEm1Oquozvz9eGuQQBvIgBKNJlA==', 1);
/*!40000 ALTER TABLE "gestor_escola" ENABLE KEYS */;

-- Copiando estrutura para tabela public.unidade_escolar
CREATE TABLE IF NOT EXISTS "unidade_escolar" (
	"uni_id" SERIAL NOT NULL,
	"uni_codigo_inep" INTEGER NOT NULL,
	"uni_nome" VARCHAR(255) NOT NULL,
	"cat_esc" INTEGER NOT NULL,
	"tip_esc" INTEGER NOT NULL,
	"ges_id" INTEGER NOT NULL,
	"end_id" INTEGER NOT NULL,
	PRIMARY KEY ("uni_id"),
	CONSTRAINT "unidade_escolar_categoria_escola" FOREIGN KEY ("cat_esc") REFERENCES "categoria_escolar" ("cat_escola_id") ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT "unidade_escolar_endereco" FOREIGN KEY ("end_id") REFERENCES "endereco" ("end_id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "unidade_escolar_gestor_escola" FOREIGN KEY ("ges_id") REFERENCES "gestor_escola" ("ges_id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "unidade_escolar_tipo_escola" FOREIGN KEY ("tip_esc") REFERENCES "tipo_escola" ("tip_escola_id") ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Copiando dados para a tabela public.unidade_escolar: 6 rows
/*!40000 ALTER TABLE "unidade_escolar" DISABLE KEYS */;
INSERT INTO "unidade_escolar" ("uni_id", "uni_codigo_inep", "uni_nome", "cat_esc", "tip_esc", "ges_id", "end_id") VALUES
	(1, 68779474, 'Escola Nascimento', 1, 3, 1, 1),
	(3, 89332709, 'Escola Estadual João Silva', 1, 2, 3, 6),
	(4, 94237178, 'Escola Municipal Maria Santos', 1, 3, 1, 5),
	(2, 73225631, 'Instituto Federal de Educação, Ciência e Tecnologia Pedro Almeida', 1, 1, 2, 7),
	(5, 55656452, 'Colégio Anglo', 2, 1, 4, 2),
	(6, 42569985, 'Escola Dom Bosco', 2, 3, 4, 3);
/*!40000 ALTER TABLE "unidade_escolar" ENABLE KEYS */;

-- Copiando estrutura para tabela public.turma
CREATE TABLE IF NOT EXISTS "turma" (
	"tur_id" SERIAL NOT NULL,
	"tur_ano" INTEGER NOT NULL,
	"tur_ano_escolar" INTEGER NOT NULL,
	"uni_id" SERIAL NOT NULL,
	"pro_id" SERIAL NOT NULL,
	PRIMARY KEY ("tur_id"),
	CONSTRAINT "turma_professor" FOREIGN KEY ("pro_id") REFERENCES "professor" ("pro_id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "turma_unidade_escolar" FOREIGN KEY ("uni_id") REFERENCES "unidade_escolar" ("uni_id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Copiando dados para a tabela public.turma: 14 rows
/*!40000 ALTER TABLE "turma" DISABLE KEYS */;
INSERT INTO "turma" ("tur_id", "tur_ano_escolar", "tur_ano", "uni_id", "pro_id") VALUES
	(1, 1, 2022, 1, 1),
	(4, 2, 2022, 2, 4),
	(2, 2, 2022, 1, 3),
	(3, 1, 2022, 2, 2),
	(5, 1, 2022, 3, 5),
	(6, 2, 2022, 3, 6),
	(7, 1, 2022, 4, 7),
	(8, 2, 2022, 4, 8),
	(9, 1, 2023, 1, 1),
	(10, 2, 2023, 1, 3),
	(11, 1, 2023, 2, 2),
	(12, 2, 2023, 2, 4),
	(13, 1, 2023, 5, 9),
	(14, 1, 2023, 6, 10);
/*!40000 ALTER TABLE "turma" ENABLE KEYS */;

-- Copiando estrutura para tabela public.tipo_aluno
CREATE TABLE IF NOT EXISTS "tipo_aluno" (
	"tip_alu_id" SERIAL NOT NULL,
	"tip_alu_desc" VARCHAR NOT NULL,
	PRIMARY KEY ("tip_alu_id")
);

-- Copiando dados para a tabela public.tipo_aluno: 3 rows
/*!40000 ALTER TABLE "tipo_aluno" DISABLE KEYS */;
INSERT INTO "tipo_aluno" ("tip_alu_id", "tip_alu_desc") VALUES
	(1, 'Normal'),
	(2, 'Especial'),
	(3, 'Superdotado');
/*!40000 ALTER TABLE "tipo_aluno" ENABLE KEYS */;


-- Copiando estrutura para tabela public.aluno
CREATE TABLE IF NOT EXISTS "aluno" (
	"alu_id" SERIAL NOT NULL,
	"alu_primeiro_nome" VARCHAR(255) NOT NULL,
	"alu_segundo_nome" VARCHAR(255) NOT NULL,
	"alu_data_nascimento" DATE NOT NULL,
	"tip_alu" SERIAL NOT NULL,
	"tur_id" SERIAL NOT NULL,
	PRIMARY KEY ("alu_id"),
	CONSTRAINT "aluno_tipo" FOREIGN KEY ("tip_alu") REFERENCES "tipo_aluno" ("tip_alu_id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "aluno_turma" FOREIGN KEY ("tur_id") REFERENCES "turma" ("tur_id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Copiando dados para a tabela public.aluno: 20 rows
/*!40000 ALTER TABLE "aluno" DISABLE KEYS */;
INSERT INTO "aluno" ("alu_id", "alu_primeiro_nome", "alu_segundo_nome", "alu_data_nascimento", "tip_alu", "tur_id") VALUES
	(1, 'Hasheem', 'Marzelo', '2017-05-24', 1, 1),
	(2, 'Iosep', 'Breens', '2018-03-15', 1, 5),
	(3, 'Matthias', 'Dan', '2017-06-09', 2, 2),
	(4, 'Annissa', 'McGraw', '2017-09-25', 3, 4),
	(5, 'Earle', 'Kencott', '2015-03-10', 3, 5),
	(6, 'Callean', 'Domerc', '2016-09-13', 2, 5),
	(7, 'Gerald', 'Heaney', '2016-08-19', 2, 4),
	(8, 'Bing', 'Berrecloth', '2017-03-06', 1, 4),
	(9, 'Orton', 'Philippson', '2017-01-18', 1, 1),
	(10, 'Celinda', 'Bachnic', '2015-07-13', 3, 2),
	(11, 'Archy', 'Commucci', '2018-06-08', 2, 1),
	(12, 'Glennis', 'Kierans', '2017-02-27', 1, 1),
	(13, 'Joey', 'Pinks', '2016-04-08', 1, 1),
	(14, 'Sawyer', 'Mathew', '2015-03-02', 1, 3),
	(15, 'Juliette', 'Grancher', '2015-04-30', 1, 5),
	(16, 'Roobbie', 'Keirl', '2018-09-27', 1, 5),
	(18, 'Lexy', 'Burge', '2017-01-19', 2, 3),
	(17, 'Briggs', 'Pocke', '2018-11-16', 1, 2),
	(19, 'Rivkah', 'Nickols', '2016-03-07', 1, 4),
	(20, 'Melisse', 'MacGille', '2016-11-30', 1, 5);
/*!40000 ALTER TABLE "aluno" ENABLE KEYS */;

-- Copiando estrutura para tabela public.avaliacao
CREATE TABLE IF NOT EXISTS "avaliacao" (
	"ava_id" SERIAL NOT NULL,
	"ava_data" TIMESTAMP NOT NULL,
	"ava_nota" NUMERIC(10,2) NULL DEFAULT NULL,
	"alu_id" SERIAL NOT NULL,
	"ava_tipo" INTEGER NOT NULL,
	PRIMARY KEY ("ava_id"),
	CONSTRAINT "avaliacao_aluno" FOREIGN KEY ("alu_id") REFERENCES "aluno" ("alu_id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "avaliacao_tipo" FOREIGN KEY ("ava_tipo") REFERENCES "tipo_avaliacao" ("tip_aval_id") ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Copiando dados para a tabela public.avaliacao: 15 rows
/*!40000 ALTER TABLE "avaliacao" DISABLE KEYS */;
INSERT INTO "avaliacao" ("ava_id", "ava_data", "ava_nota", "alu_id", "ava_tipo") VALUES
	(1, '2022-03-01 14:59:39', 1.23, 1, 1),
	(2, '2022-03-02 14:59:55', 5.64, 1, 1),
	(3, '2022-03-03 15:00:11', 2.76, 1, 2),
	(4, '2022-03-04 15:00:26', 5.97, 1, 3),
	(5, '2022-04-01 15:01:44', 6.84, 2, 2),
	(6, '2022-05-01 15:02:30', 1.40, 3, 1),
	(15, '2022-07-21 15:05:20', 5.97, 15, 2),
	(13, '2022-07-07 15:04:45', 1.30, 7, 2),
	(14, '2022-07-20 15:05:00', 2.80, 15, 1),
	(12, '2022-07-07 15:04:24', 4.44, 6, 1),
	(11, '2022-07-01 15:04:08', 2.96, 8, 3),
	(10, '2022-06-06 15:03:56', 3.96, 10, 1),
	(9, '2022-06-01 15:03:38', 1.36, 11, 3),
	(8, '2022-05-01 15:03:01', 6.55, 3, 2),
	(7, '2022-04-02 15:01:58', 4.65, 2, 3);
/*!40000 ALTER TABLE "avaliacao" ENABLE KEYS */;


-- Copiando estrutura para tabela public.coleta
CREATE TABLE IF NOT EXISTS "coleta" (
	"col_id" SERIAL NOT NULL,
	"col_audio" VARCHAR(256) NOT NULL,
	"col_metrica" REAL NOT NULL,
	"fra_id" SERIAL NOT NULL,
	"ava_id" SERIAL NOT NULL,
	PRIMARY KEY ("col_id"),
	CONSTRAINT "coleta_avaliacao" FOREIGN KEY ("ava_id") REFERENCES "avaliacao" ("ava_id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "coleta_frases" FOREIGN KEY ("fra_id") REFERENCES "frase" ("fra_id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Copiando dados para a tabela public.coleta: 10 rows
/*!40000 ALTER TABLE "coleta" DISABLE KEYS */;
INSERT INTO "coleta" ("col_id", "col_audio", "col_metrica", "fra_id", "ava_id") VALUES
	(1, '//servidor1/aluno1/audio01.mp3', 6.9, 1, 1),
	(2, '//servidor1/aluno1/audio02.mp3', 6.9, 2, 2),
	(3, '//servidor1/aluno1/audio03.mp3', 6.9, 3, 3),
	(4, '//servidor1/aluno1/audio04.mp3', 6.9, 4, 4),
	(5, '//servidor1/aluno2/audio01.mp3', 6.9, 1, 5),
	(6, '//servidor1/aluno2/audio02.mp3', 6.9, 2, 7),
	(7, '//servidor1/aluno3/audio01.mp3', 6.9, 5, 6),
	(68, '//servidor1/aluno3/audio02.mp3', 6.9, 7, 8),
	(79, '//servidor1/aluno11/audio01.mp3', 6.9, 9, 11),
	(91, '//servidor1/aluno10/audio01.mp3', 6.9, 6, 10);
/*!40000 ALTER TABLE "coleta" ENABLE KEYS */;

-- Copiando estrutura para tabela public.contrato
CREATE TABLE IF NOT EXISTS "contrato" (
	"con_id" SERIAL NOT NULL,
	"con_data_ini" DATE NOT NULL,
	"con_data_fim" DATE NOT NULL,
	"tip_contr" INTEGER NOT NULL,
	"uni_id" SERIAL NOT NULL,
	PRIMARY KEY ("con_id"),
	CONSTRAINT "contato_tipo_contrato" FOREIGN KEY ("tip_contr") REFERENCES "tipo_contrato" ("tip_contrato_id") ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT "contrato_unidade_escolar" FOREIGN KEY ("uni_id") REFERENCES "unidade_escolar" ("uni_id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Copiando dados para a tabela public.contrato: 3 rows
/*!40000 ALTER TABLE "contrato" DISABLE KEYS */;
INSERT INTO "contrato" ("con_id", "con_data_ini", "con_data_fim", "tip_contr", "uni_id") VALUES
	(1, '2022-01-01', '2023-01-01', 1, 1),
	(2, '2023-02-01', '2023-02-01', 2, 2),
	(3, '2021-01-01', '2025-01-01', 3, 5);
/*!40000 ALTER TABLE "contrato" ENABLE KEYS */;

