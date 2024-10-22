USE [Restaurant]
GO
/****** Object:  UserDefinedFunction [dbo].[tf_Lager_menge]    Script Date: 17.06.2024 18:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GruppeB
-- Create date: 17.06.2024
-- Description:	Diese Tabellenwertfunktion gibt die Lagermenge von benötigte Zutaten für eine Bestellung wieder
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[tf_Lager_menge] 
(			
	@BestellungID int 
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT dbo.tb_ZutatenLager.ZutatID, dbo.tb_ZutatenLager.Menge 
	FROM  dbo.tb_ZutatenLager INNER JOIN
          dbo.tb_ZutatenGericht ON dbo.tb_ZutatenLager.ZutatID = dbo.tb_ZutatenGericht.ZutatID INNER JOIN
          dbo.tb_Gerichte ON dbo.tb_ZutatenGericht.GerichtID = dbo.tb_Gerichte.GerichtID INNER JOIN
          dbo.tb_BestellPositionen ON dbo.tb_Gerichte.GerichtID = dbo.tb_BestellPositionen.GerichtID
		 WHERE BestellungID = @BestellungID
		
);
