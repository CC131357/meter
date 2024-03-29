USE [master]
GO
/****** Object:  Database [Meter]    Script Date: 10/24/2019 15:22:59 ******/
CREATE DATABASE [Meter] ON  PRIMARY 
( NAME = N'Meter', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Meter.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Meter_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Meter_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Meter] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Meter].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Meter] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Meter] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Meter] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Meter] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Meter] SET ARITHABORT OFF
GO
ALTER DATABASE [Meter] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Meter] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Meter] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Meter] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Meter] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Meter] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Meter] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Meter] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Meter] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Meter] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Meter] SET  DISABLE_BROKER
GO
ALTER DATABASE [Meter] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Meter] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Meter] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Meter] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Meter] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Meter] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Meter] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Meter] SET  READ_WRITE
GO
ALTER DATABASE [Meter] SET RECOVERY FULL
GO
ALTER DATABASE [Meter] SET  MULTI_USER
GO
ALTER DATABASE [Meter] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Meter] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'Meter', N'ON'
GO
USE [Meter]
GO
/****** Object:  Table [dbo].[department_info]    Script Date: 10/24/2019 15:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[department_info](
	[dept_id] [int] NOT NULL,
	[dept_name] [varchar](20) NOT NULL,
	[dept_remask] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[dept_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[department_info] ([dept_id], [dept_name], [dept_remask]) VALUES (10, N'内层线路', N'无')
INSERT [dbo].[department_info] ([dept_id], [dept_name], [dept_remask]) VALUES (11, N'层压', N'无')
INSERT [dbo].[department_info] ([dept_id], [dept_name], [dept_remask]) VALUES (12, N'钻孔', N'无')
INSERT [dbo].[department_info] ([dept_id], [dept_name], [dept_remask]) VALUES (13, N'沉铜', N'无')
/****** Object:  Table [dbo].[meter_info]    Script Date: 10/24/2019 15:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[meter_info](
	[meter_id] [int] NOT NULL,
	[dept_id] [int] NULL,
	[location] [varchar](20) NULL,
	[meter_remask] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[meter_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[meter_info] ([meter_id], [dept_id], [location], [meter_remask]) VALUES (1001, 10, N'内层1#', N'无')
INSERT [dbo].[meter_info] ([meter_id], [dept_id], [location], [meter_remask]) VALUES (1002, 10, N'内层2#', N'无')
INSERT [dbo].[meter_info] ([meter_id], [dept_id], [location], [meter_remask]) VALUES (1003, 10, N'AOI1#', N'无')
INSERT [dbo].[meter_info] ([meter_id], [dept_id], [location], [meter_remask]) VALUES (1004, 10, N'AOI2#', N'无')
INSERT [dbo].[meter_info] ([meter_id], [dept_id], [location], [meter_remask]) VALUES (1005, 10, N'磨边线', N'无')
INSERT [dbo].[meter_info] ([meter_id], [dept_id], [location], [meter_remask]) VALUES (1101, 11, N'1# 压合', N'无')
INSERT [dbo].[meter_info] ([meter_id], [dept_id], [location], [meter_remask]) VALUES (1102, 11, N'生化锅炉', N'无')
INSERT [dbo].[meter_info] ([meter_id], [dept_id], [location], [meter_remask]) VALUES (1103, 11, N'B2压合', N'无')
INSERT [dbo].[meter_info] ([meter_id], [dept_id], [location], [meter_remask]) VALUES (1104, 11, N'B2柴油锅炉', N'无')
INSERT [dbo].[meter_info] ([meter_id], [dept_id], [location], [meter_remask]) VALUES (1105, 11, N'新压机', N'无')
INSERT [dbo].[meter_info] ([meter_id], [dept_id], [location], [meter_remask]) VALUES (1106, 11, N'新棕化空调', N'无')
INSERT [dbo].[meter_info] ([meter_id], [dept_id], [location], [meter_remask]) VALUES (1201, 12, N'吸尘', N'无')
INSERT [dbo].[meter_info] ([meter_id], [dept_id], [location], [meter_remask]) VALUES (1202, 12, N'钻孔照明', N'无')
INSERT [dbo].[meter_info] ([meter_id], [dept_id], [location], [meter_remask]) VALUES (1203, 12, N'钻机', N'无')
INSERT [dbo].[meter_info] ([meter_id], [dept_id], [location], [meter_remask]) VALUES (1204, 12, N'钻孔大门', N'无')
INSERT [dbo].[meter_info] ([meter_id], [dept_id], [location], [meter_remask]) VALUES (1205, 12, N'40P冰水机', N'无')
INSERT [dbo].[meter_info] ([meter_id], [dept_id], [location], [meter_remask]) VALUES (1206, 12, N'二楼办公室', N'无')
INSERT [dbo].[meter_info] ([meter_id], [dept_id], [location], [meter_remask]) VALUES (1301, 13, N'板电线', N'无')
INSERT [dbo].[meter_info] ([meter_id], [dept_id], [location], [meter_remask]) VALUES (1302, 13, N'VCP及沉铜', N'无')
INSERT [dbo].[meter_info] ([meter_id], [dept_id], [location], [meter_remask]) VALUES (1303, 13, N'沉铜加热泵', N'无')
INSERT [dbo].[meter_info] ([meter_id], [dept_id], [location], [meter_remask]) VALUES (1304, 13, N'沉铜加热', N'无')
INSERT [dbo].[meter_info] ([meter_id], [dept_id], [location], [meter_remask]) VALUES (1305, 13, N'新沉铜', N'无')
INSERT [dbo].[meter_info] ([meter_id], [dept_id], [location], [meter_remask]) VALUES (1306, 13, N'烘干机', N'无')
INSERT [dbo].[meter_info] ([meter_id], [dept_id], [location], [meter_remask]) VALUES (1307, 13, N'陶瓷磨板机', N'无')
/****** Object:  Table [dbo].[reading]    Script Date: 10/24/2019 15:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[reading](
	[record_id] [int] IDENTITY(1,1) NOT NULL,
	[meter_id] [int] NULL,
	[record_time] [date] NULL,
	[record] [real] NOT NULL,
	[remask] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[record_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[reading] ON
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (1, 1001, CAST(0x15400B00 AS Date), 130, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (2, 1001, CAST(0x16400B00 AS Date), 131, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (3, 1001, CAST(0x17400B00 AS Date), 132, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (4, 1001, CAST(0x18400B00 AS Date), 133, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (5, 1001, CAST(0x19400B00 AS Date), 134, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (6, 1001, CAST(0x1A400B00 AS Date), 135, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (7, 1002, CAST(0x15400B00 AS Date), 100, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (8, 1002, CAST(0x16400B00 AS Date), 132, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (9, 1002, CAST(0x17400B00 AS Date), 102, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (10, 1002, CAST(0x18400B00 AS Date), 103, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (11, 1002, CAST(0x19400B00 AS Date), 104, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (12, 1002, CAST(0x1A400B00 AS Date), 105, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (13, 1001, CAST(0x1B400B00 AS Date), 130, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (14, 1001, CAST(0x1C400B00 AS Date), 133, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (15, 1001, CAST(0x1D400B00 AS Date), 133, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (16, 1001, CAST(0x1E400B00 AS Date), 133, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (27, 1001, CAST(0x1F400B00 AS Date), 123, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (28, 1001, CAST(0x20400B00 AS Date), 125, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (30, 1001, CAST(0x21400B00 AS Date), 200, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (32, 1001, CAST(0x22400B00 AS Date), 121, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (33, 1001, CAST(0x23400B00 AS Date), 134, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (34, 1001, CAST(0x24400B00 AS Date), 234, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (44, 1001, CAST(0x25400B00 AS Date), 200, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (45, 1001, CAST(0x26400B00 AS Date), 400, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (49, 1001, CAST(0x27400B00 AS Date), 120, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (50, 1001, CAST(0x28400B00 AS Date), 121, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (51, 1001, CAST(0x29400B00 AS Date), 122, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (52, 1001, CAST(0x2A400B00 AS Date), 123, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (53, 1001, CAST(0x2B400B00 AS Date), 124, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (59, 1003, CAST(0x16400B00 AS Date), 133, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (60, 1004, CAST(0x16400B00 AS Date), 134, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (61, 1005, CAST(0x16400B00 AS Date), 135, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (62, 1101, CAST(0x16400B00 AS Date), 141, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (63, 1102, CAST(0x16400B00 AS Date), 142, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (64, 1103, CAST(0x16400B00 AS Date), 143, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (65, 1104, CAST(0x16400B00 AS Date), 144, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (67, 1105, CAST(0x16400B00 AS Date), 145, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (68, 1106, CAST(0x16400B00 AS Date), 145, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (70, 1201, CAST(0x16400B00 AS Date), 151, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (71, 1202, CAST(0x16400B00 AS Date), 152, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (72, 1203, CAST(0x16400B00 AS Date), 153, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (73, 1204, CAST(0x16400B00 AS Date), 154, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (74, 1205, CAST(0x16400B00 AS Date), 155, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (75, 1206, CAST(0x16400B00 AS Date), 156, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (76, 1301, CAST(0x16400B00 AS Date), 161, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (77, 1302, CAST(0x16400B00 AS Date), 162, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (78, 1303, CAST(0x16400B00 AS Date), 163, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (79, 1304, CAST(0x16400B00 AS Date), 164, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (80, 1305, CAST(0x16400B00 AS Date), 165, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (81, 1306, CAST(0x16400B00 AS Date), 166, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (82, 1307, CAST(0x16400B00 AS Date), 167, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (83, 1001, CAST(0x34400B00 AS Date), 1, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (84, 1001, CAST(0x35400B00 AS Date), 2, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (85, 1001, CAST(0x36400B00 AS Date), 3, N'无')
INSERT [dbo].[reading] ([record_id], [meter_id], [record_time], [record], [remask]) VALUES (86, 1001, CAST(0x37400B00 AS Date), 4, N'无')
SET IDENTITY_INSERT [dbo].[reading] OFF
/****** Object:  ForeignKey [FK__meter_inf__dept___0519C6AF]    Script Date: 10/24/2019 15:23:00 ******/
ALTER TABLE [dbo].[meter_info]  WITH CHECK ADD FOREIGN KEY([dept_id])
REFERENCES [dbo].[department_info] ([dept_id])
GO
/****** Object:  ForeignKey [FK__reading__meter_i__09DE7BCC]    Script Date: 10/24/2019 15:23:00 ******/
ALTER TABLE [dbo].[reading]  WITH CHECK ADD FOREIGN KEY([meter_id])
REFERENCES [dbo].[meter_info] ([meter_id])
GO
