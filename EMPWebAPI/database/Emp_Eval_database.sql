USE [master]
GO
/****** Object:  Database [EMP_EVAL_DB]    Script Date: 6/10/2021 1:18:09 AM ******/
CREATE DATABASE [EMP_EVAL_DB] ON  PRIMARY 
( NAME = N'EMP_EVAL_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EMP_EVAL_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EMP_EVAL_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EMP_EVAL_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EMP_EVAL_DB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EMP_EVAL_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EMP_EVAL_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EMP_EVAL_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EMP_EVAL_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EMP_EVAL_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EMP_EVAL_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EMP_EVAL_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EMP_EVAL_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EMP_EVAL_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EMP_EVAL_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EMP_EVAL_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EMP_EVAL_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EMP_EVAL_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EMP_EVAL_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EMP_EVAL_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EMP_EVAL_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EMP_EVAL_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EMP_EVAL_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EMP_EVAL_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EMP_EVAL_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EMP_EVAL_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EMP_EVAL_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EMP_EVAL_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EMP_EVAL_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [EMP_EVAL_DB] SET  MULTI_USER 
GO
ALTER DATABASE [EMP_EVAL_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EMP_EVAL_DB] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EMP_EVAL_DB', N'ON'
GO
USE [EMP_EVAL_DB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/10/2021 1:18:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 6/10/2021 1:18:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/10/2021 1:18:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/10/2021 1:18:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/10/2021 1:18:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/10/2021 1:18:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/10/2021 1:18:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[DepartmentID] [int] NULL,
	[NationalID] [nvarchar](10) NULL,
	[IsAdmin] [bit] NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 6/10/2021 1:18:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 6/10/2021 1:18:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeEvaluation]    Script Date: 6/10/2021 1:18:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeEvaluation](
	[EvaluationID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [nvarchar](450) NOT NULL,
	[JobKnowledge] [int] NOT NULL,
	[WorkQuality] [int] NOT NULL,
	[Attendance] [int] NOT NULL,
	[Initiatives] [int] NOT NULL,
	[CommunicationSkill] [int] NOT NULL,
	[OverAllScore] [int] NOT NULL,
 CONSTRAINT [PK_EmployeeEvaluation] PRIMARY KEY CLUSTERED 
(
	[EvaluationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 6/10/2021 1:18:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](50) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[Mobile] [nchar](10) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[IsAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210605154630_initial', N'5.0.6')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'05e908c4-2ddf-4e88-a578-2d1fda427d13', N'Moderator', N'MODERATOR', N'360e84d1-ab0d-444d-b4ef-2ec856691113')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'52a78c18-d840-49c8-af5a-1d498ebe6a74', N'Administrator', N'ADMINISTRATOR', N'63f20c68-bbba-4a7a-967f-81f3b09f5b6c')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'5b08dda0-9aae-4c1f-adf9-4351c9416d7e', N'User', N'USER', N'f692e59c-e6c8-4b8f-8618-744f79827335')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e5a47513-0c3f-4ab3-8c18-8b7c1432d77d', N'52a78c18-d840-49c8-af5a-1d498ebe6a74')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e2d47756-ff8b-46b5-9da8-32d784c8f027', N'5b08dda0-9aae-4c1f-adf9-4351c9416d7e')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DepartmentID], [NationalID], [IsAdmin]) VALUES (N'bf636570-9ee3-44ef-88d2-b8a7708ca120', N'ali', N'Omer', N'ali', N'ALI', N'ali@company.com', N'ALI@COMPANY.COM', 0, N'AQAAAAEAACcQAAAAEIQqbJwK3hAzyukhAwRBo1MHeTg6gbGD/S0JeM6DWMZ7jJJt8pna6jS2n3ZWjRTTvA==', N'FR5DW3KOMWMWXI7OAJOJAQA5MSJB4GYA', N'9d1c6473-8bea-4589-a801-afaf402829ba', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DepartmentID], [NationalID], [IsAdmin]) VALUES (N'e2d47756-ff8b-46b5-9da8-32d784c8f027', N'Omer', N'Ali', N'brigdar.88@gmail.com', N'BRIGDAR.88@GMAIL.COM', N'brigdar.88@gmail.com', N'BRIGDAR.88@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEFcbNWP+NZslEJemKGOgk+bXTuJEpd92McVxgVYQlgFD7Xek6CWVmPkfryoNP8/XLQ==', N'OBZ2ZTB6PDLWX2N3QZ67SLLDWYRSHTPE', N'7bb7c481-650d-4821-8ed1-ef82c9f3654f', N'054904298', 0, 0, NULL, 1, 0, 3, N'1233211234', 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DepartmentID], [NationalID], [IsAdmin]) VALUES (N'e5a47513-0c3f-4ab3-8c18-8b7c1432d77d', N'Ahmed', N'Brigdar', N'admin@company.com', N'ADMIN@COMPANY.COM', N'admin@company.com', N'ADMIN@COMPANY.COM', 0, N'AQAAAAEAACcQAAAAEIVSYa4QxBA733hZe5lqJMmFS6y/M4T0vDWiPWJutHzKUInOIEyMStBYym99TPulxA==', N'D2DZXU6UPA4IKQFSJJXQ355F2UV7YJLM', N'f5abb95a-d8c5-4136-8374-26d70efb6265', N'987654342', 0, 0, NULL, 1, 0, 1, N'2411111175', 1)
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DepartmentID], [NationalID], [IsAdmin]) VALUES (N'ec75dee8-a43a-4764-b1ee-0031e9d16784', NULL, NULL, N'user', N'USER', N'user@secureapi.com', N'USER@SECUREAPI.COM', 1, N'AQAAAAEAACcQAAAAEISCCyG0ipsltYczu0W2eJVzm9JfOAq+IN8rfPHkG7Wr8PaezEMqaIDah35bXqAC4g==', N'2VFY5UP7EAWJ7H4722VNMQIFKXW4AOK7', N'5d933d98-94f0-4b78-b351-70a64cb859ce', NULL, 1, 0, NULL, 1, 0, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 
GO
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (1, N'IT')
GO
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (2, N'Finance')
GO
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (3, N'HR')
GO
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (4, N'Retails')
GO
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (5, N'Purchases')
GO
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (6, N'Logistic')
GO
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (7, N'marketing')
GO
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (8, N'Sales')
GO
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeEvaluation] ON 
GO
INSERT [dbo].[EmployeeEvaluation] ([EvaluationID], [EmployeeID], [JobKnowledge], [WorkQuality], [Attendance], [Initiatives], [CommunicationSkill], [OverAllScore]) VALUES (12, N'e2d47756-ff8b-46b5-9da8-32d784c8f027', 1, 3, 4, 2, 3, 50)
GO
SET IDENTITY_INSERT [dbo].[EmployeeEvaluation] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 
GO
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID], [Mobile], [Email], [Password], [IsAdmin]) VALUES (2, N'Admin', 1, N'0548945987', N'admin@company.com', N'admin', 1)
GO
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID], [Mobile], [Email], [Password], [IsAdmin]) VALUES (3, N'ali', 1, N'0546789987', N'ali@company.com', N'ali', 0)
GO
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID], [Mobile], [Email], [Password], [IsAdmin]) VALUES (4, N'Omer', 3, N'098765434 ', N'Omer@company.com', N'Omer', 0)
GO
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 6/10/2021 1:18:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 6/10/2021 1:18:10 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 6/10/2021 1:18:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 6/10/2021 1:18:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 6/10/2021 1:18:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 6/10/2021 1:18:10 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 6/10/2021 1:18:10 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_Departments]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[EmployeeEvaluation]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeEvaluation_AspNetUsers] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EmployeeEvaluation] CHECK CONSTRAINT [FK_EmployeeEvaluation_AspNetUsers]
GO
USE [master]
GO
ALTER DATABASE [EMP_EVAL_DB] SET  READ_WRITE 
GO
