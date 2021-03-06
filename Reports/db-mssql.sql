USE [master]
GO
/****** Object:  Database [AuctionSite]    Script Date: 19.12.17 01:53:24 ******/
CREATE DATABASE [AuctionSite]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AuctionSite', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AuctionSite.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AuctionSite_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AuctionSite_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AuctionSite] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AuctionSite].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AuctionSite] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AuctionSite] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AuctionSite] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AuctionSite] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AuctionSite] SET ARITHABORT OFF 
GO
ALTER DATABASE [AuctionSite] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AuctionSite] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AuctionSite] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AuctionSite] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AuctionSite] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AuctionSite] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AuctionSite] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AuctionSite] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AuctionSite] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AuctionSite] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AuctionSite] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AuctionSite] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AuctionSite] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AuctionSite] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AuctionSite] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AuctionSite] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AuctionSite] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AuctionSite] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AuctionSite] SET  MULTI_USER 
GO
ALTER DATABASE [AuctionSite] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AuctionSite] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AuctionSite] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AuctionSite] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AuctionSite] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AuctionSite] SET QUERY_STORE = OFF
GO
USE [AuctionSite]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [AuctionSite]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 19.12.17 01:53:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Street] [varchar](100) NOT NULL,
	[Number] [int] NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[City] [varchar](100) NOT NULL,
	[Country] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 19.12.17 01:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Text] [varchar](2000) NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DesiredProduct]    Script Date: 19.12.17 01:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DesiredProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ListId] [int] NOT NULL,
	[DesiredPrice] [float] NULL,
	[DesiredAmount] [int] NULL,
	[DesiredValue] [int] NULL,
 CONSTRAINT [PK_DesiredProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderedProduct]    Script Date: 19.12.17 01:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderedProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ListId] [int] NOT NULL,
 CONSTRAINT [PK_OrderedProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19.12.17 01:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Photo] [varchar](250) NULL,
	[Description] [varbinary](500) NULL,
	[Date] [date] NOT NULL,
	[Value] [float] NOT NULL,
	[Rating] [int] NULL,
	[SellerId] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductList]    Script Date: 19.12.17 01:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_ProductList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 19.12.17 01:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AddressId] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NULL,
	[SaltyPassword] [varchar](100) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Id], [Street], [Number], [Code], [City], [Country]) VALUES (1, N'Rolna', 24, N'33-986', N'Wojnik', N'Poland')
INSERT [dbo].[Address] ([Id], [Street], [Number], [Code], [City], [Country]) VALUES (2, N'Sosnowa', 27, N'23-981', N'Cedia', N'Poland')
INSERT [dbo].[Address] ([Id], [Street], [Number], [Code], [City], [Country]) VALUES (3, N'Dluga', 29, N'67-234', N'Barka', N'Poland')
SET IDENTITY_INSERT [dbo].[Address] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([Id], [ProductId], [Text], [Date]) VALUES (1, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras egestas tellus id erat accumsan auctor. Praesent iaculis aliquam ligula, quis maximus risus luctus vitae. Mauris et faucibus enim. Morbi metus libero, sodales et enim convallis, auctor semper nunc. Suspendisse malesuada ante quis mi aliquet, eget rhoncus tortor convallis. Class aptent.', CAST(N'2017-09-17' AS Date))
INSERT [dbo].[Comment] ([Id], [ProductId], [Text], [Date]) VALUES (2, 1, N'Vestibulum aliquet facilisis lorem sit amet fermentum. Curabitur vehicula velit et nunc facilisis laoreet. Morbi at est quis metus fringilla maximus a at neque. Sed gravida felis dolor, a porttitor turpis mollis ac. Vestibulum euismod ullamcorper volutpat. In at efficitur turpis, quis eleifend augue. Praesent tristique diam ut fermentum tristique.', CAST(N'2017-07-15' AS Date))
INSERT [dbo].[Comment] ([Id], [ProductId], [Text], [Date]) VALUES (5, 3, N'Duis ac metus orci. Donec ullamcorper odio quis ante feugiat malesuada. Donec fringilla elit id dolor luctus auctor. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed eget metus ultrices, tincidunt est sit amet, aliquet arcu. Praesent rhoncus egestas nisi a tincidunt. Sed scelerisque commodo lectus.L', CAST(N'2017-03-24' AS Date))
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[DesiredProduct] ON 

INSERT [dbo].[DesiredProduct] ([Id], [ProductId], [ListId], [DesiredPrice], [DesiredAmount], [DesiredValue]) VALUES (1, 1, 5, 22.33, 2, NULL)
INSERT [dbo].[DesiredProduct] ([Id], [ProductId], [ListId], [DesiredPrice], [DesiredAmount], [DesiredValue]) VALUES (3, 3, 8, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[DesiredProduct] OFF
SET IDENTITY_INSERT [dbo].[OrderedProduct] ON 

INSERT [dbo].[OrderedProduct] ([Id], [ProductId], [ListId]) VALUES (1, 1, 1)
INSERT [dbo].[OrderedProduct] ([Id], [ProductId], [ListId]) VALUES (4, 3, 7)
SET IDENTITY_INSERT [dbo].[OrderedProduct] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Photo], [Description], [Date], [Value], [Rating], [SellerId]) VALUES (1, N'Zelazko', NULL, NULL, CAST(N'2017-08-27' AS Date), 736.33, 3, 1)
INSERT [dbo].[Product] ([Id], [Name], [Photo], [Description], [Date], [Value], [Rating], [SellerId]) VALUES (3, N'Pralka', NULL, NULL, CAST(N'2017-09-09' AS Date), 333.09, 7, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductList] ON 

