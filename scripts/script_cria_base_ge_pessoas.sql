IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = 'ge_pessoas')
BEGIN
  CREATE DATABASE ge_pessoas
    COLLATE Latin1_General_CI_AS;  
END
GO

use ge_pessoas
GO


IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = 'cargos')
BEGIN
  CREATE TABLE dbo.cargos (ID_Cargo        Integer Primary Key Identity(1,1)
                          ,CD_Cargo        Char(6)      COLLATE Latin1_General_CI_AS NOT NULL 
                          ,NM_Cargo        Varchar(100) COLLATE Latin1_General_CI_AS NOT NULL 
                          ,VL_Salario_Base Numeric(18,2))
END
GO

IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = 'niveis')
BEGIN
  CREATE TABLE dbo.niveis (ID_Nivel Integer Primary Key Identity(1,1)
                          ,CD_Nivel Char(6)      COLLATE Latin1_General_CI_AS NOT NULL
                          ,NM_Nivel Varchar(100) COLLATE Latin1_General_CI_AS NOT NULL)
END
GO

IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = 'pessoas')
BEGIN
  CREATE TABLE dbo.pessoas (ID_Pessoa          Integer Primary Key Identity(1,1)
                           ,CD_Pessoa          Char(6)       COLLATE Latin1_General_CI_AS NOT NULL
                           ,NM_Pessoa          Varchar(100)  
                           ,ID_Cargo           Integer       NOT NULL
                           ,ID_Nivel           Integer       NOT NULL
                           ,VL_Salario         Numeric(18,2) NOT NULL
                           ,NM_Email           Varchar(50)   COLLATE Latin1_General_CI_AS NOT NULL   
                           ,NM_Senha           Varchar(32)   COLLATE Latin1_General_CI_AS NOT NULL             
                           ,NO_Celular         Varchar(20)   COLLATE Latin1_General_CI_AS
                           ,SN_Primeiro_Acesso Char(1)       COLLATE Latin1_General_CI_AS NOT NULL)
END
GO

IF NOT EXISTS (select 1 from sysobjects where id = object_id('FK_Pessoa_ID_Cargo'))
BEGIN
  ALTER TABLE dbo.pessoas ADD CONSTRAINT FK_Pessoa_ID_Cargo FOREIGN KEY (ID_Cargo) REFERENCES dbo.cargos (ID_Cargo);
END
GO

IF NOT EXISTS (select 1 from sysobjects where id = object_id('FK_Pessoa_ID_Nivel'))
BEGIN
  ALTER TABLE dbo.pessoas
  ADD CONSTRAINT FK_Pessoa_ID_Nivel FOREIGN KEY (ID_Nivel) REFERENCES dbo.niveis (ID_Nivel);
END
GO


IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = 'aplicacoes')
BEGIN
  CREATE TABLE dbo.aplicacoes (ID_Aplicacao Integer Primary Key Identity(1,1)
                              ,CD_Aplicacao Char(6)      COLLATE Latin1_General_CI_AS  NOT NULL
                              ,NM_Aplicacao Varchar(100) COLLATE Latin1_General_CI_AS  NOT NULL 
                              ,ID_Pessoa    Integer                                    NOT NULL
                              ,ID_Cargo     Integer                                    NOT NULL
                              ,ID_Nivel     Integer                                    NOT NULL
                              ,SN_Aprovado  Char(1)      COLLATE Latin1_General_CI_AS 
                              ,RS_Aplicacao Varchar(500) COLLATE Latin1_General_CI_AS )  
END
GO

IF NOT EXISTS (select 1 from sysobjects where id = object_id('FK_aplicacoes_ID_Cargo'))
BEGIN
  ALTER TABLE dbo.aplicacoes ADD CONSTRAINT FK_aplicacoes_ID_Cargo FOREIGN KEY (ID_Cargo) REFERENCES dbo.cargos (ID_Cargo);
END
GO

IF NOT EXISTS (select 1 from sysobjects where id = object_id('FK_aplicacoes_ID_niveis'))
BEGIN
  ALTER TABLE dbo.aplicacoes ADD CONSTRAINT FK_aplicacoes_ID_niveis FOREIGN KEY (ID_Nivel) REFERENCES dbo.niveis (ID_Nivel);
