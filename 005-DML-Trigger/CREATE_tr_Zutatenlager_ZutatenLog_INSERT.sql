USE Restaurant;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe B
-- Create date: 18.06.2024
-- Description:	Dieser Trigger soll Neue Zutaten im Zutatenlager melden und Meldung rausgeben, falls Mindestmenge unterschritten wurde
-- =============================================
CREATE OR ALTER TRIGGER [tr_Zutatenlager_ZutatenLog_INSERT]
   ON  [dbo].[tb_ZutatenLager]
   FOR INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Nachricht varchar(255);
    -- Insert statements for trigger here

	SET @Nachricht = (
		SELECT --@Nachricht+
		'Mindestmenge für die neue Zutat ' + i.Zutat 
				+ ' unterschritten!! Bitte auf ' 
				+ CAST(i.Maximalmenge AS VARCHAR(10)) + ' ' + i.Einheit
				+ ' (Maximalmenge) auffüllen. Danke.' AS Warnung
		FROM inserted i
		WHERE i.Menge < i.Mindestmenge
		
					);
	IF @Nachricht IS NULL
			SET @Nachricht = (
			SELECT 'Neue Zutat '+ i.Zutat +' hinzugefügt!' AS Warnung
			FROM inserted i
							);
			

	INSERT INTO dbo.tb_ZutatLog
				(Mode, DatumUhrzeit, Nachricht)
	VALUES ('Insert', GETDATE(), @Nachricht);


END
GO
