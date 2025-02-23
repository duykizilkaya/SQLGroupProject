USE [Restaurant]
GO
/****** Object:  Table [dbo].[tb_Adressen]    Script Date: 20.06.2024 08:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Adressen](
	[AdresseID] [int] IDENTITY(1,1) NOT NULL,
	[Stadt] [nvarchar](50) NOT NULL,
	[Straße] [nvarchar](50) NOT NULL,
	[Hausnummer] [nvarchar](50) NOT NULL,
	[PLZ] [char](5) NOT NULL,
	[Koordinaten] [geography] NULL,
 CONSTRAINT [PK_Adressen] PRIMARY KEY CLUSTERED 
(
	[AdresseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_Adressen] ON 

INSERT [dbo].[tb_Adressen] ([AdresseID], [Stadt], [Straße], [Hausnummer], [PLZ], [Koordinaten]) VALUES (1, N'Berlin', N'Unter den Linden', N'10', N'10115', 0xE6100000010CC3F5285C8F424A408FC2F5285CCF2A40)
INSERT [dbo].[tb_Adressen] ([AdresseID], [Stadt], [Straße], [Hausnummer], [PLZ], [Koordinaten]) VALUES (2, N'Berlin', N'Pariser Platz', N'20', N'10117', 0xE6100000010C60764F1E16424A40FE65F7E461C12A40)
INSERT [dbo].[tb_Adressen] ([AdresseID], [Stadt], [Straße], [Hausnummer], [PLZ], [Koordinaten]) VALUES (3, N'Berlin', N'Alexanderplatz', N'30', N'10178', 0xE6100000010C4182E2C798434A407DAEB6627F792B40)
INSERT [dbo].[tb_Adressen] ([AdresseID], [Stadt], [Straße], [Hausnummer], [PLZ], [Koordinaten]) VALUES (4, N'Berlin', N'Rosenthaler Platz', N'40', N'10119', 0xE6100000010CDC4603780B444A400D71AC8BDBC82A40)
INSERT [dbo].[tb_Adressen] ([AdresseID], [Stadt], [Straße], [Hausnummer], [PLZ], [Koordinaten]) VALUES (5, N'Berlin', N'Potsdamer Platz', N'50', N'10785', 0xE6100000010C9CC420B072404A40014D840D4FCF2A40)
INSERT [dbo].[tb_Adressen] ([AdresseID], [Stadt], [Straße], [Hausnummer], [PLZ], [Koordinaten]) VALUES (6, N'Berlin', N'Invalidenstraße', N'60', N'10119', 0xE6100000010CC3F5285C8F424A40DF4F8D976ED22A40)
INSERT [dbo].[tb_Adressen] ([AdresseID], [Stadt], [Straße], [Hausnummer], [PLZ], [Koordinaten]) VALUES (7, N'Berlin', N'Warschauer Straße', N'70', N'10245', 0xE6100000010C0000000000404A406666666666E62A40)
INSERT [dbo].[tb_Adressen] ([AdresseID], [Stadt], [Straße], [Hausnummer], [PLZ], [Koordinaten]) VALUES (8, N'Berlin', N'Chausseestraße', N'80', N'10115', 0xE6100000010CC3F5285C8F424A40C3F5285C8FC22A40)
INSERT [dbo].[tb_Adressen] ([AdresseID], [Stadt], [Straße], [Hausnummer], [PLZ], [Koordinaten]) VALUES (9, N'Berlin', N'Friedrichstraße', N'90', N'10117', 0xE6100000010CE17A14AE47414A40CDCCCCCCCCCC2A40)
INSERT [dbo].[tb_Adressen] ([AdresseID], [Stadt], [Straße], [Hausnummer], [PLZ], [Koordinaten]) VALUES (10, N'Berlin', N'Prenzlauer Allee', N'100', N'10405', 0xE6100000010CA4703D0AD7434A40D7A3703D0AD72A40)
INSERT [dbo].[tb_Adressen] ([AdresseID], [Stadt], [Straße], [Hausnummer], [PLZ], [Koordinaten]) VALUES (11, N'Potsdam', N'Am Neuen Garten', N'13', N'14469', 0xE6100000010CEF1F0BD121344A40815CE2C803212A40)
SET IDENTITY_INSERT [dbo].[tb_Adressen] OFF
GO
-- Format Postleitzahl beschränken
ALTER TABLE [dbo].[tb_Adressen]  WITH CHECK ADD  CONSTRAINT [CK_tb_Adressen_PLZ_Format] CHECK  (([PLZ] like '[0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[tb_Adressen] CHECK CONSTRAINT [CK_tb_Adressen_PLZ_Format]
GO
