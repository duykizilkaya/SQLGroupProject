USE Restaurant;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe B
-- Create date: 18.06.2024
-- Description:	Dieser Trigger soll Änderungen im Zutatenlager überwachen und Meldungen geben, falls Mindestmenge unterschritten wurde
-- =============================================
CREATE OR ALTER TRIGGER [tr_Zutatenlager_ZutatenLog_UPDATE]
   ON  [dbo].[tb_ZutatenLager]
   FOR UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Nachricht varchar(255);
    -- Insert statements for trigger here
	IF (UPDATE(Menge)) OR (UPDATE(Mindestmenge))
	BEGIN
	SET @Nachricht = (
		SELECT 'Mindestmenge für die Zutat ' + i.Zutat 
				+ ' unterschritten!! Bitte auf ' 
				+ CAST(i.Maximalmenge AS VARCHAR(10)) + ' ' + i.Einheit
				+ ' (Maximalmenge) auffüllen. Danke.' AS Warnung
		FROM inserted i
		WHERE i.Menge < i.Mindestmenge
	);
	IF @Nachricht IS NOT NULL
	INSERT INTO dbo.tb_ZutatLog
				(Mode, DatumUhrzeit, Nachricht)
	VALUES ('Update', GETDATE(), @Nachricht);
	END	

END
GO
