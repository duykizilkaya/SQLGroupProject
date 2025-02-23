/*    ==Skriptparameter==

    Quellserverversion : SQL Server 2022 (16.0.1115)
    Edition der Quelldatenbank-Engine : Microsoft SQL Server Enterprise Edition
    Typ der Quelldatenbank-Engine : Eigenständige SQL Server-Instanz

    Zielserverversion : SQL Server 2022
    Edition der Zieldatenbank-Engine : Microsoft SQL Server Enterprise Edition
    Typ der Zieldatenbank-Engine : Eigenständige SQL Server-Instanz
*/
USE [master]
GO
/****** Object:  Database [Restaurant]    Script Date: 20.06.2024 15:27:41 ******/
CREATE DATABASE [Restaurant]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Restaurant', FILENAME = N'C:\SQL-Kurs\Abschlussprojekt\Restaurant.mdf' , SIZE = 9920KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Restaurant_log', FILENAME = N'C:\SQL-Kurs\Abschlussprojekt\Restaurant_log.ldf' , SIZE = 21440KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Restaurant] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Restaurant].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Restaurant] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Restaurant] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Restaurant] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Restaurant] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Restaurant] SET ARITHABORT OFF 
GO
ALTER DATABASE [Restaurant] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Restaurant] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Restaurant] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Restaurant] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Restaurant] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Restaurant] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Restaurant] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Restaurant] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Restaurant] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Restaurant] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Restaurant] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Restaurant] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Restaurant] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Restaurant] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Restaurant] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Restaurant] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Restaurant] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Restaurant] SET RECOVERY FULL 
GO
ALTER DATABASE [Restaurant] SET  MULTI_USER 
GO
ALTER DATABASE [Restaurant] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Restaurant] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Restaurant] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Restaurant] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Restaurant] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Restaurant] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Restaurant', N'ON'
GO
ALTER DATABASE [Restaurant] SET QUERY_STORE = ON
GO
ALTER DATABASE [Restaurant] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/****** Object:  Login [NT-AUTORITÄT\SYSTEM]    Script Date: 20.06.2024 15:27:41 ******/
CREATE LOGIN [NT-AUTORITÄT\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Deutsch]
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 20.06.2024 15:27:41 ******/
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Deutsch]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 20.06.2024 15:27:41 ******/
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Deutsch]
GO
/****** Object:  Login [NT SERVICE\SQLTELEMETRY]    Script Date: 20.06.2024 15:27:41 ******/
CREATE LOGIN [NT SERVICE\SQLTELEMETRY] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Deutsch]
GO
/****** Object:  Login [NT SERVICE\SQLSERVERAGENT]    Script Date: 20.06.2024 15:27:41 ******/
CREATE LOGIN [NT SERVICE\SQLSERVERAGENT] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Deutsch]
GO
/****** Object:  Login [NT Service\MSSQLSERVER]    Script Date: 20.06.2024 15:27:41 ******/
CREATE LOGIN [NT Service\MSSQLSERVER] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Deutsch]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [Koch]    Script Date: 20.06.2024 15:27:41 ******/
CREATE LOGIN [Koch] WITH PASSWORD=N'DR3Fo2FOsguK+qN9HZK0LDuiKGBvR9NdvL+w8te1bF8=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Deutsch], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [Koch] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [Kellner]    Script Date: 20.06.2024 15:27:41 ******/
CREATE LOGIN [Kellner] WITH PASSWORD=N'kTHIIUSB9554v1Sv9HGCyILXn+ztUaQTVqNm77bEyJs=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Deutsch], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [Kellner] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [FirmaUser]    Script Date: 20.06.2024 15:27:41 ******/
CREATE LOGIN [FirmaUser] WITH PASSWORD=N'zby2zchNZM9V2nb39szo0D/LiP65gKGzLfeU5Iz+ocA=', DEFAULT_DATABASE=[FirmaUebung], DEFAULT_LANGUAGE=[Deutsch], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [FirmaUser] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [Eigentuemer]    Script Date: 20.06.2024 15:27:41 ******/
CREATE LOGIN [Eigentuemer] WITH PASSWORD=N'XVrjcI+4vxkZA3pkd1LX/dF5XoTj3y0gMiJ3rtkMZxo=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Deutsch], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [Eigentuemer] DISABLE
GO
/****** Object:  Login [DESKTOP-I37MTDJ\alfa]    Script Date: 20.06.2024 15:27:41 ******/
CREATE LOGIN [DESKTOP-I37MTDJ\alfa] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Deutsch]
GO
/****** Object:  Login [DESKTOP-I37MTDJ\admin]    Script Date: 20.06.2024 15:27:41 ******/
CREATE LOGIN [DESKTOP-I37MTDJ\admin] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Deutsch]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 20.06.2024 15:27:41 ******/
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'pHfQfXH91YQvB5fPTrQrxeVpztApqrUic/3TOLzyKBM=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 20.06.2024 15:27:41 ******/
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'tzfPIM2VaXmD8wLRu8j75YxEQPIJ6Pd4C8POge62QGA=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Deutsch], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
ALTER AUTHORIZATION ON DATABASE::[Restaurant] TO [DESKTOP-I37MTDJ\alfa]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\Winmgmt]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLSERVERAGENT]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT Service\MSSQLSERVER]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DESKTOP-I37MTDJ\alfa]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DESKTOP-I37MTDJ\admin]
GO
USE [Restaurant]
GO
/****** Object:  User [Koch]    Script Date: 20.06.2024 15:27:41 ******/
CREATE USER [Koch] FOR LOGIN [Koch] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Kellner]    Script Date: 20.06.2024 15:27:41 ******/
CREATE USER [Kellner] FOR LOGIN [Kellner] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Eigentuemer]    Script Date: 20.06.2024 15:27:41 ******/
CREATE USER [Eigentuemer] FOR LOGIN [Eigentuemer] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Koch]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Kellner]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [Kellner]
GO
ALTER ROLE [db_owner] ADD MEMBER [Eigentuemer]
GO
GRANT CONNECT TO [Eigentuemer] AS [dbo]
GO
GRANT CONNECT TO [Kellner] AS [dbo]
GO
GRANT CONNECT TO [Koch] AS [dbo]
GO
GRANT VIEW ANY COLUMN ENCRYPTION KEY DEFINITION TO [public] AS [dbo]
GO
GRANT VIEW ANY COLUMN MASTER KEY DEFINITION TO [public] AS [dbo]
GO
/****** Object:  UserDefinedFunction [dbo].[sf_Anzahl_Gerichte_im_Lager]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe_B
-- Create date: 18.06.2024
-- Description: Diese Funktion gibt die Anzahl der Gerichte zurück, 
--				die für ein bestimmtes Gericht bei den vorhanden Lagermengen gekocht werden können
-- =============================================
CREATE   FUNCTION [dbo].[sf_Anzahl_Gerichte_im_Lager] 
(
	-- Add the parameters for the function here
	@GerichtID INT
)
RETURNS INT
AS
BEGIN
	DECLARE @Anzahl INT;
	SET @Anzahl = 
	(
		SELECT TOP (1)
			CONVERT(INT, dbo.tb_ZutatenLager.Menge / dbo.tb_ZutatenGericht.Menge) AS Anzahl
		FROM dbo.tb_ZutatenGericht INNER JOIN
             dbo.tb_ZutatenLager ON dbo.tb_ZutatenGericht.ZutatID = dbo.tb_ZutatenLager.ZutatID
		WHERE 
			 dbo.tb_ZutatenGericht.GerichtID = @GerichtID
		ORDER BY Anzahl
	);

	IF (@Anzahl IS NULL)
		SET @Anzahl = 0;
		

	-- Return the result of the function
	RETURN @Anzahl;

END
GO
ALTER AUTHORIZATION ON [dbo].[sf_Anzahl_Gerichte_im_Lager] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[sf_Berechnung_Entfernung]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe B
-- Create date: 18.06.24
-- Description:	Diese Skalarfunktion berechnet die Entfernung der Kunden von dem Restaurant aus (13.383068 52.530644)
-- =============================================
CREATE   FUNCTION [dbo].[sf_Berechnung_Entfernung] 
(
	-- Add the parameters for the function here
	@KundenID int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Entfernung float;
	SET @Entfernung = (
		SELECT
			geography::STGeomFromText(Koordinaten.STAsText(), 4326).STDistance(geography::STGeomFromText('POINT(13.383068 52.530644)', 4326)) / 1000 AS Distanz_km
				FROM dbo.tb_Kunden 
				INNER JOIN dbo.tb_Adressen 
					ON dbo.tb_Kunden.AdresseID = dbo.tb_Adressen.AdresseID
			WHERE KundeID = @KundenID
			);

	-- Return the result of the function
	RETURN @Entfernung;

END
GO
ALTER AUTHORIZATION ON [dbo].[sf_Berechnung_Entfernung] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[sf_Ist_Stammkunde]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gruppe B
-- Create date: 19.06.2024
-- Description:	Diese Funktion sagt aus, ob ein Kunde Stammkunde ist oder nicht
-- =============================================
CREATE   FUNCTION [dbo].[sf_Ist_Stammkunde]  
(
	@Bestellnummer char(10)
)
RETURNS bit
AS
BEGIN
	DECLARE @Stammkunde bit;
	SET @Stammkunde = 
	(
		SELECT dbo.tb_Kunden.Stammkunde
		FROM dbo.tb_Bestellungen
		JOIN dbo.tb_Kunden ON dbo.tb_Bestellungen.KundenID = dbo.tb_Kunden.KundeID
		WHERE dbo.tb_Bestellungen.Bestellnummer = @Bestellnummer
	)
	
	RETURN @Stammkunde;

END


GO
ALTER AUTHORIZATION ON [dbo].[sf_Ist_Stammkunde] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[sf_NaechsteBestellnummer]    Script Date: 20.06.2024 15:27:41 ******/
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
CREATE   FUNCTION [dbo].[sf_NaechsteBestellnummer]
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
ALTER AUTHORIZATION ON [dbo].[sf_NaechsteBestellnummer] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[sf_RechnungTotalRabatt]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gruppe B
-- Create date: 18.06.2024
-- Description:	diese Funktion berechnet Preis mit/ohne Rabatt
-- =============================================
CREATE     FUNCTION [dbo].[sf_RechnungTotalRabatt]  
(
	@Bestellnummer char(10)
)
RETURNS money
AS
BEGIN
	DECLARE @Stammkunde bit;
	SET @Stammkunde = 
	(
		SELECT dbo.tb_Kunden.Stammkunde
		FROM dbo.tb_Bestellungen
		JOIN dbo.tb_Kunden ON dbo.tb_Bestellungen.KundenID = dbo.tb_Kunden.KundeID
		WHERE dbo.tb_Bestellungen.Bestellnummer = @Bestellnummer
	)
	DECLARE @Total money
	SET @Total = 
	(
		SELECT Total
		FROM dbo.View_RechnungTotal
		WHERE Bestellnummer = @Bestellnummer
	)
	RETURN IIF (@Stammkunde = 1, @Total * 0.95, @Total)
END




GO
ALTER AUTHORIZATION ON [dbo].[sf_RechnungTotalRabatt] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[sf_Status_Bestellung]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe B
-- Create date: 18.06.2024
-- Description:	Diese Skalarwertfunktion soll checken, ob eine Bestellung abgeschlossen, in Bearbeitung oder abgebrochen ist
-- =============================================
CREATE   FUNCTION [dbo].[sf_Status_Bestellung]
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
ALTER AUTHORIZATION ON [dbo].[sf_Status_Bestellung] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[sf_Zeitstempel]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe B
-- Create date: 19.06.2024
-- Description:	Die Funktion generiert einen Zeitstempel im Format: 20210105-1051 für das automatische Back-up
-- =============================================
CREATE   FUNCTION [dbo].[sf_Zeitstempel]  
(
)
RETURNS char(13)
AS
BEGIN

	RETURN FORMAT(GETDATE(), 'yyyyMMdd-HHmm');

