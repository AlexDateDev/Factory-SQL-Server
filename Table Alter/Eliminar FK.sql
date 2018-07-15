' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: Eliminar FK
'
'  Date : 25/04/2013
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------

IF (OBJECT_ID('FK_Autos_Juzgado', 'F') IS NOT NULL)
BEGIN
-- Primero eliminar FK
ALTER TABLE [dbo].[Autos]
    DROP CONSTRAINT FK_Autos_Juzgado
END


If you need to drop another type of constraint, these are the applicable codes to pass into the OBJECT_ID() function in the second parameter position:

C = CHECK constraint
D = DEFAULT (constraint or stand-alone)
F = FOREIGN KEY constraint
PK = PRIMARY KEY constraint
UQ = UNIQUE constraint
You can also use OBJECT_ID without the second parameter.


