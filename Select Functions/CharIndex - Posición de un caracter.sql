' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: CharIndex - Posición de un caracter
'
'  Date : 06/03/2013
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------

SELECT [Id]
      ,[NombreCompleto]
      ,CHARINDEX(',', [NombreCompleto]) as pos_coma
      ,[Login]
      ,[Password]
      ,[Id_COlegio]
  FROM [CGPC_Prueba].[dbo].[Usuarios] as u
  order by Nombrecompleto


