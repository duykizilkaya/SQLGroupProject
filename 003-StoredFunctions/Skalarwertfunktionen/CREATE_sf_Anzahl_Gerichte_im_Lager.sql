USE [Restaurant];
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe_B
-- Create date: 18.06.2024
-- Description: Diese Funktion gibt die Anzahl der Gerichte zurück, 
--				die für ein bestimmtes Gericht bei den vorhanden Lagermengen gekocht werden können
-- =============================================
CREATE OR ALTER FUNCTION sf_Anzahl_Gerichte_im_Lager 
(
	-- Add the parameters for the function here
	@GerichtID INT
)
RETURNS INT
AS
BEGIN
	DECLARE @Anzahl INT;
	SET @Anzahl = 
	(
		SELECT TOP (1)
			CONVERT(INT, dbo.tb_ZutatenLager.Menge / dbo.tb_ZutatenGericht.Menge) AS Anzahl
		FROM dbo.tb_ZutatenGericht INNER JOIN
             dbo.tb_ZutatenLager ON dbo.tb_ZutatenGericht.ZutatID = dbo.tb_ZutatenLager.ZutatID
		WHERE 
			 dbo.tb_ZutatenGericht.GerichtID = @GerichtID
		ORDER BY Anzahl
	);

	IF (@Anzahl IS NULL)
		SET @Anzahl = 0;
		

	-- Return the result of the function
	RETURN @Anzahl;

END
GO

