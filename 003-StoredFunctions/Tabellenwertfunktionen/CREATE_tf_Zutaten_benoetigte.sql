USE [Restaurant]
GO
/****** Object:  UserDefinedFunction [dbo].[tf_Zutaten_benoetigte]    Script Date: 17.06.2024 18:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GruppeB
-- Create date: 17.06.2024
-- Description:	Diese Tabellenwertfunktion gibt die benötigten Zutaten für eine Bestellung wieder
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[tf_Zutaten_benoetigte] 
(			
	@BestellungID int 
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT dbo.tb_ZutatenGericht.ZutatID, dbo.tb_ZutatenGericht.Menge * AnzahlGericht AS BenoetigteZutaten
	FROM dbo.tb_BestellPositionen INNER JOIN
    dbo.tb_Gerichte ON dbo.tb_BestellPositionen.GerichtID = dbo.tb_Gerichte.GerichtID INNER JOIN
    dbo.tb_ZutatenGericht ON dbo.tb_Gerichte.GerichtID = dbo.tb_ZutatenGericht.GerichtID
	WHERE BestellungID = @BestellungID 
	);