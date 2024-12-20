USE [master]
GO
/****** Object:  Database [EcommerceDb]    Script Date: 18-11-2024 11:49:01 ******/
CREATE DATABASE [EcommerceDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EcommerceDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVER2022\MSSQL\DATA\EcommerceDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EcommerceDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVER2022\MSSQL\DATA\EcommerceDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EcommerceDb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EcommerceDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EcommerceDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EcommerceDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EcommerceDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EcommerceDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EcommerceDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [EcommerceDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EcommerceDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EcommerceDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EcommerceDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EcommerceDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EcommerceDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EcommerceDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EcommerceDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EcommerceDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EcommerceDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EcommerceDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EcommerceDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EcommerceDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EcommerceDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EcommerceDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EcommerceDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EcommerceDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EcommerceDb] SET RECOVERY FULL 
GO
ALTER DATABASE [EcommerceDb] SET  MULTI_USER 
GO
ALTER DATABASE [EcommerceDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EcommerceDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EcommerceDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EcommerceDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EcommerceDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EcommerceDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EcommerceDb', N'ON'
GO
ALTER DATABASE [EcommerceDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [EcommerceDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EcommerceDb]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 18-11-2024 11:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nchar](50) NULL,
	[Description] [text] NULL,
	[Picture] [image] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerCustomerDemo]    Script Date: 18-11-2024 11:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerCustomerDemo](
	[CustomerID] [int] NOT NULL,
	[CustomerTypeID] [int] NULL,
 CONSTRAINT [PK_CustomerCustomerDemo] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerDemographics]    Script Date: 18-11-2024 11:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerDemographics](
	[CustomerTypeID] [int] NOT NULL,
	[CustomerDesc] [varchar](255) NULL,
 CONSTRAINT [PK_CustomerDemographics] PRIMARY KEY CLUSTERED 
(
	[CustomerTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 18-11-2024 11:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] NOT NULL,
	[CompanyName] [nchar](100) NULL,
	[ContactName] [nchar](100) NULL,
	[ContactTitle] [nchar](100) NULL,
	[Address] [nchar](250) NULL,
	[City] [nchar](100) NULL,
	[Region] [nchar](100) NULL,
	[PostalCode] [nchar](20) NULL,
	[Country] [nchar](100) NULL,
	[Phone] [nchar](20) NULL,
	[Fax] [nchar](20) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 18-11-2024 11:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] NOT NULL,
	[LastName] [nchar](100) NULL,
	[FirstName] [nchar](100) NULL,
	[Title] [nchar](100) NULL,
	[TitleOfCourtesy] [nchar](100) NULL,
	[BirthDate] [date] NULL,
	[HireDate] [date] NULL,
	[Address] [nchar](100) NULL,
	[City] [nchar](100) NULL,
	[Region] [nchar](100) NULL,
	[PostalCode] [nchar](10) NULL,
	[Country] [nchar](100) NULL,
	[HomePhone] [nchar](20) NULL,
	[Extension] [nchar](10) NULL,
	[Photo] [image] NULL,
	[Notes] [text] NULL,
	[ReportsTo] [nchar](100) NULL,
	[PhotoPath] [nchar](100) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeTerritories]    Script Date: 18-11-2024 11:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeTerritories](
	[EmployeeID] [int] NOT NULL,
	[TerritoryID] [int] NULL,
 CONSTRAINT [PK_EmployeeTerritories] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order Details]    Script Date: 18-11-2024 11:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order Details](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NULL,
	[UnitPrice] [decimal](10, 2) NULL,
	[Quantity] [int] NULL,
	[Discount] [decimal](3, 2) NULL,
 CONSTRAINT [PK_Order Details] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 18-11-2024 11:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] NOT NULL,
	[CustomerID] [int] NULL,
	[EmployeeID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[RequireDate] [datetime] NULL,
	[ShipperDate] [datetime] NULL,
	[ShipVia] [int] NULL,
	[Freight] [decimal](10, 2) NULL,
	[ShipName] [nchar](250) NULL,
	[ShipAddress] [nchar](255) NULL,
	[ShipCity] [nchar](100) NULL,
	[ShipRegion] [nchar](100) NOT NULL,
	[ShipPostalCode] [nchar](20) NULL,
	[ShipCountry] [nchar](100) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 18-11-2024 11:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] NOT NULL,
	[ProductName] [nchar](50) NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[QuantityPerUnit] [varchar](50) NULL,
	[UnitPrice] [decimal](10, 2) NULL,
	[UnitsInStock] [int] NOT NULL,
	[UnitsOnOrder] [int] NULL,
	[ReorderLevel] [int] NULL,
	[Discontinued] [bit] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 18-11-2024 11:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[RegionID] [int] NOT NULL,
	[RegionDescription] [nchar](255) NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shippers]    Script Date: 18-11-2024 11:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shippers](
	[ShipperID] [int] NOT NULL,
	[CompanyName] [nchar](100) NULL,
	[Phone] [nchar](20) NULL,
 CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED 
(
	[ShipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 18-11-2024 11:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] NOT NULL,
	[CompanyName] [nchar](50) NULL,
	[ContactName] [nchar](50) NULL,
	[ContactTitle] [nchar](50) NULL,
	[Address] [nchar](100) NULL,
	[City] [nchar](50) NULL,
	[Region] [nchar](50) NULL,
	[PostalCode] [varchar](10) NULL,
	[Country] [nchar](50) NULL,
	[Phone] [nchar](20) NULL,
	[Fax] [nchar](100) NULL,
	[HomePage] [nchar](1000) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Territories]    Script Date: 18-11-2024 11:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Territories](
	[TerritoryID] [int] NOT NULL,
	[TerritoryDescription] [nchar](255) NULL,
	[RegionID] [int] NULL,
 CONSTRAINT [PK_Territories] PRIMARY KEY CLUSTERED 
(
	[TerritoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomerCustomerDemo]  WITH CHECK ADD  CONSTRAINT [FK_CustomerCustomerDemo_CustomerDemographics] FOREIGN KEY([CustomerTypeID])
REFERENCES [dbo].[CustomerDemographics] ([CustomerTypeID])
GO
ALTER TABLE [dbo].[CustomerCustomerDemo] CHECK CONSTRAINT [FK_CustomerCustomerDemo_CustomerDemographics]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_CustomerCustomerDemo] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CustomerCustomerDemo] ([CustomerID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_CustomerCustomerDemo]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
ALTER TABLE [dbo].[EmployeeTerritories]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeTerritories_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeTerritories] CHECK CONSTRAINT [FK_EmployeeTerritories_Employees]
GO
ALTER TABLE [dbo].[EmployeeTerritories]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeTerritories_Territories] FOREIGN KEY([TerritoryID])
REFERENCES [dbo].[Territories] ([TerritoryID])
GO
ALTER TABLE [dbo].[EmployeeTerritories] CHECK CONSTRAINT [FK_EmployeeTerritories_Territories]
GO
ALTER TABLE [dbo].[Order Details]  WITH CHECK ADD  CONSTRAINT [FK_Order Details_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [FK_Order Details_Orders]
GO
ALTER TABLE [dbo].[Order Details]  WITH CHECK ADD  CONSTRAINT [FK_Order Details_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [FK_Order Details_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shippers] FOREIGN KEY([ShipVia])
REFERENCES [dbo].[Shippers] ([ShipperID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shippers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[Territories]  WITH CHECK ADD  CONSTRAINT [FK_Territories_Region] FOREIGN KEY([RegionID])
REFERENCES [dbo].[Region] ([RegionID])
GO
ALTER TABLE [dbo].[Territories] CHECK CONSTRAINT [FK_Territories_Region]
GO
USE [master]
GO
ALTER DATABASE [EcommerceDb] SET  READ_WRITE 
GO
