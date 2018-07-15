' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: Asignar valores a variables
'
'  Date : 20/11/2013
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------


DECLARE @SQL nvarchar(4000)
DECLARE @SQL_INTERNAL nvarchar(4000)
DECLARE @SQL_REMOTE nvarchar(4000)
DECLARE @SQL_IF int

-- Internal
SET @SQL_INTERNAL = '
INSERT INTO #proba (IdTablaReal)
SELECT distinct [dbo].[w_pBuscarExpedientes_Vista_Principal].Id
FROM [dbo].[w_pBuscarExpedientes_Vista_Principal]
WHERE
    ' + @WhereCondition

SET @SQL_INTERNAL = @SQL_INTERNAL + 'AND [dbo].[w_pBuscarExpedientes_Vista_Principal].Id IN( SELECT ID FROM [Expedientes] )'


-- Remote

SET @SQL = '
INSERT INTO #proba (IdTablaReal)
SELECT [dbo].[Expedientes].Id
FROM [dbo].[Expedientes]
WHERE
    ' + @WhereCondition

SET @SQL = @SQL + 'AND
intIdGlobal in(
    select intIdGlobalRegistro from dbo.Seguridad_Permisos
    where
        strNameObjeto = ''Expedientes'' AND
        intPermiso = 11 AND
        bolRemoto = ''S'' AND
        intGuidUserGrupo =
            ''' + @intidglobaluser

SET @SQL = @SQL + ''')'


select @SQL_IF = COUNT(*) from dbo.Seguridad_Permisos
    where
        strNameObjeto = 'frmExpedientes' AND
        intPermiso = 11 AND
        bolRemoto = 'S' AND
        intGuidUserGrupo =
            '' + @intidglobaluser + ''

IF @SQL_IF > 0
BEGIN
    SET @SQL = @SQL_INTERNAL
END

IF @DefaultOrderByExpression IS NOT NULL AND LEN(@DefaultOrderByExpression) > 0
BEGIN
    SET @SQL = @SQL + '
ORDER BY
    ' + @DefaultOrderByExpression
END

EXEC sp_executesql @SQL

