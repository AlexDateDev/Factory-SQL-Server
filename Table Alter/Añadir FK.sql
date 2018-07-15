' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: Alter
'
'  Date : 06/03/2013
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------

-- Añadir una FK

ALTER TABLE [dbo].[EncuestasRespuestas]
    ADD CONSTRAINT FK_Respuesta_Procurador
        FOREIGN KEY (IdProcurador)
        REFERENCES [dbo].[Procuradores] (Id)
GO

----------------------------------------
-- Crear Campo
ALTER TABLE [dbo].[Usuarios]
    ADD IdPerfil int
GO

-- Copiar datos
UPDATE [dbo].[Usuarios] SET IdPerfil = TipoUsuario

-- Not null
ALTER TABLE [dbo].[Usuarios]
    ALTER COLUMN IdPerfil int NOT NULL
GO

-- Clave FK
ALTER TABLE [dbo].[Usuarios]
    ADD CONSTRAINT FK_Usuarios_Perfil
        FOREIGN KEY (IdPerfil)
        REFERENCES [dbo].[Perfil] (Id)
GO


