USE Restaurant;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe B
-- Create date: 19.06.2024
-- Description:	Diese Prozedur fügt und testet eine neue Bestellung zu tb_Bestellungen hinzu. 
--				Sie soll die ID von der neuen Bestellung zurückgeben oder NULL, wenn etwas nicht passt.
-- =============================================
CREATE OR ALTER PROCEDURE sp_insert_test_neue_Bestellung 
	-- Add the parameters for the stored procedure here
		@TischID INT,
		@MitarbeiterID INT,
		@KundenID INT,
		---------------
		@BestellungID INT OUTPUT,
		@Feedback NVARCHAR(MAX) OUTPUT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;

	BEGIN TRY	
		INSERT INTO [dbo].[tb_Bestellungen]
			(Bestellnummer, TischID, Datum, MitarbeiterID, KundenID,[Status])
			VALUES
			([dbo].sf_NaechsteBestellnummer(), @TischID, GETDATE(), @MitarbeiterID, @KundenID,0);
	
		SET @BestellungID = SCOPE_IDENTITY();
	END TRY
	BEGIN CATCH
	SET @Feedback = 
			ERROR_MESSAGE() + ' Fehler Nr. '+ CONVERT(varchar, ERROR_NUMBER()) + CHAR(10)
						+ ' Prozedur: '  + ERROR_PROCEDURE() + CHAR(10)
						+ ' Zeile Nr.: ' + CONVERT(varchar,  ERROR_LINE());
	END CATCH

END
GO
