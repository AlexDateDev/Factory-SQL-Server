' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: Create intex
'
'  Date : 28/06/2013
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------

CREATE [UNIQUE] [NONCLUSTERED] INDEX index_name ON table_name (column_name [ASC|DESC][,…n])
WITH (STATISTICS_NORECOMPUTE = { ON | OFF })]

CREATE INDEX idxAutosFechaUltimoDocPublicado ON [eTRANSNET22_BCN_DEV].[dbo].[Autos] (FechaUltimoDocPublicado)
GO

CREATE INDEX idxAutosFechaUltimoDocumento ON [eTRANSNET22_BCN_DEV].[dbo].[Autos] (FechaUltimoDocumento)
GO

CREATE INDEX idxAutosTitulo ON [eTRANSNET22_BCN_DEV].[dbo].[Autos] (Titulo)
GO


