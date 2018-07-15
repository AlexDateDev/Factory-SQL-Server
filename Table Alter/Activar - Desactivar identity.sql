' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2014 FSL - FreeSoftLand
'  Title: Activar - Desactivar identity
'
'  Date : 30/01/2014
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------


SET IDENTITY_INSERT [dbo].[Juzgado] ON
INSERT [dbo].[Juzgado] ([Id], [FechaInicio], [FechaFin], [Descripcion], [Abreviatura], [IdOrganoJudicial], [Email], [Fax], [Movil], [Telefono], [Provincia], [ZipCode], [Poblacion], [Direccion]) VALUES (4, CAST(0x0000A19300000000 AS DateTime), NULL, N'JUZGADO DE LO MERCANTIL Nº 4 DE BARCELONA', N'Mercantil 4', 789, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Juzgado] ([Id], [FechaInicio], [FechaFin], [Descripcion], [Abreviatura], [IdOrganoJudicial], [Email], [Fax], [Movil], [Telefono], [Provincia], [ZipCode], [Poblacion], [Direccion]) VALUES (6, CAST(0x0000A19300000000 AS DateTime), NULL, N'JUZGADO DE LO MERCANTIL Nº 6 DE BARCELONA', N'Mercantil 6', 793, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Juzgado] OFF

