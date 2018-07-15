' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: Modificar el tipo de una columna
'
'  Date : 06/03/2013
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------

ALTER TABLE dbo.MyTable
    ALTER COLUMN Created DATETIME NOT NULL
GO

ALTER TABLE dbo.MyTable
    ALTER COLUMN Created DATETIME NOT NULL
    DEFAULT whatever
GO
