USE [master]
GO
/****** Object:  Database [ManageRoom]    Script Date: 7/8/2017 9:32:59 PM ******/
CREATE DATABASE [ManageRoom]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ManageRoom', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.QUYPC\MSSQL\DATA\ManageRoom.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ManageRoom_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.QUYPC\MSSQL\DATA\ManageRoom_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ManageRoom] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ManageRoom].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ManageRoom] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ManageRoom] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ManageRoom] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ManageRoom] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ManageRoom] SET ARITHABORT OFF 
GO
ALTER DATABASE [ManageRoom] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ManageRoom] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ManageRoom] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ManageRoom] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ManageRoom] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ManageRoom] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ManageRoom] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ManageRoom] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ManageRoom] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ManageRoom] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ManageRoom] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ManageRoom] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ManageRoom] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ManageRoom] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ManageRoom] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ManageRoom] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ManageRoom] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ManageRoom] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ManageRoom] SET  MULTI_USER 
GO
ALTER DATABASE [ManageRoom] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ManageRoom] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ManageRoom] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ManageRoom] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ManageRoom] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ManageRoom]
GO
/****** Object:  Table [dbo].[tbl_account]    Script Date: 7/8/2017 9:32:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_account](
	[username] [nvarchar](20) NOT NULL,
	[password] [varchar](25) NOT NULL,
	[role] [int] NULL,
 CONSTRAINT [PK_tbl_account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_maintenance]    Script Date: 7/8/2017 9:32:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_maintenance](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[requestDate] [datetime] NOT NULL,
	[reason] [varchar](250) NOT NULL,
	[repairedDate] [datetime] NULL,
	[mend] [varchar](250) NULL,
	[cost] [float] NULL,
	[roomId] [varchar](3) NOT NULL,
 CONSTRAINT [PK_tbl_maintenance] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_room]    Script Date: 7/8/2017 9:32:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_room](
	[roomID] [varchar](3) NOT NULL,
	[description] [varchar](250) NULL,
	[hourPrice] [float] NULL,
	[dayPrice] [float] NULL,
	[categotyID] [varchar](5) NULL,
 CONSTRAINT [PK_tbl_room] PRIMARY KEY CLUSTERED 
(
	[roomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_roomCategory]    Script Date: 7/8/2017 9:32:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_roomCategory](
	[categoryID] [varchar](5) NOT NULL,
	[categoryName] [varchar](30) NULL,
	[description] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_roomCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tbl_account] ([username], [password], [role]) VALUES (N'han', N'123', 1)
INSERT [dbo].[tbl_account] ([username], [password], [role]) VALUES (N'manager', N'123', 3)
INSERT [dbo].[tbl_account] ([username], [password], [role]) VALUES (N'quy', N'123', 3)
INSERT [dbo].[tbl_account] ([username], [password], [role]) VALUES (N'staff', N'123', 1)
SET IDENTITY_INSERT [dbo].[tbl_maintenance] ON 

INSERT [dbo].[tbl_maintenance] ([id], [requestDate], [reason], [repairedDate], [mend], [cost], [roomId]) VALUES (2073, CAST(N'2017-06-29 00:00:00.000' AS DateTime), N'Toilet Damged', CAST(N'1900-01-01 00:00:00.000' AS DateTime), N'', 49.5, N'205')
INSERT [dbo].[tbl_maintenance] ([id], [requestDate], [reason], [repairedDate], [mend], [cost], [roomId]) VALUES (2074, CAST(N'2017-06-29 00:00:00.000' AS DateTime), N'Toilet Damged', CAST(N'1900-01-01 00:00:00.000' AS DateTime), N'', 49.5, N'204')
INSERT [dbo].[tbl_maintenance] ([id], [requestDate], [reason], [repairedDate], [mend], [cost], [roomId]) VALUES (2075, CAST(N'2017-06-29 00:00:00.000' AS DateTime), N'Toilet Damged', CAST(N'1900-01-01 00:00:00.000' AS DateTime), N'', 49.5, N'203')
INSERT [dbo].[tbl_maintenance] ([id], [requestDate], [reason], [repairedDate], [mend], [cost], [roomId]) VALUES (2076, CAST(N'2017-06-30 00:00:00.000' AS DateTime), N'Tv Broken', CAST(N'1900-01-01 00:00:00.000' AS DateTime), N'', 49.5, N'203')
INSERT [dbo].[tbl_maintenance] ([id], [requestDate], [reason], [repairedDate], [mend], [cost], [roomId]) VALUES (2077, CAST(N'2017-06-30 00:00:00.000' AS DateTime), N'Tv Broken', CAST(N'1900-01-01 00:00:00.000' AS DateTime), N'', 49.5, N'201')
INSERT [dbo].[tbl_maintenance] ([id], [requestDate], [reason], [repairedDate], [mend], [cost], [roomId]) VALUES (2078, CAST(N'2017-06-30 00:00:00.000' AS DateTime), N'Tv Broken', CAST(N'1900-01-01 00:00:00.000' AS DateTime), N'', 49.5, N'209')
INSERT [dbo].[tbl_maintenance] ([id], [requestDate], [reason], [repairedDate], [mend], [cost], [roomId]) VALUES (2079, CAST(N'2017-06-30 00:00:00.000' AS DateTime), N'Tv Broken', CAST(N'1900-01-01 00:00:00.000' AS DateTime), N'', 49.5, N'207')
INSERT [dbo].[tbl_maintenance] ([id], [requestDate], [reason], [repairedDate], [mend], [cost], [roomId]) VALUES (2080, CAST(N'2017-07-02 00:00:00.000' AS DateTime), N'Tv Broken', CAST(N'1900-01-01 00:00:00.000' AS DateTime), N'', 49.5, N'207')
INSERT [dbo].[tbl_maintenance] ([id], [requestDate], [reason], [repairedDate], [mend], [cost], [roomId]) VALUES (2081, CAST(N'2017-07-02 00:00:00.000' AS DateTime), N'Tv Broken', CAST(N'1900-01-01 00:00:00.000' AS DateTime), N'', 49.5, N'301')
INSERT [dbo].[tbl_maintenance] ([id], [requestDate], [reason], [repairedDate], [mend], [cost], [roomId]) VALUES (2082, CAST(N'2017-07-02 00:00:00.000' AS DateTime), N'Tv Broken', CAST(N'1900-01-01 00:00:00.000' AS DateTime), N'', 49.5, N'304')
INSERT [dbo].[tbl_maintenance] ([id], [requestDate], [reason], [repairedDate], [mend], [cost], [roomId]) VALUES (2083, CAST(N'2017-07-02 00:00:00.000' AS DateTime), N'AC broken', CAST(N'1900-01-01 00:00:00.000' AS DateTime), N'', 49.5, N'304')
INSERT [dbo].[tbl_maintenance] ([id], [requestDate], [reason], [repairedDate], [mend], [cost], [roomId]) VALUES (2084, CAST(N'2017-07-02 00:00:00.000' AS DateTime), N'AC broken', CAST(N'1900-01-01 00:00:00.000' AS DateTime), N'', 49.5, N'401')
INSERT [dbo].[tbl_maintenance] ([id], [requestDate], [reason], [repairedDate], [mend], [cost], [roomId]) VALUES (2085, CAST(N'2017-07-02 00:00:00.000' AS DateTime), N'AC broken', CAST(N'1900-01-01 00:00:00.000' AS DateTime), N'', 49.5, N'402')
INSERT [dbo].[tbl_maintenance] ([id], [requestDate], [reason], [repairedDate], [mend], [cost], [roomId]) VALUES (2086, CAST(N'2017-07-02 00:00:00.000' AS DateTime), N'AC broken', CAST(N'1900-01-01 00:00:00.000' AS DateTime), N'', 49.5, N'202')
INSERT [dbo].[tbl_maintenance] ([id], [requestDate], [reason], [repairedDate], [mend], [cost], [roomId]) VALUES (2087, CAST(N'2017-07-03 00:00:00.000' AS DateTime), N'AirConditioner is broken', NULL, NULL, NULL, N'202')
INSERT [dbo].[tbl_maintenance] ([id], [requestDate], [reason], [repairedDate], [mend], [cost], [roomId]) VALUES (2088, CAST(N'2017-07-03 00:00:00.000' AS DateTime), N'AirConditioner is broken', NULL, NULL, NULL, N'202')
INSERT [dbo].[tbl_maintenance] ([id], [requestDate], [reason], [repairedDate], [mend], [cost], [roomId]) VALUES (2089, CAST(N'2017-07-03 00:00:00.000' AS DateTime), N'AirConditioner is broken', NULL, NULL, NULL, N'202')
INSERT [dbo].[tbl_maintenance] ([id], [requestDate], [reason], [repairedDate], [mend], [cost], [roomId]) VALUES (2090, CAST(N'2017-07-03 00:00:00.000' AS DateTime), N'AirConditioner is broken', NULL, NULL, NULL, N'202')
INSERT [dbo].[tbl_maintenance] ([id], [requestDate], [reason], [repairedDate], [mend], [cost], [roomId]) VALUES (2091, CAST(N'2017-07-03 00:00:00.000' AS DateTime), N'Door cannot open', NULL, NULL, NULL, N'204')
INSERT [dbo].[tbl_maintenance] ([id], [requestDate], [reason], [repairedDate], [mend], [cost], [roomId]) VALUES (2092, CAST(N'2017-07-05 00:00:00.000' AS DateTime), N'AirConditioner is broken', NULL, NULL, NULL, N'201')
INSERT [dbo].[tbl_maintenance] ([id], [requestDate], [reason], [repairedDate], [mend], [cost], [roomId]) VALUES (2093, CAST(N'2017-07-05 00:00:00.000' AS DateTime), N'Door cannot open', NULL, NULL, NULL, N'205')
INSERT [dbo].[tbl_maintenance] ([id], [requestDate], [reason], [repairedDate], [mend], [cost], [roomId]) VALUES (2094, CAST(N'2017-07-06 00:00:00.000' AS DateTime), N'Door crashed', NULL, NULL, NULL, N'203')
INSERT [dbo].[tbl_maintenance] ([id], [requestDate], [reason], [repairedDate], [mend], [cost], [roomId]) VALUES (2095, CAST(N'2017-07-06 00:00:00.000' AS DateTime), N'AirConditioner is broken', NULL, NULL, NULL, N'202')
INSERT [dbo].[tbl_maintenance] ([id], [requestDate], [reason], [repairedDate], [mend], [cost], [roomId]) VALUES (2096, CAST(N'2017-07-07 00:00:00.000' AS DateTime), N'abcd', NULL, NULL, NULL, N'202')
SET IDENTITY_INSERT [dbo].[tbl_maintenance] OFF
INSERT [dbo].[tbl_room] ([roomID], [description], [hourPrice], [dayPrice], [categotyID]) VALUES (N'201', N'Phong hoc 2', 50.153301239013672, 250.5, N'c201')
INSERT [dbo].[tbl_room] ([roomID], [description], [hourPrice], [dayPrice], [categotyID]) VALUES (N'202', N'Phong ban5', 123.77300262451172, 10.550999641418457, N'c202')
INSERT [dbo].[tbl_room] ([roomID], [description], [hourPrice], [dayPrice], [categotyID]) VALUES (N'203', N'Phong Don23', 50.555000305175781, 151.32000732421875, N'c203')
INSERT [dbo].[tbl_room] ([roomID], [description], [hourPrice], [dayPrice], [categotyID]) VALUES (N'204', N'Phong Don 3', 150.5, 60.054000854492188, N'c204')
INSERT [dbo].[tbl_room] ([roomID], [description], [hourPrice], [dayPrice], [categotyID]) VALUES (N'205', N'Phong Don33', 50, 160, N'c205')
INSERT [dbo].[tbl_room] ([roomID], [description], [hourPrice], [dayPrice], [categotyID]) VALUES (N'206', N'Phong DOi 3', 180, 50, N'c206')
INSERT [dbo].[tbl_room] ([roomID], [description], [hourPrice], [dayPrice], [categotyID]) VALUES (N'207', N'Phong Doi', 70, 180, N'c207')
INSERT [dbo].[tbl_room] ([roomID], [description], [hourPrice], [dayPrice], [categotyID]) VALUES (N'208', N'Phong doi', 70, 180, N'c208')
INSERT [dbo].[tbl_room] ([roomID], [description], [hourPrice], [dayPrice], [categotyID]) VALUES (N'209', N'Phong doi', 70, 180, N'c209')
INSERT [dbo].[tbl_room] ([roomID], [description], [hourPrice], [dayPrice], [categotyID]) VALUES (N'301', N'Phong VIP', 80, 190, N'c301')
INSERT [dbo].[tbl_room] ([roomID], [description], [hourPrice], [dayPrice], [categotyID]) VALUES (N'302', N'Phong VIP', 80, 190, N'c302')
INSERT [dbo].[tbl_room] ([roomID], [description], [hourPrice], [dayPrice], [categotyID]) VALUES (N'303', N'Phong VIP22', 90, 190, N'c303')
INSERT [dbo].[tbl_room] ([roomID], [description], [hourPrice], [dayPrice], [categotyID]) VALUES (N'304', N'Phong VIP', 80, 190, N'c304')
INSERT [dbo].[tbl_room] ([roomID], [description], [hourPrice], [dayPrice], [categotyID]) VALUES (N'305', N'Phong VIP', 80, 190, N'c305')
INSERT [dbo].[tbl_room] ([roomID], [description], [hourPrice], [dayPrice], [categotyID]) VALUES (N'401', N'Phong Hoang Gia', 100, 200, N'c401')
INSERT [dbo].[tbl_room] ([roomID], [description], [hourPrice], [dayPrice], [categotyID]) VALUES (N'402', N'Phong Hoang Gia', 100, 200, N'c402')
INSERT [dbo].[tbl_roomCategory] ([categoryID], [categoryName], [description]) VALUES (N'c201', N'c201', N'beautiful')
INSERT [dbo].[tbl_roomCategory] ([categoryID], [categoryName], [description]) VALUES (N'c202', N'c202', N'beautiful')
INSERT [dbo].[tbl_roomCategory] ([categoryID], [categoryName], [description]) VALUES (N'c203', N'c203', N'beautiful')
INSERT [dbo].[tbl_roomCategory] ([categoryID], [categoryName], [description]) VALUES (N'c204', N'c204', N'beautiful')
INSERT [dbo].[tbl_roomCategory] ([categoryID], [categoryName], [description]) VALUES (N'c205', N'c205', N'beautiful')
INSERT [dbo].[tbl_roomCategory] ([categoryID], [categoryName], [description]) VALUES (N'c206', N'c206', N'beautiful')
INSERT [dbo].[tbl_roomCategory] ([categoryID], [categoryName], [description]) VALUES (N'c207', N'c207', N'beautiful')
INSERT [dbo].[tbl_roomCategory] ([categoryID], [categoryName], [description]) VALUES (N'c208', N'c208', N'beautiful')
INSERT [dbo].[tbl_roomCategory] ([categoryID], [categoryName], [description]) VALUES (N'c209', N'c209', N'beautiful')
INSERT [dbo].[tbl_roomCategory] ([categoryID], [categoryName], [description]) VALUES (N'c301', N'c301', N'beautiful')
INSERT [dbo].[tbl_roomCategory] ([categoryID], [categoryName], [description]) VALUES (N'c302', N'c302', N'beautiful')
INSERT [dbo].[tbl_roomCategory] ([categoryID], [categoryName], [description]) VALUES (N'c303', N'c303', N'beautiful')
INSERT [dbo].[tbl_roomCategory] ([categoryID], [categoryName], [description]) VALUES (N'c304', N'c304', N'beautiful')
INSERT [dbo].[tbl_roomCategory] ([categoryID], [categoryName], [description]) VALUES (N'c305', N'c305', N'beautiful')
INSERT [dbo].[tbl_roomCategory] ([categoryID], [categoryName], [description]) VALUES (N'c401', N'c401', N'beautiful')
INSERT [dbo].[tbl_roomCategory] ([categoryID], [categoryName], [description]) VALUES (N'c402', N'c402', N'beautiful')
ALTER TABLE [dbo].[tbl_maintenance]  WITH CHECK ADD  CONSTRAINT [FK_tbl_maintenance_tbl_room] FOREIGN KEY([roomId])
REFERENCES [dbo].[tbl_room] ([roomID])
GO
ALTER TABLE [dbo].[tbl_maintenance] CHECK CONSTRAINT [FK_tbl_maintenance_tbl_room]
GO
ALTER TABLE [dbo].[tbl_room]  WITH CHECK ADD  CONSTRAINT [FK_tbl_room_tbl_roomCategory] FOREIGN KEY([categotyID])
REFERENCES [dbo].[tbl_roomCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tbl_room] CHECK CONSTRAINT [FK_tbl_room_tbl_roomCategory]
GO
USE [master]
GO
ALTER DATABASE [ManageRoom] SET  READ_WRITE 
GO
