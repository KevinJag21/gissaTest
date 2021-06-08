
GO
/****** Object:  Database [GissaTest]    Script Date: 8/6/2021 01:21:31 ******/
CREATE DATABASE [GissaTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GissaTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\GissaTest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GissaTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\GissaTest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GissaTest] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GissaTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GissaTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GissaTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GissaTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GissaTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GissaTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [GissaTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GissaTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GissaTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GissaTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GissaTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GissaTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GissaTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GissaTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GissaTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GissaTest] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GissaTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GissaTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GissaTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GissaTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GissaTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GissaTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GissaTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GissaTest] SET RECOVERY FULL 
GO
ALTER DATABASE [GissaTest] SET  MULTI_USER 
GO
ALTER DATABASE [GissaTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GissaTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GissaTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GissaTest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GissaTest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GissaTest] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'GissaTest', N'ON'
GO
ALTER DATABASE [GissaTest] SET QUERY_STORE = OFF
GO
USE [GissaTest]
GO
/****** Object:  UserDefinedTableType [dbo].[PhoneType]    Script Date: 8/6/2021 01:21:32 ******/
CREATE TYPE [dbo].[PhoneType] AS TABLE(
	[userId] [varchar](14) NULL,
	[phone] [varchar](8) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[SoftSkillType]    Script Date: 8/6/2021 01:21:32 ******/
CREATE TYPE [dbo].[SoftSkillType] AS TABLE(
	[softSkill] [varchar](35) NULL,
	[userId] [varchar](14) NULL
)
GO
/****** Object:  Table [dbo].[Phone]    Script Date: 8/6/2021 01:21:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phone](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [varchar](14) NOT NULL,
	[phone] [varchar](8) NOT NULL,
 CONSTRAINT [PK_Phone] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoftSkill]    Script Date: 8/6/2021 01:21:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoftSkill](
	[skill] [varchar](35) NOT NULL,
 CONSTRAINT [PK_SoftSkill] PRIMARY KEY CLUSTERED 
(
	[skill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 8/6/2021 01:21:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userId] [varchar](14) NOT NULL,
	[userType] [varchar](14) NOT NULL,
	[userIdType] [varchar](12) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[lastName] [varchar](60) NOT NULL,
	[password] [varchar](18) NOT NULL,
	[email] [varchar](60) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_SoftSkill]    Script Date: 8/6/2021 01:21:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_SoftSkill](
	[softSkill] [varchar](35) NOT NULL,
	[userId] [varchar](14) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_User_SoftSkill] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserIdType]    Script Date: 8/6/2021 01:21:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserIdType](
	[userIdType] [varchar](12) NOT NULL,
 CONSTRAINT [PK_UserIdType] PRIMARY KEY CLUSTERED 
(
	[userIdType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 8/6/2021 01:21:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[type] [varchar](14) NOT NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Phone]  WITH CHECK ADD  CONSTRAINT [FK_Phone_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([userId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Phone] CHECK CONSTRAINT [FK_Phone_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserIdType] FOREIGN KEY([userIdType])
REFERENCES [dbo].[UserIdType] ([userIdType])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserIdType]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserType] FOREIGN KEY([userType])
REFERENCES [dbo].[UserType] ([type])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserType]
GO
ALTER TABLE [dbo].[User_SoftSkill]  WITH CHECK ADD  CONSTRAINT [FK_User_SoftSkill_SoftSkill] FOREIGN KEY([softSkill])
REFERENCES [dbo].[SoftSkill] ([skill])
GO
ALTER TABLE [dbo].[User_SoftSkill] CHECK CONSTRAINT [FK_User_SoftSkill_SoftSkill]
GO
ALTER TABLE [dbo].[User_SoftSkill]  WITH CHECK ADD  CONSTRAINT [FK_User_SoftSkill_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([userId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User_SoftSkill] CHECK CONSTRAINT [FK_User_SoftSkill_User]
GO
/****** Object:  StoredProcedure [dbo].[test_getSoftSkills]    Script Date: 8/6/2021 01:21:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[test_getSoftSkills]   
    
AS   

BEGIN
    SELECT * 
    FROM SoftSkill;  
END
GO
/****** Object:  StoredProcedure [dbo].[test_InsertUser]    Script Date: 8/6/2021 01:21:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[test_InsertUser]   (
	@userId varchar (14),
	@userType varchar(14),
	@userIdType varchar(12),
	@name varchar(30),
	@lastName varchar(60),
	@password varchar (18),
	@email varchar (60),
	@tblPhone PhoneType readonly,
	@tblSoftSkill SoftSkillType readonly)
AS   

	BEGIN  
		INSERT INTO [GissaTest].[dbo].[User] 
			(userId,userType,userIdType,name,lastName,password,email)
		VALUES    
			(@userId,@userType,@userType,@name,@lastName,@password,@email)  	
	END  
	BEGIN
		INSERT INTO Phone (phone,userId) SELECT phone,userId from @tblPhone;
	END
	BEGIN
		INSERT INTO User_SoftSkill (softSkill,userId) SELECT softSkill,userId from @tblSoftSkill;
	END
GO
/****** Object:  StoredProcedure [dbo].[test_login]    Script Date: 8/6/2021 01:21:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[test_login] (
	@password varchar (18),
	@email varchar (60)
)  
    
AS   

BEGIN
    select * from [GissaTest].[dbo].[User] where email = @email and password = @password;
END
GO
USE [master]
GO
ALTER DATABASE [GissaTest] SET  READ_WRITE 
GO
use GissaTest;
GO
insert into SoftSkill (skill) values ('Buena comunicación'), ('Buena organización'),
('Trabajo en equipo'), ('Puntualidad'), ('Ser creativo'), ('Facilidad de adaptación');
GO
insert into UserIdType (userIdType) values ('Nacional'), ('Extranjero');
GO
insert into UserType (type) values ('Administrador'),('Consultor');
GO
insert into [GissaTest].[dbo].[User] (userId,userType,userIdType,name,lastName,password,email) values 
('116990315','Administrador','Nacional','Kevin','Araya Granados', '12345678','kevinjag21j@gmail.com');
GO
