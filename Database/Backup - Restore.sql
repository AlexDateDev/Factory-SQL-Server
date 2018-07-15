' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: Backup - Restore
'
'  Date : 06/03/2013
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------


-- Creción del backup a un archivo (No tener la base de datos abierta)
USE [KHouse]
GO

BACKUP DATABASE [KHouse]
TO DISK = N'C:\backups\KHouse_back'
   WITH FORMAT,
      MEDIANAME = 'KHouse-SQLServerBackups',
      NAME = 'Full Backup of KHouse';
GO

-- Para restablecerla, esta no tiene que estar en uso (Seleccionar otra base de datos)

-- Hacer que se pueda usar offine
ALTER DATABASE [KHouse] SET OFFLINE WITH ROLLBACK IMMEDIATE
GO

-- Restablecer desde el archivo
RESTORE DATABASE [KHouse]
    FROM DISK = N'C:\backups\KHouse_back'
    WITH FILE=1,
        REPLACE,
        STATS=10
GO

--
BACKUP DATABASE [GESDOCTAR]
TO  DISK = N'C:\CopiaGesdoctar\Gesdoctar.bak'
    WITH NOFORMAT,
    INIT,
    NAME = N'GESDOCTAR-Completa Base de datos Copia de seguridad',
    SKIP,
    NOREWIND,
    NOUNLOAD,
    STATS = 10
GO


