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
-- Beispiel Bestellung wird 1 Lasagne hinzugef�gt als neue BestellPosition
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
-- BestellungID 26 m�chte 8 Pizzas, aber nur weniger w�ren m�glich basierend auf Lagerbestand
		--26, 
		--1,
		--8,
		--@Erfolg OUTPUT, 
		--@Feedback OUTPUT;

-- Beispiel updated eine vorhandene Bestellposition, erh�ht die Anzahl des Gerichtes
--- BestellungID 32 m�chte 1 mehr Lasagne
		--32, --36
		--1,
		--1,
		--@Erfolg OUTPUT, 
		--@Feedback OUTPUT;

-- Beispiel INSERT f�r eine vorhandene BestellungID mit neuem Gericht, f�hrt zu neuer BestellPositionID
--- BestellungID 32 m�chte 1 Bier dazu bestellen, vohrer kein Bier bestellt
		--32, 
		--10,
		--1,
		--@Erfolg OUTPUT, 
		--@Feedback OUTPUT;

-- Beispiel Menge 1 Bier im Lager abziehen 
--- BestellungID 32 m�chte Gericht 10 (Bier = ZutatID 19) 1 x nachbestellen (wird im ZutatenLager abgezogen)
		--32, 
		--10,
		--1,
		--@Erfolg OUTPUT, 
		--@Feedback OUTPUT;
PRINT @Erfolg;
PRINT @Feedback;