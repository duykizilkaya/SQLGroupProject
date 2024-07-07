USE Restaurant;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe B
-- Create date: 17.06.2024
-- Description:	Ermittelt die nächste Bestellnummer
-- Format: B000000000
-- =============================================
CREATE OR ALTER FUNCTION sf_NaechsteBestellnummer
(
	-- Add the parameters for the function here
	-- <@Param1, sysname, @p1> <Data_Type_For_Param1, , int>
)
RETURNS CHAR(10)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Bestellnummer CHAR(10);

	-- Add the T-SQL statements to compute the return value here
	DECLARE @AktNum CHAR(10);
	DECLARE @Num int;

	SET @AktNum =
	(
		Select MAX(Bestellnummer) AS AktNum
		FROM [dbo].[tb_Bestellungen]
		WHERE Bestellnummer like 'B%'
	);
	
	IF (@AktNum IS NULL)
		SET @AktNum = '0';
	
	SET @Num = CONVERT(INT,SUBSTRING(@AktNum,2,9)) + 1;
	SET @Bestellnummer = 'B' + RIGHT(REPLICATE('0',9)+ CAST(@Num AS VARCHAR(9)),9);
	-- Return the result of the function
	RETURN @Bestellnummer;

END
GO

