USE [master]
GO
/****** Object:  Database [yemek_sepeti]    Script Date: 11.01.2021 15:07:52 ******/
CREATE DATABASE [yemek_sepeti]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'yemek_sepeti', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\yemek_sepeti.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'yemek_sepeti_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\yemek_sepeti_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [yemek_sepeti] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [yemek_sepeti].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [yemek_sepeti] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [yemek_sepeti] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [yemek_sepeti] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [yemek_sepeti] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [yemek_sepeti] SET ARITHABORT OFF 
GO
ALTER DATABASE [yemek_sepeti] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [yemek_sepeti] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [yemek_sepeti] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [yemek_sepeti] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [yemek_sepeti] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [yemek_sepeti] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [yemek_sepeti] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [yemek_sepeti] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [yemek_sepeti] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [yemek_sepeti] SET  DISABLE_BROKER 
GO
ALTER DATABASE [yemek_sepeti] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [yemek_sepeti] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [yemek_sepeti] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [yemek_sepeti] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [yemek_sepeti] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [yemek_sepeti] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [yemek_sepeti] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [yemek_sepeti] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [yemek_sepeti] SET  MULTI_USER 
GO
ALTER DATABASE [yemek_sepeti] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [yemek_sepeti] SET DB_CHAINING OFF 
GO
ALTER DATABASE [yemek_sepeti] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [yemek_sepeti] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [yemek_sepeti] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [yemek_sepeti] SET QUERY_STORE = OFF
GO
USE [yemek_sepeti]
GO
/****** Object:  Table [dbo].[calisma_saatleri]    Script Date: 11.01.2021 15:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[calisma_saatleri](
	[Calisma_saatleri_id] [int] IDENTITY(1,1) NOT NULL,
	[baslama_saati] [float] NOT NULL,
	[bitirme_saati] [float] NOT NULL,
 CONSTRAINT [PK_calisma_saatleri] PRIMARY KEY CLUSTERED 
(
	[Calisma_saatleri_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[icecek_menu]    Script Date: 11.01.2021 15:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[icecek_menu](
	[İcecek_menu_id] [int] IDENTITY(1,1) NOT NULL,
	[İcecek_ismi] [text] NOT NULL,
 CONSTRAINT [PK_icecek_menu] PRIMARY KEY CLUSTERED 
(
	[İcecek_menu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[musteri]    Script Date: 11.01.2021 15:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[musteri](
	[Musteri_id] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [text] NOT NULL,
	[Soyad] [text] NOT NULL,
	[Telefon_numarasi] [varchar](11) NOT NULL,
	[Ev_adresi] [text] NOT NULL,
	[Siparis] [int] NOT NULL,
 CONSTRAINT [PK_musteri] PRIMARY KEY CLUSTERED 
(
	[Musteri_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[siparis_alan_restaurant]    Script Date: 11.01.2021 15:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[siparis_alan_restaurant](
	[Siparis_alan_restaurant_id] [int] IDENTITY(1,1) NOT NULL,
	[Restaurant_adi] [text] NOT NULL,
	[Minumum_tutar] [float] NOT NULL,
	[Siparis_getirme_suresi] [float] NOT NULL,
	[Calisma_saatleri] [int] NOT NULL,
	[Siparis_odeme_secenekleri] [int] NOT NULL,
	[Siparis_takibi] [int] NOT NULL,
	[Yemek_menu] [int] NOT NULL,
	[İcecek_menu] [int] NOT NULL,
 CONSTRAINT [PK_siparis_alan_restaurant] PRIMARY KEY CLUSTERED 
(
	[Siparis_alan_restaurant_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[siparis_bilgisi]    Script Date: 11.01.2021 15:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[siparis_bilgisi](
	[Siparis_bilgisi_id] [int] IDENTITY(1,1) NOT NULL,
	[Siparis_takibi] [text] NOT NULL,
 CONSTRAINT [PK_siparis_bilgisi] PRIMARY KEY CLUSTERED 
(
	[Siparis_bilgisi_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[siparis_odeme_turu]    Script Date: 11.01.2021 15:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[siparis_odeme_turu](
	[Siparis_odeme_turu_id] [int] IDENTITY(1,1) NOT NULL,
	[odeme_turu] [text] NOT NULL,
 CONSTRAINT [PK_siparis_odeme_turu] PRIMARY KEY CLUSTERED 
(
	[Siparis_odeme_turu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[yemek_menu]    Script Date: 11.01.2021 15:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yemek_menu](
	[Yemek_menu_id] [int] IDENTITY(1,1) NOT NULL,
	[Yemek_ismi] [text] NOT NULL,
	[İcindekiler] [text] NOT NULL,
	[Yemegin_icinden_cikartilacaklar] [text] NULL,
 CONSTRAINT [PK_yemek_menu] PRIMARY KEY CLUSTERED 
(
	[Yemek_menu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[calisma_saatleri] ON 

INSERT [dbo].[calisma_saatleri] ([Calisma_saatleri_id], [baslama_saati], [bitirme_saati]) VALUES (1, 9, 21)
INSERT [dbo].[calisma_saatleri] ([Calisma_saatleri_id], [baslama_saati], [bitirme_saati]) VALUES (2, 8, 22)
INSERT [dbo].[calisma_saatleri] ([Calisma_saatleri_id], [baslama_saati], [bitirme_saati]) VALUES (3, 9.3, 23)
SET IDENTITY_INSERT [dbo].[calisma_saatleri] OFF
SET IDENTITY_INSERT [dbo].[icecek_menu] ON 

INSERT [dbo].[icecek_menu] ([İcecek_menu_id], [İcecek_ismi]) VALUES (1, N'kola')
INSERT [dbo].[icecek_menu] ([İcecek_menu_id], [İcecek_ismi]) VALUES (2, N'fanta')
INSERT [dbo].[icecek_menu] ([İcecek_menu_id], [İcecek_ismi]) VALUES (3, N'sprite')
INSERT [dbo].[icecek_menu] ([İcecek_menu_id], [İcecek_ismi]) VALUES (4, N'ayran')
INSERT [dbo].[icecek_menu] ([İcecek_menu_id], [İcecek_ismi]) VALUES (5, N'salgam')
SET IDENTITY_INSERT [dbo].[icecek_menu] OFF
SET IDENTITY_INSERT [dbo].[musteri] ON 

INSERT [dbo].[musteri] ([Musteri_id], [Ad], [Soyad], [Telefon_numarasi], [Ev_adresi], [Siparis]) VALUES (1, N'Fatih', N'KÜRK', N'12345678998', N'lale apartmanı ', 1)
INSERT [dbo].[musteri] ([Musteri_id], [Ad], [Soyad], [Telefon_numarasi], [Ev_adresi], [Siparis]) VALUES (2, N'Arslan', N'CENGİZ', N'98765432121', N'savaş apartmanı ', 2)
INSERT [dbo].[musteri] ([Musteri_id], [Ad], [Soyad], [Telefon_numarasi], [Ev_adresi], [Siparis]) VALUES (3, N'Ezel', N'BAYRAKTAR', N'65432178933', N'kırmızı apartmanı ', 3)
SET IDENTITY_INSERT [dbo].[musteri] OFF
SET IDENTITY_INSERT [dbo].[siparis_alan_restaurant] ON 

INSERT [dbo].[siparis_alan_restaurant] ([Siparis_alan_restaurant_id], [Restaurant_adi], [Minumum_tutar], [Siparis_getirme_suresi], [Calisma_saatleri], [Siparis_odeme_secenekleri], [Siparis_takibi], [Yemek_menu], [İcecek_menu]) VALUES (1, N'burger king', 25, 30, 1, 1, 2, 1, 1)
INSERT [dbo].[siparis_alan_restaurant] ([Siparis_alan_restaurant_id], [Restaurant_adi], [Minumum_tutar], [Siparis_getirme_suresi], [Calisma_saatleri], [Siparis_odeme_secenekleri], [Siparis_takibi], [Yemek_menu], [İcecek_menu]) VALUES (2, N'kirmizi döner', 15, 20, 2, 2, 1, 2, 3)
INSERT [dbo].[siparis_alan_restaurant] ([Siparis_alan_restaurant_id], [Restaurant_adi], [Minumum_tutar], [Siparis_getirme_suresi], [Calisma_saatleri], [Siparis_odeme_secenekleri], [Siparis_takibi], [Yemek_menu], [İcecek_menu]) VALUES (3, N'hd iskender', 35, 45, 3, 3, 3, 3, 5)
SET IDENTITY_INSERT [dbo].[siparis_alan_restaurant] OFF
SET IDENTITY_INSERT [dbo].[siparis_bilgisi] ON 

INSERT [dbo].[siparis_bilgisi] ([Siparis_bilgisi_id], [Siparis_takibi]) VALUES (1, N'siparisiniz hazirlaniyor')
INSERT [dbo].[siparis_bilgisi] ([Siparis_bilgisi_id], [Siparis_takibi]) VALUES (2, N'siparisiniz yolda')
INSERT [dbo].[siparis_bilgisi] ([Siparis_bilgisi_id], [Siparis_takibi]) VALUES (3, N'siparisiniz teslim edilmistir')
SET IDENTITY_INSERT [dbo].[siparis_bilgisi] OFF
SET IDENTITY_INSERT [dbo].[siparis_odeme_turu] ON 

INSERT [dbo].[siparis_odeme_turu] ([Siparis_odeme_turu_id], [odeme_turu]) VALUES (1, N'nakit odeme')
INSERT [dbo].[siparis_odeme_turu] ([Siparis_odeme_turu_id], [odeme_turu]) VALUES (2, N'kredi-banka karti ile odeme')
INSERT [dbo].[siparis_odeme_turu] ([Siparis_odeme_turu_id], [odeme_turu]) VALUES (3, N'online odeme')
SET IDENTITY_INSERT [dbo].[siparis_odeme_turu] OFF
SET IDENTITY_INSERT [dbo].[yemek_menu] ON 

INSERT [dbo].[yemek_menu] ([Yemek_menu_id], [Yemek_ismi], [İcindekiler], [Yemegin_icinden_cikartilacaklar]) VALUES (1, N'hamburger', N'et,domates,marul,tursu,ketcap,mayonez', N'domates')
INSERT [dbo].[yemek_menu] ([Yemek_menu_id], [Yemek_ismi], [İcindekiler], [Yemegin_icinden_cikartilacaklar]) VALUES (2, N'doner', N'tavuk,domates,ketcap,mayonez,doner sosu', N'ketcap')
INSERT [dbo].[yemek_menu] ([Yemek_menu_id], [Yemek_ismi], [İcindekiler], [Yemegin_icinden_cikartilacaklar]) VALUES (3, N'iskender', N'et,domates,biber,yogurt,ekmek', N'biber')
SET IDENTITY_INSERT [dbo].[yemek_menu] OFF
ALTER TABLE [dbo].[musteri]  WITH CHECK ADD  CONSTRAINT [FK_musteri_siparis_alan_restaurant] FOREIGN KEY([Siparis])
REFERENCES [dbo].[siparis_alan_restaurant] ([Siparis_alan_restaurant_id])
GO
ALTER TABLE [dbo].[musteri] CHECK CONSTRAINT [FK_musteri_siparis_alan_restaurant]
GO
ALTER TABLE [dbo].[siparis_alan_restaurant]  WITH CHECK ADD  CONSTRAINT [FK_siparis_alan_restaurant_calisma_saatleri] FOREIGN KEY([Calisma_saatleri])
REFERENCES [dbo].[calisma_saatleri] ([Calisma_saatleri_id])
GO
ALTER TABLE [dbo].[siparis_alan_restaurant] CHECK CONSTRAINT [FK_siparis_alan_restaurant_calisma_saatleri]
GO
ALTER TABLE [dbo].[siparis_alan_restaurant]  WITH CHECK ADD  CONSTRAINT [FK_siparis_alan_restaurant_icecek_menu] FOREIGN KEY([İcecek_menu])
REFERENCES [dbo].[icecek_menu] ([İcecek_menu_id])
GO
ALTER TABLE [dbo].[siparis_alan_restaurant] CHECK CONSTRAINT [FK_siparis_alan_restaurant_icecek_menu]
GO
ALTER TABLE [dbo].[siparis_alan_restaurant]  WITH CHECK ADD  CONSTRAINT [FK_siparis_alan_restaurant_siparis_bilgisi] FOREIGN KEY([Siparis_takibi])
REFERENCES [dbo].[siparis_bilgisi] ([Siparis_bilgisi_id])
GO
ALTER TABLE [dbo].[siparis_alan_restaurant] CHECK CONSTRAINT [FK_siparis_alan_restaurant_siparis_bilgisi]
GO
ALTER TABLE [dbo].[siparis_alan_restaurant]  WITH CHECK ADD  CONSTRAINT [FK_siparis_alan_restaurant_siparis_odeme_turu] FOREIGN KEY([Siparis_odeme_secenekleri])
REFERENCES [dbo].[siparis_odeme_turu] ([Siparis_odeme_turu_id])
GO
ALTER TABLE [dbo].[siparis_alan_restaurant] CHECK CONSTRAINT [FK_siparis_alan_restaurant_siparis_odeme_turu]
GO
ALTER TABLE [dbo].[siparis_alan_restaurant]  WITH CHECK ADD  CONSTRAINT [FK_siparis_alan_restaurant_yemek_menu] FOREIGN KEY([Yemek_menu])
REFERENCES [dbo].[yemek_menu] ([Yemek_menu_id])
GO
ALTER TABLE [dbo].[siparis_alan_restaurant] CHECK CONSTRAINT [FK_siparis_alan_restaurant_yemek_menu]
GO
USE [master]
GO
ALTER DATABASE [yemek_sepeti] SET  READ_WRITE 
GO
