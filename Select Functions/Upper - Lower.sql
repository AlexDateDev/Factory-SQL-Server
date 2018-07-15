' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: Upper - Lower
'
'  Date : 06/03/2013
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------

SELECT TOP 10
  UPPER(SUBSTRING (lastname,1,1)) + LOWER(SUBSTRING(lastname,2,29))
  AS 'Lastname'
FROM Students