END
GO
ALTER AUTHORIZATION ON [dbo].[sf_Zeitstempel] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[tb_Gerichte]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Gerichte](
	[GerichtID] [int] IDENTITY(1,1) NOT NULL,
	[Gericht] [nvarchar](30) NOT NULL,
	[GeschmacksBeschreibung] [nvarchar](60) NOT NULL,
	[Preis] [money] NOT NULL,
 CONSTRAINT [PK_tb_Gericht] PRIMARY KEY CLUSTERED 
(
	[GerichtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[tb_Gerichte] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[tb_BestellPositionen]    Script Date: 20.06.2024 15:27:41 ******/
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
ALTER AUTHORIZATION ON [dbo].[tb_BestellPositionen] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[tb_Bestellungen]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Bestellungen](
	[BestellungID] [int] IDENTITY(1,1) NOT NULL,
	[Bestellnummer] [char](10) NULL,
	[TischID] [int] NOT NULL,
	[Datum] [datetime] NOT NULL,
	[MitarbeiterID] [int] NOT NULL,
	[KundenID] [int] NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Bestellung] PRIMARY KEY CLUSTERED 
(
	[BestellungID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[tb_Bestellungen] TO  SCHEMA OWNER 
GO
/****** Object:  View [dbo].[View_RechnungPositionen]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Subtotal_CREATE*/
CREATE VIEW [dbo].[View_RechnungPositionen]
AS
SELECT        dbo.tb_Bestellungen.Bestellnummer, dbo.tb_Gerichte.Gericht, dbo.tb_Gerichte.Preis, dbo.tb_BestellPositionen.AnzahlGericht, dbo.tb_Gerichte.Preis * dbo.tb_BestellPositionen.AnzahlGericht AS Subtotal
FROM            dbo.tb_Gerichte INNER JOIN
                         dbo.tb_BestellPositionen ON dbo.tb_Gerichte.GerichtID = dbo.tb_BestellPositionen.GerichtID INNER JOIN
                         dbo.tb_Bestellungen ON dbo.tb_Bestellungen.BestellungID = dbo.tb_BestellPositionen.BestellungID
GO
ALTER AUTHORIZATION ON [dbo].[View_RechnungPositionen] TO  SCHEMA OWNER 
GO
/****** Object:  View [dbo].[View_RechnungTotal]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Total_CREATE*/
CREATE VIEW [dbo].[View_RechnungTotal]
AS
SELECT        dbo.tb_Bestellungen.Bestellnummer, SUM(dbo.tb_Gerichte.Preis * dbo.tb_BestellPositionen.AnzahlGericht) AS Total
FROM            dbo.tb_Gerichte INNER JOIN
                         dbo.tb_BestellPositionen ON dbo.tb_Gerichte.GerichtID = dbo.tb_BestellPositionen.GerichtID INNER JOIN
                         dbo.tb_Bestellungen ON dbo.tb_Bestellungen.BestellungID = dbo.tb_BestellPositionen.BestellungID
GROUP BY dbo.tb_Bestellungen.Bestellnummer
GO
ALTER AUTHORIZATION ON [dbo].[View_RechnungTotal] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[tf_Rechnung_erstellen]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe B
-- Create date: 19.06.2024
-- Description:	Diese Tabellenweertfunktion soll die Gesamtrechnung für eine BestellID 
--				ausgeben und prüfen, ob Kunde Stammkunde ist um Rabatt hinzuzufügen
-- =============================================
CREATE   FUNCTION [dbo].[tf_Rechnung_erstellen]
(	
	@Bestellnummer char(10)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
		SELECT	[Bestellnummer] AS Bestellnummer
		,[Gericht] AS Gericht
		,CONVERT(varchar(10),[Preis]) AS Preis
		,CONVERT(varchar(10),[AnzahlGericht]) AS Anzahl
		,[Subtotal] AS Subtotal
			FROM dbo.View_RechnungPositionen
			WHERE Bestellnummer = @Bestellnummer
UNION
	SELECT	'Gesamtpreis' AS Bestellnummer
		,'' AS Gericht
		,'' AS Preis
		,'' AS Anzahl
		,[Total] AS Subtotal
			FROM dbo.View_RechnungTotal
			WHERE Bestellnummer = @Bestellnummer
UNION
	SELECT CASE 
			WHEN [dbo].[sf_Ist_Stammkunde](@Bestellnummer) = 1
			THEN 'Gesamtpreis mit Stammkundenrabatt 5%' 
			ELSE 'Gesamtpreis ohne Rabatt'
			END AS Bestellnummer
				,'' AS Gericht
				,'' AS Preis
				,'' AS Anzahl
				,dbo.sf_RechnungTotalRabatt(@Bestellnummer) AS Subtotal
			FROM dbo.View_RechnungTotal
			WHERE Bestellnummer = @Bestellnummer
)
GO
ALTER AUTHORIZATION ON [dbo].[tf_Rechnung_erstellen] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[tb_Adressen]    Script Date: 20.06.2024 15:27:41 ******/
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
ALTER AUTHORIZATION ON [dbo].[tb_Adressen] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[tb_Kunden]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Kunden](
	[KundeID] [int] IDENTITY(1,1) NOT NULL,
	[Vorname] [nvarchar](50) NOT NULL,
	[Nachname] [nvarchar](50) NOT NULL,
	[Geburtsdatum] [date] NULL,
	[Email] [nvarchar](50) NULL,
	[Telefon] [varchar](20) NULL,
	[AdresseID] [int] NULL,
	[Stammkunde] [bit] NOT NULL,
 CONSTRAINT [PK_tb_Kunden] PRIMARY KEY CLUSTERED 
(
	[KundeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[tb_Kunden] TO  SCHEMA OWNER 
GO
/****** Object:  View [dbo].[View_Kunden_Adressend_Entfernung]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Kunden_Adressend_Entfernung]
AS
SELECT TOP (100)
Nachname AS KuNN, 
				Vorname AS KuVN, 
				Straße, 
				Hausnummer, 
				PLZ, 
				Stadt, 
				Koordinaten.STAsText() AS Koordinaten, 
                 geography::STGeomFromText(Koordinaten.STAsText(), 4326).STDistance(geography::STGeomFromText('POINT(13.383068 52.530644)', 4326)) / 1000 AS Distanz_km
FROM            dbo.tb_Adressen INNER JOIN
                dbo.tb_Kunden ON dbo.tb_Adressen.AdresseID = dbo.tb_Kunden.AdresseID
ORDER BY Distanz_km
GO
ALTER AUTHORIZATION ON [dbo].[View_Kunden_Adressend_Entfernung] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[tb_Taetigkeit]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Taetigkeit](
	[TaetigkeitID] [int] IDENTITY(1,1) NOT NULL,
	[Taetigkeit] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tb_Taetigkeit] PRIMARY KEY CLUSTERED 
(
	[TaetigkeitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[tb_Taetigkeit] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[tb_Mitarbeiter]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Mitarbeiter](
	[MitarbeiterID] [int] IDENTITY(1,1) NOT NULL,
	[Vorname] [nvarchar](50) NOT NULL,
	[Nachname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Telefon] [varchar](20) NULL,
	[Geburtsdatum] [date] NOT NULL,
	[AdresseID] [int] NOT NULL,
	[TaetigkeitID] [int] NOT NULL,
	[Gehalt] [money] NOT NULL,
 CONSTRAINT [PK_tb_Mitarbeiter] PRIMARY KEY CLUSTERED 
(
	[MitarbeiterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[tb_Mitarbeiter] TO  SCHEMA OWNER 
GO
/****** Object:  View [dbo].[View_Mitarbeiter_Taetigkeit_Bestellungen]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Mitarbeiter_Taetigkeit_Bestellungen]
AS
SELECT        TOP (100) PERCENT dbo.tb_Mitarbeiter.Nachname, dbo.tb_Mitarbeiter.Vorname, dbo.tb_Taetigkeit.Taetigkeit, dbo.tb_Bestellungen.Bestellnummer, dbo.tb_Bestellungen.TischID, dbo.tb_Bestellungen.Datum
FROM            dbo.tb_Taetigkeit INNER JOIN
                         dbo.tb_Mitarbeiter ON dbo.tb_Taetigkeit.TaetigkeitID = dbo.tb_Mitarbeiter.TaetigkeitID LEFT OUTER JOIN
                         dbo.tb_Bestellungen ON dbo.tb_Mitarbeiter.MitarbeiterID = dbo.tb_Bestellungen.MitarbeiterID
ORDER BY dbo.tb_Mitarbeiter.Nachname, dbo.tb_Mitarbeiter.Vorname, dbo.tb_Taetigkeit.Taetigkeit
GO
ALTER AUTHORIZATION ON [dbo].[View_Mitarbeiter_Taetigkeit_Bestellungen] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[tb_Gerichttyp]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Gerichttyp](
	[GerichttypID] [int] IDENTITY(1,1) NOT NULL,
	[Gerichttyp] [nchar](20) NOT NULL,
 CONSTRAINT [PK_tb_Gerichttyp] PRIMARY KEY CLUSTERED 
(
	[GerichttypID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[tb_Gerichttyp] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[tb_GerichtGerichttyp]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_GerichtGerichttyp](
	[GerichtGerichttypID] [int] IDENTITY(1,1) NOT NULL,
	[GerichtID] [int] NOT NULL,
	[GerichttypID] [int] NOT NULL,
 CONSTRAINT [PK_tb_GerichtGerichttyp] PRIMARY KEY CLUSTERED 
(
	[GerichtGerichttypID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[tb_GerichtGerichttyp] TO  SCHEMA OWNER 
GO
/****** Object:  View [dbo].[View_GerichtGerichttyp_Bestelldatum]    Script Date: 20.06.2024 15:27:41 ******/
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
ALTER AUTHORIZATION ON [dbo].[View_GerichtGerichttyp_Bestelldatum] TO  SCHEMA OWNER 
GO
/****** Object:  View [dbo].[View_Adressen_Kunden_Bestellung_Gericht]    Script Date: 20.06.2024 15:27:41 ******/
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
ALTER AUTHORIZATION ON [dbo].[View_Adressen_Kunden_Bestellung_Gericht] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[tb_ZutatenLager]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_ZutatenLager](
	[ZutatID] [int] IDENTITY(1,1) NOT NULL,
	[Zutat] [nvarchar](50) NOT NULL,
	[Beschreibung] [nvarchar](100) NOT NULL,
	[Menge] [float] NOT NULL,
	[Mindestmenge] [float] NOT NULL,
	[Maximalmenge] [float] NOT NULL,
	[Einheit] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_Zutaten] PRIMARY KEY CLUSTERED 
(
	[ZutatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[tb_ZutatenLager] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[tb_ZutatenGericht]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_ZutatenGericht](
	[ZutatenGerichtID] [int] IDENTITY(1,1) NOT NULL,
	[GerichtID] [int] NOT NULL,
	[ZutatID] [int] NOT NULL,
	[Menge] [float] NOT NULL,
 CONSTRAINT [PK_tb_ZutatenGericht] PRIMARY KEY CLUSTERED 
(
	[ZutatenGerichtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[tb_ZutatenGericht] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[tf_Lager_menge]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GruppeB
-- Create date: 17.06.2024
-- Description:	Diese Tabellenfunktion gibt die Lagermenge von benötigte Zutaten für eine Bestellung wieder
-- =============================================
CREATE   FUNCTION [dbo].[tf_Lager_menge] 
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
GO
ALTER AUTHORIZATION ON [dbo].[tf_Lager_menge] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[tf_Zutaten_benoetigte]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GruppeB
-- Create date: 17.06.2024
-- Description:	Diese Tabellenwertfunktion gibt die benötigten Zutaten für eine Bestellung wieder
-- =============================================
CREATE   FUNCTION [dbo].[tf_Zutaten_benoetigte] 
(			
	@BestellungID int 
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT dbo.tb_ZutatenGericht.ZutatID, dbo.tb_ZutatenGericht.Menge * AnzahlGericht AS BenoetigteZutaten
	FROM dbo.tb_BestellPositionen INNER JOIN
    dbo.tb_Gerichte ON dbo.tb_BestellPositionen.GerichtID = dbo.tb_Gerichte.GerichtID INNER JOIN
    dbo.tb_ZutatenGericht ON dbo.tb_Gerichte.GerichtID = dbo.tb_ZutatenGericht.GerichtID
	WHERE BestellungID = @BestellungID 
	);
GO
ALTER AUTHORIZATION ON [dbo].[tf_Zutaten_benoetigte] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[tf_Abzug_Lagermenge_benoetigte_Zutaten_pro_Bestellung]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GruppeB
-- Create date: 17.06.2024
-- Description:	Diese Tabellenwertfunktion gibt den subtrahierten Lagerbestand von Zutaten für eine Bestellung wieder
-- =============================================
CREATE   FUNCTION [dbo].[tf_Abzug_Lagermenge_benoetigte_Zutaten_pro_Bestellung]
(			
	@BestellungID int
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT dbo.tf_Zutaten_benoetigte.ZutatID, dbo.tf_Lager_menge.Menge - dbo.tf_Zutaten_benoetigte.BenoetigteZutaten AS 'Minus'
	FROM dbo.tf_Lager_menge(@BestellungID) INNER JOIN dbo.tf_Zutaten_benoetigte(@BestellungID)
	ON dbo.tf_Zutaten_benoetigte.ZutatID = dbo.tf_Lager_menge.ZutatID
)
GO
ALTER AUTHORIZATION ON [dbo].[tf_Abzug_Lagermenge_benoetigte_Zutaten_pro_Bestellung] TO  SCHEMA OWNER 
GO
/****** Object:  View [dbo].[View_Anzahl_Gerichte_Pro_Lagermenge]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Anzahl_Gerichte_Pro_Lagermenge]
AS
SELECT        TOP (100) PERCENT dbo.tb_ZutatenGericht.GerichtID, dbo.tb_ZutatenGericht.ZutatID, dbo.tb_ZutatenGericht.Menge AS Zutatenmenge_benötigt_pro_Gericht, dbo.tb_ZutatenLager.Menge AS Lagerbestand_pro_Zutat, 
                         CONVERT(INT, dbo.tb_ZutatenLager.Menge / dbo.tb_ZutatenGericht.Menge) AS Anzahl_bestellbar_pro_Gericht
FROM            dbo.tb_ZutatenGericht INNER JOIN
                         dbo.tb_ZutatenLager ON dbo.tb_ZutatenGericht.ZutatID = dbo.tb_ZutatenLager.ZutatID
ORDER BY dbo.tb_ZutatenGericht.GerichtID, Anzahl_bestellbar_pro_Gericht
GO
ALTER AUTHORIZATION ON [dbo].[View_Anzahl_Gerichte_Pro_Lagermenge] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[tb_temp_Rechnung]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_temp_Rechnung](
	[Bestellnummer] [varchar](36) NULL,
	[Gericht] [nvarchar](30) NOT NULL,
	[Preis] [varchar](10) NULL,
	[Anzahl] [varchar](10) NULL,
	[Subtotal] [money] NULL
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[tb_temp_Rechnung] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[tb_Tische]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Tische](
	[TischID] [int] IDENTITY(1,1) NOT NULL,
	[TischNummer] [int] NOT NULL,
	[Beschreibung] [nvarchar](50) NOT NULL,
	[Lieferservice] [bit] NOT NULL,
 CONSTRAINT [PK_tb_Tisch] PRIMARY KEY CLUSTERED 
(
	[TischID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[tb_Tische] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[tb_ZutatLog]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_ZutatLog](
	[ZutatLogID] [int] IDENTITY(1,1) NOT NULL,
	[Mode] [nvarchar](50) NOT NULL,
	[DatumUhrzeit] [datetime] NOT NULL,
	[Nachricht] [varchar](255) NOT NULL,
 CONSTRAINT [PK_tb_ZutatLog] PRIMARY KEY CLUSTERED 
(
	[ZutatLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[tb_ZutatLog] TO  SCHEMA OWNER 
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
INSERT [dbo].[tb_BestellPositionen] ([BestellPositionID], [BestellungID], [GerichtID], [AnzahlGericht]) VALUES (19, 32, 1, 2)
INSERT [dbo].[tb_BestellPositionen] ([BestellPositionID], [BestellungID], [GerichtID], [AnzahlGericht]) VALUES (20, 32, 10, 2)
SET IDENTITY_INSERT [dbo].[tb_BestellPositionen] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Bestellungen] ON 

INSERT [dbo].[tb_Bestellungen] ([BestellungID], [Bestellnummer], [TischID], [Datum], [MitarbeiterID], [KundenID], [Status]) VALUES (7, N'1234567891', 5, CAST(N'2024-06-16T13:00:00.000' AS DateTime), 3, 11, 1)
INSERT [dbo].[tb_Bestellungen] ([BestellungID], [Bestellnummer], [TischID], [Datum], [MitarbeiterID], [KundenID], [Status]) VALUES (12, N'1234567892', 5, CAST(N'2024-06-15T14:00:00.000' AS DateTime), 8, 12, 1)
INSERT [dbo].[tb_Bestellungen] ([BestellungID], [Bestellnummer], [TischID], [Datum], [MitarbeiterID], [KundenID], [Status]) VALUES (14, N'1234567893', 5, CAST(N'2024-06-15T15:00:00.000' AS DateTime), 10, 13, 1)
INSERT [dbo].[tb_Bestellungen] ([BestellungID], [Bestellnummer], [TischID], [Datum], [MitarbeiterID], [KundenID], [Status]) VALUES (18, N'1234567894', 2, CAST(N'2024-06-14T16:00:00.000' AS DateTime), 3, NULL, 0)
INSERT [dbo].[tb_Bestellungen] ([BestellungID], [Bestellnummer], [TischID], [Datum], [MitarbeiterID], [KundenID], [Status]) VALUES (21, N'1234567895', 2, CAST(N'2024-06-15T18:00:00.000' AS DateTime), 9, NULL, 1)
INSERT [dbo].[tb_Bestellungen] ([BestellungID], [Bestellnummer], [TischID], [Datum], [MitarbeiterID], [KundenID], [Status]) VALUES (23, N'1234567896', 3, CAST(N'2024-06-14T21:00:00.000' AS DateTime), 8, NULL, 2)
INSERT [dbo].[tb_Bestellungen] ([BestellungID], [Bestellnummer], [TischID], [Datum], [MitarbeiterID], [KundenID], [Status]) VALUES (26, N'B000000001', 4, CAST(N'2024-06-17T14:36:30.303' AS DateTime), 3, NULL, 0)
INSERT [dbo].[tb_Bestellungen] ([BestellungID], [Bestellnummer], [TischID], [Datum], [MitarbeiterID], [KundenID], [Status]) VALUES (27, N'B000000002', 1, CAST(N'2024-06-17T14:38:31.047' AS DateTime), 8, 14, 1)
INSERT [dbo].[tb_Bestellungen] ([BestellungID], [Bestellnummer], [TischID], [Datum], [MitarbeiterID], [KundenID], [Status]) VALUES (31, N'B000000003', 1, CAST(N'2024-06-19T09:18:00.750' AS DateTime), 3, 13, 0)
INSERT [dbo].[tb_Bestellungen] ([BestellungID], [Bestellnummer], [TischID], [Datum], [MitarbeiterID], [KundenID], [Status]) VALUES (32, N'B000000004', 1, CAST(N'2024-06-20T11:07:08.357' AS DateTime), 3, 13, 2)
INSERT [dbo].[tb_Bestellungen] ([BestellungID], [Bestellnummer], [TischID], [Datum], [MitarbeiterID], [KundenID], [Status]) VALUES (36, N'B000000005', 1, CAST(N'2024-06-20T11:09:44.197' AS DateTime), 3, NULL, 0)
SET IDENTITY_INSERT [dbo].[tb_Bestellungen] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Gerichte] ON 

INSERT [dbo].[tb_Gerichte] ([GerichtID], [Gericht], [GeschmacksBeschreibung], [Preis]) VALUES (1, N'Lasagne', N'Gemüselasagne, mit Spinat und Tomate', 15.0000)
INSERT [dbo].[tb_Gerichte] ([GerichtID], [Gericht], [GeschmacksBeschreibung], [Preis]) VALUES (3, N'Pizza', N'Belegt mit Salami und Käse', 12.0000)
INSERT [dbo].[tb_Gerichte] ([GerichtID], [Gericht], [GeschmacksBeschreibung], [Preis]) VALUES (4, N'Sushi', N'Mit Lachs und Avocado', 15.5000)
INSERT [dbo].[tb_Gerichte] ([GerichtID], [Gericht], [GeschmacksBeschreibung], [Preis]) VALUES (5, N'Pizza Margherita', N'Käse und Tomate', 12.0000)
INSERT [dbo].[tb_Gerichte] ([GerichtID], [Gericht], [GeschmacksBeschreibung], [Preis]) VALUES (6, N'Tacos', N'Würzig und scharf', 10.0000)
INSERT [dbo].[tb_Gerichte] ([GerichtID], [Gericht], [GeschmacksBeschreibung], [Preis]) VALUES (7, N'Pad Thai', N'Süß und scharf', 14.0000)
INSERT [dbo].[tb_Gerichte] ([GerichtID], [Gericht], [GeschmacksBeschreibung], [Preis]) VALUES (8, N'Creme Brulee', N'Süß und cremig', 8.0000)
INSERT [dbo].[tb_Gerichte] ([GerichtID], [Gericht], [GeschmacksBeschreibung], [Preis]) VALUES (9, N'Cola', N'süß und sprudelig', 2.0000)
INSERT [dbo].[tb_Gerichte] ([GerichtID], [Gericht], [GeschmacksBeschreibung], [Preis]) VALUES (10, N'Bier', N'Herzahft herb, alkoholisch', 2.5000)
INSERT [dbo].[tb_Gerichte] ([GerichtID], [Gericht], [GeschmacksBeschreibung], [Preis]) VALUES (11, N'Kaffee', N'heiß und vitalisierend', 2.5000)
INSERT [dbo].[tb_Gerichte] ([GerichtID], [Gericht], [GeschmacksBeschreibung], [Preis]) VALUES (12, N'Wasser', N'erfrischend', 1.0000)
INSERT [dbo].[tb_Gerichte] ([GerichtID], [Gericht], [GeschmacksBeschreibung], [Preis]) VALUES (13, N'Vorspeisensalat', N'gesund', 5.5000)
SET IDENTITY_INSERT [dbo].[tb_Gerichte] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_GerichtGerichttyp] ON 

INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (2, 1, 1)
INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (3, 1, 17)
INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (1, 1, 18)
INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (7, 3, 1)
INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (4, 3, 17)
INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (22, 4, 8)
INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (6, 4, 9)
INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (5, 4, 17)
INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (9, 5, 1)
INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (8, 5, 17)
INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (10, 5, 18)
INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (12, 6, 1)
INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (13, 6, 7)
INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (11, 6, 17)
INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (14, 7, 2)
INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (16, 7, 7)
INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (15, 7, 17)
INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (17, 8, 13)
INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (18, 8, 16)
INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (19, 8, 18)
INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (21, 9, 12)
INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (20, 9, 13)
INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (23, 10, 11)
INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (24, 11, 14)
INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (25, 12, 12)
INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (26, 13, 2)
INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (28, 13, 15)
INSERT [dbo].[tb_GerichtGerichttyp] ([GerichtGerichttypID], [GerichtID], [GerichttypID]) VALUES (27, 13, 18)
SET IDENTITY_INSERT [dbo].[tb_GerichtGerichttyp] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Gerichttyp] ON 

INSERT [dbo].[tb_Gerichttyp] ([GerichttypID], [Gerichttyp]) VALUES (8, N'fettarm             ')
INSERT [dbo].[tb_Gerichttyp] ([GerichttypID], [Gerichttyp]) VALUES (12, N'Getränk             ')
INSERT [dbo].[tb_Gerichttyp] ([GerichttypID], [Gerichttyp]) VALUES (11, N'Getränk (Alkohol)   ')
INSERT [dbo].[tb_Gerichttyp] ([GerichttypID], [Gerichttyp]) VALUES (14, N'Getränk (warm)      ')
INSERT [dbo].[tb_Gerichttyp] ([GerichttypID], [Gerichttyp]) VALUES (7, N'glutenfrei          ')
INSERT [dbo].[tb_Gerichttyp] ([GerichttypID], [Gerichttyp]) VALUES (17, N'Hauptgericht        ')
INSERT [dbo].[tb_Gerichttyp] ([GerichttypID], [Gerichttyp]) VALUES (1, N'Herzhaft            ')
INSERT [dbo].[tb_Gerichttyp] ([GerichttypID], [Gerichttyp]) VALUES (16, N'Nachtisch           ')
INSERT [dbo].[tb_Gerichttyp] ([GerichttypID], [Gerichttyp]) VALUES (9, N'natriumarm          ')
INSERT [dbo].[tb_Gerichttyp] ([GerichttypID], [Gerichttyp]) VALUES (13, N'Süß                 ')
INSERT [dbo].[tb_Gerichttyp] ([GerichttypID], [Gerichttyp]) VALUES (2, N'Vegan               ')
INSERT [dbo].[tb_Gerichttyp] ([GerichttypID], [Gerichttyp]) VALUES (18, N'Vegetarisch         ')
INSERT [dbo].[tb_Gerichttyp] ([GerichttypID], [Gerichttyp]) VALUES (15, N'Vorspeise           ')
SET IDENTITY_INSERT [dbo].[tb_Gerichttyp] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Kunden] ON 

INSERT [dbo].[tb_Kunden] ([KundeID], [Vorname], [Nachname], [Geburtsdatum], [Email], [Telefon], [AdresseID], [Stammkunde]) VALUES (11, N'Benjamin', N'Unterhof', CAST(N'1990-12-12' AS Date), N'B.unterhof@gmail.com', N'+499924298458', 1, 0)
INSERT [dbo].[tb_Kunden] ([KundeID], [Vorname], [Nachname], [Geburtsdatum], [Email], [Telefon], [AdresseID], [Stammkunde]) VALUES (12, N'Roswita', N'Neumann', CAST(N'1999-05-25' AS Date), N'urele92@gmail.de', N'+499924298487661', 1, 1)
INSERT [dbo].[tb_Kunden] ([KundeID], [Vorname], [Nachname], [Geburtsdatum], [Email], [Telefon], [AdresseID], [Stammkunde]) VALUES (13, N'Isabel', N'Peregrade', CAST(N'1952-07-01' AS Date), N'idopi90@yahoo.de', N'+4974714211639', 2, 0)
INSERT [dbo].[tb_Kunden] ([KundeID], [Vorname], [Nachname], [Geburtsdatum], [Email], [Telefon], [AdresseID], [Stammkunde]) VALUES (14, N'Hans-Josef', N'Würulodeson', CAST(N'1975-12-29' AS Date), N'aralo75@gmail.de', N'+491441295819153', 3, 0)
INSERT [dbo].[tb_Kunden] ([KundeID], [Vorname], [Nachname], [Geburtsdatum], [Email], [Telefon], [AdresseID], [Stammkunde]) VALUES (15, N'Domenico', N'Schwarz', CAST(N'1982-01-22' AS Date), N'itize64@surfnet.de', N'+491441295819153', 4, 1)
INSERT [dbo].[tb_Kunden] ([KundeID], [Vorname], [Nachname], [Geburtsdatum], [Email], [Telefon], [AdresseID], [Stammkunde]) VALUES (16, N'Francisco', N'Schmitz', CAST(N'1985-10-10' AS Date), N'orile83@outloock.de', N'+4918222345517', 5, 1)
INSERT [dbo].[tb_Kunden] ([KundeID], [Vorname], [Nachname], [Geburtsdatum], [Email], [Telefon], [AdresseID], [Stammkunde]) VALUES (17, N'Karl-Dieter', N'Koch', CAST(N'1965-06-12' AS Date), N'uvaro98@surfnet.de', N'+499769169116683', 6, 0)
INSERT [dbo].[tb_Kunden] ([KundeID], [Vorname], [Nachname], [Geburtsdatum], [Email], [Telefon], [AdresseID], [Stammkunde]) VALUES (18, N'Luca', N'Tösefare', CAST(N'2001-08-03' AS Date), N'olake64@surfnet.de', N'+497116748642', 7, 0)
INSERT [dbo].[tb_Kunden] ([KundeID], [Vorname], [Nachname], [Geburtsdatum], [Email], [Telefon], [AdresseID], [Stammkunde]) VALUES (19, N'Alice Musterfrau', N'Musterfrau', NULL, N'alice.musterfrau@example.com', N'+301234567', 1, 1)
INSERT [dbo].[tb_Kunden] ([KundeID], [Vorname], [Nachname], [Geburtsdatum], [Email], [Telefon], [AdresseID], [Stammkunde]) VALUES (20, N'Bob Beispiel', N'Beispiel', NULL, N'bob.beispiel@example.com', N'+301234568', 11, 0)
INSERT [dbo].[tb_Kunden] ([KundeID], [Vorname], [Nachname], [Geburtsdatum], [Email], [Telefon], [AdresseID], [Stammkunde]) VALUES (21, N'Clara Kunde', N'Kunde', NULL, N'clara.kunde@example.com', N'+301234569', 9, 1)
SET IDENTITY_INSERT [dbo].[tb_Kunden] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Mitarbeiter] ON 

INSERT [dbo].[tb_Mitarbeiter] ([MitarbeiterID], [Vorname], [Nachname], [Email], [Telefon], [Geburtsdatum], [AdresseID], [TaetigkeitID], [Gehalt]) VALUES (3, N'Stella', N'Propeller', N'S.Propeller@gmail.com', N'+49 12345678', CAST(N'1990-12-12' AS Date), 1, 1, 2500.0000)
INSERT [dbo].[tb_Mitarbeiter] ([MitarbeiterID], [Vorname], [Nachname], [Email], [Telefon], [Geburtsdatum], [AdresseID], [TaetigkeitID], [Gehalt]) VALUES (8, N'Anna', N'Müller', N'anna.mueller@example.com', N'+49301234567', CAST(N'1985-06-15' AS Date), 1, 1, 3000.0000)
INSERT [dbo].[tb_Mitarbeiter] ([MitarbeiterID], [Vorname], [Nachname], [Email], [Telefon], [Geburtsdatum], [AdresseID], [TaetigkeitID], [Gehalt]) VALUES (9, N'Hans', N'Schmidt', N'hans.schmidt@example.com', N'+49309876543', CAST(N'1990-04-10' AS Date), 2, 1, 3200.0000)
INSERT [dbo].[tb_Mitarbeiter] ([MitarbeiterID], [Vorname], [Nachname], [Email], [Telefon], [Geburtsdatum], [AdresseID], [TaetigkeitID], [Gehalt]) VALUES (10, N'Claudia', N'Weber', N'claudia.weber@example.com', N'+49305678901', CAST(N'1982-09-23' AS Date), 3, 1, 3500.0000)
INSERT [dbo].[tb_Mitarbeiter] ([MitarbeiterID], [Vorname], [Nachname], [Email], [Telefon], [Geburtsdatum], [AdresseID], [TaetigkeitID], [Gehalt]) VALUES (11, N'Peter', N'Koch', N'peter.koch@example.com', N'+49307654321', CAST(N'1978-12-05' AS Date), 4, 3, 4000.0000)
INSERT [dbo].[tb_Mitarbeiter] ([MitarbeiterID], [Vorname], [Nachname], [Email], [Telefon], [Geburtsdatum], [AdresseID], [TaetigkeitID], [Gehalt]) VALUES (12, N'Klaus', N'Fischer', N'klaus.fischer@example.com', N'+49309876542', CAST(N'1975-03-11' AS Date), 5, 3, 4200.0000)
SET IDENTITY_INSERT [dbo].[tb_Mitarbeiter] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Taetigkeit] ON 

INSERT [dbo].[tb_Taetigkeit] ([TaetigkeitID], [Taetigkeit]) VALUES (3, N'Koch')
INSERT [dbo].[tb_Taetigkeit] ([TaetigkeitID], [Taetigkeit]) VALUES (1, N'Service')
SET IDENTITY_INSERT [dbo].[tb_Taetigkeit] OFF
GO
INSERT [dbo].[tb_temp_Rechnung] ([Bestellnummer], [Gericht], [Preis], [Anzahl], [Subtotal]) VALUES (N'1234567894', N'Kaffee', N'2.50', N'1', 2.5000)
INSERT [dbo].[tb_temp_Rechnung] ([Bestellnummer], [Gericht], [Preis], [Anzahl], [Subtotal]) VALUES (N'Gesamtpreis', N'', N'', N'', 2.5000)
INSERT [dbo].[tb_temp_Rechnung] ([Bestellnummer], [Gericht], [Preis], [Anzahl], [Subtotal]) VALUES (N'Gesamtpreis ohne Rabatt', N'', N'', N'', 2.5000)
GO
SET IDENTITY_INSERT [dbo].[tb_Tische] ON 

INSERT [dbo].[tb_Tische] ([TischID], [TischNummer], [Beschreibung], [Lieferservice]) VALUES (1, 1, N'Tisch 1 hinten links', 0)
INSERT [dbo].[tb_Tische] ([TischID], [TischNummer], [Beschreibung], [Lieferservice]) VALUES (2, 2, N'Tisch 2 vorne links', 0)
INSERT [dbo].[tb_Tische] ([TischID], [TischNummer], [Beschreibung], [Lieferservice]) VALUES (3, 3, N'Tisch 3 vor der Tür', 0)
INSERT [dbo].[tb_Tische] ([TischID], [TischNummer], [Beschreibung], [Lieferservice]) VALUES (4, 4, N'Tisch 4 Vor dem Fenster', 0)
INSERT [dbo].[tb_Tische] ([TischID], [TischNummer], [Beschreibung], [Lieferservice]) VALUES (5, 5, N'Lieferservice', 1)
SET IDENTITY_INSERT [dbo].[tb_Tische] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_ZutatenGericht] ON 

INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (1, 1, 2, 0.5)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (2, 1, 3, 100)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (3, 1, 4, 3)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (4, 1, 6, 0.5)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (5, 3, 4, 0.5)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (6, 3, 6, 0.5)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (7, 3, 7, 250)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (8, 3, 8, 100)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (9, 4, 9, 100)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (10, 4, 10, 50)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (11, 4, 11, 1)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (12, 5, 4, 5)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (13, 5, 6, 0.5)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (14, 5, 7, 0.4)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (15, 6, 12, 1)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (16, 6, 13, 100)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (17, 6, 6, 0.2)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (18, 7, 14, 100)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (19, 7, 15, 0.2)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (20, 8, 1, 1)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (21, 8, 16, 0.2)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (22, 8, 17, 0.2)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (23, 9, 18, 1)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (24, 10, 19, 1)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (25, 11, 20, 50)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (26, 11, 16, 0.2)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (27, 12, 21, 1)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (28, 13, 22, 100)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (29, 13, 15, 0.2)
INSERT [dbo].[tb_ZutatenGericht] ([ZutatenGerichtID], [GerichtID], [ZutatID], [Menge]) VALUES (30, 13, 4, 1)
SET IDENTITY_INSERT [dbo].[tb_ZutatenGericht] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_ZutatenLager] ON 

INSERT [dbo].[tb_ZutatenLager] ([ZutatID], [Zutat], [Beschreibung], [Menge], [Mindestmenge], [Maximalmenge], [Einheit]) VALUES (1, N'Ei', N'weiss und gelb', 20, 20, 1000, N'Stück')
INSERT [dbo].[tb_ZutatenLager] ([ZutatID], [Zutat], [Beschreibung], [Menge], [Mindestmenge], [Maximalmenge], [Einheit]) VALUES (2, N'Nudeln', N'aus Italien', 19, 10, 50, N'kg')
INSERT [dbo].[tb_ZutatenLager] ([ZutatID], [Zutat], [Beschreibung], [Menge], [Mindestmenge], [Maximalmenge], [Einheit]) VALUES (3, N'Spinat', N'grün', 400, 500, 4000, N'g')
INSERT [dbo].[tb_ZutatenLager] ([ZutatID], [Zutat], [Beschreibung], [Menge], [Mindestmenge], [Maximalmenge], [Einheit]) VALUES (4, N'Tomaten', N'rot, frisch', 51, 30, 150, N'Stück')
INSERT [dbo].[tb_ZutatenLager] ([ZutatID], [Zutat], [Beschreibung], [Menge], [Mindestmenge], [Maximalmenge], [Einheit]) VALUES (6, N'Käse', N'Mozzarella', 8.5, 5, 25, N'kg')
INSERT [dbo].[tb_ZutatenLager] ([ZutatID], [Zutat], [Beschreibung], [Menge], [Mindestmenge], [Maximalmenge], [Einheit]) VALUES (7, N'Mehl', N'feinkörnig', 50, 20, 150, N'kg')
INSERT [dbo].[tb_ZutatenLager] ([ZutatID], [Zutat], [Beschreibung], [Menge], [Mindestmenge], [Maximalmenge], [Einheit]) VALUES (8, N'Salami', N'Scheiben', 800, 300, 1500, N'g')
INSERT [dbo].[tb_ZutatenLager] ([ZutatID], [Zutat], [Beschreibung], [Menge], [Mindestmenge], [Maximalmenge], [Einheit]) VALUES (9, N'Reis', N'Sush-Reis', 500, 200, 1000, N'g')
INSERT [dbo].[tb_ZutatenLager] ([ZutatID], [Zutat], [Beschreibung], [Menge], [Mindestmenge], [Maximalmenge], [Einheit]) VALUES (10, N'Lachs', N'Fisch, frisch', 200, 50, 500, N'g')
INSERT [dbo].[tb_ZutatenLager] ([ZutatID], [Zutat], [Beschreibung], [Menge], [Mindestmenge], [Maximalmenge], [Einheit]) VALUES (11, N'Avocado', N'essreif', 20, 10, 50, N'Stück')
INSERT [dbo].[tb_ZutatenLager] ([ZutatID], [Zutat], [Beschreibung], [Menge], [Mindestmenge], [Maximalmenge], [Einheit]) VALUES (12, N'Tortillas', N'Maismehl', 15, 10, 50, N'Stück')
INSERT [dbo].[tb_ZutatenLager] ([ZutatID], [Zutat], [Beschreibung], [Menge], [Mindestmenge], [Maximalmenge], [Einheit]) VALUES (13, N'Rinderhack', N'Fleisch', 500, 250, 1500, N'g')
INSERT [dbo].[tb_ZutatenLager] ([ZutatID], [Zutat], [Beschreibung], [Menge], [Mindestmenge], [Maximalmenge], [Einheit]) VALUES (14, N'Reisnudeln', N'aus Asien', 500, 200, 1000, N'g')
INSERT [dbo].[tb_ZutatenLager] ([ZutatID], [Zutat], [Beschreibung], [Menge], [Mindestmenge], [Maximalmenge], [Einheit]) VALUES (15, N'Karotten', N'Frisch', 4, 2, 10, N'kg')
INSERT [dbo].[tb_ZutatenLager] ([ZutatID], [Zutat], [Beschreibung], [Menge], [Mindestmenge], [Maximalmenge], [Einheit]) VALUES (16, N'Milch', N'frsich', 5.4, 2, 10, N'l')
INSERT [dbo].[tb_ZutatenLager] ([ZutatID], [Zutat], [Beschreibung], [Menge], [Mindestmenge], [Maximalmenge], [Einheit]) VALUES (17, N'Zucker', N'süß', 3, 2, 5, N'kg')
INSERT [dbo].[tb_ZutatenLager] ([ZutatID], [Zutat], [Beschreibung], [Menge], [Mindestmenge], [Maximalmenge], [Einheit]) VALUES (18, N'Cola', N'Flaschen', 20, 10, 50, N'Stück')
INSERT [dbo].[tb_ZutatenLager] ([ZutatID], [Zutat], [Beschreibung], [Menge], [Mindestmenge], [Maximalmenge], [Einheit]) VALUES (19, N'Bier', N'Flaschen', 19, 10, 50, N'Stück')
INSERT [dbo].[tb_ZutatenLager] ([ZutatID], [Zutat], [Beschreibung], [Menge], [Mindestmenge], [Maximalmenge], [Einheit]) VALUES (20, N'Kaffee', N'Bohnen', 5100, 2000, 15000, N'g')
INSERT [dbo].[tb_ZutatenLager] ([ZutatID], [Zutat], [Beschreibung], [Menge], [Mindestmenge], [Maximalmenge], [Einheit]) VALUES (21, N'Wasser', N'Flaschen', 50, 20, 100, N'Stück')
INSERT [dbo].[tb_ZutatenLager] ([ZutatID], [Zutat], [Beschreibung], [Menge], [Mindestmenge], [Maximalmenge], [Einheit]) VALUES (22, N'Salat', N'Blatt', 500, 200, 1000, N'g')
INSERT [dbo].[tb_ZutatenLager] ([ZutatID], [Zutat], [Beschreibung], [Menge], [Mindestmenge], [Maximalmenge], [Einheit]) VALUES (23, N'Erdnüsse', N'salzig', 0, 200, 500, N'g')
INSERT [dbo].[tb_ZutatenLager] ([ZutatID], [Zutat], [Beschreibung], [Menge], [Mindestmenge], [Maximalmenge], [Einheit]) VALUES (24, N'Walnüsse', N'ungesalzen', 500, 200, 500, N'g')
INSERT [dbo].[tb_ZutatenLager] ([ZutatID], [Zutat], [Beschreibung], [Menge], [Mindestmenge], [Maximalmenge], [Einheit]) VALUES (25, N'Salzstangen', N'zum snacken', 600, 700, 15000, N'g')
INSERT [dbo].[tb_ZutatenLager] ([ZutatID], [Zutat], [Beschreibung], [Menge], [Mindestmenge], [Maximalmenge], [Einheit]) VALUES (26, N'Limonade', N'selbstgemacht', 5, 3, 10, N'l')
INSERT [dbo].[tb_ZutatenLager] ([ZutatID], [Zutat], [Beschreibung], [Menge], [Mindestmenge], [Maximalmenge], [Einheit]) VALUES (27, N'Apfel', N'gesund', 6, 10, 50, N'kg')
INSERT [dbo].[tb_ZutatenLager] ([ZutatID], [Zutat], [Beschreibung], [Menge], [Mindestmenge], [Maximalmenge], [Einheit]) VALUES (36, N'Oliven', N'grüne, mit Stein', 200, 20, 500, N'g')
SET IDENTITY_INSERT [dbo].[tb_ZutatenLager] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_ZutatLog] ON 

INSERT [dbo].[tb_ZutatLog] ([ZutatLogID], [Mode], [DatumUhrzeit], [Nachricht]) VALUES (1, N'Update', CAST(N'2024-06-18T15:09:28.870' AS DateTime), N'Mindestmenge für die Zutat Spinat unterschritten!! Bitte auf 4000 g (Maximalmenge) auffüllen. Danke.')
INSERT [dbo].[tb_ZutatLog] ([ZutatLogID], [Mode], [DatumUhrzeit], [Nachricht]) VALUES (2, N'Update', CAST(N'2024-06-18T15:10:03.780' AS DateTime), N'Mindestmenge für die Zutat Spinat unterschritten!! Bitte auf 4000 g (Maximalmenge) auffüllen. Danke.')
INSERT [dbo].[tb_ZutatLog] ([ZutatLogID], [Mode], [DatumUhrzeit], [Nachricht]) VALUES (3, N'Update', CAST(N'2024-06-18T15:10:26.860' AS DateTime), N'Mindestmenge für die Zutat Avocado unterschritten!! Bitte auf 50 Stück (Maximalmenge) auffüllen. Danke.')
INSERT [dbo].[tb_ZutatLog] ([ZutatLogID], [Mode], [DatumUhrzeit], [Nachricht]) VALUES (4, N'Update', CAST(N'2024-06-18T15:10:49.293' AS DateTime), N'Mindestmenge für die Zutat Avocado unterschritten!! Bitte auf 50 Stück (Maximalmenge) auffüllen. Danke.')
INSERT [dbo].[tb_ZutatLog] ([ZutatLogID], [Mode], [DatumUhrzeit], [Nachricht]) VALUES (5, N'Update', CAST(N'2024-06-18T15:12:50.970' AS DateTime), N'Mindestmenge für die Zutat Tortillas unterschritten!! Bitte auf 50 Stück (Maximalmenge) auffüllen. Danke.')
INSERT [dbo].[tb_ZutatLog] ([ZutatLogID], [Mode], [DatumUhrzeit], [Nachricht]) VALUES (7, N'Update', CAST(N'2024-06-18T15:15:00.670' AS DateTime), N'Mindestmenge für die Zutat Reisnudeln unterschritten!! Bitte auf 1000 g (Maximalmenge) auffüllen. Danke.')
INSERT [dbo].[tb_ZutatLog] ([ZutatLogID], [Mode], [DatumUhrzeit], [Nachricht]) VALUES (8, N'Insert', CAST(N'2024-06-18T15:23:48.780' AS DateTime), N'Mindestmenge für die Zutat Erdnüsse unterschritten!! Bitte auf 500 g (Maximalmenge) auffüllen. Danke.')
INSERT [dbo].[tb_ZutatLog] ([ZutatLogID], [Mode], [DatumUhrzeit], [Nachricht]) VALUES (9, N'Insert', CAST(N'2024-06-18T15:32:48.943' AS DateTime), N'Mindestmenge für die Zutat Salzstangen unterschritten!! Bitte auf 15000 g (Maximalmenge) auffüllen. Danke.')
INSERT [dbo].[tb_ZutatLog] ([ZutatLogID], [Mode], [DatumUhrzeit], [Nachricht]) VALUES (10, N'Insert', CAST(N'2024-06-18T15:34:15.117' AS DateTime), N'Neue Zutat Limonade hinzugefügt!')
INSERT [dbo].[tb_ZutatLog] ([ZutatLogID], [Mode], [DatumUhrzeit], [Nachricht]) VALUES (11, N'Insert', CAST(N'2024-06-18T15:35:12.063' AS DateTime), N'Mindestmenge für die neue Zutat Apfel unterschritten!! Bitte auf 50 kg (Maximalmenge) auffüllen. Danke.')
INSERT [dbo].[tb_ZutatLog] ([ZutatLogID], [Mode], [DatumUhrzeit], [Nachricht]) VALUES (12, N'Update', CAST(N'2024-06-19T06:37:33.297' AS DateTime), N'Mindestmenge für die Zutat Spinat unterschritten!! Bitte auf 4000 g (Maximalmenge) auffüllen. Danke.')
INSERT [dbo].[tb_ZutatLog] ([ZutatLogID], [Mode], [DatumUhrzeit], [Nachricht]) VALUES (13, N'Update', CAST(N'2024-06-20T11:17:44.350' AS DateTime), N'Mindestmenge für die Zutat Spinat unterschritten!! Bitte auf 4000 g (Maximalmenge) auffüllen. Danke.')
INSERT [dbo].[tb_ZutatLog] ([ZutatLogID], [Mode], [DatumUhrzeit], [Nachricht]) VALUES (14, N'Update', CAST(N'2024-06-20T11:25:54.673' AS DateTime), N'Mindestmenge für die Zutat Spinat unterschritten!! Bitte auf 4000 g (Maximalmenge) auffüllen. Danke.')
INSERT [dbo].[tb_ZutatLog] ([ZutatLogID], [Mode], [DatumUhrzeit], [Nachricht]) VALUES (15, N'Update', CAST(N'2024-06-20T11:37:01.870' AS DateTime), N'Mindestmenge für die Zutat Spinat unterschritten!! Bitte auf 4000 g (Maximalmenge) auffüllen. Danke.')
INSERT [dbo].[tb_ZutatLog] ([ZutatLogID], [Mode], [DatumUhrzeit], [Nachricht]) VALUES (16, N'Insert', CAST(N'2024-06-20T13:37:10.650' AS DateTime), N'Neue Zutat Oliven hinzugefügt!')
SET IDENTITY_INSERT [dbo].[tb_ZutatLog] OFF
GO
/****** Object:  Index [IX_tb_BestellPositionen_BestellungID_GerichtID]    Script Date: 20.06.2024 15:27:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tb_BestellPositionen_BestellungID_GerichtID] ON [dbo].[tb_BestellPositionen]
(
	[BestellungID] ASC,
	[GerichtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tb_Bestellungen_Bestellnummer]    Script Date: 20.06.2024 15:27:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tb_Bestellungen_Bestellnummer] ON [dbo].[tb_Bestellungen]
(
	[Bestellnummer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tb_Gerichte_Gericht]    Script Date: 20.06.2024 15:27:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tb_Gerichte_Gericht] ON [dbo].[tb_Gerichte]
(
	[Gericht] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_tb_GerichtGerichttyp]    Script Date: 20.06.2024 15:27:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tb_GerichtGerichttyp] ON [dbo].[tb_GerichtGerichttyp]
(
	[GerichtID] ASC,
	[GerichttypID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tb_Gerichttyp_Gerichttyp]    Script Date: 20.06.2024 15:27:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tb_Gerichttyp_Gerichttyp] ON [dbo].[tb_Gerichttyp]
(
	[Gerichttyp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tb_Kunden_eindeutig]    Script Date: 20.06.2024 15:27:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tb_Kunden_eindeutig] ON [dbo].[tb_Kunden]
(
	[Nachname] ASC,
	[Vorname] ASC,
	[AdresseID] ASC,
	[Email] ASC,
	[Telefon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tb_Taetigkeit]    Script Date: 20.06.2024 15:27:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tb_Taetigkeit] ON [dbo].[tb_Taetigkeit]
(
	[Taetigkeit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_tb_Tische]    Script Date: 20.06.2024 15:27:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tb_Tische] ON [dbo].[tb_Tische]
(
	[TischNummer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_tb_ZutatenGericht_GerichtID_ZutatID]    Script Date: 20.06.2024 15:27:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tb_ZutatenGericht_GerichtID_ZutatID] ON [dbo].[tb_ZutatenGericht]
(
	[GerichtID] ASC,
	[ZutatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tb_ZutatenLager_Zutat]    Script Date: 20.06.2024 15:27:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tb_ZutatenLager_Zutat] ON [dbo].[tb_ZutatenLager]
(
	[Zutat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tb_Bestellungen] ADD  CONSTRAINT [DF_tb_Bestellungen_Bestellnummer]  DEFAULT ([dbo].[sf_NaechsteBestellnummer]()) FOR [Bestellnummer]
GO
ALTER TABLE [dbo].[tb_Bestellungen] ADD  CONSTRAINT [DF_tb_Bestellungen_Datum]  DEFAULT (getdate()) FOR [Datum]
GO
ALTER TABLE [dbo].[tb_Tische] ADD  CONSTRAINT [DF_tb_Tische_Lieferservice]  DEFAULT ((0)) FOR [Lieferservice]
GO
ALTER TABLE [dbo].[tb_BestellPositionen]  WITH CHECK ADD  CONSTRAINT [FK_tb_BestellPosition_tb_Bestellungen_BestellungID] FOREIGN KEY([BestellungID])
REFERENCES [dbo].[tb_Bestellungen] ([BestellungID])
GO
ALTER TABLE [dbo].[tb_BestellPositionen] CHECK CONSTRAINT [FK_tb_BestellPosition_tb_Bestellungen_BestellungID]
GO
ALTER TABLE [dbo].[tb_BestellPositionen]  WITH CHECK ADD  CONSTRAINT [FK_tb_BestellPosition_tb_Gericht_GerichtID] FOREIGN KEY([GerichtID])
REFERENCES [dbo].[tb_Gerichte] ([GerichtID])
GO
ALTER TABLE [dbo].[tb_BestellPositionen] CHECK CONSTRAINT [FK_tb_BestellPosition_tb_Gericht_GerichtID]
GO
ALTER TABLE [dbo].[tb_Bestellungen]  WITH CHECK ADD  CONSTRAINT [FK_tb_Bestellung_tb_Mitarbeiter_MitarbeiterID] FOREIGN KEY([MitarbeiterID])
REFERENCES [dbo].[tb_Mitarbeiter] ([MitarbeiterID])
GO
ALTER TABLE [dbo].[tb_Bestellungen] CHECK CONSTRAINT [FK_tb_Bestellung_tb_Mitarbeiter_MitarbeiterID]
GO
ALTER TABLE [dbo].[tb_Bestellungen]  WITH CHECK ADD  CONSTRAINT [FK_tb_Bestellungen_tb_Kunden_KundenID] FOREIGN KEY([KundenID])
REFERENCES [dbo].[tb_Kunden] ([KundeID])
GO
ALTER TABLE [dbo].[tb_Bestellungen] CHECK CONSTRAINT [FK_tb_Bestellungen_tb_Kunden_KundenID]
GO
ALTER TABLE [dbo].[tb_Bestellungen]  WITH CHECK ADD  CONSTRAINT [FK_tb_Bestellungen_tb_Tische_TischID] FOREIGN KEY([TischID])
REFERENCES [dbo].[tb_Tische] ([TischID])
GO
ALTER TABLE [dbo].[tb_Bestellungen] CHECK CONSTRAINT [FK_tb_Bestellungen_tb_Tische_TischID]
GO
ALTER TABLE [dbo].[tb_GerichtGerichttyp]  WITH CHECK ADD  CONSTRAINT [FK_tb_GerichtGerichttyp_tb_Gerichte_GerichtID] FOREIGN KEY([GerichtID])
REFERENCES [dbo].[tb_Gerichte] ([GerichtID])
GO
ALTER TABLE [dbo].[tb_GerichtGerichttyp] CHECK CONSTRAINT [FK_tb_GerichtGerichttyp_tb_Gerichte_GerichtID]
GO
ALTER TABLE [dbo].[tb_GerichtGerichttyp]  WITH CHECK ADD  CONSTRAINT [FK_tb_GerichtGerichttyp_tb_Gerichttyp_GerichttypID] FOREIGN KEY([GerichttypID])
REFERENCES [dbo].[tb_Gerichttyp] ([GerichttypID])
GO
ALTER TABLE [dbo].[tb_GerichtGerichttyp] CHECK CONSTRAINT [FK_tb_GerichtGerichttyp_tb_Gerichttyp_GerichttypID]
GO
ALTER TABLE [dbo].[tb_Kunden]  WITH CHECK ADD  CONSTRAINT [FK_tb_Kunden_tb_Adressen_AdresseID] FOREIGN KEY([AdresseID])
REFERENCES [dbo].[tb_Adressen] ([AdresseID])
GO
ALTER TABLE [dbo].[tb_Kunden] CHECK CONSTRAINT [FK_tb_Kunden_tb_Adressen_AdresseID]
GO
ALTER TABLE [dbo].[tb_Mitarbeiter]  WITH CHECK ADD  CONSTRAINT [FK_tb_Mitarbeiter_tb_Adressse_AdresseID] FOREIGN KEY([AdresseID])
REFERENCES [dbo].[tb_Adressen] ([AdresseID])
GO
ALTER TABLE [dbo].[tb_Mitarbeiter] CHECK CONSTRAINT [FK_tb_Mitarbeiter_tb_Adressse_AdresseID]
GO
ALTER TABLE [dbo].[tb_Mitarbeiter]  WITH CHECK ADD  CONSTRAINT [FK_tb_Mitarbeiter_tb_Taetigkeit_TeatigkeitID] FOREIGN KEY([TaetigkeitID])
REFERENCES [dbo].[tb_Taetigkeit] ([TaetigkeitID])
GO
ALTER TABLE [dbo].[tb_Mitarbeiter] CHECK CONSTRAINT [FK_tb_Mitarbeiter_tb_Taetigkeit_TeatigkeitID]
GO
ALTER TABLE [dbo].[tb_ZutatenGericht]  WITH CHECK ADD  CONSTRAINT [FK_tb_ZutatenGericht_tb_Gericht_GerichtID] FOREIGN KEY([GerichtID])
REFERENCES [dbo].[tb_Gerichte] ([GerichtID])
GO
ALTER TABLE [dbo].[tb_ZutatenGericht] CHECK CONSTRAINT [FK_tb_ZutatenGericht_tb_Gericht_GerichtID]
GO
ALTER TABLE [dbo].[tb_ZutatenGericht]  WITH CHECK ADD  CONSTRAINT [FK_tb_ZutatenGericht_tb_ZutatenLager_ZutatID] FOREIGN KEY([ZutatID])
REFERENCES [dbo].[tb_ZutatenLager] ([ZutatID])
GO
ALTER TABLE [dbo].[tb_ZutatenGericht] CHECK CONSTRAINT [FK_tb_ZutatenGericht_tb_ZutatenLager_ZutatID]
GO
ALTER TABLE [dbo].[tb_Adressen]  WITH CHECK ADD  CONSTRAINT [CK_tb_Adressen_PLZ_Format] CHECK  (([PLZ] like '[0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[tb_Adressen] CHECK CONSTRAINT [CK_tb_Adressen_PLZ_Format]
GO
ALTER TABLE [dbo].[tb_BestellPositionen]  WITH CHECK ADD  CONSTRAINT [CK_tb_BestellPositionen_AnzahlGericht_gr_null] CHECK  (([AnzahlGericht]>(0)))
GO
ALTER TABLE [dbo].[tb_BestellPositionen] CHECK CONSTRAINT [CK_tb_BestellPositionen_AnzahlGericht_gr_null]
GO
ALTER TABLE [dbo].[tb_Bestellungen]  WITH CHECK ADD  CONSTRAINT [CK_tb_Bestellungen_Bestellnummer_Laenge_gleich_10] CHECK  ((len([Bestellnummer])=(10)))
GO
ALTER TABLE [dbo].[tb_Bestellungen] CHECK CONSTRAINT [CK_tb_Bestellungen_Bestellnummer_Laenge_gleich_10]
GO
ALTER TABLE [dbo].[tb_Bestellungen]  WITH CHECK ADD  CONSTRAINT [CK_tb_Bestellungen_Datum_Oeffnungszeiten] CHECK  ((datepart(hour,[Datum])>=(9) AND datepart(hour,[Datum])<(22) AND [Datum]<=getdate()))
GO
ALTER TABLE [dbo].[tb_Bestellungen] CHECK CONSTRAINT [CK_tb_Bestellungen_Datum_Oeffnungszeiten]
GO
ALTER TABLE [dbo].[tb_Bestellungen]  WITH CHECK ADD  CONSTRAINT [CK_tb_Bestellungen_Status] CHECK  (([Status]>=(0) AND [Status]<=(2)))
GO
ALTER TABLE [dbo].[tb_Bestellungen] CHECK CONSTRAINT [CK_tb_Bestellungen_Status]
GO
ALTER TABLE [dbo].[tb_Gerichte]  WITH CHECK ADD  CONSTRAINT [CK_tb_Gerichte_Preis_groesser_0] CHECK  (([Preis]>(0)))
GO
ALTER TABLE [dbo].[tb_Gerichte] CHECK CONSTRAINT [CK_tb_Gerichte_Preis_groesser_0]
GO
ALTER TABLE [dbo].[tb_Kunden]  WITH CHECK ADD  CONSTRAINT [CK_tb_Kunden_Alter_ueber_16] CHECK  ((floor(datediff(day,[Geburtsdatum],getdate())/(365.2524))>=(16)))
GO
ALTER TABLE [dbo].[tb_Kunden] CHECK CONSTRAINT [CK_tb_Kunden_Alter_ueber_16]
GO
ALTER TABLE [dbo].[tb_Kunden]  WITH CHECK ADD  CONSTRAINT [CK_tb_Kunden_Email_Format] CHECK  (([Email] like '%_@%_.__%'))
GO
ALTER TABLE [dbo].[tb_Kunden] CHECK CONSTRAINT [CK_tb_Kunden_Email_Format]
GO
ALTER TABLE [dbo].[tb_Kunden]  WITH CHECK ADD  CONSTRAINT [CK_tb_Kunden_Email_oder_Telefon] CHECK  (([Email] IS NOT NULL OR [Telefon] IS NOT NULL))
GO
ALTER TABLE [dbo].[tb_Kunden] CHECK CONSTRAINT [CK_tb_Kunden_Email_oder_Telefon]
GO
ALTER TABLE [dbo].[tb_Kunden]  WITH CHECK ADD  CONSTRAINT [CK_tb_Kunden_Telefon_Format] CHECK  (([Telefon] like '+%[0-9]%'))
GO
ALTER TABLE [dbo].[tb_Kunden] CHECK CONSTRAINT [CK_tb_Kunden_Telefon_Format]
GO
ALTER TABLE [dbo].[tb_Mitarbeiter]  WITH CHECK ADD  CONSTRAINT [CK_tb_Mitarbeiter_Alter_aelter_18] CHECK  ((floor(datediff(day,[Geburtsdatum],getdate())/(365.2524))>=(18)))
GO
ALTER TABLE [dbo].[tb_Mitarbeiter] CHECK CONSTRAINT [CK_tb_Mitarbeiter_Alter_aelter_18]
GO
ALTER TABLE [dbo].[tb_Mitarbeiter]  WITH CHECK ADD  CONSTRAINT [CK_tb_Mitarbeiter_Email_Format] CHECK  (([Email] like '%_@%_.__%'))
GO
ALTER TABLE [dbo].[tb_Mitarbeiter] CHECK CONSTRAINT [CK_tb_Mitarbeiter_Email_Format]
GO
ALTER TABLE [dbo].[tb_Mitarbeiter]  WITH CHECK ADD  CONSTRAINT [CK_tb_Mitarbeiter_Gehalt_nicht_negativ] CHECK  (([Gehalt]>=(0)))
GO
ALTER TABLE [dbo].[tb_Mitarbeiter] CHECK CONSTRAINT [CK_tb_Mitarbeiter_Gehalt_nicht_negativ]
GO
ALTER TABLE [dbo].[tb_Mitarbeiter]  WITH CHECK ADD  CONSTRAINT [CK_tb_Mitarbeiter_Telefon_Format] CHECK  (([Telefon] like '+%[0-9]%'))
GO
ALTER TABLE [dbo].[tb_Mitarbeiter] CHECK CONSTRAINT [CK_tb_Mitarbeiter_Telefon_Format]
GO
ALTER TABLE [dbo].[tb_Tische]  WITH CHECK ADD  CONSTRAINT [CK_tb_Tische_Tischnummern_bis_20] CHECK  (([TischNummer]>(0) AND [TischNummer]<(20)))
GO
ALTER TABLE [dbo].[tb_Tische] CHECK CONSTRAINT [CK_tb_Tische_Tischnummern_bis_20]
GO
ALTER TABLE [dbo].[tb_ZutatenGericht]  WITH CHECK ADD  CONSTRAINT [CK_tb_ZutatenGericht_Menge_groesser_0] CHECK  (([Menge]>(0)))
GO
ALTER TABLE [dbo].[tb_ZutatenGericht] CHECK CONSTRAINT [CK_tb_ZutatenGericht_Menge_groesser_0]
GO
ALTER TABLE [dbo].[tb_ZutatenLager]  WITH CHECK ADD  CONSTRAINT [CK_tb_ZutatenLager_Maximalmenge_groesser_0] CHECK  (([Maximalmenge]>(0)))
GO
ALTER TABLE [dbo].[tb_ZutatenLager] CHECK CONSTRAINT [CK_tb_ZutatenLager_Maximalmenge_groesser_0]
GO
ALTER TABLE [dbo].[tb_ZutatenLager]  WITH CHECK ADD  CONSTRAINT [CK_tb_ZutatenLager_Mindestmenge_groesser_0] CHECK  (([Mindestmenge]>(0)))
GO
ALTER TABLE [dbo].[tb_ZutatenLager] CHECK CONSTRAINT [CK_tb_ZutatenLager_Mindestmenge_groesser_0]
GO
/****** Object:  StoredProcedure [dbo].[sp_Backup_Restaurant_mit_Zeitstempel]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe B
-- Create date: 19.06.2024
-- Description:	Diese Prozedur soll ein automatisches Back-up mit Zeitstempel ausführen
-- =============================================
CREATE   PROCEDURE [dbo].[sp_Backup_Restaurant_mit_Zeitstempel] 
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
GO
ALTER AUTHORIZATION ON [dbo].[sp_Backup_Restaurant_mit_Zeitstempel] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_test_neue_BestellPosition]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe B 
-- Create date: 18.06.2024
-- Description:	Diese Prozedur fügt und testet neue Bestellungspositionen in tb_BestellPosition ein
-- =============================================
CREATE   PROCEDURE [dbo].[sp_insert_test_neue_BestellPosition] 
	-- Add the parameters for the stored procedure here
		@BestellungID int,
		@GerichtID int,
		@AnzahlGericht int,
		-----
		@Erfolg bit OUTPUT, -- geklappt oder nicht
		@Feedback NVARCHAR(MAX) OUTPUT -- Fehlermeldungen etc.
AS
BEGIN
	-- Hilfsvariablen deklarieren	
	DECLARE @CheckResult AS bit;
	-----------------------------
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
	------------------------------
	--1. Bestellung abgeschlossen?
	SET @CheckResult = dbo.sf_Status_Bestellung(@BestellungID);
	IF @CheckResult = 0 --@BestellungID abgeschlossen, abgebrochen oder existiert nicht
		THROW 60001, 'Bestellung entweder abgeschlossen, abgebrochen oder existiert nicht', 1;
	------------------------------
	--2. Gericht pro Position prüfen ob Lagerbestand ausreichend?

	IF dbo.sf_Anzahl_Gerichte_im_Lager(@GerichtID) >= @AnzahlGericht
		SET @CheckResult = 1;
	ELSE
		BEGIN
		DECLARE @FehlerAnzahlGericht VARCHAR(MAX);
		SET @FehlerAnzahlGericht = 'Zu wenig Zutaten im Lager, Bestellung nicht möglich!' + CHAR(10) +
                     'Kunde möchte ' + CAST(@AnzahlGericht AS VARCHAR(3)) + 'x Gericht, aber nur ' +
                     CAST(dbo.sf_Anzahl_Gerichte_im_Lager(@GerichtID) AS VARCHAR(5)) + 'x möglich!'+ CHAR(10);
		SET @CheckResult = 0;
			THROW 60002,@FehlerAnzahlGericht
			, 1;
		END
	------------------------------

	BEGIN TRANSACTION tr_Lagermenge_reduzieren

	--3. UPDATE falls es sich um Nachbestellung handelt, ansonsten INSERT 
	--	(Falls BestellungID & GerichtID schon vorhanden)

	SET @CheckResult = (
		SELECT COUNT(BestellPositionID)
			FROM [Restaurant].[dbo].[tb_BestellPositionen]
			WHERE (BestellungID = @BestellungID) AND (GerichtID = @GerichtID));
	IF (@CheckResult = 1)
		UPDATE [Restaurant].[dbo].[tb_BestellPositionen]
			SET [AnzahlGericht] = [AnzahlGericht] + @AnzahlGericht
			WHERE(BestellungID = @BestellungID) AND (GerichtID = @GerichtID);
	ELSE 
		INSERT INTO [Restaurant].[dbo].[tb_BestellPositionen]
					([BestellungID],[GerichtID],[AnzahlGericht])
		VALUES (@BestellungID, @GerichtID, @AnzahlGericht);
	---------------------------------

	-- 4. Lagermenge korrigieren
	-- (Durch die Zutaten für 1 Gericht eine Schleife laufen lassen und Menge pro Zutat von tb_ZutatenLager abziehen)

	DECLARE Cursor_Zutaten CURSOR
		FOR
		SELECT 
			dbo.tb_ZutatenGericht.ZutatID,
			dbo.tb_ZutatenGericht.Menge
			FROM dbo.tb_ZutatenGericht 
			WHERE dbo.tb_ZutatenGericht.GerichtID = @GerichtID;
	
	DECLARE @ZutatID int;
	DECLARE @Menge float;

	OPEN Cursor_Zutaten;
	FETCH NEXT FROM Cursor_Zutaten INTO @ZutatID, @Menge;
	WHILE @@FETCH_STATUS = 0
	BEGIN

	UPDATE dbo.tb_ZutatenLager
		SET Menge = Menge - @Menge * @AnzahlGericht
		WHERE dbo.tb_ZutatenLager.ZutatID = @ZutatID
	
		FETCH NEXT FROM Cursor_Zutaten INTO @ZutatID, @Menge; 
	END
	CLOSE Cursor_Zutaten;
	DEALLOCATE Cursor_Zutaten;

	-----------------------------------

	COMMIT TRANSACTION tr_Lagermenge_reduzieren
	
	----------------------------------
	SET @Erfolg = 1;
	SET @Feedback = 'Alles OK!';	
	END TRY
	----------------------------------
	BEGIN CATCH
		SET @Erfolg = 0; -- nicht geklappt--
		-- 	@Feedback text OUTPUT --Fehlermeldungen etc.
		SET @Feedback = 
			ERROR_MESSAGE() + ' Fehler Nr. '+ CONVERT(varchar, ERROR_NUMBER()) + CHAR(10)
						+ ' Prozedur: '  + ERROR_PROCEDURE() + CHAR(10)
						+ ' Zeile Nr.: ' + CONVERT(varchar,  ERROR_LINE());
	END CATCH;
    
END
GO
ALTER AUTHORIZATION ON [dbo].[sp_insert_test_neue_BestellPosition] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_test_neue_Bestellung]    Script Date: 20.06.2024 15:27:41 ******/
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
CREATE   PROCEDURE [dbo].[sp_insert_test_neue_Bestellung] 
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
ALTER AUTHORIZATION ON [dbo].[sp_insert_test_neue_Bestellung] TO  SCHEMA OWNER 
GO
/****** Object:  Trigger [dbo].[tr_tb_Bestellungen_Status_ueberwachen]    Script Date: 20.06.2024 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe B
-- Create date: 19.06.2024
-- Description:	Dieser Trigger soll den Status in der Tabelle tb_Bestellungen überwachen
-- =============================================
CREATE   TRIGGER [dbo].[tr_tb_Bestellungen_Status_ueberwachen]
   ON [dbo].[tb_Bestellungen]
   FOR UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	IF UPDATE([Status])
		BEGIN
			-- Wenn Kunde bezahlen möchte, Status auf 1 (abgeschlossen) ändern und Rechnung in tb_temp_Rechnung generieren
			IF (SELECT [Status] FROM inserted) = 1
				BEGIN
				DROP TABLE IF EXISTS tb_temp_Rechnung
				DECLARE @Bestellnummer CHAR(10)
				SET @Bestellnummer = (SELECT [Bestellnummer] FROM inserted)
				SELECT * INTO tb_temp_Rechnung
				FROM [dbo].[tf_Rechnung_erstellen](@Bestellnummer)
				END

			-- Wenn Bestellung abgebrochen wird (Status 2), Zutaten im Lager wieder freigeben
			IF (SELECT [Status] FROM inserted) = 2
				BEGIN 
				BEGIN TRANSACTION Tr_Bestell_Status_2
					DECLARE @BestellungID int
					SET @BestellungID = (SELECT [BestellungID] FROM inserted)
					DECLARE Cursor_Zutaten CURSOR
						FOR
						SELECT * FROM [dbo].[tf_Zutaten_benoetigte](@BestellungID)
	
						DECLARE @ZutatID int; --1 Spalte ZutatID
						DECLARE @Menge float; --2. Spalte BenötigteZutaten (Menge)

						OPEN Cursor_Zutaten;
						FETCH NEXT FROM Cursor_Zutaten INTO @ZutatID, @Menge;
						WHILE @@FETCH_STATUS = 0
							BEGIN

							UPDATE dbo.tb_ZutatenLager
							SET Menge = Menge + @Menge
							WHERE dbo.tb_ZutatenLager.ZutatID = @ZutatID
	
							FETCH NEXT FROM Cursor_Zutaten INTO @ZutatID, @Menge; 
							END
					CLOSE Cursor_Zutaten;
					DEALLOCATE Cursor_Zutaten;
				COMMIT TRANSACTION Tr_Bestell_Status_2
				END

			-- Wenn (seltener Fall) Abbruch von Bestellung (Status 2) storniert wird, dann Zutaten im Lager wieder abziehen
			IF (((SELECT [Status] FROM inserted) = 1) OR ((SELECT [Status] FROM inserted) = 0)) AND ((SELECT [Status] FROM deleted) = 2)
				BEGIN
				BEGIN TRANSACTION Tr_Bestell_Status_2
					DECLARE @BestellungID_2 int
					SET @BestellungID_2 = (SELECT [BestellungID] FROM inserted)
					DECLARE Cursor_Zutaten CURSOR
						FOR
						SELECT * FROM [dbo].[tf_Zutaten_benoetigte](@BestellungID_2)
	
						DECLARE @ZutatID_2 int; --1 Spalte ZutatID
						DECLARE @Menge_2 float; --2. Spalte BenötigteZutaten (Menge)

						OPEN Cursor_Zutaten;
						FETCH NEXT FROM Cursor_Zutaten INTO @ZutatID_2, @Menge_2;
						WHILE @@FETCH_STATUS = 0
							BEGIN

							UPDATE dbo.tb_ZutatenLager
							SET Menge = Menge - @Menge_2
							WHERE dbo.tb_ZutatenLager.ZutatID = @ZutatID_2
	
							FETCH NEXT FROM Cursor_Zutaten INTO @ZutatID_2, @Menge_2; 
							END
					CLOSE Cursor_Zutaten;
					DEALLOCATE Cursor_Zutaten;

					IF (SELECT [Status] FROM inserted) = 1
						BEGIN
							DROP TABLE IF EXISTS tb_temp_Rechnung
							DECLARE @Bestellnummer_2 CHAR(10)
							SET @Bestellnummer_2 = (SELECT [Bestellnummer] FROM inserted)
							SELECT * INTO tb_temp_Rechnung
							FROM [dbo].[tf_Rechnung_erstellen](@Bestellnummer_2)
						END
				COMMIT TRANSACTION Tr_Bestell_Status_2
				END
		END
END
GO
ALTER TABLE [dbo].[tb_Bestellungen] ENABLE TRIGGER [tr_tb_Bestellungen_Status_ueberwachen]
GO
/****** Object:  Trigger [dbo].[tr_Zutatenlager_ZutatenLog_INSERT]    Script Date: 20.06.2024 15:27:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe B
-- Create date: 18.06.2024
-- Description:	Dieser Trigger soll Neue Zutaten im Zutatenlager melden und Meldung rausgeben, falls Mindestmenge unterschritten wurde
-- =============================================
CREATE   TRIGGER [dbo].[tr_Zutatenlager_ZutatenLog_INSERT]
   ON  [dbo].[tb_ZutatenLager]
   FOR INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Nachricht varchar(255);
    -- Insert statements for trigger here

	SET @Nachricht = (
		SELECT --@Nachricht+
		'Mindestmenge für die neue Zutat ' + i.Zutat 
				+ ' unterschritten!! Bitte auf ' 
				+ CAST(i.Maximalmenge AS VARCHAR(10)) + ' ' + i.Einheit
				+ ' (Maximalmenge) auffüllen. Danke.' AS Warnung
		FROM inserted i
		WHERE i.Menge < i.Mindestmenge
		
					);
	IF @Nachricht IS NULL
			SET @Nachricht = (
			SELECT 'Neue Zutat '+ i.Zutat +' hinzugefügt!' AS Warnung
			FROM inserted i
							);
			

	INSERT INTO dbo.tb_ZutatLog
				(Mode, DatumUhrzeit, Nachricht)
	VALUES ('Insert', GETDATE(), @Nachricht);


END
GO
ALTER TABLE [dbo].[tb_ZutatenLager] ENABLE TRIGGER [tr_Zutatenlager_ZutatenLog_INSERT]
GO
/****** Object:  Trigger [dbo].[tr_Zutatenlager_ZutatenLog_UPDATE]    Script Date: 20.06.2024 15:27:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe B
-- Create date: 18.06.2024
-- Description:	Dieser Trigger soll Änderungen im Zutatenlager überwachen und Meldungen geben, falls Mindestmenge unterschritten wurde
-- =============================================
CREATE   TRIGGER [dbo].[tr_Zutatenlager_ZutatenLog_UPDATE]
   ON  [dbo].[tb_ZutatenLager]
   FOR UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Nachricht varchar(255);
    -- Insert statements for trigger here
	IF (UPDATE(Menge)) OR (UPDATE(Mindestmenge))
	BEGIN
	SET @Nachricht = (
		SELECT 'Mindestmenge für die Zutat ' + i.Zutat 
				+ ' unterschritten!! Bitte auf ' 
				+ CAST(i.Maximalmenge AS VARCHAR(10)) + ' ' + i.Einheit
				+ ' (Maximalmenge) auffüllen. Danke.' AS Warnung
		FROM inserted i
		WHERE i.Menge < i.Mindestmenge
	);
	IF @Nachricht IS NOT NULL
	INSERT INTO dbo.tb_ZutatLog
				(Mode, DatumUhrzeit, Nachricht)
	VALUES ('Update', GETDATE(), @Nachricht);
	END	

END
GO
ALTER TABLE [dbo].[tb_ZutatenLager] ENABLE TRIGGER [tr_Zutatenlager_ZutatenLog_UPDATE]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Eine Bestellung muss mindestens ein Gericht beinhalten' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_BestellPositionen', @level2type=N'CONSTRAINT',@level2name=N'CK_tb_BestellPositionen_AnzahlGericht_gr_null'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Öffnungszeiten beschränken' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Bestellungen', @level2type=N'CONSTRAINT',@level2name=N'CK_tb_Bestellungen_Datum_Oeffnungszeiten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status 0 = In Bearbeitung, 1 = Abgeschlossen, 2 = Abgebrochen' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Bestellungen', @level2type=N'CONSTRAINT',@level2name=N'CK_tb_Bestellungen_Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Preis darf nicht negativ sein' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Gerichte', @level2type=N'CONSTRAINT',@level2name=N'CK_tb_Gerichte_Preis_groesser_0'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kundeninformationen eindeutig' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Kunden', @level2type=N'INDEX',@level2name=N'IX_tb_Kunden_eindeutig'
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
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[44] 4[19] 2[10] 3) )"
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
         Begin Table = "tb_ZutatenGericht"
            Begin Extent = 
               Top = 100
               Left = 347
               Bottom = 254
               Right = 584
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_ZutatenLager"
            Begin Extent = 
               Top = 56
               Left = 791
               Bottom = 254
               Right = 1016
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
         Width = 1005
         Width = 1005
         Width = 3345
         Width = 3735
         Width = 4155
         Width = 1005
         Width = 1005
         Width = 1005
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2145
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Anzahl_Gerichte_Pro_Lagermenge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Anzahl_Gerichte_Pro_Lagermenge'
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
         Begin Table = "tb_Taetigkeit"
            Begin Extent = 
               Top = 80
               Left = 230
               Bottom = 176
               Right = 397
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_Mitarbeiter"
            Begin Extent = 
               Top = 88
               Left = 509
               Bottom = 308
               Right = 676
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_Bestellungen"
            Begin Extent = 
               Top = 85
               Left = 800
               Bottom = 281
               Right = 969
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
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Mitarbeiter_Taetigkeit_Bestellungen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Mitarbeiter_Taetigkeit_Bestellungen'
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
         Begin Table = "tb_Gerichte"
            Begin Extent = 
               Top = 55
               Left = 131
               Bottom = 185
               Right = 358
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_BestellPositionen"
            Begin Extent = 
               Top = 97
               Left = 501
               Bottom = 235
               Right = 678
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_Bestellungen"
            Begin Extent = 
               Top = 91
               Left = 832
               Bottom = 278
               Right = 1001
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
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 5790
         Alias = 900
         Table = 2865
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_RechnungPositionen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_RechnungPositionen'
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
         Begin Table = "tb_Gerichte"
            Begin Extent = 
               Top = 83
               Left = 119
               Bottom = 213
               Right = 362
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_BestellPositionen"
            Begin Extent = 
               Top = 122
               Left = 452
               Bottom = 252
               Right = 645
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_Bestellungen"
            Begin Extent = 
               Top = 104
               Left = 717
               Bottom = 296
               Right = 902
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
      Begin ColumnWidths = 12
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
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_RechnungTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_RechnungTotal'
GO
USE [master]
GO
ALTER DATABASE [Restaurant] SET  READ_WRITE 
GO
