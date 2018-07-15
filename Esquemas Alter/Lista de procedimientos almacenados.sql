                                  ' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: Lista de procedimientos almacenados
'
'  Date : 04/10/2013
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------

select name, user_name(uid) from sysobjects where type='P'
and name not like 'dt_%'
Order By Name

------------------------

SELECT
    [name], [object_id], [create_date], [modify_date]
FROM
    sys.all_objects
WHERE
    [type] = 'P' AND [object_id] > 0
ORDER BY
    [modify_date] DESC
