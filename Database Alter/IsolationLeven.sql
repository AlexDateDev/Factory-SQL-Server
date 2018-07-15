' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: IsolationLeven
'
'  Date : 03/05/2013
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------



-- Activar el modo shapshop

ALTER DATABASE eTRANSNET21
SET READ_COMMITTED_SNAPSHOT ON WITH ROLLBACK IMMEDIATE
GO

-- Comprobar si esta abilitado
SELECT is_read_committed_snapshot_on FROM sys.databases WHERE name= 'eTRANSNET21'

ALTER DATABASE [eTRANSNET21] SET ALLOW_SNAPSHOT_ISOLATION ON

select is_read_committed_snapshot_on, * from sys.databases
