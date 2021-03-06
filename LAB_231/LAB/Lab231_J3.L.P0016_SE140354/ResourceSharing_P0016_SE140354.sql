USE [master]
GO
/****** Object:  Database [LAB231_P0016_ResourceSharing]    Script Date: 5/30/2021 11:26:07 PM ******/
CREATE DATABASE [LAB231_P0016_ResourceSharing]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LAB231_P0016_ResourceSharing', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LAB231_P0016_ResourceSharing.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LAB231_P0016_ResourceSharing_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LAB231_P0016_ResourceSharing_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LAB231_P0016_ResourceSharing].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET ARITHABORT OFF 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET  MULTI_USER 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET QUERY_STORE = OFF
GO
USE [LAB231_P0016_ResourceSharing]
GO
/****** Object:  Table [dbo].[booking]    Script Date: 5/30/2021 11:26:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booking](
	[bookingID] [nvarchar](50) NOT NULL,
	[userID] [nvarchar](200) NULL,
	[timOfCreate] [datetime] NULL,
	[timeOfConfirm] [datetime] NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_booking] PRIMARY KEY CLUSTERED 
(
	[bookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bookingDetail]    Script Date: 5/30/2021 11:26:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bookingDetail](
	[bookingDetailsID] [nvarchar](50) NOT NULL,
	[bookingID] [nvarchar](50) NULL,
	[itemID] [nvarchar](100) NULL,
	[itemName] [nvarchar](200) NULL,
	[quantity] [int] NULL,
	[imgUrl] [nvarchar](200) NULL,
	[dateBegin] [date] NULL,
	[dateEnd] [date] NULL,
 CONSTRAINT [PK_bookingDetail] PRIMARY KEY CLUSTERED 
(
	[bookingDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bookingStatus]    Script Date: 5/30/2021 11:26:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bookingStatus](
	[bookingStatusID] [nvarchar](50) NOT NULL,
	[bookingStatusName] [nvarchar](50) NULL,
 CONSTRAINT [PK_bookingStatus] PRIMARY KEY CLUSTERED 
(
	[bookingStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 5/30/2021 11:26:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[cateID] [nvarchar](100) NOT NULL,
	[cateName] [nvarchar](200) NULL,
	[status] [nvarchar](50) NULL,
	[roleBorrow] [nvarchar](50) NULL,
	[description] [nvarchar](100) NULL,
 CONSTRAINT [PK_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[cateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[colorItems]    Script Date: 5/30/2021 11:26:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[colorItems](
	[colorID] [nvarchar](50) NOT NULL,
	[colorName] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
	[description] [nvarchar](200) NULL,
 CONSTRAINT [PK_colorItems] PRIMARY KEY CLUSTERED 
(
	[colorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[item]    Script Date: 5/30/2021 11:26:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item](
	[itemID] [nvarchar](100) NOT NULL,
	[itemName] [nvarchar](200) NULL,
	[colorID] [nvarchar](50) NULL,
	[cateID] [nvarchar](100) NULL,
	[quantity] [int] NULL,
	[dateOfPost] [date] NULL,
	[status] [nvarchar](50) NULL,
	[imgUrl] [nvarchar](200) NULL,
 CONSTRAINT [PK_item] PRIMARY KEY CLUSTERED 
(
	[itemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roleUser]    Script Date: 5/30/2021 11:26:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roleUser](
	[roleID] [nvarchar](50) NOT NULL,
	[roleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_roleUser] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 5/30/2021 11:26:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[userID] [nvarchar](200) NOT NULL,
	[password] [nvarchar](50) NULL,
	[fullname] [nvarchar](100) NULL,
	[address] [nvarchar](300) NULL,
	[phoneNumber] [nvarchar](20) NULL,
	[createDate] [datetime] NULL,
	[roleID] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622082317636', N'phucdo2601@gmail.com', CAST(N'2021-05-27T09:25:17.637' AS DateTime), CAST(N'2021-05-27T10:29:04.583' AS DateTime), N'inActive')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622082384196', N'phucdo2601@gmail.com', CAST(N'2021-05-27T09:26:24.197' AS DateTime), CAST(N'2021-05-30T22:55:54.110' AS DateTime), N'Delete')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622082444616', N'phucdo2601@gmail.com', CAST(N'2021-05-27T09:27:24.617' AS DateTime), CAST(N'2021-05-27T19:02:14.143' AS DateTime), N'Returned')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622082539569', N'phucdo2601@gmail.com', CAST(N'2021-05-27T09:28:59.570' AS DateTime), CAST(N'2021-05-27T10:03:22.290' AS DateTime), N'Delete')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622082711565', N'phucdo2601@gmail.com', CAST(N'2021-05-27T09:31:51.567' AS DateTime), CAST(N'2021-05-29T22:30:12.873' AS DateTime), N'Accept')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622082859582', N'phucdo2601@gmail.com', CAST(N'2021-05-27T09:34:19.583' AS DateTime), CAST(N'2021-05-27T10:31:15.067' AS DateTime), N'inActive')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622082932970', N'phucdo2601@gmail.com', CAST(N'2021-05-27T09:35:32.970' AS DateTime), NULL, N'New')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622083065516', N'phucdo2601@gmail.com', CAST(N'2021-05-27T09:37:45.517' AS DateTime), CAST(N'2021-05-30T23:08:53.337' AS DateTime), N'inActive')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622083139231', N'phucdo2601@gmail.com', CAST(N'2021-05-27T09:38:59.230' AS DateTime), CAST(N'2021-05-27T16:22:40.823' AS DateTime), N'Accept')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622083197726', N'phucdo2601@gmail.com', CAST(N'2021-05-27T09:39:57.727' AS DateTime), CAST(N'2021-05-30T23:09:21.630' AS DateTime), N'Returned')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622083235833', N'phucdo2601@gmail.com', CAST(N'2021-05-27T09:40:35.833' AS DateTime), CAST(N'2021-05-27T10:04:16.357' AS DateTime), N'Delete')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622083295166', N'phucdo2601@gmail.com', CAST(N'2021-05-27T09:41:35.167' AS DateTime), NULL, N'New')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622083354313', N'phucdo2601@gmail.com', CAST(N'2021-05-27T09:42:34.313' AS DateTime), CAST(N'2021-05-27T10:03:35.540' AS DateTime), N'Accept')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622083412091', N'phucdo2601@gmail.com', CAST(N'2021-05-27T09:43:32.090' AS DateTime), CAST(N'2021-05-27T10:03:38.660' AS DateTime), N'Delete')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622083461460', N'phucdo2601@gmail.com', CAST(N'2021-05-27T09:44:21.460' AS DateTime), CAST(N'2021-05-30T22:53:36.700' AS DateTime), N'Accept')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622083535206', N'ngocphucdo2601@gmail.com', CAST(N'2021-05-27T09:45:35.207' AS DateTime), CAST(N'2021-05-27T10:03:18.797' AS DateTime), N'Delete')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622083590820', N'ngocphucdo2601@gmail.com', CAST(N'2021-05-27T09:46:30.820' AS DateTime), CAST(N'2021-05-29T22:30:18.507' AS DateTime), N'Delete')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622083720980', N'ngocphucdo2601@gmail.com', CAST(N'2021-05-27T09:48:40.980' AS DateTime), CAST(N'2021-05-27T10:02:59.633' AS DateTime), N'Accept')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622083768731', N'ngocphucdo2601@gmail.com', CAST(N'2021-05-27T09:49:28.730' AS DateTime), CAST(N'2021-05-27T16:25:56.383' AS DateTime), N'Accept')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622083808638', N'ngocphucdo2601@gmail.com', CAST(N'2021-05-27T09:50:08.637' AS DateTime), CAST(N'2021-05-27T10:04:08.407' AS DateTime), N'Accept')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622084509418', N'ngocphucdo2601@gmail.com', CAST(N'2021-05-27T10:01:49.417' AS DateTime), NULL, N'New')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622117105413', N'ngocphucdo2601@gmail.com', CAST(N'2021-05-27T19:05:05.413' AS DateTime), CAST(N'2021-05-27T19:06:58.943' AS DateTime), N'Accept')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622117171948', N'ngocphucdo2601@gmail.com', CAST(N'2021-05-27T19:06:11.947' AS DateTime), CAST(N'2021-05-27T19:07:04.587' AS DateTime), N'Delete')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622302376489', N'ngocphucdo2601@gmail.com', CAST(N'2021-05-29T22:32:56.490' AS DateTime), NULL, N'New')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622302445464', N'ngocphucdo2601@gmail.com', CAST(N'2021-05-29T22:34:05.463' AS DateTime), NULL, N'New')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622304219654', N'ngocphucdo2601@gmail.com', CAST(N'2021-05-29T23:03:39.653' AS DateTime), NULL, N'New')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622304349472', N'ngocphucdo2601@gmail.com', CAST(N'2021-05-29T23:05:49.473' AS DateTime), NULL, N'New')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622304446957', N'ngocphucdo2601@gmail.com', CAST(N'2021-05-29T23:07:26.957' AS DateTime), NULL, N'New')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622305082422', N'phucdo2601@gmail.com', CAST(N'2021-05-29T23:18:02.423' AS DateTime), NULL, N'New')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622390418666', N'phucdo2601@gmail.com', CAST(N'2021-05-30T23:00:18.667' AS DateTime), NULL, N'New')
INSERT [dbo].[booking] ([bookingID], [userID], [timOfCreate], [timeOfConfirm], [status]) VALUES (N'OB1622390518063', N'phucdo2601@gmail.com', CAST(N'2021-05-30T23:01:58.063' AS DateTime), NULL, N'New')
GO
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100001-1415098318', N'OB1622082539569', N'SP100001', N'But Bi Thien Long Do', 2, N'https://product.hstatic.net/1000230347/product/but_bi_thien_long_tl-027__2_.jpg', CAST(N'2021-05-29' AS Date), CAST(N'2021-06-10' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100002-1193418233', N'OB1622304219654', N'SP100002', N'But Bi Thien Long Xanh', 2, N'https://product.hstatic.net/1000230347/product/but_bi_thien_long_tl-027__1_.jpg', CAST(N'2021-05-29' AS Date), CAST(N'2021-06-06' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100002-1195261398', N'OB1622302376489', N'SP100002', N'But Bi Thien Long Xanh', 5, N'https://product.hstatic.net/1000230347/product/but_bi_thien_long_tl-027__1_.jpg', CAST(N'2021-05-29' AS Date), CAST(N'2021-06-05' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100003-1192555465', N'OB1622305082422', N'SP100003', N'But Bi Thien Long Den', 2, N'https://product.hstatic.net/1000230347/product/but_bi_thien_long_tl-027__3_.jpg', CAST(N'2021-05-29' AS Date), CAST(N'2021-06-06' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100003-1195192423', N'OB1622302445464', N'SP100003', N'But Bi Thien Long Den', 3, N'https://product.hstatic.net/1000230347/product/but_bi_thien_long_tl-027__3_.jpg', CAST(N'2021-05-30' AS Date), CAST(N'2021-06-06' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100003-1415320250', N'OB1622082317636', N'SP100003', N'But Bi Thien Long Den', 1, N'https://product.hstatic.net/1000230347/product/but_bi_thien_long_tl-027__3_.jpg', CAST(N'2021-05-28' AS Date), CAST(N'2021-06-10' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100006-1193288414', N'OB1622304349472', N'SP100006', N'But Bi Nuoc A-Start Mau Xanh', 3, N'https://salt.tikicdn.com/cache/280x280/media/catalog/product//2/-/2-002.u5567.d20170911.t111128.738873.jpg', CAST(N'2021-05-30' AS Date), CAST(N'2021-06-06' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100006-1195192422', N'OB1622302445464', N'SP100006', N'But Bi Nuoc A-Start Mau Xanh', 3, N'https://salt.tikicdn.com/cache/280x280/media/catalog/product//2/-/2-002.u5567.d20170911.t111128.738873.jpg', CAST(N'2021-05-30' AS Date), CAST(N'2021-06-06' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100008-1413829249', N'OB1622083808638', N'SP100008', N'But Bi Nuoc A-Start Vàng ', 2, N'https://salt.tikicdn.com/cache/280x280/media/catalog/product//2/-/2-002.u5567.d20170911.t111128.738873.jpg', CAST(N'2021-05-27' AS Date), CAST(N'2021-05-30' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100008-1414047066', N'OB1622083590820', N'SP100008', N'But Bi Nuoc A-Start Vàng ', 1, N'https://salt.tikicdn.com/cache/280x280/media/catalog/product//2/-/2-002.u5567.d20170911.t111128.738873.jpg', CAST(N'2021-05-27' AS Date), CAST(N'2021-06-06' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100009-1107219220', N'OB1622390418666', N'SP100009', N'But Bi Nuoc A-Start Xanh Lá', 4, N'https://salt.tikicdn.com/cache/280x280/media/catalog/product//2/-/2-002.u5567.d20170911.t111128.738873.jpg', CAST(N'2021-05-30' AS Date), CAST(N'2021-07-02' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100009-1414342721', N'OB1622083295166', N'SP100009', N'But Bi Nuoc A-Start Xanh Lá', 2, N'https://salt.tikicdn.com/cache/280x280/media/catalog/product//2/-/2-002.u5567.d20170911.t111128.738873.jpg', CAST(N'2021-05-27' AS Date), CAST(N'2021-05-27' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100009-1414572370', N'OB1622083065516', N'SP100009', N'But Bi Nuoc A-Start Xanh Lá', 2, N'https://salt.tikicdn.com/cache/280x280/media/catalog/product//2/-/2-002.u5567.d20170911.t111128.738873.jpg', CAST(N'2021-05-27' AS Date), CAST(N'2021-06-10' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100009-1414926322', N'OB1622082711565', N'SP100009', N'But Bi Nuoc A-Start Xanh Lá', 7, N'https://salt.tikicdn.com/cache/280x280/media/catalog/product//2/-/2-002.u5567.d20170911.t111128.738873.jpg', CAST(N'2021-05-28' AS Date), CAST(N'2021-06-11' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100010-1192555464', N'OB1622305082422', N'SP100010', N'But Bi Nuoc A-Start Cam', 4, N'https://salt.tikicdn.com/cache/280x280/media/catalog/product//2/-/2-002.u5567.d20170911.t111128.738873.jpg', CAST(N'2021-05-29' AS Date), CAST(N'2021-06-06' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100010-1414102681', N'OB1622083535206', N'SP100010', N'But Bi Nuoc A-Start Cam', 2, N'https://salt.tikicdn.com/cache/280x280/media/catalog/product//2/-/2-002.u5567.d20170911.t111128.738873.jpg', CAST(N'2021-05-27' AS Date), CAST(N'2021-05-28' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100010-1414704917', N'OB1622082932970', N'SP100010', N'But Bi Nuoc A-Start Cam', 3, N'https://salt.tikicdn.com/cache/280x280/media/catalog/product//2/-/2-002.u5567.d20170911.t111128.738873.jpg', CAST(N'2021-05-27' AS Date), CAST(N'2021-05-28' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100012-1107219221', N'OB1622390418666', N'SP100012', N'May Chieu', 1, N'https://hanoicomputercdn.com/media/product/54681_may_chieu_acer_x118hp__1_.jpg', CAST(N'2021-05-30' AS Date), CAST(N'2021-07-02' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100012-1193288415', N'OB1622304349472', N'SP100012', N'May Chieu', 3, N'https://hanoicomputercdn.com/media/product/54681_may_chieu_acer_x118hp__1_.jpg', CAST(N'2021-05-30' AS Date), CAST(N'2021-06-06' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100012-1380532474', N'OB1622117105413', N'SP100012', N'May Chieu', 1, N'https://hanoicomputercdn.com/media/product/54681_may_chieu_acer_x118hp__1_.jpg', CAST(N'2021-05-28' AS Date), CAST(N'2021-06-11' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100012-1415253691', N'OB1622082384196', N'SP100012', N'May Chieu', 4, N'https://hanoicomputercdn.com/media/product/54681_may_chieu_acer_x118hp__1_.jpg', CAST(N'2021-05-28' AS Date), CAST(N'2021-06-06' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100012-1415320251', N'OB1622082317636', N'SP100012', N'May Chieu', 1, N'https://hanoicomputercdn.com/media/product/54681_may_chieu_acer_x118hp__1_.jpg', CAST(N'2021-05-28' AS Date), CAST(N'2021-06-10' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100013-1107119824', N'OB1622390518063', N'SP100013', N'May Quat', 2, N'https://i-shop.vnecdn.net/resize/560/560/images/2021/04/03/6067f3e999450-DH1600.jpg', CAST(N'2021-05-30' AS Date), CAST(N'2021-07-01' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100013-1193190930', N'OB1622304446957', N'SP100013', N'May Quat', 1, N'https://i-shop.vnecdn.net/resize/560/560/images/2021/04/03/6067f3e999450-DH1600.jpg', CAST(N'2021-05-30' AS Date), CAST(N'2021-06-06' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100013-1195261397', N'OB1622302376489', N'SP100013', N'May Quat', 5, N'https://i-shop.vnecdn.net/resize/560/560/images/2021/04/03/6067f3e999450-DH1600.jpg', CAST(N'2021-05-29' AS Date), CAST(N'2021-06-05' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100013-1380532473', N'OB1622117105413', N'SP100013', N'May Quat', 1, N'https://i-shop.vnecdn.net/resize/560/560/images/2021/04/03/6067f3e999450-DH1600.jpg', CAST(N'2021-05-28' AS Date), CAST(N'2021-06-11' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100014-1414047067', N'OB1622083590820', N'SP100014', N'Man Hinh LCD SamSung', 1, N'https://hailocvn.com/wp-content/uploads/2019/04/man-hinh-lcd.jpg', CAST(N'2021-05-27' AS Date), CAST(N'2021-06-06' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100014-1414225796', N'OB1622083412091', N'SP100014', N'Man Hinh LCD SamSung', 2, N'https://hailocvn.com/wp-content/uploads/2019/04/man-hinh-lcd.jpg', CAST(N'2021-05-27' AS Date), CAST(N'2021-06-11' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100015-1107119823', N'OB1622390518063', N'SP100015', N'Man Hinh LCD LG', 1, N'https://lh3.googleusercontent.com/CBDTkJKuIRSXe0wFFu7qTWE0RnNJ5hYOdTPjHTyDtJd46Rt3FnszjTEkxMxUbkbmQ3B68_kvl6hTw5Dv9KE', CAST(N'2021-05-30' AS Date), CAST(N'2021-07-01' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100015-1380465938', N'OB1622117171948', N'SP100015', N'Man Hinh LCD LG', 3, N'https://lh3.googleusercontent.com/CBDTkJKuIRSXe0wFFu7qTWE0RnNJ5hYOdTPjHTyDtJd46Rt3FnszjTEkxMxUbkbmQ3B68_kvl6hTw5Dv9KE', CAST(N'2021-05-28' AS Date), CAST(N'2021-06-11' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100015-1414498656', N'OB1622083139231', N'SP100015', N'Man Hinh LCD LG', 3, N'https://lh3.googleusercontent.com/CBDTkJKuIRSXe0wFFu7qTWE0RnNJ5hYOdTPjHTyDtJd46Rt3FnszjTEkxMxUbkbmQ3B68_kvl6hTw5Dv9KE', CAST(N'2021-05-27' AS Date), CAST(N'2021-05-31' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100016-1195261396', N'OB1622302376489', N'SP100016', N'Ho so Noi Bo 2010', 5, N'https://jobsgo.vn/blog/wp-content/uploads/2019/05/sai-lam-khi-nop-ho-so-xin-viec-2.jpg', CAST(N'2021-05-29' AS Date), CAST(N'2021-06-05' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100016-1413869156', N'OB1622083768731', N'SP100016', N'Ho so Noi Bo 2010', 1, N'https://jobsgo.vn/blog/wp-content/uploads/2019/05/sai-lam-khi-nop-ho-so-xin-viec-2.jpg', CAST(N'2021-05-27' AS Date), CAST(N'2021-06-01' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100017-1193190929', N'OB1622304446957', N'SP100017', N'Ghe Nhua', 1, N'https://nhua66a.com/wp-content/uploads/2019/03/ghe-dua-soc-ngang-1.jpg', CAST(N'2021-05-30' AS Date), CAST(N'2021-06-06' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100017-1414342720', N'OB1622083295166', N'SP100017', N'Ghe Nhua', 2, N'https://nhua66a.com/wp-content/uploads/2019/03/ghe-dua-soc-ngang-1.jpg', CAST(N'2021-05-27' AS Date), CAST(N'2021-05-27' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100017-1414778304', N'OB1622082859582', N'SP100017', N'Ghe Nhua', 2, N'https://nhua66a.com/wp-content/uploads/2019/03/ghe-dua-soc-ngang-1.jpg', CAST(N'2021-05-27' AS Date), CAST(N'2021-06-28' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100018-1192555463', N'OB1622305082422', N'SP100018', N'Ghe Tua', 3, N'https://nhuathaonguyen.com/wp-content/uploads/2019/10/Gh%E1%BA%BF-nh%E1%BB%B1a-PARIS-c%C3%B3-tay-3-510x510-1.jpg', CAST(N'2021-05-29' AS Date), CAST(N'2021-06-06' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100018-1414176427', N'OB1622083461460', N'SP100018', N'Ghe Tua', 2, N'https://nhuathaonguyen.com/wp-content/uploads/2019/10/Gh%E1%BA%BF-nh%E1%BB%B1a-PARIS-c%C3%B3-tay-3-510x510-1.jpg', CAST(N'2021-05-28' AS Date), CAST(N'2021-07-27' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100018-1414440161', N'OB1622083197726', N'SP100018', N'Ghe Tua', 2, N'https://nhuathaonguyen.com/wp-content/uploads/2019/10/Gh%E1%BA%BF-nh%E1%BB%B1a-PARIS-c%C3%B3-tay-3-510x510-1.jpg', CAST(N'2021-05-27' AS Date), CAST(N'2021-05-27' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100019-1380465939', N'OB1622117171948', N'SP100019', N'Ghe Van Phong Cao Cap A250', 3, N'https://hoaphatmiennam.vn/wp-content/uploads/2017/12/ghe-xoay-van-phong-cao-cap-F304A02.jpg', CAST(N'2021-05-28' AS Date), CAST(N'2021-06-11' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100019-1380532472', N'OB1622117105413', N'SP100019', N'Ghe Van Phong Cao Cap A250', 1, N'https://hoaphatmiennam.vn/wp-content/uploads/2017/12/ghe-xoay-van-phong-cao-cap-F304A02.jpg', CAST(N'2021-05-28' AS Date), CAST(N'2021-06-11' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP100019-1415193271', N'OB1622082444616', N'SP100019', N'Ghe Van Phong Cao Cap A250', 4, N'https://hoaphatmiennam.vn/wp-content/uploads/2017/12/ghe-xoay-van-phong-cao-cap-F304A02.jpg', CAST(N'2021-05-28' AS Date), CAST(N'2021-06-10' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP110001-1413128469', N'OB1622084509418', N'SP110001', N'Giay A4 A-One', 2, N'https://cf.shopee.vn/file/99638d186e3040aba1a76513285590d4', CAST(N'2021-05-28' AS Date), CAST(N'2021-06-06' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP110001-1414402054', N'OB1622083235833', N'SP110001', N'Giay A4 A-One', 2, N'https://cf.shopee.vn/file/99638d186e3040aba1a76513285590d4', CAST(N'2021-05-27' AS Date), CAST(N'2021-06-01' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP110001-1414572371', N'OB1622083065516', N'SP110001', N'Giay A4 A-One', 2, N'https://cf.shopee.vn/file/99638d186e3040aba1a76513285590d4', CAST(N'2021-05-27' AS Date), CAST(N'2021-06-10' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP110002-1413916907', N'OB1622083720980', N'SP110002', N'Giay A4 @-Blank', 2, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9tUe-5aJa8lDOeNZRijPNWoIScPi4GpdlXQ&usqp=CAU', CAST(N'2021-05-27' AS Date), CAST(N'2021-05-27' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP110002-1414283574', N'OB1622083354313', N'SP110002', N'Giay A4 @-Blank', 2, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9tUe-5aJa8lDOeNZRijPNWoIScPi4GpdlXQ&usqp=CAU', CAST(N'2021-05-28' AS Date), CAST(N'2021-05-30' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP110002-1414778305', N'OB1622082859582', N'SP110002', N'Giay A4 @-Blank', 2, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9tUe-5aJa8lDOeNZRijPNWoIScPi4GpdlXQ&usqp=CAU', CAST(N'2021-05-27' AS Date), CAST(N'2021-06-28' AS Date))
INSERT [dbo].[bookingDetail] ([bookingDetailsID], [bookingID], [itemID], [itemName], [quantity], [imgUrl], [dateBegin], [dateEnd]) VALUES (N'STKSP110002-1415098317', N'OB1622082539569', N'SP110002', N'Giay A4 @-Blank', 2, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9tUe-5aJa8lDOeNZRijPNWoIScPi4GpdlXQ&usqp=CAU', CAST(N'2021-05-29' AS Date), CAST(N'2021-06-10' AS Date))
GO
INSERT [dbo].[bookingStatus] ([bookingStatusID], [bookingStatusName]) VALUES (N'Accept', N'Admin Approval')
INSERT [dbo].[bookingStatus] ([bookingStatusID], [bookingStatusName]) VALUES (N'Delete', N'Admin Rejected')
INSERT [dbo].[bookingStatus] ([bookingStatusID], [bookingStatusName]) VALUES (N'inActive', N'General User Delete in History')
INSERT [dbo].[bookingStatus] ([bookingStatusID], [bookingStatusName]) VALUES (N'New', N'New Confirm')
INSERT [dbo].[bookingStatus] ([bookingStatusID], [bookingStatusName]) VALUES (N'Returned', N'General User returns items')
GO
INSERT [dbo].[category] ([cateID], [cateName], [status], [roleBorrow], [description]) VALUES (N'CT01', N'Van Phong Pham', N'Active', N'All ', NULL)
INSERT [dbo].[category] ([cateID], [cateName], [status], [roleBorrow], [description]) VALUES (N'CT02', N'Thiet bi Ho Tro', N'Active', N'All', NULL)
INSERT [dbo].[category] ([cateID], [cateName], [status], [roleBorrow], [description]) VALUES (N'CT03', N'Ho So Chung ', N'Active', N'All', NULL)
INSERT [dbo].[category] ([cateID], [cateName], [status], [roleBorrow], [description]) VALUES (N'CT04', N'Hoi So Noi Bo', N'Active', N'Lead', NULL)
INSERT [dbo].[category] ([cateID], [cateName], [status], [roleBorrow], [description]) VALUES (N'CT05', N'Dia Diem', N'Active', N'All', NULL)
GO
INSERT [dbo].[colorItems] ([colorID], [colorName], [status], [description]) VALUES (N'CL0001', N'Red', N'Active', NULL)
INSERT [dbo].[colorItems] ([colorID], [colorName], [status], [description]) VALUES (N'CL0002', N'Blue', N'Active', NULL)
INSERT [dbo].[colorItems] ([colorID], [colorName], [status], [description]) VALUES (N'CL0003', N'Black', N'Active', NULL)
INSERT [dbo].[colorItems] ([colorID], [colorName], [status], [description]) VALUES (N'CL0004', N'Yellow', N'Active', NULL)
INSERT [dbo].[colorItems] ([colorID], [colorName], [status], [description]) VALUES (N'CL0005', N'White', N'Active', NULL)
INSERT [dbo].[colorItems] ([colorID], [colorName], [status], [description]) VALUES (N'CL0006', N'Green', N'Active', NULL)
INSERT [dbo].[colorItems] ([colorID], [colorName], [status], [description]) VALUES (N'CL0007', N'Orange', N'Active', NULL)
INSERT [dbo].[colorItems] ([colorID], [colorName], [status], [description]) VALUES (N'CL0008', N'Pink', N'Active', NULL)
INSERT [dbo].[colorItems] ([colorID], [colorName], [status], [description]) VALUES (N'CL0009', N'Gray', N'Active', NULL)
INSERT [dbo].[colorItems] ([colorID], [colorName], [status], [description]) VALUES (N'CL0010', N'Grown', N'Active', NULL)
INSERT [dbo].[colorItems] ([colorID], [colorName], [status], [description]) VALUES (N'CL0011', N'Violet', N'Active', NULL)
INSERT [dbo].[colorItems] ([colorID], [colorName], [status], [description]) VALUES (N'CL0012', N'Turquoise', N'Active', NULL)
INSERT [dbo].[colorItems] ([colorID], [colorName], [status], [description]) VALUES (N'CL0013', N'Dark Green', N'Active', NULL)
INSERT [dbo].[colorItems] ([colorID], [colorName], [status], [description]) VALUES (N'CL0014', N'Purple', N'Active', NULL)
INSERT [dbo].[colorItems] ([colorID], [colorName], [status], [description]) VALUES (N'CL0015', N'Navy', N'Active', NULL)
INSERT [dbo].[colorItems] ([colorID], [colorName], [status], [description]) VALUES (N'CL0016', N'Avocado', N'Active', NULL)
INSERT [dbo].[colorItems] ([colorID], [colorName], [status], [description]) VALUES (N'CL0017', N'Limon', N'Active', NULL)
INSERT [dbo].[colorItems] ([colorID], [colorName], [status], [description]) VALUES (N'CL0018', N'Chlorophyll', N'Active', NULL)
INSERT [dbo].[colorItems] ([colorID], [colorName], [status], [description]) VALUES (N'CL0019', N'Sky', N'Active', NULL)
INSERT [dbo].[colorItems] ([colorID], [colorName], [status], [description]) VALUES (N'CL0020', N'Bright blue', N'Active', NULL)
INSERT [dbo].[colorItems] ([colorID], [colorName], [status], [description]) VALUES (N'CL0021', N'Bright green', N'Active', NULL)
INSERT [dbo].[colorItems] ([colorID], [colorName], [status], [description]) VALUES (N'CL0022', N'Light green', N'Active', NULL)
INSERT [dbo].[colorItems] ([colorID], [colorName], [status], [description]) VALUES (N'CL0023', N'Light blue', N'Active', NULL)
INSERT [dbo].[colorItems] ([colorID], [colorName], [status], [description]) VALUES (N'CL0024', N'Dark blue', N'Active', NULL)
INSERT [dbo].[colorItems] ([colorID], [colorName], [status], [description]) VALUES (N'CL0025', N'Eggplant', N'Active', NULL)
INSERT [dbo].[colorItems] ([colorID], [colorName], [status], [description]) VALUES (N'CL0026', N'Plum', N'Active', NULL)
GO
INSERT [dbo].[item] ([itemID], [itemName], [colorID], [cateID], [quantity], [dateOfPost], [status], [imgUrl]) VALUES (N'SP100001', N'But Bi Thien Long Do', N'CL0001', N'CT01', 997, CAST(N'2020-10-21' AS Date), N'ALL', N'https://product.hstatic.net/1000230347/product/but_bi_thien_long_tl-027__2_.jpg')
INSERT [dbo].[item] ([itemID], [itemName], [colorID], [cateID], [quantity], [dateOfPost], [status], [imgUrl]) VALUES (N'SP100002', N'But Bi Thien Long Xanh', N'CL0002', N'CT01', 1000, CAST(N'2020-10-20' AS Date), N'ALL', N'https://product.hstatic.net/1000230347/product/but_bi_thien_long_tl-027__1_.jpg')
INSERT [dbo].[item] ([itemID], [itemName], [colorID], [cateID], [quantity], [dateOfPost], [status], [imgUrl]) VALUES (N'SP100003', N'But Bi Thien Long Den', N'CL0003', N'CT01', 1010, CAST(N'2021-04-23' AS Date), N'ALL', N'https://product.hstatic.net/1000230347/product/but_bi_thien_long_tl-027__3_.jpg')
INSERT [dbo].[item] ([itemID], [itemName], [colorID], [cateID], [quantity], [dateOfPost], [status], [imgUrl]) VALUES (N'SP100004', N'But Bi Thien Long Vang', N'CL0004', N'CT01', 1003, CAST(N'2021-04-20' AS Date), N'ALL', N'https://product.hstatic.net/1000230347/product/but_bi_thien_long_tl-027__4_.jpg')
INSERT [dbo].[item] ([itemID], [itemName], [colorID], [cateID], [quantity], [dateOfPost], [status], [imgUrl]) VALUES (N'SP100005', N'But Bi Nuoc A-Start Do', N'CL0001', N'CT01', 1000, CAST(N'2021-02-21' AS Date), N'ALL', N'https://salt.tikicdn.com/cache/280x280/media/catalog/product//2/-/2-002.u5567.d20170911.t111128.738873.jpg')
INSERT [dbo].[item] ([itemID], [itemName], [colorID], [cateID], [quantity], [dateOfPost], [status], [imgUrl]) VALUES (N'SP100006', N'But Bi Nuoc A-Start Mau Xanh', N'CL0002', N'CT01', 1000, CAST(N'2021-01-19' AS Date), N'ALL', N'https://salt.tikicdn.com/cache/280x280/media/catalog/product//2/-/2-002.u5567.d20170911.t111128.738873.jpg')
INSERT [dbo].[item] ([itemID], [itemName], [colorID], [cateID], [quantity], [dateOfPost], [status], [imgUrl]) VALUES (N'SP100007', N'Bút Bi nước A-Start Đen', N'CL0003', N'CT01', 1000, CAST(N'2019-11-18' AS Date), N'ALL', N'https://salt.tikicdn.com/cache/280x280/media/catalog/product//2/-/2-002.u5567.d20170911.t111128.738873.jpg')
INSERT [dbo].[item] ([itemID], [itemName], [colorID], [cateID], [quantity], [dateOfPost], [status], [imgUrl]) VALUES (N'SP100008', N'But Bi Nuoc A-Start Vàng ', N'CL0004', N'CT01', 992, CAST(N'2019-10-04' AS Date), N'ALL', N'https://salt.tikicdn.com/cache/280x280/media/catalog/product//2/-/2-002.u5567.d20170911.t111128.738873.jpg')
INSERT [dbo].[item] ([itemID], [itemName], [colorID], [cateID], [quantity], [dateOfPost], [status], [imgUrl]) VALUES (N'SP100009', N'But Bi Nuoc A-Start Xanh Lá', N'CL0006', N'CT01', 993, CAST(N'2019-11-05' AS Date), N'ALL', N'https://salt.tikicdn.com/cache/280x280/media/catalog/product//2/-/2-002.u5567.d20170911.t111128.738873.jpg')
INSERT [dbo].[item] ([itemID], [itemName], [colorID], [cateID], [quantity], [dateOfPost], [status], [imgUrl]) VALUES (N'SP100010', N'But Bi Nuoc A-Start Cam', N'CL0007', N'CT01', 1000, CAST(N'2020-12-05' AS Date), N'ALL', N'https://salt.tikicdn.com/cache/280x280/media/catalog/product//2/-/2-002.u5567.d20170911.t111128.738873.jpg')
INSERT [dbo].[item] ([itemID], [itemName], [colorID], [cateID], [quantity], [dateOfPost], [status], [imgUrl]) VALUES (N'SP100012', N'May Chieu', N'CL0005', N'CT02', 97, CAST(N'2020-12-06' AS Date), N'ALL', N'https://hanoicomputercdn.com/media/product/54681_may_chieu_acer_x118hp__1_.jpg')
INSERT [dbo].[item] ([itemID], [itemName], [colorID], [cateID], [quantity], [dateOfPost], [status], [imgUrl]) VALUES (N'SP100013', N'May Quat', N'CL0009', N'CT02', 104, CAST(N'2020-11-10' AS Date), N'ALL', N'https://i-shop.vnecdn.net/resize/560/560/images/2021/04/03/6067f3e999450-DH1600.jpg')
INSERT [dbo].[item] ([itemID], [itemName], [colorID], [cateID], [quantity], [dateOfPost], [status], [imgUrl]) VALUES (N'SP100014', N'Man Hinh LCD SamSung', N'CL0003', N'CT02', 400, CAST(N'2020-09-20' AS Date), N'ALL', N'https://hailocvn.com/wp-content/uploads/2019/04/man-hinh-lcd.jpg')
INSERT [dbo].[item] ([itemID], [itemName], [colorID], [cateID], [quantity], [dateOfPost], [status], [imgUrl]) VALUES (N'SP100015', N'Man Hinh LCD LG', N'CL0003', N'CT02', 297, CAST(N'2020-07-20' AS Date), N'ALL', N'https://lh3.googleusercontent.com/CBDTkJKuIRSXe0wFFu7qTWE0RnNJ5hYOdTPjHTyDtJd46Rt3FnszjTEkxMxUbkbmQ3B68_kvl6hTw5Dv9KE')
INSERT [dbo].[item] ([itemID], [itemName], [colorID], [cateID], [quantity], [dateOfPost], [status], [imgUrl]) VALUES (N'SP100016', N'Ho so Noi Bo 2010', N'CL0010', N'CT04', 147, CAST(N'2019-06-05' AS Date), N'OPT', N'https://jobsgo.vn/blog/wp-content/uploads/2019/05/sai-lam-khi-nop-ho-so-xin-viec-2.jpg')
INSERT [dbo].[item] ([itemID], [itemName], [colorID], [cateID], [quantity], [dateOfPost], [status], [imgUrl]) VALUES (N'SP100017', N'Ghe Nhua', N'CL0002', N'CT02', 502, CAST(N'2019-07-21' AS Date), N'ALL', N'https://nhua66a.com/wp-content/uploads/2019/03/ghe-dua-soc-ngang-1.jpg')
INSERT [dbo].[item] ([itemID], [itemName], [colorID], [cateID], [quantity], [dateOfPost], [status], [imgUrl]) VALUES (N'SP100018', N'Ghe Tua', N'CL0009', N'CT02', 398, CAST(N'2019-06-20' AS Date), N'ALL', N'https://nhuathaonguyen.com/wp-content/uploads/2019/10/Gh%E1%BA%BF-nh%E1%BB%B1a-PARIS-c%C3%B3-tay-3-510x510-1.jpg')
INSERT [dbo].[item] ([itemID], [itemName], [colorID], [cateID], [quantity], [dateOfPost], [status], [imgUrl]) VALUES (N'SP100019', N'Ghe Van Phong Cao Cap A250', N'CL0002', N'CT02', 319, CAST(N'2018-06-20' AS Date), N'ALL', N'https://hoaphatmiennam.vn/wp-content/uploads/2017/12/ghe-xoay-van-phong-cao-cap-F304A02.jpg')
INSERT [dbo].[item] ([itemID], [itemName], [colorID], [cateID], [quantity], [dateOfPost], [status], [imgUrl]) VALUES (N'SP110001', N'Giay A4 A-One', N'CL0005', N'CT01', 1000, CAST(N'2018-05-20' AS Date), N'ALL', N'https://cf.shopee.vn/file/99638d186e3040aba1a76513285590d4')
INSERT [dbo].[item] ([itemID], [itemName], [colorID], [cateID], [quantity], [dateOfPost], [status], [imgUrl]) VALUES (N'SP110002', N'Giay A4 @-Blank', N'CL0005', N'CT01', 994, CAST(N'2018-04-12' AS Date), N'ALL', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9tUe-5aJa8lDOeNZRijPNWoIScPi4GpdlXQ&usqp=CAU')
INSERT [dbo].[item] ([itemID], [itemName], [colorID], [cateID], [quantity], [dateOfPost], [status], [imgUrl]) VALUES (N'SP300001', N'Ho So Noi Bo 2015', N'CL0001', N'CT01', 149, CAST(N'2021-03-20' AS Date), N'OPT', N'https://cdn.123job.vn/123job/uploads/2020/09/20/2020_09_20______f33a63ee8e105f14ce567b6b2c47d422.jpg')
INSERT [dbo].[item] ([itemID], [itemName], [colorID], [cateID], [quantity], [dateOfPost], [status], [imgUrl]) VALUES (N'SP400001', N'Phong hop A01', N'CL0005', N'CT05', 5, CAST(N'2018-04-17' AS Date), N'ALL', N'https://phonghoitruong.com.vn/wp-content/uploads/2016/08/Phong-hop-nho.jpg')
GO
INSERT [dbo].[roleUser] ([roleID], [roleName]) VALUES (N'emp', N'employee')
INSERT [dbo].[roleUser] ([roleID], [roleName]) VALUES (N'ld', N'leader')
INSERT [dbo].[roleUser] ([roleID], [roleName]) VALUES (N'mng', N'manager')
GO
INSERT [dbo].[user] ([userID], [password], [fullname], [address], [phoneNumber], [createDate], [roleID], [status]) VALUES (N'lnslbscl3@gmail.com', N'123', N'Do Ngoc Phuc', N'Ho Chi Minh', N'0987215804', CAST(N'2021-05-12T18:50:15.150' AS DateTime), N'mng', N'Active')
INSERT [dbo].[user] ([userID], [password], [fullname], [address], [phoneNumber], [createDate], [roleID], [status]) VALUES (N'ngocphucdo2601@gmail.com', N'123', N'Do Ngoc Phuc', N'Binh Thanh, Thanh Pho Ho Chi Minh', N'0987215804', CAST(N'2021-05-20T00:00:00.000' AS DateTime), N'ld', N'Active')
INSERT [dbo].[user] ([userID], [password], [fullname], [address], [phoneNumber], [createDate], [roleID], [status]) VALUES (N'phucdo2601@gmail.com', N'123', N'Do Ngoc Phuc', N'72C/6 Dinh Tien Hoang, P.Đa Kao', N'7987987979', CAST(N'2021-05-15T18:16:38.513' AS DateTime), N'emp', N'Active')
GO
ALTER TABLE [dbo].[booking]  WITH CHECK ADD  CONSTRAINT [FK_booking_bookingStatus] FOREIGN KEY([status])
REFERENCES [dbo].[bookingStatus] ([bookingStatusID])
GO
ALTER TABLE [dbo].[booking] CHECK CONSTRAINT [FK_booking_bookingStatus]
GO
ALTER TABLE [dbo].[booking]  WITH CHECK ADD  CONSTRAINT [FK_booking_USER] FOREIGN KEY([userID])
REFERENCES [dbo].[user] ([userID])
GO
ALTER TABLE [dbo].[booking] CHECK CONSTRAINT [FK_booking_USER]
GO
ALTER TABLE [dbo].[bookingDetail]  WITH CHECK ADD  CONSTRAINT [FK_bookingDetail_booking] FOREIGN KEY([bookingID])
REFERENCES [dbo].[booking] ([bookingID])
GO
ALTER TABLE [dbo].[bookingDetail] CHECK CONSTRAINT [FK_bookingDetail_booking]
GO
ALTER TABLE [dbo].[bookingDetail]  WITH CHECK ADD  CONSTRAINT [FK_bookingDetail_item] FOREIGN KEY([itemID])
REFERENCES [dbo].[item] ([itemID])
GO
ALTER TABLE [dbo].[bookingDetail] CHECK CONSTRAINT [FK_bookingDetail_item]
GO
ALTER TABLE [dbo].[item]  WITH CHECK ADD  CONSTRAINT [FK_item_CATEGORY] FOREIGN KEY([cateID])
REFERENCES [dbo].[category] ([cateID])
GO
ALTER TABLE [dbo].[item] CHECK CONSTRAINT [FK_item_CATEGORY]
GO
ALTER TABLE [dbo].[item]  WITH CHECK ADD  CONSTRAINT [FK_item_colorItems] FOREIGN KEY([colorID])
REFERENCES [dbo].[colorItems] ([colorID])
GO
ALTER TABLE [dbo].[item] CHECK CONSTRAINT [FK_item_colorItems]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_roleUser] FOREIGN KEY([roleID])
REFERENCES [dbo].[roleUser] ([roleID])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_roleUser]
GO
USE [master]
GO
ALTER DATABASE [LAB231_P0016_ResourceSharing] SET  READ_WRITE 
GO
