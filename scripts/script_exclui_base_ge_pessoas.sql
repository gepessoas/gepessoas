USE ge_pessoas
GO

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'requisitos')
BEGIN
  DROP TABLE dbo.requisitos
END
GO

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'req_aplicacoes')
BEGIN
  DROP TABLE dbo.req_aplicacoes
END
GO

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'capacitacoes')
BEGIN
  DROP TABLE dbo.capacitacoes
END
GO

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'vagas')
BEGIN
  DROP TABLE dbo.vagas
END
GO

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'solicitacoes')
BEGIN
  DROP TABLE dbo.solicitacoes
END
GO

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'capacitacoes')
BEGIN
  DROP TABLE dbo.capacitacoes
END
GO

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'aplicacoes')
BEGIN
  DROP TABLE dbo.aplicacoes
END
GO

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'pessoas')
BEGIN
  DROP TABLE dbo.pessoas
END
GO

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'niveis')
BEGIN
  DROP TABLE dbo.niveis
END
GO

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'cargos')
BEGIN
  DROP TABLE dbo.cargos
END
GO






--USE MASTER
--GO

--DROP DATABASE ge_pessoas
--GO