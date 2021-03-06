USE [master]
GO

/****** Object:  Database [DotNetProject]    Script Date: 02-Jan-22 9:09:41 AM ******/
CREATE DATABASE [DotNetProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DotNetProject', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DotNetProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DotNetProject_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DotNetProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DotNetProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [DotNetProject] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [DotNetProject] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [DotNetProject] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [DotNetProject] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [DotNetProject] SET ARITHABORT OFF 
GO

ALTER DATABASE [DotNetProject] SET AUTO_CLOSE ON 
GO

ALTER DATABASE [DotNetProject] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [DotNetProject] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [DotNetProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [DotNetProject] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [DotNetProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [DotNetProject] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [DotNetProject] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [DotNetProject] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [DotNetProject] SET  ENABLE_BROKER 
GO

ALTER DATABASE [DotNetProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [DotNetProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [DotNetProject] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [DotNetProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [DotNetProject] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [DotNetProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [DotNetProject] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [DotNetProject] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [DotNetProject] SET  MULTI_USER 
GO

ALTER DATABASE [DotNetProject] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [DotNetProject] SET DB_CHAINING OFF 
GO

ALTER DATABASE [DotNetProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [DotNetProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [DotNetProject] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [DotNetProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [DotNetProject] SET QUERY_STORE = OFF
GO

ALTER DATABASE [DotNetProject] SET  READ_WRITE 
GO


USE [DotNetProject]
GO

/****** Object:  Table [dbo].[assignment]    Script Date: 02-Jan-22 9:11:17 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[assignment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[filename] [varchar](50) NOT NULL,
	[subject_id] [varchar](8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[assignment]  WITH CHECK ADD  CONSTRAINT [FK_assignment_subject] FOREIGN KEY([subject_id])
REFERENCES [dbo].[subject] ([id])
GO

ALTER TABLE [dbo].[assignment] CHECK CONSTRAINT [FK_assignment_subject]
GO


USE [DotNetProject]
GO

/****** Object:  Table [dbo].[assignment_student]    Script Date: 02-Jan-22 9:11:30 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[assignment_student](
	[assignment_title] [varchar](50) NULL,
	[student_id] [varchar](50) NULL,
	[subject_id] [varchar](50) NULL,
	[file_name] [varchar](50) NULL,
	[student_file] [varchar](50) NULL
) ON [PRIMARY]
GO

USE [DotNetProject]
GO

/****** Object:  Table [dbo].[student_subject]    Script Date: 02-Jan-22 9:11:41 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[student_subject](
	[student_id] [nchar](50) NOT NULL,
	[subject_id] [nchar](8) NOT NULL,
 CONSTRAINT [FK_student_subject] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC,
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [DotNetProject]
GO

/****** Object:  Table [dbo].[subject]    Script Date: 02-Jan-22 9:11:50 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[subject](
	[id] [varchar](8) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_subject] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



USE [DotNetProject]
GO

/****** Object:  Table [dbo].[user]    Script Date: 02-Jan-22 9:12:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[user](
	[id] [varchar](50) NOT NULL,
	[name] [text] NOT NULL,
	[password] [varchar](50) NOT NULL,
	[type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


USE [DotNetProject]
GO

/****** Object:  Table [dbo].[workload]    Script Date: 02-Jan-22 9:12:11 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[workload](
	[lecturer_id] [nchar](50) NOT NULL,
	[subject_id] [nchar](8) NOT NULL,
 CONSTRAINT [FK_workload_subject] PRIMARY KEY CLUSTERED 
(
	[lecturer_id] ASC,
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO












