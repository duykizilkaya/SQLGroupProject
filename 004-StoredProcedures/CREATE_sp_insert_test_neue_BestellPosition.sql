USE Restaurant;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe B 
-- Create date: 18.06.2024
-- Description:	Diese Prozedur fügt und testet neue Bestellungspositionen in tb_BestellPosition ein
-- =============================================
CREATE OR ALTER PROCEDURE sp_insert_test_neue_BestellPosition 
	-- Add the parameters for the stored procedure here
		@BestellungID int,
		@GerichtID int,
		@AnzahlGericht int,
		-----
		@Erfolg bit OUTPUT, -- geklappt oder nicht
		@Feedback NVARCHAR(MAX) OUTPUT -- Fehlermeldungen etc.
AS
BEGIN
	-- Hilfsvariablen deklarieren	
	DECLARE @CheckResult AS bit;
	-----------------------------
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
	------------------------------
	--1. Bestellung abgeschlossen?
	SET @CheckResult = dbo.sf_Status_Bestellung(@BestellungID);
	IF @CheckResult = 0 --@BestellungID abgeschlossen, abgebrochen oder existiert nicht
		THROW 60001, 'Bestellung entweder abgeschlossen, abgebrochen oder existiert nicht', 1;
	------------------------------
	--2. Gericht pro Position prüfen ob Lagerbestand ausreichend?

	IF dbo.sf_Anzahl_Gerichte_im_Lager(@GerichtID) >= @AnzahlGericht
		SET @CheckResult = 1;
	ELSE
		BEGIN
		DECLARE @FehlerAnzahlGericht VARCHAR(MAX);
		SET @FehlerAnzahlGericht = 'Zu wenig Zutaten im Lager, Bestellung nicht möglich!' + CHAR(10) +
                     'Kunde möchte ' + CAST(@AnzahlGericht AS VARCHAR(3)) + 'x Gericht, aber nur ' +
                     CAST(dbo.sf_Anzahl_Gerichte_im_Lager(@GerichtID) AS VARCHAR(5)) + 'x möglich!'+ CHAR(10);
		SET @CheckResult = 0;
			THROW 60002,@FehlerAnzahlGericht
			, 1;
		END
	------------------------------

	BEGIN TRANSACTION tr_Lagermenge_reduzieren

	--3. UPDATE falls es sich um Nachbestellung handelt, ansonsten INSERT 
	--	(Falls BestellungID & GerichtID schon vorhanden)

	SET @CheckResult = (
		SELECT COUNT(BestellPositionID)
			FROM [Restaurant].[dbo].[tb_BestellPositionen]
			WHERE (BestellungID = @BestellungID) AND (GerichtID = @GerichtID));
	IF (@CheckResult = 1)
		UPDATE [Restaurant].[dbo].[tb_BestellPositionen]
			SET [AnzahlGericht] = [AnzahlGericht] + @AnzahlGericht
			WHERE(BestellungID = @BestellungID) AND (GerichtID = @GerichtID);
	ELSE 
		INSERT INTO [Restaurant].[dbo].[tb_BestellPositionen]
					([BestellungID],[GerichtID],[AnzahlGericht])
		VALUES (@BestellungID, @GerichtID, @AnzahlGericht);
	---------------------------------

	-- 4. Lagermenge korrigieren
	-- (Durch die Zutaten für 1 Gericht eine Schleife laufen lassen und Menge pro Zutat von tb_ZutatenLager abziehen)

	DECLARE Cursor_Zutaten CURSOR
		FOR
		SELECT 
			dbo.tb_ZutatenGericht.ZutatID,
			dbo.tb_ZutatenGericht.Menge
			FROM dbo.tb_ZutatenGericht 
			WHERE dbo.tb_ZutatenGericht.GerichtID = @GerichtID;
	
	DECLARE @ZutatID int;
	DECLARE @Menge float;

	OPEN Cursor_Zutaten;
	FETCH NEXT FROM Cursor_Zutaten INTO @ZutatID, @Menge;
	WHILE @@FETCH_STATUS = 0
	BEGIN

	UPDATE dbo.tb_ZutatenLager
		SET Menge = Menge - @Menge * @AnzahlGericht
		WHERE dbo.tb_ZutatenLager.ZutatID = @ZutatID
	
		FETCH NEXT FROM Cursor_Zutaten INTO @ZutatID, @Menge; 
	END
	CLOSE Cursor_Zutaten;
	DEALLOCATE Cursor_Zutaten;

	-----------------------------------

	COMMIT TRANSACTION tr_Lagermenge_reduzieren
	
	----------------------------------
	SET @Erfolg = 1;
	SET @Feedback = 'Alles OK!';	
	END TRY
	----------------------------------
	BEGIN CATCH
		SET @Erfolg = 0; -- nicht geklappt--
		-- 	@Feedback text OUTPUT --Fehlermeldungen etc.
		SET @Feedback = 
			ERROR_MESSAGE() + ' Fehler Nr. '+ CONVERT(varchar, ERROR_NUMBER()) + CHAR(10)
						+ ' Prozedur: '  + ERROR_PROCEDURE() + CHAR(10)
						+ ' Zeile Nr.: ' + CONVERT(varchar,  ERROR_LINE());
	END CATCH;
    
END
GO

