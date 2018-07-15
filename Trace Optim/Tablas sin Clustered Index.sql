' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: Tablas sin Clustered Index
'
'  Date : 12/02/2011
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------

select t.name from sys.tables t
where t.name not in
(
      select t.name from sys.tables t
      join sys.indexes i
      on t.object_id = i.object_id
      where
            t.type = 'U' --Solo nos interesan las tablas de usuario
            and i.type = '1' --1 == Índice clustered
) order by t.name
