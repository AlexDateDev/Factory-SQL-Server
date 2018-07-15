' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: Trace sin uso memoria
'
'  Date : 12/09/2013
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------

http://tololochile.wordpress.com/2008/10/01/indices-en-sql-server-%E2%80%93-parte-1-%E2%80%93-introduccion/

CHECKPOINT
DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS
SET STATISTICS IO ON

SELECT     * FRM Users

SET STATISTICS IO OFF
