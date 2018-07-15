' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2014 FSL - FreeSoftLand
'  Title: Trim
'
'  Date : 21/01/2014
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------

select distinct(Right( (lTrim(Rtrim(ZipCode)) ) , 6)) as z, Nombreprovincia from ZIpcode  where ZIpCode>0 order by z
