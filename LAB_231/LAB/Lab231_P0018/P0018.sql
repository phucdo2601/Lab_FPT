USE [master]
GO
/****** Object:  Database [Lab231_P0018_BookStore]    Script Date: 6/22/2021 10:49:23 PM ******/
CREATE DATABASE [Lab231_P0018_BookStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Lab231_P0018_BookStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Lab231_P0018_BookStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Lab231_P0018_BookStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Lab231_P0018_BookStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Lab231_P0018_BookStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET  MULTI_USER 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET QUERY_STORE = OFF
GO
USE [Lab231_P0018_BookStore]
GO
/****** Object:  Table [dbo].[booking]    Script Date: 6/22/2021 10:49:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booking](
	[bookingID] [nvarchar](50) NOT NULL,
	[userID] [nvarchar](50) NULL,
	[fullname] [nvarchar](50) NULL,
	[phone] [nvarchar](20) NULL,
	[email] [nvarchar](50) NULL,
	[address] [nvarchar](200) NULL,
	[dateOfCreate] [date] NULL,
	[discountID] [nvarchar](50) NULL,
	[paymentMethod] [nvarchar](50) NULL,
	[subTotal] [float] NULL,
	[shipping] [float] NULL,
	[tax] [float] NULL,
	[total] [float] NULL,
	[status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_booking] PRIMARY KEY CLUSTERED 
(
	[bookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bookingDetails]    Script Date: 6/22/2021 10:49:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bookingDetails](
	[bookingDeID] [nvarchar](100) NOT NULL,
	[bookingID] [nvarchar](50) NULL,
	[itemID] [nvarchar](50) NULL,
	[itemName] [nvarchar](50) NULL,
	[imgUrl] [nvarchar](50) NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_bookingDetails] PRIMARY KEY CLUSTERED 
(
	[bookingDeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 6/22/2021 10:49:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[cateID] [nvarchar](50) NOT NULL,
	[cateName] [nvarchar](50) NULL,
	[dateOfCreate] [date] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[cateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discount]    Script Date: 6/22/2021 10:49:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discount](
	[discountID] [nvarchar](50) NOT NULL,
	[discountName] [nvarchar](50) NULL,
	[rateDis] [int] NULL,
	[isUsing] [bit] NULL,
	[isAddAcc] [bit] NULL,
	[dateOfCreate] [date] NULL,
	[userID] [nvarchar](50) NULL,
 CONSTRAINT [PK_discount] PRIMARY KEY CLUSTERED 
(
	[discountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[item]    Script Date: 6/22/2021 10:49:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item](
	[itemID] [nvarchar](50) NOT NULL,
	[itemName] [nvarchar](50) NULL,
	[author] [nvarchar](50) NULL,
	[cateID] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[imgUrl] [nvarchar](200) NULL,
	[price] [float] NULL,
	[dateOfCreate] [datetime] NULL,
	[description] [nvarchar](200) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_item] PRIMARY KEY CLUSTERED 
(
	[itemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roleUser]    Script Date: 6/22/2021 10:49:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roleUser](
	[roleID] [nvarchar](50) NOT NULL,
	[roleName] [nvarchar](50) NULL,
	[statusRole] [nvarchar](50) NULL,
 CONSTRAINT [PK_roleUser] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 6/22/2021 10:49:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[userID] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[fullname] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[address] [nvarchar](200) NULL,
	[roleID] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
	[dateOfCreate] [date] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[booking] ([bookingID], [userID], [fullname], [phone], [email], [address], [dateOfCreate], [discountID], [paymentMethod], [subTotal], [shipping], [tax], [total], [status]) VALUES (N'B1624367177164', N'phucThai2601', N'Thai Hoang Phuc', N'5768675445', N'phucdo2601@gmail.com', N'Go Vap, Ho Chi Minh', CAST(N'2021-06-22' AS Date), N'', N'rdCash', 150, 30, 15, 195, N'Finish')
INSERT [dbo].[booking] ([bookingID], [userID], [fullname], [phone], [email], [address], [dateOfCreate], [discountID], [paymentMethod], [subTotal], [shipping], [tax], [total], [status]) VALUES (N'B1624367944319', N'phucThai2601', N'Thai Hoang Phuc', N'5768675445', N'phucdo2601@gmail.com', N'Go Vap, Ho Chi Minh', CAST(N'2021-06-22' AS Date), N'dsc100003', N'rdPaypal', 27, 5.4, 2.7, 35.1, N'Finish')
INSERT [dbo].[booking] ([bookingID], [userID], [fullname], [phone], [email], [address], [dateOfCreate], [discountID], [paymentMethod], [subTotal], [shipping], [tax], [total], [status]) VALUES (N'B1624369245380', N'phucThai2601', N'Thai Hoang Phuc', N'5768675445', N'phucdo2601@gmail.com', N'Go Vap, Ho Chi Minh', CAST(N'2021-06-22' AS Date), N'dsc100001', N'rdPaypal', 30, 6, 3, 39, N'Finish')
INSERT [dbo].[booking] ([bookingID], [userID], [fullname], [phone], [email], [address], [dateOfCreate], [discountID], [paymentMethod], [subTotal], [shipping], [tax], [total], [status]) VALUES (N'B1624370817041', N'phucThai2601', N'Thai Hoang Phuc', N'5768675445', N'phucdo2601@gmail.com', N'Go Vap, Ho Chi Minh', CAST(N'2021-06-22' AS Date), N'dsc100009', N'rdPaypal', 73.5, 14.7, 7.35, 95.55, N'Waiting')
INSERT [dbo].[booking] ([bookingID], [userID], [fullname], [phone], [email], [address], [dateOfCreate], [discountID], [paymentMethod], [subTotal], [shipping], [tax], [total], [status]) VALUES (N'B1624371038762', N'phucThai2601', N'Thai Hoang Phuc', N'5768675445', N'phucdo2601@gmail.com', N'Go Vap, Ho Chi Minh', CAST(N'2021-06-22' AS Date), N'dsc100004', N'rdCash', 29, 5.8, 2.9, 37.699999999999996, N'Finish')
GO
INSERT [dbo].[bookingDetails] ([bookingDeID], [bookingID], [itemID], [itemName], [imgUrl], [quantity]) VALUES (N'STKBS100001869539278', N'B1624367177164', N'BS100001', N'

Foundations of Software Testing ISTQB', N'BS100001.jpg', 1)
INSERT [dbo].[bookingDetails] ([bookingDeID], [bookingID], [itemID], [itemName], [imgUrl], [quantity]) VALUES (N'STKBS100001871607494', N'B1624369245380', N'BS100001', N'

Foundations of Software Testing ISTQB', N'BS100001.jpg', 1)
INSERT [dbo].[bookingDetails] ([bookingDeID], [bookingID], [itemID], [itemName], [imgUrl], [quantity]) VALUES (N'STKBS100001873400876', N'B1624371038762', N'BS100001', N'

Foundations of Software Testing ISTQB', N'BS100001.jpg', 1)
INSERT [dbo].[bookingDetails] ([bookingDeID], [bookingID], [itemID], [itemName], [imgUrl], [quantity]) VALUES (N'STKBS100002869539277', N'B1624367177164', N'BS100002', N'Java Concurrency in Practice', N'BS100002.jpg', 1)
INSERT [dbo].[bookingDetails] ([bookingDeID], [bookingID], [itemID], [itemName], [imgUrl], [quantity]) VALUES (N'STKBS100002870306433', N'B1624367944319', N'BS100002', N'Java Concurrency in Practice', N'BS100002.jpg', 1)
INSERT [dbo].[bookingDetails] ([bookingDeID], [bookingID], [itemID], [itemName], [imgUrl], [quantity]) VALUES (N'STKBS100002871607493', N'B1624369245380', N'BS100002', N'Java Concurrency in Practice', N'BS100002.jpg', 1)
INSERT [dbo].[bookingDetails] ([bookingDeID], [bookingID], [itemID], [itemName], [imgUrl], [quantity]) VALUES (N'STKBS100006873179156', N'B1624370817041', N'BS100006', N'Software Requirements, 3rd Edition', N'BS100006.jpg', 1)
INSERT [dbo].[bookingDetails] ([bookingDeID], [bookingID], [itemID], [itemName], [imgUrl], [quantity]) VALUES (N'STKBS100009873179154', N'B1624370817041', N'BS100009', N'Thinking in Java (4th Edition)', N'BS100009.jpg', 1)
INSERT [dbo].[bookingDetails] ([bookingDeID], [bookingID], [itemID], [itemName], [imgUrl], [quantity]) VALUES (N'STKBS100010873400875', N'B1624371038762', N'BS100010', N'Head First PHP & MySQL', N'BS100010.jpg', 1)
INSERT [dbo].[bookingDetails] ([bookingDeID], [bookingID], [itemID], [itemName], [imgUrl], [quantity]) VALUES (N'STKBS100016870306434', N'B1624367944319', N'BS100016', N'Modern PHP: New Features and Good Practices', N'BS100016.jpg', 1)
INSERT [dbo].[bookingDetails] ([bookingDeID], [bookingID], [itemID], [itemName], [imgUrl], [quantity]) VALUES (N'STKBS100021870306432', N'B1624367944319', N'BS100021', N'Code Complete', N'BS100021.jpg', 1)
INSERT [dbo].[bookingDetails] ([bookingDeID], [bookingID], [itemID], [itemName], [imgUrl], [quantity]) VALUES (N'STKBS100024873179155', N'B1624370817041', N'BS100024', N'Writing Effective Use Cases', N'BS100024.jpg', 2)
GO
INSERT [dbo].[category] ([cateID], [cateName], [dateOfCreate], [status]) VALUES (N'C#', N'C Sharp', CAST(N'2021-06-12' AS Date), 1)
INSERT [dbo].[category] ([cateID], [cateName], [dateOfCreate], [status]) VALUES (N'java', N'Java', CAST(N'2021-06-12' AS Date), 1)
INSERT [dbo].[category] ([cateID], [cateName], [dateOfCreate], [status]) VALUES (N'PHP', N'Hypertext Preprocessor', CAST(N'2021-06-12' AS Date), 1)
INSERT [dbo].[category] ([cateID], [cateName], [dateOfCreate], [status]) VALUES (N'Python', N'Python', CAST(N'2021-06-12' AS Date), 1)
INSERT [dbo].[category] ([cateID], [cateName], [dateOfCreate], [status]) VALUES (N'req', N'Requirement', CAST(N'2021-06-12' AS Date), 1)
INSERT [dbo].[category] ([cateID], [cateName], [dateOfCreate], [status]) VALUES (N'se', N'Software engineer', CAST(N'2021-06-12' AS Date), 1)
INSERT [dbo].[category] ([cateID], [cateName], [dateOfCreate], [status]) VALUES (N'tt', N'Testing', CAST(N'2021-06-12' AS Date), 1)
GO
INSERT [dbo].[discount] ([discountID], [discountName], [rateDis], [isUsing], [isAddAcc], [dateOfCreate], [userID]) VALUES (N'dsc100001', NULL, 20, 1, 1, CAST(N'2021-06-12' AS Date), N'phucThai2601')
INSERT [dbo].[discount] ([discountID], [discountName], [rateDis], [isUsing], [isAddAcc], [dateOfCreate], [userID]) VALUES (N'dsc100002', NULL, 25, 0, 1, CAST(N'2021-06-12' AS Date), N'tamPham95')
INSERT [dbo].[discount] ([discountID], [discountName], [rateDis], [isUsing], [isAddAcc], [dateOfCreate], [userID]) VALUES (N'dsc100003', NULL, 25, 1, 1, CAST(N'2021-06-12' AS Date), N'phucThai2601')
INSERT [dbo].[discount] ([discountID], [discountName], [rateDis], [isUsing], [isAddAcc], [dateOfCreate], [userID]) VALUES (N'dsc100004', NULL, 20, 1, 1, CAST(N'2021-06-12' AS Date), N'phucThai2601')
INSERT [dbo].[discount] ([discountID], [discountName], [rateDis], [isUsing], [isAddAcc], [dateOfCreate], [userID]) VALUES (N'dsc100005', NULL, 15, 0, 1, CAST(N'2021-06-12' AS Date), N'thainguyen24')
INSERT [dbo].[discount] ([discountID], [discountName], [rateDis], [isUsing], [isAddAcc], [dateOfCreate], [userID]) VALUES (N'dsc100006', NULL, 25, 0, 0, CAST(N'2021-06-16' AS Date), NULL)
INSERT [dbo].[discount] ([discountID], [discountName], [rateDis], [isUsing], [isAddAcc], [dateOfCreate], [userID]) VALUES (N'dsc100007', N'Hot Summer', 25, 0, 0, CAST(N'2021-06-17' AS Date), NULL)
INSERT [dbo].[discount] ([discountID], [discountName], [rateDis], [isUsing], [isAddAcc], [dateOfCreate], [userID]) VALUES (N'dsc100008', N'Hot Summer 2', 25, 0, 0, CAST(N'2021-06-19' AS Date), NULL)
INSERT [dbo].[discount] ([discountID], [discountName], [rateDis], [isUsing], [isAddAcc], [dateOfCreate], [userID]) VALUES (N'dsc100009', N'Hot Summer', 15, 1, 1, CAST(N'2021-06-19' AS Date), N'phucThai2601')
INSERT [dbo].[discount] ([discountID], [discountName], [rateDis], [isUsing], [isAddAcc], [dateOfCreate], [userID]) VALUES (N'dsc100010', N'Hot Summer', 10, 0, 1, CAST(N'2021-06-19' AS Date), NULL)
GO
INSERT [dbo].[item] ([itemID], [itemName], [author], [cateID], [quantity], [imgUrl], [price], [dateOfCreate], [description], [status]) VALUES (N'BS100001', N'

Foundations of Software Testing ISTQB', N'Dorothy Graham
', N'tt', 198, N'BS100001.jpg', 100, CAST(N'2021-06-13T00:00:00.000' AS DateTime), NULL, N'Active')
INSERT [dbo].[item] ([itemID], [itemName], [author], [cateID], [quantity], [imgUrl], [price], [dateOfCreate], [description], [status]) VALUES (N'BS100002', N'Java Concurrency in Practice', N'Brian Goetz ', N'java', 199, N'BS100002.jpg', 50, CAST(N'2021-06-13T00:00:00.000' AS DateTime), NULL, N'Active')
INSERT [dbo].[item] ([itemID], [itemName], [author], [cateID], [quantity], [imgUrl], [price], [dateOfCreate], [description], [status]) VALUES (N'BS100003', N'NET toàn tập', N'Dương Quang Thiện', N'C#', 200, N'BS100003.png', 10, CAST(N'2021-06-13T00:00:00.000' AS DateTime), NULL, N'Active')
INSERT [dbo].[item] ([itemID], [itemName], [author], [cateID], [quantity], [imgUrl], [price], [dateOfCreate], [description], [status]) VALUES (N'BS100004', N'PHP & MySQL: Novice to Ninja', N'Kevin Yank', N'PHP', 200, N'BS100004.jpg', 45, CAST(N'2021-06-13T00:00:00.000' AS DateTime), NULL, N'Active')
INSERT [dbo].[item] ([itemID], [itemName], [author], [cateID], [quantity], [imgUrl], [price], [dateOfCreate], [description], [status]) VALUES (N'BS100005', N'Think Python 2nd Edition', N'Allen B. Downey', N'Python', 200, N'BS100005.jpg', 55, CAST(N'2021-06-13T00:00:00.000' AS DateTime), NULL, N'Active')
INSERT [dbo].[item] ([itemID], [itemName], [author], [cateID], [quantity], [imgUrl], [price], [dateOfCreate], [description], [status]) VALUES (N'BS100006', N'Software Requirements, 3rd Edition', N'Karl Wiegers and Joy Beatty', N'req', 200, N'BS100006.jpg', 65, CAST(N'2021-06-13T00:00:00.000' AS DateTime), NULL, N'Active')
INSERT [dbo].[item] ([itemID], [itemName], [author], [cateID], [quantity], [imgUrl], [price], [dateOfCreate], [description], [status]) VALUES (N'BS100007', N'Visual Models for Software Requirements', N'Joy Beatty and Anthony Chen', N'req', 200, N'BS100007.jpg', 45, CAST(N'2021-06-13T00:00:00.000' AS DateTime), NULL, N'Active')
INSERT [dbo].[item] ([itemID], [itemName], [author], [cateID], [quantity], [imgUrl], [price], [dateOfCreate], [description], [status]) VALUES (N'BS100008', N'Java Performance', N'Scott Oaks', N'java', 200, N'BS100008.jpg', 35, CAST(N'2021-06-13T00:00:00.000' AS DateTime), NULL, N'Active')
INSERT [dbo].[item] ([itemID], [itemName], [author], [cateID], [quantity], [imgUrl], [price], [dateOfCreate], [description], [status]) VALUES (N'BS100009', N'Thinking in Java (4th Edition)', N'Bruce Eckel', N'java', 200, N'BS100009.jpg', 25, CAST(N'2021-06-13T00:00:00.000' AS DateTime), NULL, N'Active')
INSERT [dbo].[item] ([itemID], [itemName], [author], [cateID], [quantity], [imgUrl], [price], [dateOfCreate], [description], [status]) VALUES (N'BS100010', N'Head First PHP & MySQL', N'Lynn Beighley & Michael Morrison', N'PHP', 199, N'BS100010.jpg', 45, CAST(N'2021-06-13T00:00:00.000' AS DateTime), NULL, N'Active')
INSERT [dbo].[item] ([itemID], [itemName], [author], [cateID], [quantity], [imgUrl], [price], [dateOfCreate], [description], [status]) VALUES (N'BS100011', N'Các giải pháp lập trình C#', N'Nguyễn Ngọc Bình Phương, Thái Thanh Phong', N'C#', 200, N'BS100011.png', 10, CAST(N'2021-06-13T00:00:00.000' AS DateTime), NULL, N'Active')
INSERT [dbo].[item] ([itemID], [itemName], [author], [cateID], [quantity], [imgUrl], [price], [dateOfCreate], [description], [status]) VALUES (N'BS100012', N'Python for everybody', N'Charles Severance', N'Python', 200, N'BS100012.jpg', 35, CAST(N'2021-06-13T00:00:00.000' AS DateTime), NULL, N'Active')
INSERT [dbo].[item] ([itemID], [itemName], [author], [cateID], [quantity], [imgUrl], [price], [dateOfCreate], [description], [status]) VALUES (N'BS100013', N'Effective Java (2nd Edition)', N'Joshua Bloch', N'java', 200, N'BS100013.jpg', 39, CAST(N'2021-06-13T00:00:00.000' AS DateTime), NULL, N'Active')
INSERT [dbo].[item] ([itemID], [itemName], [author], [cateID], [quantity], [imgUrl], [price], [dateOfCreate], [description], [status]) VALUES (N'BS100014', N'Java Puzzlers : Traps, Pitfalls, And Corner Cases', N'Neal Gafter, Joshua Bloch', N'java', 200, N'BS100014.jpg', 45, CAST(N'2021-06-13T00:00:00.000' AS DateTime), NULL, N'Active')
INSERT [dbo].[item] ([itemID], [itemName], [author], [cateID], [quantity], [imgUrl], [price], [dateOfCreate], [description], [status]) VALUES (N'BS100015', N'The C# Player’ Guide', N'R. B. Whitaker', N'C#', 200, N'BS100015.jpg', 45, CAST(N'2021-06-13T00:00:00.000' AS DateTime), NULL, N'Active')
INSERT [dbo].[item] ([itemID], [itemName], [author], [cateID], [quantity], [imgUrl], [price], [dateOfCreate], [description], [status]) VALUES (N'BS100016', N'Modern PHP: New Features and Good Practices', N'Josh Lockhart', N'PHP', 200, N'BS100016.jpg', 35, CAST(N'2021-06-13T00:00:00.000' AS DateTime), NULL, N'Active')
INSERT [dbo].[item] ([itemID], [itemName], [author], [cateID], [quantity], [imgUrl], [price], [dateOfCreate], [description], [status]) VALUES (N'BS100017', N'Nền tảng của Software Testing', N'Cem Kaner', N'tt', 200, N'BS100017.jpg', 45, CAST(N'2021-06-13T00:00:00.000' AS DateTime), NULL, N'Active')
INSERT [dbo].[item] ([itemID], [itemName], [author], [cateID], [quantity], [imgUrl], [price], [dateOfCreate], [description], [status]) VALUES (N'BS100018', N'Agile Estimating and Planing', N'Mike Cohn', N'tt', 200, N'BS100018.jpg', 35, CAST(N'2021-06-13T00:00:00.000' AS DateTime), NULL, N'Active')
INSERT [dbo].[item] ([itemID], [itemName], [author], [cateID], [quantity], [imgUrl], [price], [dateOfCreate], [description], [status]) VALUES (N'BS100019', N'A practical guide to testing in devops', N'Katrina Clokie', N'tt', 200, N'BS100019.jpg', 45, CAST(N'2021-06-13T00:00:00.000' AS DateTime), NULL, N'Active')
INSERT [dbo].[item] ([itemID], [itemName], [author], [cateID], [quantity], [imgUrl], [price], [dateOfCreate], [description], [status]) VALUES (N'BS100020', N'Head First Java, 2nd Edition', N'Kathy Sierra', N'java', 200, N'BS100020.jpg', 24, CAST(N'2021-06-13T00:00:00.000' AS DateTime), NULL, N'Active')
INSERT [dbo].[item] ([itemID], [itemName], [author], [cateID], [quantity], [imgUrl], [price], [dateOfCreate], [description], [status]) VALUES (N'BS100021', N'Code Complete', N'Steve McConnell', N'se', 200, N'BS100021.jpg', 23, CAST(N'2021-06-13T00:00:00.000' AS DateTime), NULL, N'Active')
INSERT [dbo].[item] ([itemID], [itemName], [author], [cateID], [quantity], [imgUrl], [price], [dateOfCreate], [description], [status]) VALUES (N'BS100022', N'Cracking the Coding Interview', N'Gayle Laakmann McDowell', N'se', 200, N'BS100022.jpg', 24, CAST(N'2021-06-13T00:00:00.000' AS DateTime), NULL, N'Active')
INSERT [dbo].[item] ([itemID], [itemName], [author], [cateID], [quantity], [imgUrl], [price], [dateOfCreate], [description], [status]) VALUES (N'BS100023', N'Selenium Testing Tools Cookbook', N'Unmesh Gundecha', N'tt', 200, N'BS100023.jpg', 45, CAST(N'2021-06-13T00:00:00.000' AS DateTime), NULL, N'Active')
INSERT [dbo].[item] ([itemID], [itemName], [author], [cateID], [quantity], [imgUrl], [price], [dateOfCreate], [description], [status]) VALUES (N'BS100024', N'Writing Effective Use Cases', N'Alistair Cockburn', N'req', 200, N'BS100024.jpg', 200, CAST(N'2021-06-15T20:37:00.797' AS DateTime), NULL, N'Active')
INSERT [dbo].[item] ([itemID], [itemName], [author], [cateID], [quantity], [imgUrl], [price], [dateOfCreate], [description], [status]) VALUES (N'BS100025', N'C# căn bản', N'Đoàn Nguyễn Thành Hòa', N'C#', 200, N'BS100025.jpg', 15, CAST(N'2021-06-20T14:22:11.003' AS DateTime), NULL, N'Active')
GO
INSERT [dbo].[roleUser] ([roleID], [roleName], [statusRole]) VALUES (N'admin', N'Management', NULL)
INSERT [dbo].[roleUser] ([roleID], [roleName], [statusRole]) VALUES (N'user', N'General User', NULL)
GO
INSERT [dbo].[user] ([userID], [password], [fullname], [phone], [email], [address], [roleID], [status], [dateOfCreate]) VALUES (N'admin', N'73l8gRjwLftklgfdXT+MdiMEjJwGPVMsyVxe16iYpk8=', N'Do Ngoc Phuc ', N'0987215804', N'lnslbscl3@gmail.com', N'Binh Thanh, Thanh Pho Ho Chi Minh', N'admin', N'Active', CAST(N'2021-06-18' AS Date))
INSERT [dbo].[user] ([userID], [password], [fullname], [phone], [email], [address], [roleID], [status], [dateOfCreate]) VALUES (N'phucThai2601', N'GF+NsyJx/iX1Yab8k4suJkMG7DBO2lGAB9F2SCY4GWk=', N'Thai Hoang Phuc', N'5768675445', N'phucdo2601@gmail.com', N'Go Vap, Ho Chi Minh', N'user', N'Active', CAST(N'2021-06-18' AS Date))
INSERT [dbo].[user] ([userID], [password], [fullname], [phone], [email], [address], [roleID], [status], [dateOfCreate]) VALUES (N'tamPham95', N'GF+NsyJx/iX1Yab8k4suJkMG7DBO2lGAB9F2SCY4GWk=', N'Pham Thanh Tam', N'3253453453', N'tamPham0495@gmail.com', N'Tan Binh, Ho Chi Minh', N'user', N'Active', CAST(N'2021-06-08' AS Date))
INSERT [dbo].[user] ([userID], [password], [fullname], [phone], [email], [address], [roleID], [status], [dateOfCreate]) VALUES (N'thainguyen24', N'GF+NsyJx/iX1Yab8k4suJkMG7DBO2lGAB9F2SCY4GWk=', N'Nguyen Pham Hoang Thai', N'6456547567', N'ngocphucdo2601@gmail.com', N'Quan 2, Ho Chi Minh', N'user', N'Active', CAST(N'2021-06-18' AS Date))
GO
ALTER TABLE [dbo].[booking]  WITH CHECK ADD  CONSTRAINT [FK_booking_user] FOREIGN KEY([userID])
REFERENCES [dbo].[user] ([userID])
GO
ALTER TABLE [dbo].[booking] CHECK CONSTRAINT [FK_booking_user]
GO
ALTER TABLE [dbo].[bookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_bookingDetails_booking] FOREIGN KEY([bookingID])
REFERENCES [dbo].[booking] ([bookingID])
GO
ALTER TABLE [dbo].[bookingDetails] CHECK CONSTRAINT [FK_bookingDetails_booking]
GO
ALTER TABLE [dbo].[bookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_bookingDetails_item] FOREIGN KEY([itemID])
REFERENCES [dbo].[item] ([itemID])
GO
ALTER TABLE [dbo].[bookingDetails] CHECK CONSTRAINT [FK_bookingDetails_item]
GO
ALTER TABLE [dbo].[discount]  WITH CHECK ADD  CONSTRAINT [FK_discount_user] FOREIGN KEY([userID])
REFERENCES [dbo].[user] ([userID])
GO
ALTER TABLE [dbo].[discount] CHECK CONSTRAINT [FK_discount_user]
GO
ALTER TABLE [dbo].[item]  WITH CHECK ADD  CONSTRAINT [FK_item_category] FOREIGN KEY([cateID])
REFERENCES [dbo].[category] ([cateID])
GO
ALTER TABLE [dbo].[item] CHECK CONSTRAINT [FK_item_category]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_roleUser] FOREIGN KEY([roleID])
REFERENCES [dbo].[roleUser] ([roleID])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_roleUser]
GO
USE [master]
GO
ALTER DATABASE [Lab231_P0018_BookStore] SET  READ_WRITE 
GO
