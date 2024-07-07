-- TEST sp_insert_test_neue_BestellPosition
-- Parameter:
--		BestellungID,
--		GerichtID,
--		AnzahlGericht,
--		+ Outputs: Erfolg und Feedback
-----------------------------
USE Restaurant;
GO
DECLARE @Erfolg bit;
DECLARE @Feedback nvarchar(MAX);

-----------------------------
-- Beispiel Bestellung wird 1 Lasagne hinzugefügt als neue BestellPosition
EXEC [dbo].[sp_insert_test_neue_BestellPosition]
		32, --36 
		1,
		1,
		@Erfolg OUTPUT, 
		@Feedback OUTPUT;

-- Beispiel funktioniert nicht weil Bestellung abgeschlossen
		--12, 
		--1,
		--1,
		--@Erfolg OUTPUT, 
		--@Feedback OUTPUT;

-- Beispiel funktioniert nicht weil zu wenig Zutaten im Lager
-- BestellungID 26 möchte 8 Pizzas, aber nur weniger wären möglich basierend auf Lagerbestand
		--26, 
		--1,
		--8,
		--@Erfolg OUTPUT, 
		--@Feedback OUTPUT;

-- Beispiel updated eine vorhandene Bestellposition, erhöht die Anzahl des Gerichtes
--- BestellungID 32 möchte 1 mehr Lasagne
		--32, --36
		--1,
		--1,
		--@Erfolg OUTPUT, 
		--@Feedback OUTPUT;

-- Beispiel INSERT für eine vorhandene BestellungID mit neuem Gericht, führt zu neuer BestellPositionID
--- BestellungID 32 möchte 1 Bier dazu bestellen, vohrer kein Bier bestellt
		--32, 
		--10,
		--1,
		--@Erfolg OUTPUT, 
		--@Feedback OUTPUT;

-- Beispiel Menge 1 Bier im Lager abziehen 
--- BestellungID 32 möchte Gericht 10 (Bier = ZutatID 19) 1 x nachbestellen (wird im ZutatenLager abgezogen)
		--32, 
		--10,
		--1,
		--@Erfolg OUTPUT, 
		--@Feedback OUTPUT;
PRINT @Erfolg;
PRINT @Feedback;