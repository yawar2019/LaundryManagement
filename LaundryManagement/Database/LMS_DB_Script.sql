USE [master]
GO
/****** Object:  Database [LaundryManagementSystem]    Script Date: 11/20/2020 6:32:38 PM ******/
CREATE DATABASE [LaundryManagementSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LaundryManagementSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LaundryManagementSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LaundryManagementSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LaundryManagementSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LaundryManagementSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LaundryManagementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LaundryManagementSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LaundryManagementSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LaundryManagementSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LaundryManagementSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LaundryManagementSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [LaundryManagementSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LaundryManagementSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LaundryManagementSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LaundryManagementSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LaundryManagementSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LaundryManagementSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LaundryManagementSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LaundryManagementSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LaundryManagementSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LaundryManagementSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LaundryManagementSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LaundryManagementSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LaundryManagementSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LaundryManagementSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LaundryManagementSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LaundryManagementSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LaundryManagementSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LaundryManagementSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LaundryManagementSystem] SET  MULTI_USER 
GO
ALTER DATABASE [LaundryManagementSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LaundryManagementSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LaundryManagementSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LaundryManagementSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LaundryManagementSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LaundryManagementSystem] SET QUERY_STORE = OFF
GO
USE [LaundryManagementSystem]
GO
/****** Object:  Table [dbo].[tbl_Billing]    Script Date: 11/20/2020 6:32:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Billing](
	[BillingId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[Products] [varchar](100) NULL,
	[BillDateTime] [datetime] NULL,
	[TotalAmount] [float] NULL,
	[PaidAmount] [float] NULL,
	[DueAmount] [float] NULL,
	[Discount] [float] NOT NULL,
	[BillingStatus] [varchar](25) NULL,
	[DeliveredDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdateBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Billing] PRIMARY KEY CLUSTERED 
(
	[BillingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Customer]    Script Date: 11/20/2020 6:32:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Customer](
	[CustId] [int] IDENTITY(1000,1) NOT NULL,
	[CustName] [varchar](100) NULL,
	[CustMobileNumber] [varchar](20) NULL,
	[CustEmailId] [varchar](50) NULL,
	[CustEntryDate] [date] NULL,
	[CustEntryTime] [time](7) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Customer] PRIMARY KEY CLUSTERED 
(
	[CustId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Employee]    Script Date: 11/20/2020 6:32:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Employee](
	[EmpId] [int] NOT NULL,
	[EmpName] [varchar](50) NULL,
	[EmpRole] [int] NULL,
	[EmpDesignation] [varchar](50) NULL,
	[EmpEmail] [varchar](50) NULL,
	[EmpDob] [date] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Employee] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Product]    Script Date: 11/20/2020 6:32:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NULL,
	[PGroupId] [int] NULL,
	[Description] [varchar](250) NULL,
	[Price] [float] NULL,
	[Status] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ProductGroup]    Script Date: 11/20/2020 6:32:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ProductGroup](
	[PGroupId] [int] IDENTITY(1,1) NOT NULL,
	[PGroupName] [varchar](50) NULL,
	[PGroupDesc] [varchar](250) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_ProductGroup] PRIMARY KEY CLUSTERED 
(
	[PGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Customer] ADD  CONSTRAINT [DF_tbl_Customer_CustEntryDate]  DEFAULT (getdate()) FOR [CustEntryDate]
GO
ALTER TABLE [dbo].[tbl_Customer] ADD  CONSTRAINT [DF_tbl_Customer_CustEntryTime]  DEFAULT (getdate()) FOR [CustEntryTime]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddBilling]    Script Date: 11/20/2020 6:32:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AddBilling]
@CustomerId int,
@Products varchar(100),
@TotalAmount float,
@PaidAmount float,
@DueAmount float,
@Discount float,
@BillingStatus varchar(25),
@CreatedBy int,
@UpdateBy int,
@DeliveredDate datetime
AS
BEGIN

	INSERT INTO tbl_Billing
		(CustomerId,
		 Products,	 
		 TotalAmount,
		 PaidAmount,
		 DueAmount,
		 Discount,
		 BillingStatus,
		 CreatedBy,
		 UpdateBy,
		 DeliveredDate)
	 VALUES
		(@CustomerId,
		 @Products,	 
		 @TotalAmount,
		 @PaidAmount,
		 @DueAmount,
		 @Discount,
		 @BillingStatus,
		 @CreatedBy,
		 @UpdateBy,
		 @DeliveredDate)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AddCustomer]    Script Date: 11/20/2020 6:32:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AddCustomer]
@CustName varchar(100),
@CustMobileNumber varchar(20),
@CustEmailId varchar(50)
as
begin
	insert into tbl_Customer (CustName, CustMobileNumber, CustEmailId) 
	values (@CustName, @CustMobileNumber, @CustEmailId )
end
GO
/****** Object:  StoredProcedure [dbo].[sp_AddProduct]    Script Date: 11/20/2020 6:32:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AddProduct]
@ProductName varchar(50),
@PGroupId int,
@Description varchar(250),
@Price float,
@Status bit
AS
BEGIN
	INSERT INTO tbl_Product
	VALUES (@ProductName, @PGroupId, @Description, @Price, @Status)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AddProductGroup]    Script Date: 11/20/2020 6:32:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AddProductGroup]
@PGroupName varchar(50),
@PGroupDesc varchar(250)
AS
BEGIN
	INSERT INTO tbl_ProductGroup 
	values (@PGroupName, @PGroupDesc);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllBillings]    Script Date: 11/20/2020 6:32:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetAllBillings]
AS
BEGIN
	SELECT  BillingId,
			CustomerId,
			Products,
			BillDateTime,
			TotalAmount,
			PaidAmount,
			DueAmount,
			Discount,
			BillingStatus,
			CreatedBy,
			UpdateBy,
			DeliveredDate
	
	FROM	tbl_Billing		
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllCustomers]    Script Date: 11/20/2020 6:32:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetAllCustomers]
AS
BEGIN
	SELECT CustId, CustName, CustMobileNumber, CustEmailId, CustEntryDate, CustEntryTime
	FROM tbl_Customer;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllProductGroups]    Script Date: 11/20/2020 6:32:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_GetAllProductGroups]
AS
BEGIN
	SELECT PGroupId, PGroupName, PGroupDesc 
	FROM tbl_ProductGroup;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllProducts]    Script Date: 11/20/2020 6:32:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetAllProducts]
AS
BEGIN
	SELECT ProductId, ProductName, PGroupId, Description, Price, Status
	FROM tbl_Product;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetBilling]    Script Date: 11/20/2020 6:32:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetBilling]
@BillingId int
AS
BEGIN
	SELECT  BillingId,
			CustomerId,
			Products,
			BillDateTime,
			TotalAmount,
			PaidAmount,
			DueAmount,
			Discount,
			BillingStatus,
			CreatedBy,
			UpdateBy,
			DeliveredDate
	
	FROM	tbl_Billing
	WHERE	BillingId = @BillingId;			
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCustomer]    Script Date: 11/20/2020 6:32:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetCustomer]
@CustMobileNumber varchar(20)
AS
BEGIN
	SELECT CustId,
	       CustName,
		   CustMobileNumber,
		   CustEmailId,
		   CustEntryDate,
		   CustEntryTime 
	FROM tbl_Customer
	WHERE CustMobileNumber = @CustMobileNumber;	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetProductById]    Script Date: 11/20/2020 6:32:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetProductById]
@ProductId int
AS
BEGIN
	SELECT ProductId, ProductName, PGroupId, Description, Price, Status
	FROM tbl_Product where ProductId = @ProductId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetProductGroupById]    Script Date: 11/20/2020 6:32:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetProductGroupById]
@PGroupId int
AS
BEGIN
	SELECT PGroupId, PGroupName, PGroupDesc 
	FROM tbl_ProductGroup WHERE PGroupId=@PGroupId;
END
GO
USE [master]
GO
ALTER DATABASE [LaundryManagementSystem] SET  READ_WRITE 
GO
