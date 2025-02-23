USE [Restaurant]
GO
/****** Object:  View [dbo].[View_GerichtGerichttyp_Bestelldatum]    Script Date: 20.06.2024 09:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_GerichtGerichttyp_Bestelldatum]
AS
SELECT        TOP (100) PERCENT dbo.tb_Gerichte.Gericht, dbo.tb_Gerichte.GeschmacksBeschreibung, dbo.tb_Gerichttyp.Gerichttyp, dbo.tb_BestellPositionen.AnzahlGericht, dbo.tb_Bestellungen.Bestellnummer, 
                         dbo.tb_Bestellungen.Datum
FROM            dbo.tb_Gerichttyp INNER JOIN
                         dbo.tb_GerichtGerichttyp ON dbo.tb_Gerichttyp.GerichttypID = dbo.tb_GerichtGerichttyp.GerichttypID INNER JOIN
                         dbo.tb_Gerichte ON dbo.tb_GerichtGerichttyp.GerichtID = dbo.tb_Gerichte.GerichtID LEFT OUTER JOIN
                         dbo.tb_BestellPositionen INNER JOIN
                         dbo.tb_Bestellungen ON dbo.tb_BestellPositionen.BestellungID = dbo.tb_Bestellungen.BestellungID ON dbo.tb_Gerichte.GerichtID = dbo.tb_BestellPositionen.GerichtID
ORDER BY dbo.tb_Gerichte.Gericht, dbo.tb_Bestellungen.Datum
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tb_Gerichttyp"
            Begin Extent = 
               Top = 54
               Left = 24
               Bottom = 155
               Right = 191
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_GerichtGerichttyp"
            Begin Extent = 
               Top = 71
               Left = 272
               Bottom = 187
               Right = 465
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_Gerichte"
            Begin Extent = 
               Top = 70
               Left = 549
               Bottom = 200
               Right = 776
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_BestellPositionen"
            Begin Extent = 
               Top = 105
               Left = 884
               Bottom = 235
               Right = 1061
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_Bestellungen"
            Begin Extent = 
               Top = 82
               Left = 1138
               Bottom = 263
               Right = 1307
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_GerichtGerichttyp_Bestelldatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_GerichtGerichttyp_Bestelldatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_GerichtGerichttyp_Bestelldatum'
GO
