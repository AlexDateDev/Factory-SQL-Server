' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: Case
'
'  Date : 26/11/2013
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------

select
case when CHARINDEX('(AC', [descripcion]) > 0
then
    'aa'
else
    'bb'
end  as cc,
 id, titulo, descripcion
 ,CHARINDEX('(', [descripcion]) as pos_ini
 ,CHARINDEX(')', [descripcion]) as pos_fi
 ,LEN( [descripcion] ) as l
,SUBSTRING ( [descripcion],
    CHARINDEX('(AC', [descripcion]),
    LEN( [descripcion] )
    ) as AC
from autos
where descripcion like '%AC%'
