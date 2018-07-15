' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: Select Fecha - Dia - Hora
'
'  Date : 06/09/2013
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------

SELECT     Substring( convert(varchar(20),FechaAuth,103), 0, 11 ) as Dia,
            Substring( convert(varchar(20),FechaAuth,108), 0, 14 ) as Hora

18/10/2012    18:26:03
18/10/2012    18:34:39

-------------------------------------------------
-- Per ordenar dies agafem format YYYY/MM/DD

SELECT  Substring( convert(varchar(20),FechaAuth,111), 0, 11 ) as Dia,
        Substring( convert(varchar(20),FechaAuth,108), 1,2  ) as Hora,
        count(*) as Total
FROM         dbo.Log_Auth
WHERE     (Auth = 1)
Group by
 Substring( convert(varchar(20),FechaAuth,111), 0, 11 ),
        Substring( convert(varchar(20),FechaAuth,108), 1,2  )
order by dia desc, hora desc

2012/10/18    18
2012/10/18    17

