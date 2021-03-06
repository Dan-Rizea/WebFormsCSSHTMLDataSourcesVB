USE [master]
GO
/****** Object:  Database [WebAppTempProj]    Script Date: 7/3/2021 2:04:29 AM ******/
CREATE DATABASE [WebAppTempProj]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebAppTempProj', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\WebAppTempProj.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebAppTempProj_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\WebAppTempProj_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WebAppTempProj] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebAppTempProj].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebAppTempProj] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebAppTempProj] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebAppTempProj] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebAppTempProj] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebAppTempProj] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebAppTempProj] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebAppTempProj] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebAppTempProj] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebAppTempProj] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebAppTempProj] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebAppTempProj] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebAppTempProj] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebAppTempProj] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebAppTempProj] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebAppTempProj] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebAppTempProj] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebAppTempProj] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebAppTempProj] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebAppTempProj] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebAppTempProj] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebAppTempProj] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebAppTempProj] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebAppTempProj] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebAppTempProj] SET  MULTI_USER 
GO
ALTER DATABASE [WebAppTempProj] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebAppTempProj] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebAppTempProj] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebAppTempProj] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebAppTempProj] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebAppTempProj] SET QUERY_STORE = OFF
GO
USE [WebAppTempProj]
GO
/****** Object:  Table [dbo].[AccountOwners]    Script Date: 7/3/2021 2:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountOwners](
	[OwnerId] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[IDCard] [varchar](10) NULL,
	[OwnerPIN] [varchar](13) NULL,
	[Locality] [nvarchar](20) NULL,
	[Address] [nvarchar](70) NULL,
	[Phone] [char](20) NULL,
	[UserID] [bigint] NULL,
 CONSTRAINT [PK_AccountOwners] PRIMARY KEY CLUSTERED 
(
	[OwnerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountTransactions]    Script Date: 7/3/2021 2:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountTransactions](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[TransactionType] [nvarchar](50) NULL,
	[TransactionDate] [datetime] NULL,
	[Amount] [decimal](18, 2) NULL,
	[AccountId] [int] NULL,
	[Explanation] [nvarchar](max) NULL,
	[ExternalCounterpartID] [bigint] NULL,
 CONSTRAINT [PK_AccountTransactions] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BankAccounts]    Script Date: 7/3/2021 2:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankAccounts](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[AccountIBAN] [varchar](34) NULL,
	[AccountType] [nvarchar](50) NULL,
	[OpeningDate] [date] NULL,
	[InterestRate] [decimal](18, 2) NULL,
	[OwnerId] [int] NULL,
 CONSTRAINT [PK_BankAccounts] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExternalCounterparts]    Script Date: 7/3/2021 2:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExternalCounterparts](
	[CounterpartId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[OtherDetails] [nvarchar](500) NULL,
 CONSTRAINT [PK_ExternalCounterparts] PRIMARY KEY CLUSTERED 
(
	[CounterpartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fees]    Script Date: 7/3/2021 2:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fees](
	[FeeId] [int] IDENTITY(1,1) NOT NULL,
	[FeeName] [nvarchar](50) NULL,
	[Application] [nvarchar](max) NULL,
 CONSTRAINT [PK_Fees] PRIMARY KEY CLUSTERED 
(
	[FeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionFees]    Script Date: 7/3/2021 2:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionFees](
	[TransactionId] [int] NOT NULL,
	[FeeId] [int] NOT NULL,
	[FeeAmount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TransactionFees] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC,
	[FeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/3/2021 2:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[Password] [nvarchar](500) NULL,
	[email] [varchar](50) NULL,
	[locked] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountOwners]  WITH CHECK ADD  CONSTRAINT [FK_AccountOwners_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[AccountOwners] CHECK CONSTRAINT [FK_AccountOwners_Users]
GO
ALTER TABLE [dbo].[AccountTransactions]  WITH CHECK ADD  CONSTRAINT [FK_AccountTransactions_BankAccounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[BankAccounts] ([AccountId])
GO
ALTER TABLE [dbo].[AccountTransactions] CHECK CONSTRAINT [FK_AccountTransactions_BankAccounts]
GO
ALTER TABLE [dbo].[AccountTransactions]  WITH CHECK ADD  CONSTRAINT [FK_AccountTransactions_ExternalCounterparts] FOREIGN KEY([ExternalCounterpartID])
REFERENCES [dbo].[ExternalCounterparts] ([CounterpartId])
GO
ALTER TABLE [dbo].[AccountTransactions] CHECK CONSTRAINT [FK_AccountTransactions_ExternalCounterparts]
GO
ALTER TABLE [dbo].[BankAccounts]  WITH CHECK ADD  CONSTRAINT [FK_BankAccounts_AccountOwners] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[AccountOwners] ([OwnerId])
GO
ALTER TABLE [dbo].[BankAccounts] CHECK CONSTRAINT [FK_BankAccounts_AccountOwners]
GO
ALTER TABLE [dbo].[TransactionFees]  WITH CHECK ADD  CONSTRAINT [FK_TransactionFees_AccountTransactions] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[AccountTransactions] ([TransactionId])
GO
ALTER TABLE [dbo].[TransactionFees] CHECK CONSTRAINT [FK_TransactionFees_AccountTransactions]
GO
ALTER TABLE [dbo].[TransactionFees]  WITH CHECK ADD  CONSTRAINT [FK_TransactionFees_Fees] FOREIGN KEY([FeeId])
REFERENCES [dbo].[Fees] ([FeeId])
GO
ALTER TABLE [dbo].[TransactionFees] CHECK CONSTRAINT [FK_TransactionFees_Fees]
GO
USE [master]
GO
ALTER DATABASE [WebAppTempProj] SET  READ_WRITE 
GO
