USE [Restaurant]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe B
-- Create date: 19.06.2024
-- Description:	Die Funktion generiert einen Zeitstempel im Format: 20210105-1051 für das automatische Back-up
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[sf_Zeitstempel]  
(
)
RETURNS char(13)
AS
BEGIN

	RETURN FORMAT(GETDATE(), 'yyyyMMdd-HHmm');

END
