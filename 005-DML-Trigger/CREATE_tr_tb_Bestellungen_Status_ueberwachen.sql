USE [Restaurant];
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe B
-- Create date: 19.06.2024
-- Description:	Dieser Trigger soll den Status in der Tabelle tb_Bestellungen überwachen
-- =============================================
CREATE OR ALTER TRIGGER tr_tb_Bestellungen_Status_ueberwachen
   ON tb_Bestellungen
   FOR UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	IF UPDATE([Status])
		BEGIN
			-- Wenn Kunde bezahlen möchte, Status auf 1 (abgeschlossen) ändern und Rechnung in tb_temp_Rechnung generieren
			IF (SELECT [Status] FROM inserted) = 1
				BEGIN
				DROP TABLE IF EXISTS tb_temp_Rechnung
				DECLARE @Bestellnummer CHAR(10)
				SET @Bestellnummer = (SELECT [Bestellnummer] FROM inserted)
				SELECT * INTO tb_temp_Rechnung
				FROM [dbo].[tf_Rechnung_erstellen](@Bestellnummer)
				END

			-- Wenn Bestellung abgebrochen wird (Status 2), Zutaten im Lager wieder freigeben
			IF (SELECT [Status] FROM inserted) = 2
				BEGIN 
				BEGIN TRANSACTION Tr_Bestell_Status_2
					DECLARE @BestellungID int
					SET @BestellungID = (SELECT [BestellungID] FROM inserted)
					DECLARE Cursor_Zutaten CURSOR
						FOR
						SELECT * FROM [dbo].[tf_Zutaten_benoetigte](@BestellungID)
	
						DECLARE @ZutatID int; --1 Spalte ZutatID
						DECLARE @Menge float; --2. Spalte BenötigteZutaten (Menge)

						OPEN Cursor_Zutaten;
						FETCH NEXT FROM Cursor_Zutaten INTO @ZutatID, @Menge;
						WHILE @@FETCH_STATUS = 0
							BEGIN

							UPDATE dbo.tb_ZutatenLager
							SET Menge = Menge + @Menge
							WHERE dbo.tb_ZutatenLager.ZutatID = @ZutatID
	
							FETCH NEXT FROM Cursor_Zutaten INTO @ZutatID, @Menge; 
							END
					CLOSE Cursor_Zutaten;
					DEALLOCATE Cursor_Zutaten;
				COMMIT TRANSACTION Tr_Bestell_Status_2
				END

			-- Wenn (seltener Fall) Abbruch von Bestellung (Status 2) storniert wird, dann Zutaten im Lager wieder abziehen
			IF (((SELECT [Status] FROM inserted) = 1) OR ((SELECT [Status] FROM inserted) = 0)) AND ((SELECT [Status] FROM deleted) = 2)
				BEGIN
				BEGIN TRANSACTION Tr_Bestell_Status_2
					DECLARE @BestellungID_2 int
					SET @BestellungID_2 = (SELECT [BestellungID] FROM inserted)
					DECLARE Cursor_Zutaten CURSOR
						FOR
						SELECT * FROM [dbo].[tf_Zutaten_benoetigte](@BestellungID_2)
	
						DECLARE @ZutatID_2 int; --1 Spalte ZutatID
						DECLARE @Menge_2 float; --2. Spalte BenötigteZutaten (Menge)

						OPEN Cursor_Zutaten;
						FETCH NEXT FROM Cursor_Zutaten INTO @ZutatID_2, @Menge_2;
						WHILE @@FETCH_STATUS = 0
							BEGIN

							UPDATE dbo.tb_ZutatenLager
							SET Menge = Menge - @Menge_2
							WHERE dbo.tb_ZutatenLager.ZutatID = @ZutatID_2
	
							FETCH NEXT FROM Cursor_Zutaten INTO @ZutatID_2, @Menge_2; 
							END
					CLOSE Cursor_Zutaten;
					DEALLOCATE Cursor_Zutaten;

					IF (SELECT [Status] FROM inserted) = 1
						BEGIN
							DROP TABLE IF EXISTS tb_temp_Rechnung
							DECLARE @Bestellnummer_2 CHAR(10)
							SET @Bestellnummer_2 = (SELECT [Bestellnummer] FROM inserted)
							SELECT * INTO tb_temp_Rechnung
							FROM [dbo].[tf_Rechnung_erstellen](@Bestellnummer_2)
						END
				COMMIT TRANSACTION Tr_Bestell_Status_2
				END
		END
END
GO
