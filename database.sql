CREATE DATABASE [MallDB]
GO
USE [MallDB]
GO
/****** Object:  Table [dbo].[admins]    Script Date: 3/18/2021 8:52:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admins](
	[adminId] [int] IDENTITY(1,1) NOT NULL,
	[adminName] [varchar](50) NULL,
	[adminPassword] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[adminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brands]    Script Date: 3/18/2021 8:52:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brands](
	[brandId] [int] IDENTITY(1,1) NOT NULL,
	[brandName] [varchar](50) NULL,
	[brandURL] [varchar](50) NULL,
	[imageName] [varchar](50) NULL,
	[storeId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[brandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cinema]    Script Date: 3/18/2021 8:52:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cinema](
	[cinemaId] [int] IDENTITY(1,1) NOT NULL,
	[cinemaNo] [int] NULL,
	[movieId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cinemaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 3/18/2021 8:52:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedback](
	[feedbackId] [int] IDENTITY(1,1) NOT NULL,
	[feedbackSubject] [varchar](50) NULL,
	[feedbackContent] [varchar](300) NULL,
	[userEmail] [varchar](50) NULL,
	[feedbackDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[feedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movie]    Script Date: 3/18/2021 8:52:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movie](
	[movieId] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
	[director] [varchar](50) NULL,
	[cast] [varchar](256) NULL,
	[description] [text] NULL,
	[duration] [int] NULL,
	[trailer] [varchar](256) NULL,
	[imageName] [varchar](256) NULL,
	[cinemaId] [int] NULL,
	[price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[movieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[plots]    Script Date: 3/18/2021 8:52:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plots](
	[plotId] [int] IDENTITY(1,1) NOT NULL,
	[plotName] [varchar](50) NULL,
	[isEmpty] [bit] NULL,
	[floor] [tinyint] NULL,
	[storeId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[plotId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 3/18/2021 8:52:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[productName] [varchar](50) NULL,
	[storeId] [int] NULL,
	[brandId] [int] NULL,
	[category] [varchar](50) NULL,
	[imageName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seat]    Script Date: 3/18/2021 8:52:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seat](
	[seatId] [int] IDENTITY(1,1) NOT NULL,
	[seatNo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[seatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seatreserve]    Script Date: 3/18/2021 8:52:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seatreserve](
	[seatreserveId] [int] IDENTITY(1,1) NOT NULL,
	[seatreserveName] [varchar](50) NULL,
	[seatreserveDate] [date] NULL,
	[seatreserveCode] [int] NULL,
	[cinemaId] [int] NULL,
	[seatId] [int] NULL,
	[showtime] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[seatreserveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stores]    Script Date: 3/18/2021 8:52:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stores](
	[storeId] [int] IDENTITY(1,1) NOT NULL,
	[storeName] [varchar](50) NULL,
	[openTime] [time](7) NULL,
	[closeTime] [time](7) NULL,
	[imageName] [varchar](256) NULL,
	[promoImageName] [varchar](256) NULL,
	[storeAbout] [varchar](50) NULL,
	[storeDescription] [text] NULL,
	[storeCategory] [varchar](50) NULL,
	[plotId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[storeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admins] ON 

INSERT [dbo].[admins] ([adminId], [adminName], [adminPassword]) VALUES (1, N'chuanhoang11', N'123456')
INSERT [dbo].[admins] ([adminId], [adminName], [adminPassword]) VALUES (2, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[admins] OFF
SET IDENTITY_INSERT [dbo].[brands] ON 

INSERT [dbo].[brands] ([brandId], [brandName], [brandURL], [imageName], [storeId]) VALUES (1, N'Starbucks', N'https://www.starbucks.com/', N'Images/download (43).jpg', 1)
INSERT [dbo].[brands] ([brandId], [brandName], [brandURL], [imageName], [storeId]) VALUES (3, N'Adidas', N'www.adidas.com', N'Images/download (1).png', 3)
INSERT [dbo].[brands] ([brandId], [brandName], [brandURL], [imageName], [storeId]) VALUES (4, N'H&M', N'www.hm.com', N'Images/download (2).png', 4)
INSERT [dbo].[brands] ([brandId], [brandName], [brandURL], [imageName], [storeId]) VALUES (5, N'Luis Vuitton', N'https://eu.louisvuitton.com/eng-e1/homepage', N'Images/download (3).png', 5)
INSERT [dbo].[brands] ([brandId], [brandName], [brandURL], [imageName], [storeId]) VALUES (6, N'Indya', N'https://www.houseofindya.com/', N'Images/download (4).png', 6)
INSERT [dbo].[brands] ([brandId], [brandName], [brandURL], [imageName], [storeId]) VALUES (7, N'Tous les Jours', N'https://www.tljus.com/', N'Images/download.jpg', 7)
INSERT [dbo].[brands] ([brandId], [brandName], [brandURL], [imageName], [storeId]) VALUES (8, N'Sephora', N'https://www.sephora.com/', N'Images/download.png', 8)
INSERT [dbo].[brands] ([brandId], [brandName], [brandURL], [imageName], [storeId]) VALUES (9, N'Bandicoot', N'https://bandicootclothing.com.au/', N'Images/download (1).png', 9)
INSERT [dbo].[brands] ([brandId], [brandName], [brandURL], [imageName], [storeId]) VALUES (10, N'Myntra', N'https://www.myntra.com/', N'Images/download (1).jpg', 10)
INSERT [dbo].[brands] ([brandId], [brandName], [brandURL], [imageName], [storeId]) VALUES (11, N'Baskin Robbins', N'https://www.baskinrobbins.com/', N'Images/download (2).png', 11)
INSERT [dbo].[brands] ([brandId], [brandName], [brandURL], [imageName], [storeId]) VALUES (12, N'Gibson', N'https://www.gibson.com/', N'Images/download (3).png', 12)
INSERT [dbo].[brands] ([brandId], [brandName], [brandURL], [imageName], [storeId]) VALUES (13, N'Divanidea', N'https://www.divanidea.com/', N'Images/51ZQRn5jEUL.png', 13)
INSERT [dbo].[brands] ([brandId], [brandName], [brandURL], [imageName], [storeId]) VALUES (14, N'Apple', N'https://www.apple.com/shop', N'Images/download (4).png', 14)
INSERT [dbo].[brands] ([brandId], [brandName], [brandURL], [imageName], [storeId]) VALUES (15, N'Crafsvilla', N'https://www.craftsvilla.com/', N'Images/download (5).png', 15)
INSERT [dbo].[brands] ([brandId], [brandName], [brandURL], [imageName], [storeId]) VALUES (16, N'Biba', N'https://www.biba.in/', N'Images/Logo_of_Biba_Apparels.png', 16)
INSERT [dbo].[brands] ([brandId], [brandName], [brandURL], [imageName], [storeId]) VALUES (17, N'titan', N'https://www.titan.co.in/', N'Images/download (7).png', 17)
INSERT [dbo].[brands] ([brandId], [brandName], [brandURL], [imageName], [storeId]) VALUES (18, N'Red Apron', N'https://redapron.vn/', N'Images/download.png', 18)
INSERT [dbo].[brands] ([brandId], [brandName], [brandURL], [imageName], [storeId]) VALUES (19, N'Gharana', N'http://www.gharanarestaurant.com/', N'Images/download (1).jpg', 19)
INSERT [dbo].[brands] ([brandId], [brandName], [brandURL], [imageName], [storeId]) VALUES (20, N'Dehli Highway', N'https://www.zomato.com/mumbai/delhi-highway-fort', N'Images/download (2).jpg', 20)
INSERT [dbo].[brands] ([brandId], [brandName], [brandURL], [imageName], [storeId]) VALUES (21, N'Dune', N'https://www.dunelondon.com/', N'Images/download (1).png', 21)
INSERT [dbo].[brands] ([brandId], [brandName], [brandURL], [imageName], [storeId]) VALUES (22, N'Kings Kulfi', N'http://kingskulfi.co.in/', N'Images/09-59-23am_07-07-2019-kings_kulfi.png', 22)
INSERT [dbo].[brands] ([brandId], [brandName], [brandURL], [imageName], [storeId]) VALUES (23, N'Titan Eyes Plus', N'https://www.titaneyeplus.com/', N'Images/titan-eyeplus.gif', 23)
INSERT [dbo].[brands] ([brandId], [brandName], [brandURL], [imageName], [storeId]) VALUES (24, N'Anita Dongre', N'https://www.anitadongre.com/int/', N'Images/download (2).jpg', 24)
INSERT [dbo].[brands] ([brandId], [brandName], [brandURL], [imageName], [storeId]) VALUES (25, N'Anokhi', N'https://www.anokhi.com/', N'Images/utkyuilkuililuo;.jpg', 25)
INSERT [dbo].[brands] ([brandId], [brandName], [brandURL], [imageName], [storeId]) VALUES (26, N'Ajmal', N'https://www.ajmalperfume.com/', N'Images/lllllllllll.jpg', 26)
INSERT [dbo].[brands] ([brandId], [brandName], [brandURL], [imageName], [storeId]) VALUES (27, N'Fabindia', N'https://www.fabindia.com/', N'Images/ghnmfghmghmhmkgyukyuiluil.png', 29)
INSERT [dbo].[brands] ([brandId], [brandName], [brandURL], [imageName], [storeId]) VALUES (28, N'Pizza Hut', N'https://pizzahut.com/', N'Images/nynyy6t6.png', 30)
SET IDENTITY_INSERT [dbo].[brands] OFF
SET IDENTITY_INSERT [dbo].[cinema] ON 

INSERT [dbo].[cinema] ([cinemaId], [cinemaNo], [movieId]) VALUES (1, 1, 1)
INSERT [dbo].[cinema] ([cinemaId], [cinemaNo], [movieId]) VALUES (2, 2, 2)
INSERT [dbo].[cinema] ([cinemaId], [cinemaNo], [movieId]) VALUES (3, 3, 3)
INSERT [dbo].[cinema] ([cinemaId], [cinemaNo], [movieId]) VALUES (4, 4, 4)
INSERT [dbo].[cinema] ([cinemaId], [cinemaNo], [movieId]) VALUES (5, 5, 5)
INSERT [dbo].[cinema] ([cinemaId], [cinemaNo], [movieId]) VALUES (6, 6, NULL)
SET IDENTITY_INSERT [dbo].[cinema] OFF
SET IDENTITY_INSERT [dbo].[feedback] ON 

INSERT [dbo].[feedback] ([feedbackId], [feedbackSubject], [feedbackContent], [userEmail], [feedbackDate]) VALUES (1, N'asd', N'asd', N'asd@asdgmail.com', CAST(N'2021-03-18T00:00:00.000' AS DateTime))
INSERT [dbo].[feedback] ([feedbackId], [feedbackSubject], [feedbackContent], [userEmail], [feedbackDate]) VALUES (2, N'asd', N'asd', N'asdasd', CAST(N'2021-03-18T00:00:00.000' AS DateTime))
INSERT [dbo].[feedback] ([feedbackId], [feedbackSubject], [feedbackContent], [userEmail], [feedbackDate]) VALUES (3, N'asd', N'asd', N'asd@asdgmail.com', CAST(N'2021-03-18T00:00:00.000' AS DateTime))
INSERT [dbo].[feedback] ([feedbackId], [feedbackSubject], [feedbackContent], [userEmail], [feedbackDate]) VALUES (4, N'StarBuck', N'Good', N'hoanggiangchuan@gmai.com', CAST(N'2021-03-18T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[feedback] OFF
SET IDENTITY_INSERT [dbo].[movie] ON 

INSERT [dbo].[movie] ([movieId], [title], [director], [cast], [description], [duration], [trailer], [imageName], [cinemaId], [price]) VALUES (1, N'Kesari', N'Anurag Singh', N' Akshay Kumar, Parineeti Chopra, Suvinder Vicky ', N'Havildar Ishar Singh, a soldier in the British Indian Army, leads 21 Sikh soldiers in a fight against 10,000 Pashtun invaders. However, what unfolds is the greatest last stand wars of all time.', 150, N'https://www.youtube.com/watch?v=JFP24D15_XM', N'Images/MV5BYTRhZWVkNTctMzRmYy00MDk1LWIzNDYtMjA1ZGE5YWJkYjU0XkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_UY268_CR4,0,182,268_AL_.jpg', 1, 10)
INSERT [dbo].[movie] ([movieId], [title], [director], [cast], [description], [duration], [trailer], [imageName], [cinemaId], [price]) VALUES (2, N'Ginny Weds Sunny', N'Puneet Khanna', N' Yami Gautam, Vikrant Massey, Ayesha Raza', N'The film follows headstrong Ginny who meets Sunny for an arranged marriage, but turns him down, and then shows how Sunny teams up with Ginny''s mother to win her love.', 125, N'https://www.youtube.com/watch?v=WTJW2Ol1c0g', N'Images/MV5BOTU2Mjc4YWUtMjkzNC00ZDQ5LTkzZmYtOTMyY2NkODU4ZmU2XkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_UY268_CR2,0,182,268_AL_.jpg', 2, 15)
INSERT [dbo].[movie] ([movieId], [title], [director], [cast], [description], [duration], [trailer], [imageName], [cinemaId], [price]) VALUES (3, N'Chhalaang', N'Hansal Mehta', N'Rajkummar Rao, Nushrat Bharucha, Mohd. Zeeshan Ayyub ', N'Chhalaang is a hilarious, yet inspirational journey of Montu, a PT Master from a semi govt. funded school for whom teaching PT is just a job. When circumstances put everything he cares for ', 135, N'https://www.youtube.com/watch?v=BY-0SbSF2dE', N'Images/MV5BODJiNGJhM2UtMDkxMC00YWUzLTllZjEtODU3MGI4N2RhNWU2XkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_UY268_CR1,0,182,268_AL_.jpg', 3, 11)
INSERT [dbo].[movie] ([movieId], [title], [director], [cast], [description], [duration], [trailer], [imageName], [cinemaId], [price]) VALUES (4, N'Andhadhun', N' Sriram Raghavan', N' Ayushmann Khurrana, Tabu, Radhika Apte', N'A series of mysterious events change the life of a blind pianist, who must now report a crime that he should technically know nothing of.', 140, N'https://www.youtube.com/watch?v=2iVYI99VGaw', N'Images/MV5BZWZhMjhhZmYtOTIzOC00MGYzLWI1OGYtM2ZkN2IxNTI4ZWI3XkEyXkFqcGdeQXVyNDAzNDk0MTQ@._V1_UY268_CR1,0,182,268_AL_.jpg', 4, 15)
INSERT [dbo].[movie] ([movieId], [title], [director], [cast], [description], [duration], [trailer], [imageName], [cinemaId], [price]) VALUES (5, N'Godzilla vs. Kong', N'Adam Wingard', N'Madison Russell, Nathan Lind, ,Josh Valentine', N'Fearsome monsters Godzilla and King Kong square off in an epic battle for the ages, while humanity looks to wipe out both of the creatures and take back the planet once and for all.', 180, N'https://www.youtube.com/watch?v=odM92ap8_c0', N'Images/images.jpg', 5, 18)
SET IDENTITY_INSERT [dbo].[movie] OFF
SET IDENTITY_INSERT [dbo].[plots] ON 

INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (1, N'a1', 0, 1, 1)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (2, N'a2', 1, 1, NULL)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (3, N'a3', 0, 1, 3)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (4, N'a4', 0, 1, 4)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (5, N'a5', 0, 1, 5)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (6, N'a6', 0, 1, 6)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (7, N'a7', 0, 1, 7)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (8, N'a8', 0, 1, 8)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (9, N'a9', 0, 1, 9)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (10, N'b1', 0, 2, 10)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (11, N'b2', 0, 2, 11)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (12, N'b3', 0, 2, 12)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (13, N'b4', 0, 2, 13)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (14, N'b5', 0, 2, 14)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (15, N'b5', 0, 2, 15)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (16, N'b6', 0, 2, 16)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (17, N'b7', 0, 2, 17)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (18, N'c1', 0, 3, 18)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (19, N'c2', 0, 3, 19)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (20, N'c3', 0, 3, 20)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (21, N'c4', 0, 3, 21)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (22, N'c5', 0, 3, 22)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (23, N'c6', 0, 3, 23)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (24, N'c7', 0, 3, 24)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (25, N'd1', 0, 4, 25)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (26, N'd2', 0, 4, 26)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (27, N'd3', 0, 4, 27)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (28, N'd4', 0, 4, 28)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (29, N'd5', 0, 4, 29)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (30, N'd6', 0, 4, 30)
INSERT [dbo].[plots] ([plotId], [plotName], [isEmpty], [floor], [storeId]) VALUES (31, N'd7', 0, 4, 31)
SET IDENTITY_INSERT [dbo].[plots] OFF
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (1, N'Cinnamon Dolce Latte', 1, 1, N'Food', N'Images/scale.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (2, N'Hazelnut Macchiatob', 1, 1, N'Food', N'Images/hazelnut-macchiato_tcm90-24778_w1024_n.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (3, N'Ristretto Bianco', 1, 1, N'Food', N'Images/ristretto-bianco_tcm90-24779_w1024_n.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (6, N'Chocolate Crème Frappuccino® blended beverage', 1, 1, N'Food', N'Images/choc.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (7, N'Espresso', 1, 1, N'Food', N'Images/Espresso_tcm90-2090_w1024_n.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (13, N'Ultraboost Dna Shoe', 3, 3, N'Clothing', N'Images/ultraboost-dna-shoes (1).jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (14, N'SuperStar Shoe', 3, 3, N'Clothing', N'Images/superstar-shoes.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (15, N'Own the Run Tee', 3, 3, N'Clothing', N'Images/Own_the_Run_Tee_Black_FS9799_21_model.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (16, N'Regular Fit Hoodie', 4, 4, N'Clothing', N'Images/hmgoepprod.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (17, N'Regular Fit Hoodie', 4, 4, N'Clothing', N'Images/hmgoepprod (1).jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (18, N'Chunky trainers', 4, 4, N'Clothing', N'Images/hmgoepprod (2).jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (20, N'CAPUCINES MINI', 5, 5, N'Other', N'Images/1.webp')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (21, N'VANITY PM', 5, 5, N'Other', N'Images/2.webp')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (22, N'EASY POUCH ON STRAP', 5, 5, N'Clothing', N'Images/5.webp')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (23, N'Navy Georgette Foil Panelled Maxi Skirt', 6, 6, N'Clothing', N'Images/2.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (25, N'Payal Singhal for Maxi Skirt', 6, 6, N'Clothing', N'Images/d4.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (26, N'Navy Floral Foil Panelled Maxi Skirt', 6, 6, N'Clothing', N'Images/d4 (1).jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (28, N'Corn Cheese Mousse Cake 2', 7, 7, N'Food', N'Images/a.jpeg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (30, N' Creamy Tiramisu Mousse 2', 7, 7, N'Food', N'Images/1.jpeg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (31, N'La Mer', 8, 8, N'Other', N'Images/s2448298-main-zoom.webp')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (32, N'KVD Beauty', 8, 8, N'Other', N'Images/s2420040-main-zoom.webp')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (33, N'BREAD BEAUTY SUPPLY', 8, 8, N'Other', N'Images/s2444065-main-zoom.webp')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (34, N'London- Pink Color Sling Bag', 9, 9, N'Clothing', N'Images/61-XgLLgjhL._SL1100_.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (35, N'London Faux Leather Sling Bag', 9, 9, N'Clothing', N'Images/61j4TIJ1u2L._SL1100_.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (37, N'HueTrap', 10, 10, N'Clothing', N'Images/g.webp')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (38, N'HRX', 10, 10, N'Clothing', N'Images/vr.webp')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (39, N'Difference of Opinion', 10, 10, N'Clothing', N'Images/fvbe.webp')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (40, N'Single Emlaaq Cone', 11, 11, N'Food', N'Images/Single-Emlaaq-Cone-1.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (41, N'Single Emlaaq Cup', 11, 11, N'Food', N'Images/Emlaaq-Scoop-Cupjpg.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (42, N'Triple Scoop Small', 11, 11, N'Food', N'Images/Triple-Scoop-Small.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (43, N'J-45 Studio Walnut - Antique Natural', 12, 12, N'Other', N'Images/hardware-500_500.png')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (44, N'J-185 EC Modern Rosewood - Antique Natural', 12, 12, N'Other', N'Images/hardware-500_500 (1).png')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (45, N'Hummingbird Standard - Vintage Cherry Sunburst', 12, 12, N'Other', N'Images/hardware-500_500 (2).png')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (46, N'Avenue', 13, 13, N'Other', N'Images/living-sofas-avenue_C3en_168.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (47, N'City', 13, 13, N'Other', N'Images/living-sofas-city_C3en_169.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (48, N'Ego', 13, 13, N'Other', N'Images/living-sofas-ego-en_C3en_1604.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (49, N'iPhone 12 Pro 256GB', 14, 14, N'Other', N'Images/iphone-12-pro-xam-new-600x600-600x600.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (51, N'The Style Story Blue Rayon Printed Flared Kurti', 15, 15, N'Clothing', N'Images/asd.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (52, N'Fabviva Grey Rayon Embroidered Anarkali Kurti', 15, 15, N'Clothing', N'Images/sdv.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (53, N'Blue Cotton Straight Kurta', 16, 16, N'Clothing', N'Images/assorted16659ss21blu_6.webp')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (54, N'Mustard Cotton Straight Kurta', 16, 16, N'Clothing', N'Images/assorted16907ss21mus-3.webp')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (57, N'Workwear Watch with Silver White Dia', 17, 17, N'Other', N'Images/bvf.webp')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (58, N'India''s First Payment Watch for Men', 17, 17, N'Other', N'Images/1805SL10_1.webp')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (60, N'Triple Malt Scotch Whisky - Monkey Shoulder', 18, 18, N'Other', N'Images/download.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (62, N'Tandoori Bhutta', 19, 19, N'Food', N'Images/vbfs.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (63, N'Murgh Makhani', 19, 19, N'Food', N'Images/bvfbd.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (64, N'Murgh Ghazala', 19, 19, N'Clothing', N'Images/bfdeb.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (65, N'Mehman Nawazi', 20, 20, N'Food', N'Images/nf.webp')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (66, N'Chholay', 20, 20, N'Food', N'Images/4720fac4eefb82c1024ad7260146f2d4.webp')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (67, N'Lockstockk - Black', 21, 1, N'Clothing', N'Images/LOCKSTOCKK-0079503940001484_Side.webp')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (68, N'Torin - Tan', 21, 21, N'Clothing', N'Images/TORIN-0483510590035511_Side.webp')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (69, N'Chocolate Butty Buddy Cone', 22, 22, N'Food', N'Images/607b09f9ec00486f0f54bc492f20924d.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (70, N'Cassata Rainbow', 22, 22, N'Food', N'Images/f1d06e6db04384b94a0c6183ce7b2a8d.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (71, N'Black Wayfarer Fastrack Men Sunglasses', 23, 23, N'Other', N'Images/p357bk1_1_lar.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (72, N'Green Round Rimmed Eyeglasses from Fastrack', 23, 23, N'Other', N'Images/ft1224wfp4mgrv_1_lar.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (73, N'Embroidered Summer Top', 24, 24, N'Clothing', N'Images/bdgfbfgdntegjy.webp')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (74, N'BAIZA SET', 24, 24, N'Clothing', N'Images/ad_ss20pd142_ivory_1.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (75, N'QUILTED ROBE IN ENGLISH GARDEN', 25, 25, N'Clothing', N'Images/vvvvvvvvvvvvvvvvvvvv.webp')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (76, N'EASY SHIRT IN GOLD STAMP', 25, 25, N'Clothing', N'Images/k8li.webp')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (77, N'SAFWAT AL SAFWA', 26, 26, N'Other', N'Images/414840653Safwat-Al-Safwa-Small.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (78, N'ZEAL', 26, 26, N'Other', N'Images/359619141Zeal-Small188201691655.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (79, N'Fried Chicken', 28, 26, N'Food', N'Images/7166d1bee7b66d1e90e7899cda0b03be.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (80, N'Rice with Fried Chicken', 28, 26, N'Food', N'Images/7166d1bee7b66d1e90e7899cda0b03be.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (81, N'Silk Organza Chikankari Dupatta', 29, 27, N'Clothing', N'Images/bbdtyuyu.webp')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (82, N'Cotton Silk Chikankari Dupatta', 29, 27, N'Clothing', N'Images/hfguilio;8yo;.webp')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (83, N'Cotton Woven Check Dupatta', 29, 27, N'Clothing', N'Images/444w.webp')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (84, N'Double Seafood Pizza with Pesto Sauce', 30, 28, N'Food', N'Images/Pizza_Double_Topping_Hai_San_Xot_Pesto.jpg')
INSERT [dbo].[products] ([productId], [productName], [storeId], [brandId], [category], [imageName]) VALUES (85, N'Grilled Beef with Blackpepper Pizza', 30, 28, N'Food', N'Images/Pizza_Bo_Nuong_Tieu_Den.jpg')
SET IDENTITY_INSERT [dbo].[products] OFF
SET IDENTITY_INSERT [dbo].[seat] ON 

INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (1, 1)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (2, 2)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (3, 3)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (4, 4)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (5, 5)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (6, 6)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (7, 7)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (8, 8)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (9, 9)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (10, 10)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (11, 11)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (12, 12)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (13, 13)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (14, 14)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (15, 15)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (16, 16)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (17, 17)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (18, 18)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (19, 19)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (20, 20)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (21, 21)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (22, 22)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (23, 23)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (24, 24)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (25, 25)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (26, 26)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (27, 27)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (28, 28)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (29, 29)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (30, 30)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (31, 31)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (32, 32)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (33, 33)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (34, 34)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (35, 35)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (36, 36)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (37, 37)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (38, 38)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (39, 39)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (40, 40)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (41, 41)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (42, 42)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (43, 43)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (44, 44)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (45, 45)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (46, 46)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (47, 47)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (48, 48)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (49, 49)
INSERT [dbo].[seat] ([seatId], [seatNo]) VALUES (50, 50)
SET IDENTITY_INSERT [dbo].[seat] OFF
SET IDENTITY_INSERT [dbo].[seatreserve] ON 

INSERT [dbo].[seatreserve] ([seatreserveId], [seatreserveName], [seatreserveDate], [seatreserveCode], [cinemaId], [seatId], [showtime]) VALUES (1, N'Phat', CAST(N'2021-03-12' AS Date), 514132, 1, 1, CAST(N'08:00:00' AS Time))
INSERT [dbo].[seatreserve] ([seatreserveId], [seatreserveName], [seatreserveDate], [seatreserveCode], [cinemaId], [seatId], [showtime]) VALUES (2, N'Phat', CAST(N'2021-03-12' AS Date), 412352, 1, 2, CAST(N'08:00:00' AS Time))
INSERT [dbo].[seatreserve] ([seatreserveId], [seatreserveName], [seatreserveDate], [seatreserveCode], [cinemaId], [seatId], [showtime]) VALUES (3, N'Chuan', CAST(N'2021-03-18' AS Date), 158312, 2, 1, CAST(N'08:00:00' AS Time))
INSERT [dbo].[seatreserve] ([seatreserveId], [seatreserveName], [seatreserveDate], [seatreserveCode], [cinemaId], [seatId], [showtime]) VALUES (4, N'Chinh', CAST(N'2021-03-20' AS Date), 363421, 2, 3, CAST(N'08:00:00' AS Time))
INSERT [dbo].[seatreserve] ([seatreserveId], [seatreserveName], [seatreserveDate], [seatreserveCode], [cinemaId], [seatId], [showtime]) VALUES (5, N'Chinh', CAST(N'2021-03-18' AS Date), 145235, 1, 4, CAST(N'08:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[seatreserve] OFF
SET IDENTITY_INSERT [dbo].[stores] ON 

INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (1, N'Starbucks Coffee', CAST(N'06:00:00' AS Time), CAST(N'22:00:00' AS Time), N'Images/Starbuck-img.jpg', N'Images/StarBuck-promo.jpg', N'Coffee and Food', N'Starbucks Corporation is an American multinational chain of coffeehouses and roastery reserves headquartered in Seattle, Washington. As the world''s largest coffeehouse chain, Starbucks is seen to be the main representation of the United States'' second wave of coffee culture', N'Food', 1)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (3, N'Adidas', CAST(N'09:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Images/Adidas-image.jpg', N'Images/Adidas-promo.jpg', N'Sport Clothing', N'Welcome to adidas. Shop for adidas shoes, clothing and view new collections for adidas Originals, running, football, soccer, training and much more.', N'Clothing', 3)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (4, N'H&M', CAST(N'08:30:00' AS Time), CAST(N'21:00:00' AS Time), N'Images/H&M-image.jpg', N'Images/H&M-promo.jpg', N'Clothing', N'Welcome to H&M, your shopping destination for fashion online. We offer fashion and quality at the best price in a more sustainable way', N'Clothing', 4)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (5, N'Louis Vuitton', CAST(N'09:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Images/Louisvuiton-image.jpg', N'Images/download (3).jpg', N'Luxury Clothing', N'For Women. The Latest. Spring Summer 2021 Show Collection. LV x UF Collection. Monogram Since 1854 Collection.', N'Clothing', 5)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (6, N'Indya', CAST(N'08:30:00' AS Time), CAST(N'20:30:00' AS Time), N'Images/download (4).jpg', N'Images/download (5).jpg', N'Women Clothing', N'Welcome to the House of Indya, a world of fashion where traditions are fused with modern aesthetics and infused with an ultra-modern spirit to cater to the women of today. It is an authentic fashion brand quintessentially dedicated to ethnic Indian wear.', N'Clothing', 6)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (7, N'Tous les Jours', CAST(N'08:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Images/download (6).jpg', N'Images/download (7).jpg', N'Bakery', N'At TOUS les JOURS, we offer more than 300 different kinds of bakery goods, including bread, pastries, cakes, desserts, and beverages.', N'Food', 7)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (8, N'Sephora', CAST(N'09:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Images/download (8).jpg', N'Images/download (9).jpg', N'Cosmetic', N'Discover the latest in beauty at Sephora. Explore our unrivaled selection of makeup, skin care, fragrance and more from classic and emerging brands.', N'Other', 8)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (9, N'Bandicoot', CAST(N'09:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Images/download (10).jpg', N'Images/download (11).jpg', N'Shoes and Bags', N'International Brand Bandicoot Leather Bag Man Bag Messenger Bag Brown Black Large Small Sizes Bags-sale of low-price goods, in catalogue of products ...', N'Clothing', 9)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (10, N'Myntra', CAST(N'08:30:00' AS Time), CAST(N'20:30:00' AS Time), N'Images/download (12).jpg', N'Images/download (13).jpg', N'Casual Clothing', N'Online Shopping Site for Fashion & Lifestyle in India. Buy Shoes, Clothing, Accessories and lifestyle products for women & men. Best Online Fashion Store ...', N'Clothing', 10)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (11, N'Baskin Robin', CAST(N'08:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Images/download (14).jpg', N'Images/download (15).jpg', N'Ice-Cream', N'Your favorite cookie just met your favorite coffee. Our Flavor of the Month is a cold brew ice cream with OREO® cookies and a cookie ribbon', N'Food', 11)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (12, N' ACE Music', CAST(N'09:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Images/download (16).jpg', N'Images/download (17).jpg', N'Instruments', N'Now, with over 2500 guitars in stock, Dave''s Guitar Shop is one of the largest independently owned guitar stores in the Midwest, and still growing.', N'Other', 12)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (13, N'Divanidea', CAST(N'09:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Images/download (18).jpg', N'Images/download (11).jpg', N'Sofa', N'Divanidea was born about 15 years ago and then became a notorious chain of ... 10) Managing all the annual promotional initiatives with the support of ...', N'Other', 13)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (14, N'Croma Electronic', CAST(N'08:30:00' AS Time), CAST(N'21:00:00' AS Time), N'Images/download (19).jpg', N'Images/download (20).jpg', N'Electronic', N'Croma Retail is one stop destination for online shopping in India. Buy online all the products that you need here. Shop online in India through Croma Retail and ...', N'Other', 14)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (15, N'Craftsvilla', CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Images/download (21).jpg', N'Images/images.jpg', N'Ethnic Clothing', N'Buy Latest collecton of The Retail Store Products Online ? 100% authentic products, ? Hand curated, ? Timely delivery, ? Craftsvilla assured.', N'Clothing', 15)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (16, N'Biba', CAST(N'08:30:00' AS Time), CAST(N'21:00:00' AS Time), N'Images/download (22).jpg', N'Images/download (23).jpg', N'Ethnic Clothing', N'Online shopping for designer ethnic wear for ladies. Buy latest collection of anarkali suits, kurta/kurtis, lehenga, palazzo & salwar kameez for women at ...', N'Clothing', 16)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (17, N'Titan', CAST(N'09:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Images/download (24).jpg', N'Images/download (25).jpg', N'Watches', N'Shop Wrist Watches & get exciting offers online for Men & Women at Titan''s E-store. Get ?Cash On Delivery ?Easy 7 days Return Policy ...', N'Other', 17)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (18, N'Red Apron', CAST(N'09:30:00' AS Time), CAST(N'22:00:00' AS Time), N'Images/download (26).jpg', N'Images/download (27).jpg', N'Liqours', N'FINE WINES & SPIRITS offers extensive wine collections of 2000 wines and spirits from prestigious brands to family-owned wineries, glassware, distributor.', N'Other', 18)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (19, N'Gharana Restaurant', CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time), N'Images/download (28).jpg', N'Images/images (1).jpg', N'Dining Place', N'Indian restaurant Gharana in Holiday Inn Dubai Al Barsha hotel serves authentic Indian food. Best restaurant for Indian cuisine in Dubai Al Barsha.', N'Food', 19)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (20, N'Delhi Highway', CAST(N'08:30:00' AS Time), CAST(N'22:00:00' AS Time), N'Images/restaurant-images.jpg', N'Images/pngtree-discount-up-to-20-off-label-sale-line-gradient-logo-vector-png-image_2091127.jpg', N'Dining Place', N'105 Mistry Mansion Ground Floor Mahatma Gandhi Road Kala Ghoda, Mumbai 400001 India', N'Food', 20)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (21, N'Dune', CAST(N'10:00:00' AS Time), CAST(N'22:00:00' AS Time), N'Images/download (29).jpg', N'Images/download (1).png', N'Shoes and Footwears', N'Welcome to Dune If you''re looking for the perfect shoes and bags to go with your dress, drop in at Dune. You won''t be disappointed!', N'Clothing', 21)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (22, N'Kings Kulfi', CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time), N'Images/images (2).jpg', N'Images/download (30).jpg', N'Ice-Cream', N'Be a part of it. Kings Homemade Icecreams and Kulfi are created with rich cream and butterfat, only the freshest nuts, real fruits and the truest flavoring. Our ...', N'Food', 22)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (23, N'Titan Eyes Plus', CAST(N'08:30:00' AS Time), CAST(N'21:00:00' AS Time), N'Images/images (3).jpg', N'Images/download (31).jpg', N'Glass Wears', N'Welcome to Titan Eye Plus Eye Wear Frames & Sunglasses with a wide range of collection', N'Other', 23)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (24, N'Anita Dongre', CAST(N'09:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Images/download (32).jpg', N'Images/download (1).png', N'Ethnic Clothing', N'Anita Dongre, coveted for bridal couture, handcrafted luxury pret and menswear, derives inspiration from the splendid crafts of Rajasthan and remote villages of ...', N'Clothing', 24)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (25, N'Anokhi', CAST(N'09:00:00' AS Time), CAST(N'22:00:00' AS Time), N'Images/download (33).jpg', N'Images/pngtree-discount-up-to-20-off-label-sale-line-gradient-logo-vector-png-image_2091127.jpg', N'Ethnic Clothing', N'Sparks fly when masked modern-day misogynist Shaurya comes across Anokhi, a headstrong girl. With their clashing ideologies on the line, will opposites ...', N'Clothing', 25)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (26, N'Ajmal', CAST(N'09:00:00' AS Time), CAST(N'22:00:00' AS Time), N'Images/download (34).jpg', N'Images/download (35).jpg', N'Perfume', N'Ajmal Perfumes Online. A world of fragrances and offers. The New Year 2020 has dawned. And as the world celebrates a new wave of optimism and promise, we ...', N'Other', 26)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (27, N'Zenith Dance Troupe', CAST(N'10:00:00' AS Time), CAST(N'22:00:00' AS Time), N'Images/download (36).jpg', N'Images/download (37).jpg', N'Entertain', N'Welcome to Zeneith Dance Troupe Zenith is the best dance troupe or group of India with 20 years of domain experience and above 10000 dance shows across the world.', N'Other', 27)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (28, N'KFC', CAST(N'08:30:00' AS Time), CAST(N'21:30:00' AS Time), N'Images/download (38).jpg', N'Images/download (39).jpg', N'Fast Food', N'KFC is an American fast food restaurant chain headquartered in Louisville, Kentucky, that specializes in fried chicken.', N'Food', 28)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (29, N'Fabindia', CAST(N'10:00:00' AS Time), CAST(N'22:00:00' AS Time), N'Images/download (40).jpg', N'Images/images (4).jpg', N'Ethnic Clothing', N'Fabindia is India''s largest private platform for products that are made from traditional techniques, skills and hand-based processes.', N'Clothing', 29)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (30, N'PizzaHut', CAST(N'09:00:00' AS Time), CAST(N'21:30:00' AS Time), N'Images/download (41).jpg', N'Images/download (42).jpg', N'Fast Food and Pizza', N'Pizza Hut is an American restaurant chain and international franchise founded in 1958 in Wichita, Kansas by Dan and Frank Carney. It provides pizza and other Italian-American dishes, including pasta, side dishes and desserts.', N'Food', 30)
INSERT [dbo].[stores] ([storeId], [storeName], [openTime], [closeTime], [imageName], [promoImageName], [storeAbout], [storeDescription], [storeCategory], [plotId]) VALUES (31, N'Game Zone', CAST(N'10:00:00' AS Time), CAST(N'22:00:00' AS Time), N'Images/5fc9b04d11b0ad1c752f66ff_5fc632d80ebbc561623ec92e_G.jpeg', N'Images/images (4).jpg', N'Entertain', N'Arcade, Bowling and much more!', N'Other', 31)
SET IDENTITY_INSERT [dbo].[stores] OFF
ALTER TABLE [dbo].[brands]  WITH CHECK ADD FOREIGN KEY([storeId])
REFERENCES [dbo].[stores] ([storeId])
GO
ALTER TABLE [dbo].[cinema]  WITH CHECK ADD FOREIGN KEY([movieId])
REFERENCES [dbo].[movie] ([movieId])
GO
ALTER TABLE [dbo].[movie]  WITH CHECK ADD FOREIGN KEY([cinemaId])
REFERENCES [dbo].[cinema] ([cinemaId])
GO
ALTER TABLE [dbo].[plots]  WITH CHECK ADD FOREIGN KEY([storeId])
REFERENCES [dbo].[stores] ([storeId])
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([brandId])
REFERENCES [dbo].[brands] ([brandId])
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([storeId])
REFERENCES [dbo].[stores] ([storeId])
GO
ALTER TABLE [dbo].[seatreserve]  WITH CHECK ADD FOREIGN KEY([cinemaId])
REFERENCES [dbo].[cinema] ([cinemaId])
GO
ALTER TABLE [dbo].[seatreserve]  WITH CHECK ADD FOREIGN KEY([seatId])
REFERENCES [dbo].[seat] ([seatId])
GO
ALTER TABLE [dbo].[stores]  WITH CHECK ADD FOREIGN KEY([plotId])
REFERENCES [dbo].[plots] ([plotId])
GO
