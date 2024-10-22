USE [Restaurant]
GO
/****** Object:  UserDefinedFunction [dbo].[sf_Berechnung_Entfernung]    Script Date: 20.06.2024 10:25:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe B
-- Create date: 18.06.24
-- Description:	Diese Skalarfunktion berechnet die Entfernung der Kunden von dem Restaurant aus (13.383068 52.530644)
-- =============================================
ALTER   FUNCTION [dbo].[sf_Berechnung_Entfernung] 
(
	-- Add the parameters for the function here
	@KundenID int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Entfernung float;
	SET @Entfernung = (
		SELECT
			geography::STGeomFromText(Koordinaten.STAsText(), 4326).STDistance(geography::STGeomFromText('POINT(13.383068 52.530644)', 4326)) / 1000 AS Distanz_km
				FROM dbo.tb_Kunden 
				INNER JOIN dbo.tb_Adressen 
					ON dbo.tb_Kunden.AdresseID = dbo.tb_Adressen.AdresseID
			WHERE KundeID = @KundenID
			);

	-- Return the result of the function
	RETURN @Entfernung;

END
