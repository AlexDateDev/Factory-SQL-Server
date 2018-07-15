' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: Sumar y restar fechas
'
'  Date : 08/05/2013
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------


Update [eTRANSNET21].[dbo].[Autos] SET FechaUltimoDocPublicado  = DATEADD( day, -1, Fecha )

