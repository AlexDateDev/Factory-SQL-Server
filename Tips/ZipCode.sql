' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2014 FSL - FreeSoftLand
'  Title: ZipCode
'
'  Date : 21/01/2014
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------


select z.NombreProvincia,
    p.Idprovincia,
    Right( ('00'+lTrim(Rtrim(z.ZipCode))), 5) as CP, zip.IdZipCode
    ,z.Ciudad
    , c.IdCiudad
    from Zipcodeall as z

    left join ZipCode as zip on zip.ZipCode = Right( ('00'+lTrim(Rtrim(z.ZipCode))), 5)
    left join Provincia as p on p.Nombre = z.Nombreprovincia
    left join Ciudad as c on c.Nombre=z.Ciudad and c.Idprovincia = p.IdProvincia       // hay el mismo nombre de pueblo para diferentesw comarcas
where z.Ciudad != ''
order by z.Ciudad

