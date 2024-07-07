-- Sicherstellen, dass wir die richtige Datenbank verwenden
-- Eigent�mer darf alles lesen und �berarbeiten
USE [Restaurant];
GO

-- Anmeldenamen erstellen, falls noch nicht vorhanden
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'Eigentuemer')
BEGIN
    CREATE LOGIN [Eigentuemer] WITH PASSWORD = 'SicheresPasswort123!';
END
GO

-- Benutzer f�r die Datenbank erstellen, falls noch nicht vorhanden
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'Eigentuemer')
BEGIN
    CREATE USER [Eigentuemer] FOR LOGIN [Eigentuemer];
END
GO

-- Benutzer zu den maximalen Rollen hinzuf�gen
-- darf alles
ALTER ROLE [db_owner] ADD MEMBER [Eigentuemer];
GO
