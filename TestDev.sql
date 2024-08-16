USE [master]
GO
/****** Object:  Database [TestDev]    Script Date: 8/16/2024 7:01:45 PM ******/
CREATE DATABASE [TestDev]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestDev]', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.ANGEL\MSSQL\DATA\TestDev].mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestDev]_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.ANGEL\MSSQL\DATA\TestDev]_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TestDev] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestDev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestDev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestDev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestDev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestDev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestDev] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestDev] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestDev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestDev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestDev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestDev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestDev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestDev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestDev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestDev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestDev] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestDev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestDev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestDev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestDev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestDev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestDev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestDev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestDev] SET RECOVERY FULL 
GO
ALTER DATABASE [TestDev] SET  MULTI_USER 
GO
ALTER DATABASE [TestDev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestDev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestDev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestDev] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestDev] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestDev] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestDev', N'ON'
GO
ALTER DATABASE [TestDev] SET QUERY_STORE = OFF
GO
USE [TestDev]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 8/16/2024 7:01:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Acc_number] [int] NOT NULL,
	[Acc_parent] [int] NULL,
	[Balance] [decimal](18, 2) NULL,
 CONSTRAINT [PK__Accounts__84CD3A125EE1BBDF] PRIMARY KEY CLUSTERED 
(
	[Acc_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Acc_number], [Acc_parent], [Balance]) VALUES (1, NULL, NULL)
GO
INSERT [dbo].[Accounts] ([Acc_number], [Acc_parent], [Balance]) VALUES (2, 1, CAST(100.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Accounts] ([Acc_number], [Acc_parent], [Balance]) VALUES (3, 1, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Accounts] ([Acc_number], [Acc_parent], [Balance]) VALUES (4, 3, CAST(100.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Accounts] ([Acc_number], [Acc_parent], [Balance]) VALUES (5, NULL, NULL)
GO
INSERT [dbo].[Accounts] ([Acc_number], [Acc_parent], [Balance]) VALUES (6, 5, CAST(130.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Accounts] ([Acc_number], [Acc_parent], [Balance]) VALUES (7, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Accounts] ([Acc_number], [Acc_parent], [Balance]) VALUES (8, 7, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Accounts] ([Acc_number], [Acc_parent], [Balance]) VALUES (9, 8, CAST(100.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Accounts] ([Acc_number], [Acc_parent], [Balance]) VALUES (10, NULL, NULL)
GO
INSERT [dbo].[Accounts] ([Acc_number], [Acc_parent], [Balance]) VALUES (11, 10, CAST(100.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Accounts] ([Acc_number], [Acc_parent], [Balance]) VALUES (12, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Accounts] ([Acc_number], [Acc_parent], [Balance]) VALUES (13, 12, CAST(100.00 AS Decimal(18, 2)))
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK__Accounts__Acc_pa__2A4B4B5E] FOREIGN KEY([Acc_parent])
REFERENCES [dbo].[Accounts] ([Acc_number])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK__Accounts__Acc_pa__2A4B4B5E]
GO
USE [master]
GO
ALTER DATABASE [TestDev] SET  READ_WRITE 
GO
