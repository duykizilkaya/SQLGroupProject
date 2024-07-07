-- TEST Prozedur sp_insert_test_neue_Bestellung

USE Restaurant;
GO
DECLARE @BestellungID int;
DECLARE @Feedback NVARCHAR(MAX);
-- Parameter:
	-- TischID,
	-- MitarbeiterID,
	-- KundenID,
	-- + Outputs

----------------------------------------------------------------
-- Beispiel um neue Bestellung hinzuzufügen
EXEC [dbo].[sp_insert_test_neue_Bestellung]
		1,
		3,
		13,
		@BestellungID OUTPUT,
		@Feedback OUTPUT;

----------------------------------------------------------------
---- Beispiel um neue Bestellung hinzuzufügen, ohne Kundennummer
--EXEC [dbo].[sp_insert_test_neue_Bestellung]
--		1,
--		3,
--		NULL,
--		@BestellungID OUTPUT,
--		@Feedback OUTPUT;



PRINT @BestellungID;
PRINT @Feedback;
