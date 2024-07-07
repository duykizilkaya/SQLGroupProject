USE Restaurant;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe B
-- Create date: 18.06.2024
-- Description:	Diese Skalarwertfunktion soll checken, ob eine Bestellung abgeschlossen, in Bearbeitung oder abgebrochen ist
-- =============================================
CREATE OR ALTER FUNCTION sf_Status_Bestellung
(
	-- Add the parameters for the function here
	@BestellungID int
)
RETURNS bit -- 1 = in Bearbeitung, 0 = abgeschlossen oder abgebrochen, oder existiert nicht
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Status tinyint
	SET @Status = (
		-- Add the T-SQL statements to compute the return value here
		SELECT [Status] 
		FROM [dbo].[tb_Bestellungen]
		WHERE [BestellungID] = @BestellungID
	);

	-- Return the result of the function
	
	RETURN IIF(@Status = 0, 1, 0)

END
GO

