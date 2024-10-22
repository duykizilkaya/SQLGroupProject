USE [Restaurant]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe B
-- Create date: 19.06.2024
-- Description:	Diese Prozedur soll ein automatisches Back-up mit Zeitstempel ausführen
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[sp_Backup_Restaurant_mit_Zeitstempel] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here

	DECLARE @BackupFile NVARCHAR(MAX); -- file name
		SET @BackupFile = 'C:\SQL-Kurs\SQL-Restaurant-Gruppe-B\007-BackUp\Restaurant-'
							+ [dbo].[sf_Zeitstempel]() 
							+ '.bak';

	BACKUP DATABASE [Restaurant] TO DISK = @BackupFile 
	;
END
