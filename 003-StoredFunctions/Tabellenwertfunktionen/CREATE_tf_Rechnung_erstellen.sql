USE Restaurant;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe B
-- Create date: 19.06.2024
-- Description:	Diese Tabellenweertfunktion soll die Gesamtrechnung für eine BestellID 
--				ausgeben und prüfen, ob Kunde Stammkunde ist um Rabatt hinzuzufügen
-- =============================================
CREATE OR ALTER FUNCTION tf_Rechnung_erstellen
(	
	@Bestellnummer char(10)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
		SELECT	[Bestellnummer] AS Bestellnummer
		,[Gericht] AS Gericht
		,CONVERT(varchar(10),[Preis]) AS Preis
		,CONVERT(varchar(10),[AnzahlGericht]) AS Anzahl
		,[Subtotal] AS Subtotal
			FROM dbo.View_RechnungPositionen
			WHERE Bestellnummer = @Bestellnummer
UNION
	SELECT	'Gesamtpreis' AS Bestellnummer
		,'' AS Gericht
		,'' AS Preis
		,'' AS Anzahl
		,[Total] AS Subtotal
			FROM dbo.View_RechnungTotal
			WHERE Bestellnummer = @Bestellnummer
UNION
	SELECT CASE 
			WHEN [dbo].[sf_Ist_Stammkunde](@Bestellnummer) = 1
			THEN 'Gesamtpreis mit Stammkundenrabatt 5%' 
			ELSE 'Gesamtpreis ohne Rabatt'
			END AS Bestellnummer
				,'' AS Gericht
				,'' AS Preis
				,'' AS Anzahl
				,dbo.sf_RechnungTotalRabatt(@Bestellnummer) AS Subtotal
			FROM dbo.View_RechnungTotal
			WHERE Bestellnummer = @Bestellnummer
)
GO
