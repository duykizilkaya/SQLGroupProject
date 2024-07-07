USE [Restaurant]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gruppe B
-- Create date: 19.06.2024
-- Description:	Diese Funktion sagt aus, ob ein Kunde Stammkunde ist oder nicht
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[sf_Ist_Stammkunde]  
(
	@Bestellnummer char(10)
)
RETURNS bit
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
	
	RETURN @Stammkunde;

END


