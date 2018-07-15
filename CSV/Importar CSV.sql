USE [CodigosPostales]

BULK INSERT Colegios FROM 'c:\Colegios.csv' /* Ruta C:\ del servidor */
	WITH(
		CODEPAGE = 'ACP',	/* iso-8859-1 or windows-1252 - Permite acentos */
		FIELDTERMINATOR = ';',
		ROWTERMINATOR = '\n'
	)
GO