' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: Saber cuanto tarda una query
'
'  Date : 12/09/2013
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------


DECLARE
    @antes   DATETIME,
    @despues DATETIME
SET @antes = GETDATE()

-- SELECT * FROM [Order Details]

SET @despues = GETDATE()
SELECT DATEDIFF(ms,@antes,@despues)

