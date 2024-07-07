-- Sicherstellen, dass wir die richtige Datenbank verwenden
-- Koch darf nur lesen 
USE [Restaurant];
GO

-- Anmeldenamen erstellen, falls noch nicht vorhanden
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'Koch')
BEGIN
    CREATE LOGIN [Koch] WITH PASSWORD = 'SicheresPasswort123!';
END
GO

-- Benutzer für die Datenbank erstellen, falls noch nicht vorhanden
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'Koch')
BEGIN
    CREATE USER [Koch] FOR LOGIN [Koch];
END
GO

-- Benutzer zu der Rolle mit Ansichtsrechten hinzufügen
-- nur lesen
ALTER ROLE [db_datareader] ADD MEMBER [Koch];
GO
