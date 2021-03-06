USE [master]
GO
/****** Object:  Database [LaundryManagmentSystem]    Script Date: 19/11/2020 13:11:41 ******/
CREATE DATABASE [LaundryManagmentSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LaundryDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\LaundryDb.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LaundryDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\LaundryDb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LaundryManagmentSystem] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LaundryManagmentSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LaundryManagmentSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LaundryManagmentSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LaundryManagmentSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LaundryManagmentSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LaundryManagmentSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LaundryManagmentSystem] SET  MULTI_USER 
GO
ALTER DATABASE [LaundryManagmentSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LaundryManagmentSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LaundryManagmentSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LaundryManagmentSystem] SET DELAYED_DURABILITY = DISABLED 
GO
USE [LaundryManagmentSystem]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 19/11/2020 13:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](50) NULL,
	[IsActive] [bit] NULL CONSTRAINT [DF_Group_IsActive]  DEFAULT ((0)),
	[Code] [nvarchar](50) NULL,
	[ColorCode] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertlndryGroup]    Script Date: 19/11/2020 13:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[sp_InsertlndryGroup]
      (@GroupName nvarchar(50),
	  @Code   nvarchar(50),
	  @ColorCode nvarchar(50),
	  @IsActive  bit,
	  @CreatedBy int,
	  @UpdatedBy int)
AS
BEGIN
Insert into  [dbo].[Group]
      ([GroupName]
      ,[Code]
      ,[ColorCode]
	   ,[IsActive]
      ,[CreatedBy]
      ,[UpdatedBy]
      ,[CreatedOn]
      ,[UpdatedOn]
	  )
	  values(

     @GroupName,
	 @Code,   
	 @ColorCode,
	 @IsActive,
	 @CreatedBy,
	 @UpdatedBy,
	 GETDATE(),
	 GETDATE())

END
GO
/****** Object:  StoredProcedure [dbo].[sp_lndryGroup]    Script Date: 19/11/2020 13:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[sp_lndryGroup]
AS
BEGIN
SELECT [GroupId]
      ,[GroupName]
      ,[IsActive]
      ,[Code]
      ,[ColorCode]
      ,[CreatedBy]
      ,[UpdatedBy]
      ,[CreatedOn]
      ,[UpdatedOn]
  FROM [dbo].[Group]

END
GO
USE [master]
GO
ALTER DATABASE [LaundryManagmentSystem] SET  READ_WRITE 
GO
