' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: Create
'
'  Date : 06/03/2013
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------


CREATE TABLE [dbo].[EncuestasRespuestas]    (
    IdRespuesta int IDENTITY (1,1) CONSTRAINT pkIdRespuesta PRIMARY KEY,
    IdProcurador int NOT NULL,
    Texto nvarchar (255),
    Visible bit not null default 0,
    Orden int Not null,
    FechaCreacion Datetime not null
)
GO

ALTER TABLE [dbo].[EncuestasRespuestas]
    ADD CONSTRAINT FK_Respuesta_Procurador
        FOREIGN KEY (IdProcurador)
        REFERENCES [dbo].[Procuradores] (Id)
GO



CREATE TABLE Streets ( IdStreet int IDENTITY (1,1) PRIMARY KEY, Name nvarchar (100))
