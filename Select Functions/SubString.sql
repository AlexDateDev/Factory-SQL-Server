' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: SubString
'
'  Date : 06/03/2013
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------

SELECT [Id]
      ,[NombreCompleto]

      ,SUBSTRING ( [NombreCompleto], 0, 3)

      -- Obtener el texto antes de la coma
      ,SUBSTRING ( [NombreCompleto], 0, CHARINDEX(',', [NombreCompleto]) )  as solo_apellido

  FROM [CGPC_Prueba].[dbo].[Usuarios] as u
  order by Nombrecompleto


