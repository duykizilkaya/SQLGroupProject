-- Skript um neue Kunden (import von .csv-File) zur bestehenden Tabelle tb_Kunden 
-- hinzuzufügen. Danach tb_Kunden_neu_import löschen

USE [Restaurant];
GO

INSERT INTO [dbo].[tb_Kunden]
			(Vorname, Nachname, Email, AdresseID, Telefon, Stammkunde)
SELECT * FROM [dbo].[tb_Kunden_neu_import]

SELECT TOP (1000) [KundeID]
      ,[Vorname]
      ,[Nachname]
      ,[Geburtsdatum]
      ,[Email]
      ,[Telefon]
      ,[AdresseID]
      ,[Stammkunde]
  FROM [Restaurant].[dbo].[tb_Kunden]

DROP TABLE tb_Kunden_neu_import