INSERT [dbo].[ProductList] ([Id], [UserId]) VALUES (1, 1)
INSERT [dbo].[ProductList] ([Id], [UserId]) VALUES (2, 1)
INSERT [dbo].[ProductList] ([Id], [UserId]) VALUES (3, 1)
INSERT [dbo].[ProductList] ([Id], [UserId]) VALUES (4, 1)
INSERT [dbo].[ProductList] ([Id], [UserId]) VALUES (5, 3)
INSERT [dbo].[ProductList] ([Id], [UserId]) VALUES (6, 3)
INSERT [dbo].[ProductList] ([Id], [UserId]) VALUES (7, 2)
INSERT [dbo].[ProductList] ([Id], [UserId]) VALUES (8, 2)
INSERT [dbo].[ProductList] ([Id], [UserId]) VALUES (9, 2)
INSERT [dbo].[ProductList] ([Id], [UserId]) VALUES (10, 2)
SET IDENTITY_INSERT [dbo].[ProductList] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [AddressId], [FirstName], [LastName], [SaltyPassword]) VALUES (1, 1, N'Tomek', N'Zywy', N'dkfikghjdsfnjasdkfj')
INSERT [dbo].[User] ([Id], [AddressId], [FirstName], [LastName], [SaltyPassword]) VALUES (2, 3, N'Bartek', N'Zulek', N'dfhidsfjkd;lsfk')
INSERT [dbo].[User] ([Id], [AddressId], [FirstName], [LastName], [SaltyPassword]) VALUES (3, 3, N'Gosia', N'Kep', N'djfhl;k;l/k,m;kljm')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Product]
GO
ALTER TABLE [dbo].[DesiredProduct]  WITH CHECK ADD  CONSTRAINT [FK_DesiredProduct_Product] FOREIGN KEY([Id])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[DesiredProduct] CHECK CONSTRAINT [FK_DesiredProduct_Product]
GO
ALTER TABLE [dbo].[DesiredProduct]  WITH CHECK ADD  CONSTRAINT [FK_DesiredProduct_ProductList] FOREIGN KEY([ListId])
REFERENCES [dbo].[ProductList] ([Id])
GO
ALTER TABLE [dbo].[DesiredProduct] CHECK CONSTRAINT [FK_DesiredProduct_ProductList]
GO
ALTER TABLE [dbo].[OrderedProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderedProduct_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderedProduct] CHECK CONSTRAINT [FK_OrderedProduct_Product]
GO
ALTER TABLE [dbo].[OrderedProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderedProduct_ProductList] FOREIGN KEY([ListId])
REFERENCES [dbo].[ProductList] ([Id])
GO
ALTER TABLE [dbo].[OrderedProduct] CHECK CONSTRAINT [FK_OrderedProduct_ProductList]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_User] FOREIGN KEY([SellerId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_User]
GO
ALTER TABLE [dbo].[ProductList]  WITH CHECK ADD  CONSTRAINT [FK_ProductList_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ProductList] CHECK CONSTRAINT [FK_ProductList_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Address]
GO
USE [master]
GO
ALTER DATABASE [AuctionSite] SET  READ_WRITE 
GO
