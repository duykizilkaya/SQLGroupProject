-- Sicherstellen, dass wir die richtige Datenbank verwenden
-- Kellner darf lesen und schreiben
USE [Restaurant];
GO

-- Anmeldenamen erstellen, falls noch nicht vorhanden
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'Kellner')
BEGIN
    CREATE LOGIN [Kellner] WITH PASSWORD = 'SicheresPasswort123!';
END
GO

-- Benutzer f�r die Datenbank erstellen, falls noch nicht vorhanden
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'Kellner')
BEGIN
    CREATE USER [Kellner] FOR LOGIN [Kellner];
END
GO

-- Benutzer zu den Rollen hinzuf�gen
-- darf lesen
ALTER ROLE [db_datareader] ADD MEMBER [Kellner];
GO
-- darf schreiben
ALTER ROLE [db_datawriter] ADD MEMBER [Kellner];
GO
