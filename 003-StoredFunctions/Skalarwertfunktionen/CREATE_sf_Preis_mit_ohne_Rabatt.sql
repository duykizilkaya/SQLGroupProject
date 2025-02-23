USE [Restaurant]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gruppe B
-- Create date: 18.06.2024
-- Description:	Diese Funktion berechnet Preis mit/ohne Rabatt
-- =============================================
CREATE OR ALTER   FUNCTION [dbo].[sf_RechnungTotalRabatt]  
(
	@Bestellnummer char(10)
)
RETURNS money
AS
BEGIN
	DECLARE @Stammkunde bit;
	SET @Stammkunde = 
	(
		SELECT dbo.tb_Kunden.Stammkunde
		FROM dbo.tb_Bestellungen
		JOIN dbo.tb_Kunden ON dbo.tb_Bestellungen.KundenID = dbo.tb_Kunden.KundeID
		WHERE dbo.tb_Bestellungen.Bestellnummer = @Bestellnummer
	)
	DECLARE @Total money
	SET @Total = 
	(
		SELECT Total
		FROM dbo.View_RechnungTotal
		WHERE Bestellnummer = @Bestellnummer
	)
	RETURN IIF (@Stammkunde = 1, @Total * 0.95, @Total)
END




