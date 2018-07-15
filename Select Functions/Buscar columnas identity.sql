' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: Buscar columnas identity
'
'  Date : 15/03/2013
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------

-- Buscar columnas identity en base de datos
SELECT SCHEMA_NAME(OBJECTPROPERTY(OBJECT_ID,'SchemaId')) AS SchemaName,
       OBJECT_NAME(OBJECT_ID) AS TableName,
       name AS ColumnName
FROM  SYS.COLUMNS
WHERE is_identity = 1
ORDER BY SchemaName, TableName, ColumnName