END
GO

IF NOT EXISTS (select 1 from sysobjects where id = object_id('FK_aplicacoes_ID_Pessoa'))
BEGIN
  ALTER TABLE dbo.aplicacoes ADD CONSTRAINT FK_aplicacoes_ID_Pessoa FOREIGN KEY (ID_Pessoa) REFERENCES dbo.pessoas (ID_Pessoa);
END
GO

IF NOT EXISTS(SELECT 1 FROM SYSOBJECTS WHERE ID = OBJECT_ID('CK_aplicacoes_SN_Aprovado'))
BEGIN
  ALTER TABLE dbo.aplicacoes ADD CONSTRAINT CK_aplicacoes_SN_Aprovado CHECK (
                                                                          SN_Aprovado = 'S' OR -- Sim
                                                                          SN_Aprovado = 'N'    -- Nao
                                                                          );
END
GO

IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = 'requisitos')
BEGIN
  CREATE TABLE dbo.requisitos (ID_Requisito Integer Primary Key Identity(1,1)         NOT NULL
                              ,CD_Requisito Char(6)      COLLATE Latin1_General_CI_AS NOT NULL
                              ,NM_Requisito Varchar(100) COLLATE Latin1_General_CI_AS NOT NULL
                              ,SN_Concluido Char(1)      COLLATE Latin1_General_CI_AS NOT NULL)
END
GO

IF NOT EXISTS (select 1 from sysobjects where id = object_id('FK_aplicacoes_ID_Aplicacao'))
BEGIN
  ALTER TABLE dbo.requisitos ADD CONSTRAINT FK_aplicacoes_ID_Aplicacao FOREIGN KEY (ID_Aplicacao) REFERENCES dbo.aplicacoes (ID_Aplicacao);
END
GO

IF NOT EXISTS(SELECT 1 FROM SYSOBJECTS WHERE ID = OBJECT_ID('CK_requisitos_SN_Concluido'))
BEGIN
  ALTER TABLE dbo.requisitos ADD CONSTRAINT CK_requisitos_SN_Concluido CHECK (
                                                                          SN_Concluido = 'S' OR -- Sim
                                                                          SN_Concluido = 'N'    -- Nao
                                                                          );
END

IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = 'req_aplicacoes')
BEGIN
  CREATE TABLE dbo.req_aplicacoes (ID_Aplicacao Integer NOT NULL --//Uma aplicacao pode ter vários requisitos
                                  ,ID_Requisito Integer NOT NULL)
END
GO

IF NOT EXISTS (select 1 from sysobjects where id = object_id('FK_req_aplicacoes_ID_Pessoa'))
BEGIN
  ALTER TABLE dbo.req_aplicacoes ADD CONSTRAINT FK_req_aplicacoes_ID_Aplicacao FOREIGN KEY (ID_Aplicacao) REFERENCES dbo.aplicacoes (ID_Aplicacao);
END
GO

IF NOT EXISTS (select 1 from sysobjects where id = object_id('FK_req_aplicacoes_ID_Requisito'))
BEGIN
  ALTER TABLE dbo.req_aplicacoes ADD CONSTRAINT FK_req_aplicacoes_ID_Requisito FOREIGN KEY (ID_Requisito) REFERENCES dbo.requisitos (ID_Requisito);
END
GO

IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = 'capacitacoes')
BEGIN
  CREATE TABLE dbo.capacitacoes (ID_Capacitacao Integer                                   NOT NULL
                                ,ID_Pessoa      Integer                                   NOT NULL
                                ,NM_Capacitacao Varchar(100) COLLATE Latin1_General_CI_AS NOT NULL 
                                ,NM_Instituicao Varchar(100) COLLATE Latin1_General_CI_AS NOT NULL 
                                ,DT_Conclusao   Datetime)
END
GO

IF NOT EXISTS (select 1 from sysobjects where id = object_id('FK_capacitacoes_ID_Pessoa'))
BEGIN
  ALTER TABLE dbo.capacitacoes ADD CONSTRAINT FK_capacitacoes_ID_Pessoa FOREIGN KEY (ID_Pessoa) REFERENCES dbo.pessoas (ID_Pessoa);
END
GO
