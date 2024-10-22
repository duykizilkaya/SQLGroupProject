USE [Restaurant]
GO
/****** Object:  UserDefinedFunction [dbo].[tf_minus]    Script Date: 17.06.2024 18:20:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GruppeB
-- Create date: 17.06.2024
-- Description:	Diese Tabellenwertfunktion gibt den subtrahierten Lagerbestand von Zutaten für eine Bestellung wieder
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[tf_Abzug_Lagermenge_benoetigte_Zutaten_pro_Bestellung]
(			
	@BestellungID int
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT dbo.tf_Zutaten_benoetigte.ZutatID, dbo.tf_Lager_menge.Menge - dbo.tf_Zutaten_benoetigte.BenoetigteZutaten AS 'Minus'
	FROM dbo.tf_Lager_menge(@BestellungID) INNER JOIN dbo.tf_Zutaten_benoetigte(@BestellungID)
	ON dbo.tf_Zutaten_benoetigte.ZutatID = dbo.tf_Lager_menge.ZutatID
)
