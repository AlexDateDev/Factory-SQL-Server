' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: Guardar fecha actual
'
'  Date : 08/05/2013
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------

UPDATE RelacionJuzgadoAutos
    SET FechaFin = GETDATE()
    WHERE idauto = 49 AND FechaFin IS NULL";

