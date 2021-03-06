USE [master]
GO
/****** Object:  Database [Lab231_JP0017_UserManagement]    Script Date: 6/17/2021 12:05:18 PM ******/
CREATE DATABASE [Lab231_JP0017_UserManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Lab231_JP0017_UserManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Lab231_JP0017_UserManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Lab231_JP0017_UserManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Lab231_JP0017_UserManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Lab231_JP0017_UserManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET  MULTI_USER 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET QUERY_STORE = OFF
GO
USE [Lab231_JP0017_UserManagement]
GO
/****** Object:  Table [dbo].[promoStatus]    Script Date: 6/17/2021 12:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promoStatus](
	[promoStatusID] [nvarchar](50) NOT NULL,
	[promoStatusName] [nvarchar](50) NULL,
 CONSTRAINT [PK_promoStatus] PRIMARY KEY CLUSTERED 
(
	[promoStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roleUser]    Script Date: 6/17/2021 12:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roleUser](
	[roleUserID] [nvarchar](50) NOT NULL,
	[roleUserName] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_roleUser] PRIMARY KEY CLUSTERED 
(
	[roleUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 6/17/2021 12:05:18 PM ******/
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
	[imgUrl] [nvarchar](200) NULL,
	[roleID] [nvarchar](50) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[promoStatus] [nvarchar](50) NOT NULL,
	[rankPromo] [int] NULL,
	[dateOfCreate] [date] NULL,
	[dateOfAddPromo] [date] NULL,
 CONSTRAINT [PK_user_1] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userStatus]    Script Date: 6/17/2021 12:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userStatus](
	[userStatusID] [nvarchar](50) NOT NULL,
	[userStatusName] [nvarchar](50) NULL,
 CONSTRAINT [PK_userStatus] PRIMARY KEY CLUSTERED 
(
	[userStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[promoStatus] ([promoStatusID], [promoStatusName]) VALUES (N'Active', N'Account Add Promo')
INSERT [dbo].[promoStatus] ([promoStatusID], [promoStatusName]) VALUES (N'Manager', N'Main Role')
INSERT [dbo].[promoStatus] ([promoStatusID], [promoStatusName]) VALUES (N'NonActive', N'Account Non Activate')
GO
INSERT [dbo].[roleUser] ([roleUserID], [roleUserName], [status]) VALUES (N'admin', N'Management', NULL)
INSERT [dbo].[roleUser] ([roleUserID], [roleUserName], [status]) VALUES (N'user', N'General User', NULL)
GO
INSERT [dbo].[user] ([userID], [password], [fullname], [phone], [email], [imgUrl], [roleID], [status], [promoStatus], [rankPromo], [dateOfCreate], [dateOfAddPromo]) VALUES (N'chinhNguyen', N'GF+NsyJx/iX1Yab8k4suJkMG7DBO2lGAB9F2SCY4GWk=', N'Nguyen Le Hoang Chinh', N'5456575675', N'lnslbscl3@gmail.com', N'user.png', N'admin', N'Active', N'NonActive', NULL, CAST(N'2021-06-12' AS Date), NULL)
INSERT [dbo].[user] ([userID], [password], [fullname], [phone], [email], [imgUrl], [roleID], [status], [promoStatus], [rankPromo], [dateOfCreate], [dateOfAddPromo]) VALUES (N'dungTran0408', N'GF+NsyJx/iX1Yab8k4suJkMG7DBO2lGAB9F2SCY4GWk=', N'Tran Thi Thuy Dung', N'576867867', N'lnslbscl3@gmail.com', N'1.jpg', N'admin', N'Active', N'Active', 4, CAST(N'2021-06-11' AS Date), CAST(N'2021-06-11' AS Date))
INSERT [dbo].[user] ([userID], [password], [fullname], [phone], [email], [imgUrl], [roleID], [status], [promoStatus], [rankPromo], [dateOfCreate], [dateOfAddPromo]) VALUES (N'phucdo2601', N'NdYYYn+SJpG9tX2NJzDZeoeWAkj3eCxjk/jgstIfNkw=', N'Đỗ Ngọc Phúc', N'0987215804', N'phucdo2601@gmail.com', N'test1.jpg', N'admin', N'Active', N'Manager', NULL, CAST(N'2021-06-01' AS Date), NULL)
INSERT [dbo].[user] ([userID], [password], [fullname], [phone], [email], [imgUrl], [roleID], [status], [promoStatus], [rankPromo], [dateOfCreate], [dateOfAddPromo]) VALUES (N'quangPhat', N'73l8gRjwLftklgfdXT+MdiMEjJwGPVMsyVxe16iYpk8=', N'Tran Quang Phat', N'0987676543', N'phucdo2601@gmail.com', N'b1.jpg', N'user', N'Active', N'Active', 5, CAST(N'2021-06-11' AS Date), CAST(N'2021-06-11' AS Date))
INSERT [dbo].[user] ([userID], [password], [fullname], [phone], [email], [imgUrl], [roleID], [status], [promoStatus], [rankPromo], [dateOfCreate], [dateOfAddPromo]) VALUES (N'sonNguyen', N'GF+NsyJx/iX1Yab8k4suJkMG7DBO2lGAB9F2SCY4GWk=', N'Nguyen Vu Thai Son', N'576867867', N'phucdnse140354@fpt.edu.vn', N'3.jpg', N'admin', N'Active', N'Active', 6, CAST(N'2021-06-11' AS Date), CAST(N'2021-06-09' AS Date))
INSERT [dbo].[user] ([userID], [password], [fullname], [phone], [email], [imgUrl], [roleID], [status], [promoStatus], [rankPromo], [dateOfCreate], [dateOfAddPromo]) VALUES (N'thaiNguyen', N'GF+NsyJx/iX1Yab8k4suJkMG7DBO2lGAB9F2SCY4GWk=', N'Hoang Thai', N'576867867', N'lnslbscl3@gmail.com', N'1.jpg', N'user', N'InActive', N'Active', 5, CAST(N'2021-06-11' AS Date), CAST(N'2021-06-07' AS Date))
INSERT [dbo].[user] ([userID], [password], [fullname], [phone], [email], [imgUrl], [roleID], [status], [promoStatus], [rankPromo], [dateOfCreate], [dateOfAddPromo]) VALUES (N'thanhTuong', N'GF+NsyJx/iX1Yab8k4suJkMG7DBO2lGAB9F2SCY4GWk=', N'Nguyen Thanh Tuong', N'5456575675', N'lnslbscl3@gmail.com', N'user.png', N'admin', N'Active', N'Active', 6, CAST(N'2021-06-11' AS Date), CAST(N'2021-06-11' AS Date))
INSERT [dbo].[user] ([userID], [password], [fullname], [phone], [email], [imgUrl], [roleID], [status], [promoStatus], [rankPromo], [dateOfCreate], [dateOfAddPromo]) VALUES (N'thuanThien', N'GF+NsyJx/iX1Yab8k4suJkMG7DBO2lGAB9F2SCY4GWk=', N'Nguyen Thai Son', N'3545656756', N'lnslbscl3@gmail.com', N'2.jpg', N'admin', N'InActive', N'NonActive', NULL, CAST(N'2021-06-11' AS Date), NULL)
INSERT [dbo].[user] ([userID], [password], [fullname], [phone], [email], [imgUrl], [roleID], [status], [promoStatus], [rankPromo], [dateOfCreate], [dateOfAddPromo]) VALUES (N'tueNguyen', N'GF+NsyJx/iX1Yab8k4suJkMG7DBO2lGAB9F2SCY4GWk=', N'Nguyen Duy Minh Tue', N'5456575675', N'lnslbscl3@gmail.com', N'user.png', N'user', N'Active', N'NonActive', NULL, CAST(N'2021-06-17' AS Date), NULL)
INSERT [dbo].[user] ([userID], [password], [fullname], [phone], [email], [imgUrl], [roleID], [status], [promoStatus], [rankPromo], [dateOfCreate], [dateOfAddPromo]) VALUES (N'tuongLam', N'GF+NsyJx/iX1Yab8k4suJkMG7DBO2lGAB9F2SCY4GWk=', N'Nguyen Thai Son', N'576867867', N'lnslbscl3@gmail.com', N'2.jpg', N'user', N'Active', N'Active', 4, CAST(N'2021-06-11' AS Date), CAST(N'2021-06-06' AS Date))
INSERT [dbo].[user] ([userID], [password], [fullname], [phone], [email], [imgUrl], [roleID], [status], [promoStatus], [rankPromo], [dateOfCreate], [dateOfAddPromo]) VALUES (N'tuPhan', N'GF+NsyJx/iX1Yab8k4suJkMG7DBO2lGAB9F2SCY4GWk=', N'Phan Anh Tu', N'576867867', N'lnslbscl3@gmail.com', N'1.jpg', N'user', N'Active', N'NonActive', NULL, CAST(N'2021-06-11' AS Date), NULL)
GO
INSERT [dbo].[userStatus] ([userStatusID], [userStatusName]) VALUES (N'Active', N'Account Active')
INSERT [dbo].[userStatus] ([userStatusID], [userStatusName]) VALUES (N'InActive', N'Account Banned')
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_promoStatus] FOREIGN KEY([promoStatus])
REFERENCES [dbo].[promoStatus] ([promoStatusID])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_promoStatus]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_roleUser] FOREIGN KEY([roleID])
REFERENCES [dbo].[roleUser] ([roleUserID])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_roleUser]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_userStatus] FOREIGN KEY([status])
REFERENCES [dbo].[userStatus] ([userStatusID])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_userStatus]
GO
USE [master]
GO
ALTER DATABASE [Lab231_JP0017_UserManagement] SET  READ_WRITE 
GO
