' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: Replace
'
'  Date : 06/03/2013
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------

SELECT [p].[Id] as Idprocurador
      ,REPLACE( [p].[Apellidos], '.', '') as nom
      ,REPLACE( REPLACE( REPLACE( [p].[Apellidos], '.', ''), ',', ''), ' ', '')  + REPLACE( REPLACE( REPLACE( [p].[Nombre], '.', ''), ',', ''), ' ', '') as procu
      ,REPLACE( REPLACE( REPLACE( [u].[NombreCompleto], '.', ''), ',', ''), ' ', '') as usuar
      , [u].[Id] as idUser

  FROM [CGPC_Prueba].[dbo].[Procuradores] as p
    left join  [CGPC_Prueba].[dbo].[Usuarios] as u
    on (REPLACE( REPLACE( REPLACE( [u].[NombreCompleto], '.', ''), ',', ''), ' ', '')) = (REPLACE( REPLACE( REPLACE( [p].[Apellidos], '.', ''), ',', ''), ' ', '')  + REPLACE( REPLACE( REPLACE( [p].[Nombre], '.', ''), ',', ''), ' ', '') )

