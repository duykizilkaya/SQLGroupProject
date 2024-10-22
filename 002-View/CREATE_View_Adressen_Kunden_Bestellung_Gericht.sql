USE [Restaurant]
GO
/****** Object:  View [dbo].[View_Adressen_Kunden_Bestellung_Gericht]    Script Date: 20.06.2024 09:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Adressen_Kunden_Bestellung_Gericht]
AS
SELECT        dbo.tb_Adressen.PLZ, dbo.tb_Kunden.Nachname, dbo.tb_Kunden.Vorname, dbo.tb_Kunden.Stammkunde, dbo.tb_Bestellungen.Datum, dbo.tb_Gerichte.Gericht
FROM            dbo.tb_Bestellungen INNER JOIN
                         dbo.tb_BestellPositionen ON dbo.tb_Bestellungen.BestellungID = dbo.tb_BestellPositionen.BestellungID INNER JOIN
                         dbo.tb_Gerichte ON dbo.tb_BestellPositionen.GerichtID = dbo.tb_Gerichte.GerichtID RIGHT OUTER JOIN
                         dbo.tb_Kunden ON dbo.tb_Bestellungen.KundenID = dbo.tb_Kunden.KundeID LEFT OUTER JOIN
                         dbo.tb_Adressen ON dbo.tb_Kunden.AdresseID = dbo.tb_Adressen.AdresseID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[39] 4[17] 2[4] 3) )"
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
         Begin Table = "tb_Bestellungen"
            Begin Extent = 
               Top = 82
               Left = 668
               Bottom = 310
               Right = 837
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_BestellPositionen"
            Begin Extent = 
               Top = 63
               Left = 935
               Bottom = 309
               Right = 1112
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_Gerichte"
            Begin Extent = 
               Top = 65
               Left = 1203
               Bottom = 230
               Right = 1430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_Kunden"
            Begin Extent = 
               Top = 117
               Left = 384
               Bottom = 317
               Right = 551
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_Adressen"
            Begin Extent = 
               Top = 33
               Left = 111
               Bottom = 163
               Right = 278
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1350
         Width = 1500
         Width = 3015
         Width = 4590
         Width = 1485
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Adressen_Kunden_Bestellung_Gericht'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Adressen_Kunden_Bestellung_Gericht'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Adressen_Kunden_Bestellung_Gericht'
GO
