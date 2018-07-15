' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: Colate Modern_Spanish_CI_AI
'
'  Date : 15/03/2013
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------

ALTER DATABASE CGPC_Prueba COLLATE Modern_Spanish_CI_AI


// Modern_Spanish_CI_AI = Case Insensitive - Accenets Insensitive
// Modern_Spanish_CI_AS = Case Insensitive - Accenets Sensitive

ALTER TABLE [CGPC_Prueba].[dbo].[Procuradores]
ALTER COLUMN Nombre nvarchar(255) COLLATE Modern_Spanish_CI_AI

ALTER TABLE [CGPC_Prueba].[dbo].[Procuradores]
ALTER COLUMN Apellidos nvarchar(255) COLLATE Modern_Spanish_CI_AI
