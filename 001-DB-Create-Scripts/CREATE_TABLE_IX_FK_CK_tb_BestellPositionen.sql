USE [Restaurant]
GO
/****** Object:  Table [dbo].[tb_BestellPositionen]    Script Date: 20.06.2024 08:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_BestellPositionen](
	[BestellPositionID] [int] IDENTITY(1,1) NOT NULL,
	[BestellungID] [int] NOT NULL,
	[GerichtID] [int] NOT NULL,
	[AnzahlGericht] [int] NOT NULL,
 CONSTRAINT [PK_BestellPosition] PRIMARY KEY CLUSTERED 
(
	[BestellPositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_BestellPositionen] ON 

INSERT [dbo].[tb_BestellPositionen] ([BestellPositionID], [BestellungID], [GerichtID], [AnzahlGericht]) VALUES (1, 7, 1, 7)
INSERT [dbo].[tb_BestellPositionen] ([BestellPositionID], [BestellungID], [GerichtID], [AnzahlGericht]) VALUES (2, 7, 9, 2)
INSERT [dbo].[tb_BestellPositionen] ([BestellPositionID], [BestellungID], [GerichtID], [AnzahlGericht]) VALUES (3, 7, 8, 1)
INSERT [dbo].[tb_BestellPositionen] ([BestellPositionID], [BestellungID], [GerichtID], [AnzahlGericht]) VALUES (4, 12, 3, 4)
INSERT [dbo].[tb_BestellPositionen] ([BestellPositionID], [BestellungID], [GerichtID], [AnzahlGericht]) VALUES (5, 12, 9, 2)
INSERT [dbo].[tb_BestellPositionen] ([BestellPositionID], [BestellungID], [GerichtID], [AnzahlGericht]) VALUES (6, 12, 10, 2)
INSERT [dbo].[tb_BestellPositionen] ([BestellPositionID], [BestellungID], [GerichtID], [AnzahlGericht]) VALUES (7, 14, 6, 1)
INSERT [dbo].[tb_BestellPositionen] ([BestellPositionID], [BestellungID], [GerichtID], [AnzahlGericht]) VALUES (8, 14, 10, 1)
INSERT [dbo].[tb_BestellPositionen] ([BestellPositionID], [BestellungID], [GerichtID], [AnzahlGericht]) VALUES (9, 18, 11, 1)
INSERT [dbo].[tb_BestellPositionen] ([BestellPositionID], [BestellungID], [GerichtID], [AnzahlGericht]) VALUES (10, 21, 4, 1)
INSERT [dbo].[tb_BestellPositionen] ([BestellPositionID], [BestellungID], [GerichtID], [AnzahlGericht]) VALUES (11, 21, 7, 1)
INSERT [dbo].[tb_BestellPositionen] ([BestellPositionID], [BestellungID], [GerichtID], [AnzahlGericht]) VALUES (12, 21, 12, 2)
INSERT [dbo].[tb_BestellPositionen] ([BestellPositionID], [BestellungID], [GerichtID], [AnzahlGericht]) VALUES (13, 23, 13, 2)
INSERT [dbo].[tb_BestellPositionen] ([BestellPositionID], [BestellungID], [GerichtID], [AnzahlGericht]) VALUES (14, 23, 5, 1)
INSERT [dbo].[tb_BestellPositionen] ([BestellPositionID], [BestellungID], [GerichtID], [AnzahlGericht]) VALUES (15, 23, 3, 1)
INSERT [dbo].[tb_BestellPositionen] ([BestellPositionID], [BestellungID], [GerichtID], [AnzahlGericht]) VALUES (16, 23, 8, 2)
INSERT [dbo].[tb_BestellPositionen] ([BestellPositionID], [BestellungID], [GerichtID], [AnzahlGericht]) VALUES (17, 23, 10, 2)
INSERT [dbo].[tb_BestellPositionen] ([BestellPositionID], [BestellungID], [GerichtID], [AnzahlGericht]) VALUES (18, 7, 10, 2)
SET IDENTITY_INSERT [dbo].[tb_BestellPositionen] OFF
GO
/****** Object:  Index [IX_tb_BestellPositionen_BestellungID_GerichtID]    Script Date: 20.06.2024 08:46:34 ******/
-- BestellungID und GerichtID einzigartig
CREATE UNIQUE NONCLUSTERED INDEX [IX_tb_BestellPositionen_BestellungID_GerichtID] ON [dbo].[tb_BestellPositionen]
(
	[BestellungID] ASC,
	[GerichtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
-- Foreign key setzen
ALTER TABLE [dbo].[tb_BestellPositionen]  WITH CHECK ADD  CONSTRAINT [FK_tb_BestellPosition_tb_Bestellungen_BestellungID] FOREIGN KEY([BestellungID])
REFERENCES [dbo].[tb_Bestellungen] ([BestellungID])
GO
ALTER TABLE [dbo].[tb_BestellPositionen] CHECK CONSTRAINT [FK_tb_BestellPosition_tb_Bestellungen_BestellungID]
GO
-- Foreign key setzen
ALTER TABLE [dbo].[tb_BestellPositionen]  WITH CHECK ADD  CONSTRAINT [FK_tb_BestellPosition_tb_Gericht_GerichtID] FOREIGN KEY([GerichtID])
REFERENCES [dbo].[tb_Gerichte] ([GerichtID])
GO
ALTER TABLE [dbo].[tb_BestellPositionen] CHECK CONSTRAINT [FK_tb_BestellPosition_tb_Gericht_GerichtID]
GO
-- Anzahl der Gerichte pro Bestellung muss immer über 0 sein
ALTER TABLE [dbo].[tb_BestellPositionen]  WITH CHECK ADD  CONSTRAINT [CK_tb_BestellPositionen_AnzahlGericht_gr_null] CHECK  (([AnzahlGericht]>(0)))
GO
ALTER TABLE [dbo].[tb_BestellPositionen] CHECK CONSTRAINT [CK_tb_BestellPositionen_AnzahlGericht_gr_null]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Eine Bestellung muss mindestens ein Gericht beinhalten' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_BestellPositionen', @level2type=N'CONSTRAINT',@level2name=N'CK_tb_BestellPositionen_AnzahlGericht_gr_null'
GO
