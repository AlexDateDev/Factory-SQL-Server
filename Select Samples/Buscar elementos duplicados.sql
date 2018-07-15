' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: Buscar elementos duplicados
'
'  Date : 06/03/2013
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------


SELECT [Type], Reference, COUNT(*)
    FROM Scheme
    GROUP BY [Type], Reference
    HAVING COUNT(*) > 1
