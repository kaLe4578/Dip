USE [master]
GO
/****** Object:  Database [Bib]    Script Date: 18.05.2021 21:29:00 ******/
CREATE DATABASE [Bib]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bib', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Bib.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bib_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Bib_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Bib] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bib].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bib] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bib] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bib] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bib] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bib] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bib] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bib] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bib] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bib] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bib] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bib] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bib] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bib] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bib] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bib] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bib] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bib] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bib] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bib] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bib] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bib] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bib] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bib] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Bib] SET  MULTI_USER 
GO
ALTER DATABASE [Bib] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bib] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bib] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bib] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bib] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Bib] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Bib] SET QUERY_STORE = OFF
GO
USE [Bib]
GO
/****** Object:  Table [dbo].[InventarnoyKnigi]    Script Date: 18.05.2021 21:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventarnoyKnigi](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Kod] [int] NULL,
 CONSTRAINT [PK_InventarnoyKnigi] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Izdanie]    Script Date: 18.05.2021 21:29:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Izdanie](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StatusKniga] [nvarchar](50) NULL,
 CONSTRAINT [PK_Izdanie] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Journal]    Script Date: 18.05.2021 21:29:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Journal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookingStartData] [datetime] NULL,
	[BookingEndData] [datetime] NULL,
	[BookingStatus] [int] NULL,
	[IdBook] [int] NULL,
	[F] [nvarchar](50) NULL,
	[I] [nvarchar](50) NULL,
	[O] [nvarchar](50) NULL,
 CONSTRAINT [PK_Journal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kniga]    Script Date: 18.05.2021 21:29:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kniga](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KodInventarnoyKnigi] [int] NULL,
	[Author] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[MestoIzdaniya] [nvarchar](50) NULL,
	[GodIzdaniya] [int] NULL,
	[RazdelSistematicheskogoKataloga] [nchar](10) NULL,
	[Availability] [bit] NULL,
	[Keyword] [int] NULL,
	[NoteToEmployees] [nvarchar](100) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Kniga] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 18.05.2021 21:29:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 18.05.2021 21:29:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 18.05.2021 21:29:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[IsBlocked] [bit] NULL,
	[Role] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[InventarnoyKnigi] ON 

INSERT [dbo].[InventarnoyKnigi] ([Id], [Kod]) VALUES (1, 1)
INSERT [dbo].[InventarnoyKnigi] ([Id], [Kod]) VALUES (2, 2)
INSERT [dbo].[InventarnoyKnigi] ([Id], [Kod]) VALUES (3, 3)
INSERT [dbo].[InventarnoyKnigi] ([Id], [Kod]) VALUES (4, 4)
INSERT [dbo].[InventarnoyKnigi] ([Id], [Kod]) VALUES (5, 5)
INSERT [dbo].[InventarnoyKnigi] ([Id], [Kod]) VALUES (6, 6)
INSERT [dbo].[InventarnoyKnigi] ([Id], [Kod]) VALUES (7, 7)
INSERT [dbo].[InventarnoyKnigi] ([Id], [Kod]) VALUES (8, 8)
INSERT [dbo].[InventarnoyKnigi] ([Id], [Kod]) VALUES (9, 9)
INSERT [dbo].[InventarnoyKnigi] ([Id], [Kod]) VALUES (10, 10)
SET IDENTITY_INSERT [dbo].[InventarnoyKnigi] OFF
GO
SET IDENTITY_INSERT [dbo].[Izdanie] ON 

INSERT [dbo].[Izdanie] ([Id], [StatusKniga]) VALUES (4, N'требует проверки и, возможно, правки ')
INSERT [dbo].[Izdanie] ([Id], [StatusKniga]) VALUES (6, N'написано верно, жирно - ОЦ')
INSERT [dbo].[Izdanie] ([Id], [StatusKniga]) VALUES (7, N'книга списана и отсутствует, или пропущен номер')
SET IDENTITY_INSERT [dbo].[Izdanie] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [Status]) VALUES (1, N'идет подверждение заявки')
INSERT [dbo].[Status] ([Id], [Status]) VALUES (2, N'заявка подвержданна ')
INSERT [dbo].[Status] ([Id], [Status]) VALUES (3, N'ожидание выдачи книги ')
INSERT [dbo].[Status] ([Id], [Status]) VALUES (4, N'книга выдана')
INSERT [dbo].[Status] ([Id], [Status]) VALUES (5, N'заявка отклонена ')
INSERT [dbo].[Status] ([Id], [Status]) VALUES (6, N'завершение операции')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([Id], [Type]) VALUES (1, N'Книга')
INSERT [dbo].[Type] ([Id], [Type]) VALUES (2, N'Журнал')
INSERT [dbo].[Type] ([Id], [Type]) VALUES (3, N'Газета')
INSERT [dbo].[Type] ([Id], [Type]) VALUES (4, N'Другая печатная продукция')
INSERT [dbo].[Type] ([Id], [Type]) VALUES (5, N'Особо ценная(а,б,в)')
SET IDENTITY_INSERT [dbo].[Type] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Login], [Password], [IsBlocked], [Role]) VALUES (1, N'admin', N'admin', 0, N'администратор')
INSERT [dbo].[Users] ([Id], [Login], [Password], [IsBlocked], [Role]) VALUES (2, N'1', N'18', 1, N'менеджер')
INSERT [dbo].[Users] ([Id], [Login], [Password], [IsBlocked], [Role]) VALUES (3, N'1', N'1', 0, N'менеджер')
INSERT [dbo].[Users] ([Id], [Login], [Password], [IsBlocked], [Role]) VALUES (1002, N'12', N'12', 0, N'менеджер')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Journal]  WITH CHECK ADD  CONSTRAINT [FK_Journal_Kniga] FOREIGN KEY([IdBook])
REFERENCES [dbo].[Kniga] ([Id])
GO
ALTER TABLE [dbo].[Journal] CHECK CONSTRAINT [FK_Journal_Kniga]
GO
ALTER TABLE [dbo].[Journal]  WITH CHECK ADD  CONSTRAINT [FK_Journal_Status] FOREIGN KEY([BookingStatus])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Journal] CHECK CONSTRAINT [FK_Journal_Status]
GO
ALTER TABLE [dbo].[Kniga]  WITH CHECK ADD  CONSTRAINT [FK_Kniga_InventarnoyKnigi] FOREIGN KEY([KodInventarnoyKnigi])
REFERENCES [dbo].[InventarnoyKnigi] ([Id])
GO
ALTER TABLE [dbo].[Kniga] CHECK CONSTRAINT [FK_Kniga_InventarnoyKnigi]
GO
ALTER TABLE [dbo].[Kniga]  WITH CHECK ADD  CONSTRAINT [FK_Kniga_Izdanie] FOREIGN KEY([Status])
REFERENCES [dbo].[Izdanie] ([Id])
GO
ALTER TABLE [dbo].[Kniga] CHECK CONSTRAINT [FK_Kniga_Izdanie]
GO
ALTER TABLE [dbo].[Kniga]  WITH CHECK ADD  CONSTRAINT [FK_Kniga_Type] FOREIGN KEY([Keyword])
REFERENCES [dbo].[Type] ([Id])
GO
ALTER TABLE [dbo].[Kniga] CHECK CONSTRAINT [FK_Kniga_Type]
GO
USE [master]
GO
ALTER DATABASE [Bib] SET  READ_WRITE 
GO
