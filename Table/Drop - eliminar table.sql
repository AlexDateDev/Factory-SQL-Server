' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: Drop - eliminar database
'
'  Date : 06/03/2013
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------


IF OBJECT_ID('[dbo].[EncuestasRespuestas]','U') IS NOT NULL
    DROP TABLE [dbo].[EncuestasRespuestas]
GO

