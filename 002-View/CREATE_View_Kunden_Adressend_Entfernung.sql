USE [Restaurant]
GO
/****** Object:  View [dbo].[View_Kunden_Adressend_Entfernung]    Script Date: 20.06.2024 09:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Kunden_Adressend_Entfernung]
AS
SELECT TOP (100)
Nachname AS KuNN, 
				Vorname AS KuVN, 
				Straße, 
				Hausnummer, 
				PLZ, 
				Stadt, 
				Koordinaten.STAsText() AS Koordinaten, 
                 geography::STGeomFromText(Koordinaten.STAsText(), 4326).STDistance(geography::STGeomFromText('POINT(13.383068 52.530644)', 4326)) / 1000 AS Distanz_km
FROM            dbo.tb_Adressen INNER JOIN
                dbo.tb_Kunden ON dbo.tb_Adressen.AdresseID = dbo.tb_Kunden.AdresseID
ORDER BY Distanz_km
GO
