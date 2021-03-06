USE [master]
GO
/****** Object:  Database [University_Test]    Script Date: 2018/10/25 10:13:35 ******/
CREATE DATABASE [University_Test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'University_Test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.DMON001\MSSQL\DATA\University_Test.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'University_Test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.DMON001\MSSQL\DATA\University_Test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [University_Test] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [University_Test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [University_Test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [University_Test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [University_Test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [University_Test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [University_Test] SET ARITHABORT OFF 
GO
ALTER DATABASE [University_Test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [University_Test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [University_Test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [University_Test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [University_Test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [University_Test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [University_Test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [University_Test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [University_Test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [University_Test] SET  ENABLE_BROKER 
GO
ALTER DATABASE [University_Test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [University_Test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [University_Test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [University_Test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [University_Test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [University_Test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [University_Test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [University_Test] SET RECOVERY FULL 
GO
ALTER DATABASE [University_Test] SET  MULTI_USER 
GO
ALTER DATABASE [University_Test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [University_Test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [University_Test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [University_Test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [University_Test] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'University_Test', N'ON'
GO
ALTER DATABASE [University_Test] SET QUERY_STORE = OFF
GO
USE [University_Test]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [University_Test]
GO
/****** Object:  Table [dbo].[students]    Script Date: 2018/10/25 10:13:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subject_registrations]    Script Date: 2018/10/25 10:13:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject_registrations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NOT NULL,
	[subject_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subjects]    Script Date: 2018/10/25 10:13:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subjects](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](6) NOT NULL,
	[description] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[students] ON 

INSERT [dbo].[students] ([id], [first_name], [last_name]) VALUES (1, N'Dominic', N'Romanel')
INSERT [dbo].[students] ([id], [first_name], [last_name]) VALUES (3, N'Kendra', N'Demarsfs')
INSERT [dbo].[students] ([id], [first_name], [last_name]) VALUES (4, N'Marcelene', N'Leffler')
INSERT [dbo].[students] ([id], [first_name], [last_name]) VALUES (5, N'Shwanta', N'Burghart')
SET IDENTITY_INSERT [dbo].[students] OFF
SET IDENTITY_INSERT [dbo].[subject_registrations] ON 

INSERT [dbo].[subject_registrations] ([id], [student_id], [subject_id]) VALUES (1, 1, 2)
INSERT [dbo].[subject_registrations] ([id], [student_id], [subject_id]) VALUES (3, 3, 2)
INSERT [dbo].[subject_registrations] ([id], [student_id], [subject_id]) VALUES (4, 3, 1)
SET IDENTITY_INSERT [dbo].[subject_registrations] OFF
SET IDENTITY_INSERT [dbo].[subjects] ON 

INSERT [dbo].[subjects] ([id], [code], [description]) VALUES (1, N'COS110', N'Program Design: Introduction')
INSERT [dbo].[subjects] ([id], [code], [description]) VALUES (2, N'INL120', N'Information Science: Organisation and representation of information')
INSERT [dbo].[subjects] ([id], [code], [description]) VALUES (3, N'JCP202', N'Community-based Project')
SET IDENTITY_INSERT [dbo].[subjects] OFF
ALTER TABLE [dbo].[subject_registrations]  WITH CHECK ADD FOREIGN KEY([student_id])
REFERENCES [dbo].[students] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[subject_registrations]  WITH CHECK ADD FOREIGN KEY([subject_id])
REFERENCES [dbo].[subjects] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [University_Test] SET  READ_WRITE 
GO
