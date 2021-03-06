USE [master]
GO
/****** Object:  Database [Bib]    Script Date: 07.06.2021 21:20:20 ******/
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
/****** Object:  Table [dbo].[InventarnoyKnigi]    Script Date: 07.06.2021 21:20:22 ******/
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
/****** Object:  Table [dbo].[Journal]    Script Date: 07.06.2021 21:20:22 ******/
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
/****** Object:  Table [dbo].[Kniga]    Script Date: 07.06.2021 21:20:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kniga](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KodInventarnoyKnigi] [int] NULL,
	[Author] [nvarchar](150) NULL,
	[Name] [nvarchar](2500) NULL,
	[MestoIzdaniya] [nvarchar](150) NULL,
	[GodIzdaniya] [int] NULL,
	[RazdelSistematicheskogoKataloga] [nvarchar](250) NULL,
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
/****** Object:  Table [dbo].[Publication]    Script Date: 07.06.2021 21:20:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publication](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StatusKniga] [nvarchar](50) NULL,
 CONSTRAINT [PK_Publication] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 07.06.2021 21:20:23 ******/
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
/****** Object:  Table [dbo].[Type]    Script Date: 07.06.2021 21:20:23 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 07.06.2021 21:20:23 ******/
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
SET IDENTITY_INSERT [dbo].[Kniga] ON 

INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (1, 1, NULL, N'Сметы и раскладки Юрьевецкого уездного земства на 1916 год.', N'Юрьевец : Типография В.Н. Крылова, ', 1915, N'336:9(С)1 ', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (2, 1, NULL, N'Отчет Костромской городской управы за 1888 год.', N'Кострома : В Губернской типографии.', 1889, N'6С8:9(С)1 ', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (3, 1, NULL, N'Доклады Костромской губернской земской  управы. К очередному губернскому земскому собранию сессии 1899 года. Ч. 3-я.', N'Кострома : В Губернской типографии.', 1899, N'34С1:9(С)1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (4, 1, NULL, N'Доклады Костромской губернской земской управы к очередному губернскому земскому собранию сессии 1913 года. По кустарному  отделению. ', N'Кострома : Губернская типография.', 1913, N'6П9.4:9(С)1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (5, 1, NULL, N'[Циркуляры от г. Костромского губернатора и от его канцелярии].', N'[Кострома : б. и.].', 1908, N'34С1:9(С)', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (6, 1, NULL, N'Доклад губернской земской управы и постановление губернского земского собрания по вопросу об улучшении дорог в губернии за счет специального дорожного капитала.                                                                                                                    Костромское губернское земское собрание, очередная сессия 1898 года, № 115.', N'Кострома : В Губернской типографии.', 1899, N'6С8:9(С)1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (7, 1, NULL, N'Отчет Костромской уездной земской управы за 1916 год.', N'Кострома : Губернская типография.', 1917, N'34С1 +336.1 +63(09С) +9(С)1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (8, 1, NULL, N'Доклады Костромской губернской земской управы очередному губернскому земскому собранию сессии 1914 года. По канцелярии, бухгалтерии и пенсионной кассе. Вып. 2.', N'Кострома : Губернская типография.', 1914, N'34С1 +336.4', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (9, 1, NULL, N'Отчет Костромской городской управы за 1900 год.', N'Кострома : Губернская типография.', 1901, N'34С1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (10, 1, NULL, N'Отчет по казенной продаже питей в Костромском акцизном управлении за 1908 год. (Год восьмой).', N'Кострома : Губернская типография', 1909, N'338Т85', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (11, 1, NULL, N'Постановления Костромского очередного уездного земского собрания. С 11 по 13 марта 1874 г. и экстренного созыва 21 сентября 1873 г.', N'Кострома : В Губернской типографии', 1874, N'34С1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (12, 1, NULL, N'Сборник постановлений Чухломского уездного очередного земского собрания. 28-го марта - 7-го апреля 1883 года.', N'Кострома : Типо-Литография А.Г. Фальк', 1883, N'34С1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (13, 1, NULL, N'[Российский календарь за 1913 год].', N'[Б. м. : б. и.].', 1913, N'03', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (14, 1, NULL, N'Доклады к очередному уездному земскому собранию сессии 1914 года по агрономическо-экономическому отделу / Костромское уездное земство.', N'Кострома : Типогр. А. Азерского', 1914, N'631.1+334 +336.5', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (15, 1, NULL, N'Доклады управы и постановления Буйского уездного земского собрания экстренных заседаний 5 марта 1912 года, 27 февраля 1913 года и очередной сессии 1912 года.', N'Буй : Типография Н.А. Бутаковского', 1913, N'34С1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (16, 1, NULL, N'Доклады по агрономическому отделу к очередному уездному земскому собранию  сессии 1913 года: С приложением журнала заседания Экономического Совета и постановлений земского собрания / Буйское уездное земство.', N'Буй : Типография Н.А. Бутаковского', 1913, N'631.1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (17, 1, NULL, N'Отчет Нерехтского добровольного пожарного общества за 1906 год.', N'Нерехта : Типогафия В.А. Тезикова', 1907, N'36', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (18, 1, NULL, N'Постановления Нерехтской городской думы, состоявшиеся в 1916 году.', N'Нерехта : Типография В.А. Тезикова', 1917, N'34С1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (19, 1, NULL, N'Журнал заседания Костромской губернской оценочной комиссии 14-го апреля 1909 г. Выпуск 6.', N'Кострома : Губернская типография', 1909, N'338', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (20, 1, NULL, N'Доклады Костромской губернской земской управы к очередному губернскому земскому собранию сессии 1911 года. По оценочно-статистическому отделению. Часть 1.', N'Кострома : Типография Х.А. Гелина', 1911, N'34С1 +336.2     +31', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (21, 1, NULL, N' Журналы заседаний Костромской губернской оценочной комиссии 12 и 16 февраля 1908 года. Выпуск 4.', N'Кострома : Губернская типография', 1908, N'34С1 +33С1 +63(09С) +9(С)1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (22, 1, NULL, N'Постановления Костромского губернского земства очередного собрания сессии 1913 года по оценочно-статистическому делу и доклады ГЗУ по оценочно-статистическому отделению.', N'Кострома : Типография Х.А. Гелина', 1914, N'34С1
+31
+33С4
+9(С)1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (23, 1, NULL, N'Заключения уездных земских собраний и уездных оценочных комиссий Костромской губернии, полученные от уездных земских управ по 21 ноября 1914 г., по докладу Костромской губернской земской управы "Цены на строительные материалы и рабочие руки Костромской губ. за период с 1902 по 1910 г.".', N'Кострома : Губернская типография', 1914, N'34С1 +33С1 +33С4 +9(С)1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (24, 1, NULL, N'Отчет Чухломской уездной земской управы за 1883 год. К очередной сессии уездного земского собрания 1884 года.', N'Кострома : Тип.-лит. А.Г. Фальк', 1884, N'34С1 +33С1 +33С4 +9(С)1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (25, 1, NULL, N'Журналы заседаний Костромской губернской оценочной комиссии 12 августа и 29 ноября  1908 года. Выпуск 5.', N'Кострома : Губернская типография', 1909, N'34С1
+31
+33С4
+9(С)', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (26, 1, NULL, N'Журналы заседаний Костромской губернской оценочной комиссии 12 августа и 29 ноября  1908 года. Выпуск 5.', N'Кострома : Губернская типография,', 1909, N'34С1
+31
+33С4
+9(С)1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (27, 1, NULL, N'Отчет Костромской губернской земской управы по взаимному земскому страхованию от огня строений за 1903 год.', N'Кострома : Губернская типография', 1904, N'34С1
+36
+9(С)1 +6С9.6', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (28, 1, NULL, N'Отчет Костромской губернской земской управы по взаимному земскому страхованию от огня строений за 1901 год.', N'Кострома : Губернская типография', 1902, N'34С1
+36
+9(С)1 +6С9.6', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (29, 1, NULL, N'Приложение к докладам губернской управы земскому собранию сессии 1911 г. Противопожарные мероприятия.', N'Кострома : Типография Х.А. Гелина', 1911, N'34С1
+36', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (30, 1, NULL, N'Отчет Костромской губернской земской управы по взаимному земскому страхованию от огня строений и земскому страхованию животных, за время с 1-го октября 1891 г. по 1-е октября 1892 г.', N'Кострома : В Губернской типографии', 1892, N'34С1 
36', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (31, 1, NULL, N'Формулярный список селений, обследованных в противопожарном отношении в 1912 году.', N'Кострома : Губернская типография', 1914, N'34С1
+36
+6С9.6
+312', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (32, 1, NULL, N'Сборник постановлений Солигаличского уездного земского собрания XXIV очередной сессии с 5-13 октября 1888 года.', N'Кострома : Типо-литография Ф.А. Фальк', 1889, N'34С1
+336
+9(С)1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (33, 1, NULL, N'Отчет местного попечительства Ивановского сельского сиротского детского приюта имени Н.Н. Григорьева ведомства учреждений императрицы Марии за 1903 год.', N'Кострома : Губернская типография', 1904, N'373.5', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (34, 1, NULL, N'Дополнение к отчету Костромского губернского предводителя дворянства. Постановления очередного губернского дворянского собрания с 30 января по 2 февраля 1911 года.', N'Кострома : Типография М.Ф. Риттер', 1911, N'34С1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (35, 1, NULL, N'Сборник постановлений Ветлужского уездного земского собрания очередной сессии 1914 года и чрезвычайных сессий 9-го марта и 27-го апреля 1915 года : [С докладами управы].', N'[Ветлуга : б. и.].', 1915, N'34С1
+33С4', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (36, 1, NULL, N'Доклад Костромскому губернскому земскому собранию очередной сессии 1913 г. По юбилейной выставке 1913 г.', N'[Кострома : б. и.].', 1913, N'34С1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (37, 1, NULL, N'Доклады Костромской губернской земской управы. К очередному губернскому земскому собранию сессии 1899 года. Часть 2-я.', N'Кострома : В Губернской типографии', 1899, N'34С1
+33С1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (38, 1, NULL, N'Отчет Костромской губернской земской управы за 1908 год.', N'Кострома : Типо-литография насл. А.Е. Грузинцева', 1909, N'34С1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (39, 1, NULL, N'10 лет борьбы за социалистическое строительство / Издание Костромской губернской плановой комиссии.', N'Кострома : [б.и.]', 1927, N'33С', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (40, 1, NULL, N'Доклады по агрономическому отделу к очередному уездному земскому собранию  сессии 1912 года.', N'Кострома : Типография Х.А. Гелина', 1912, N'34С1 +631.1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (41, 1, NULL, N'Доклады Костромской уездной земской управы к очередному уездному земскому собранию сессии 1887 года.', N'Кострома : Типо-литография Ф.А. Фальк', 1887, N'34С1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (42, 1, NULL, N'Постановления Костромского чрезвычайного губернского земского собрания сессии 1909 г.', N'Кострома : Губернская типография', 1909, N'34С1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (43, 1, NULL, N'Ежегодник Солигаличского уездного земства Костромской губернии: 1909 г.', N'Солигалич : Типография Н.Ф. Касаткина ', 1910, N'34С1+33С', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (44, 1, NULL, N'Положение о земских учреждениях 12 июня 1890 года и дополнительные к нему постановления об отдельных отраслях деятельности земства / Составили по Своду законов, Полному собранию законов и Собранию узаконений и распоряжений правительства Н. Воеводский и барон Ю. Икскуль.', N'СПб. : В государственной типографии', 1890, N'34С1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (45, 1, NULL, N'Журналы Секретного и Главного комитетов по крестьянскому делу. Т. 2. С 10 октября 1860 года по 13 февраля 1861 года. - (Архив Государственного Совета).', N'Пг. : Государственная типография', 1915, N'63(09С)', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (46, 1, NULL, N'Сборник постановлений Галичского уездного земского собрания. Очередной сессии 1914 года.', N'Кострома : Типография Х.А. Гелина', 1915, N'34С1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (47, 1, NULL, N'Обязательные постановления об устройстве и распланировании селений  Костромской губернии, составленные Костромским губернским земским собранием по постановлению 12 декабря 1903 года и 25 января 1909 года и изданные на основ. ст. 111 Полож. о земск. учрежд. с приложением извлечений из Устава Строительного, из Положения о губернских и уездных земских учреждениях и из Устава о наказаниях, налагаемых миров. судьями.', N'Кострома : Типография А. Азерского', 1909, N'34С1
+338:6С
+31', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (48, 1, NULL, N'Доклады Костромской губернской земской управы очередному губернскому земскому собранию сессии 1915 года. По страховому отделению.', N'Кострома : Типография Х.А. Гелина', 1916, N'34С1+36', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (49, 1, NULL, N'Сметы и раскладки Галичского уездного земства на 1916 год / Составлен Галичской уездной земской управой.', N'Кострома : Типография губернского земства', 1916, N'336.1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (50, 1, NULL, N'Доклады Костромской уездной земской управы. К очередной сессии уездного земского собрания 1907 года. Ч. 3-я.', N'Кострома : Губернская типография', 1908, N'34С1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (51, 1, NULL, N'В Костромскую городскую Думу городской управы доклад  с приложением отчета  Костромской городской управы за 1892 год.', N'Кострома : В губернской типографии', 1893, N'34С1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (52, 1, NULL, N'Отчет о действиях Большесольского общественного К.А. Попова банка за 1901 год.', N'Кострома : Губернская типография', 1902, N'336.5', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (53, 1, NULL, N'Отчет о действиях Большесольского общественного К.А. Повова банка за 1887 год.', N'Кострома : Типо-литография Ф.А. Фальк', 1888, N'336.5', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (54, 1, NULL, N'Обзор Костромской губернии за 1887 год: Приложение к всеподданнейшему отчету Костромского губернатора.', N'[Кострома : б. и.].', 1888, N'34С1 +33С5', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (55, 1, NULL, N'Обзор Костромской губернии за 1890 год: Приложение к всеподданнейшему отчету Костромского губернатора.', N'[Кострома : б. и.].', 1891, N'34С1 +33С5', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (56, 1, NULL, N'Обзор Костромской губернии за 1903-й год: Приложение к всеподданнейшему отчету Костромского губернатора.', N'[Кострома : б. и.].', 1904, N'34С1 +33С5', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (57, 1, NULL, N'Пятнадцатый отчет Костромско-Ярославского отделения, состоящего под августейшим покровительством ее императорского величества государыни императрицы, попечительства императрицы Марии Александровны о слепых за 1902 год.', N'Кострома : Губернская типография', 1903, N'36
+371.9', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (58, 1, NULL, N'Сборник постановлений Галичского уездного земского собрания. Очередной сессии 1913 года.', N'Кострома : Типография Х.А. Гелина', 1914, N'34С1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (59, 1, NULL, N'Инструкция должностным лицам акцизного надзора и служащим по казенной продаже питей в Костромской губернии о порядке ведения казенной винной операции.', N'Кострома : Губернская типография', 1903, N'338Т8 +6П8.5', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (60, 1, NULL, N'Отчет Варнавинской уездной земской управы за 1904 год. К очередной сессии земского собрания 1905 г.', N'Варнавин :  Типография Филиппа Тимофеевича Мутовкина', 1905, N'34С1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (61, 1, NULL, N'Доклады Буйской уездной земской управы уездному земскому собранию очередной сессии и экстренных заседаний 1913 года.', N'Буй : Типография Н.А. Бутаковского', 1914, N'34С1
+33С', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (62, 1, NULL, N'Отчеты Костромской уездной земской управы за 1882 год. К очередной сессии уездного земского собрания 1883 года.', N'Кострома : Типо-литография А. Фальк', 1883, N'34С1 +336.1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (63, 1, NULL, N'Отчеты Буйскогй уездной земской управы за 1915 г.', N'Буй : Типография Товарищества', 1916, N'34С1
+33С4', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (64, 1, NULL, N'Обзор Костромской губернии за 1885 год: Приложение к всеподданнейшему отчету Костромского губернатора.', N'[Кострома : б. и.].', 1886, N'34С1
+33С5', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (65, 1, NULL, N'Доклады Костромской уездной земской управы. Очередному уездному земскому собранию 1914 года. Часть 2-я.', N'Кострома : Губернская типография', 1914, N'34С1 +336.1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (66, 1, NULL, N'Сборник постановлений Ветлужского уездного земского собрания очередной сессии с 8-го по 21-е ноября 1908 года и чрезвычайной сессии 27, 28, 29 и 30 апреля 1909 г.', N'Ветлуга', 1909, N'3', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (67, 1, NULL, N'Краткая характеристика грунтовых дорог Костромской губернии: По исследованию 1912 г. Выпуск 1-й (Уезды: Буйский, Галичский, Солигаличский, Чухломской).', N'Кострома : Тип. Х.А. Гелина', 1912, N'338:6Т2', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (68, 1, NULL, N'Отчет Кинешемской уездной земской управы за 1913 год. Выпуск 2. По выполнению земской сметы.', N'Кинешма : Типография уездного земства', 1914, N'34С1 +336.1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (69, 1, NULL, N'Доклады Кинешемской уездной земской управы очередному уездному земскому собранию сессии 1901 года, с приложениями к ним. Отделы 2, 3, 4.', N'Кострома : Губернская типография', 1901, N'34С1 +373.01', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (70, 1, NULL, N'Доклады Костромской губернской земской управы очередному губернскому земскому собранию сессии 1913 года. По гидротехническому отделу.', N'Кострома : Типо-литография А.Н. Чемоданова', 1914, NULL, 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (71, 1, NULL, N'Отчет Кинешемской уездной земской управы по приходу и расходу сумм за 1904 год.', N'Кинешма : Типография Л.А. Анфимова', 1905, N'34С1 +336.1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (72, 1, NULL, N'Отчет Кинешемской уездной земской управы за 1911 год. Выпуск 2. По выполнению земской сметы.', N'Кинешма : Типография уездного земства', 1912, N'34С1 +336.1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (73, 1, NULL, N'Отчет Кинешемской уездной земской управы за 1910 г. Выпуск 2. По выполнению уездной земской сметы.', N'Кинешма : Типография уездного земства', 1911, N'34С1 +336.1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (74, 1, NULL, N'[Конволют]:
     Доклады Костромской губернской земской управы к очередному губернскому земскому собранию сессии 1910 года. [По агрономическому, кустарному, гидротехническому, дорожному, пчеловодному, ветеринарному отделам, по губернской больнице и психиатрической колонии, по страховому и оценочно-статистическому отделениям].', N'Кострома : Губернская типография 1910-1911', 1911, N'34С1 +33С4', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (75, 1, NULL, N'Постановления Костромского очередного губернского земского собрания сессии 1897 года.', N'Кострома : Типо-лит. С. П. Федотова', 1889, N'34С1 +33С4', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (76, 1, NULL, N'Доклады Костромской губернской земской управы. К очередному губернскому земскому собранию сессии 1908 года. Часть 1-я. ', N'Кострома : Губернская типография', 1908, N'34С1 +33С4', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (77, 1, NULL, N'Экономическое обследование района линии Кострома-Николо-Палома.', N'Кострома : Типография А.С. Азерского', 1914, N'338:6Т1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (78, 1, NULL, N'Доклады Костромской губернской земской управы очередному губернскому земскому собранию сессиии 1916 года. По больнице и психиатрической колонии.', N'Кострома : Типография губернского земства', 1917, N'34С1 +33С1 +61(09)С  ', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (79, 1, NULL, N'Отчет Костромской губернской земской управы за 1914 год', N'Кострома', 1915, N'34С1 +33С1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (80, 1, NULL, N'Доклады Костромской уездной земской управы. Очередному уездному земскому собранию сессии 1908 года. Часть 3.', N'Кострома : Губернская типография', 1909, N'34С1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (81, 1, NULL, N'Отчет Кологривской уездной земской управы за 1914 год.', N'Кологрив : Типография уездного земства', 1915, N'34С1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (82, 1, NULL, N'Отчет Костромской уездной земской управы за 1915 год.', N'Кострома : Типо-литография А.Н. Чемоданова', 1916, N'34С1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (83, 1, NULL, N'Доклады Костромской уездной земской управы. Очередному уездному земскому собранию сессии 1908 года. Часть 1.', N'Кострома : Губернская типография', 1908, N'34С1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (84, 1, NULL, N'Постановления Костромской городской думы. 1877.', N'Кострома', 1877, N'34С1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (85, 1, NULL, N'Сборник постановлений Ветлужского уездного земского собрания очередной сессии с 29-го сентября, по 12-е октября 1911 года.', N'Ветлуга : Типография А. Ханыкина', 1912, N'34С1', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (86, 1, NULL, N'Журнал заседаний Костромской…', N'Кострома', 1911, N'3', 0, 1, N' Акт от 02.04.1987 № 1', 3)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (87, 1, NULL, N'Сборник постановлений Ветлужского уездного земского собрания очередной сессии 1913 года и чрезвычайной 15 августа 1914 г.', N'Ветлуга : Типография А.И. Шестерикова', 1914, N'34С1
+31', 1, 1, NULL, 2)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (88, NULL, N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Kniga] ([Id], [KodInventarnoyKnigi], [Author], [Name], [MestoIzdaniya], [GodIzdaniya], [RazdelSistematicheskogoKataloga], [Availability], [Keyword], [NoteToEmployees], [Status]) VALUES (89, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Kniga] OFF
GO
SET IDENTITY_INSERT [dbo].[Publication] ON 

INSERT [dbo].[Publication] ([Id], [StatusKniga]) VALUES (1, N'требует проверки и, ыозможно, правки')
INSERT [dbo].[Publication] ([Id], [StatusKniga]) VALUES (2, N'написано верно, жирно-Оц')
INSERT [dbo].[Publication] ([Id], [StatusKniga]) VALUES (3, N'книга списана и отстуствует, или пропущен номер ')
SET IDENTITY_INSERT [dbo].[Publication] OFF
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
ALTER TABLE [dbo].[Kniga]  WITH CHECK ADD  CONSTRAINT [FK_Kniga_Publication] FOREIGN KEY([Status])
REFERENCES [dbo].[Publication] ([Id])
GO
ALTER TABLE [dbo].[Kniga] CHECK CONSTRAINT [FK_Kniga_Publication]
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
