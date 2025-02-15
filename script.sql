USE [Booking]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 27/08/2024 8:09:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HotelId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[RoomNumber] [int] NOT NULL,
	[NumberOfPeople] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Booking1]    Script Date: 27/08/2024 8:09:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Booking1] AS 
SELECT *
FROM Booking
GO
/****** Object:  Table [dbo].[HotelInfo]    Script Date: 27/08/2024 8:09:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ChainId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
	[AmountToBePaid] [decimal](16, 2) NOT NULL,
 CONSTRAINT [PK_Hotel-Info] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Hotel1]    Script Date: 27/08/2024 8:09:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Hotel1] AS
SELECT *
FROM HotelInfo
GO
/****** Object:  Table [dbo].[CustomerInfo]    Script Date: 27/08/2024 8:09:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NOT NULL,
	[PaymentId] [int] NOT NULL,
 CONSTRAINT [PK_Customer-Info] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Customer1]    Script Date: 27/08/2024 8:09:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Customer1] AS
SELECT *
FROM CustomerInfo
GO
/****** Object:  View [dbo].[AboveSingleBooking]    Script Date: 27/08/2024 8:09:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AboveSingleBooking] AS
SELECT *
FROM HotelInfo WHERE
AmountToBePaid > 150
GO
/****** Object:  View [dbo].[BookingBefAug17]    Script Date: 27/08/2024 8:09:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BookingBefAug17] AS
SELECT *
FROM Booking WHERE
Date < '2024-08-17'
GO
/****** Object:  View [dbo].[CustomerPaysInCash]    Script Date: 27/08/2024 8:09:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CustomerPaysInCash] AS
SELECT * 
FROM CustomerInfo WHERE
PaymentId IN (1,4)
GO
/****** Object:  View [dbo].[NameDateLocation]    Script Date: 27/08/2024 8:09:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[NameDateLocation] AS
SELECT FirstName + ' ' + LastName AS Name, Date,HotelId
FROM Booking
GO
/****** Object:  Table [dbo].[CountryOfOrigin]    Script Date: 27/08/2024 8:09:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryOfOrigin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[Continent] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CountryOfOrigin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationChain]    Script Date: 27/08/2024 8:09:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationChain](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LocationChain] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 27/08/2024 8:09:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeOfPayment] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 27/08/2024 8:09:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeOfRoom] [nvarchar](50) NOT NULL,
	[MaxPeople] [int] NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([Id], [HotelId], [CustomerId], [FirstName], [LastName], [Email], [RoomNumber], [NumberOfPeople], [Date]) VALUES (3, 4, 7, N'Emily', N'Port', N'EmilyP@gmail.com', 142, 2, CAST(N'2024-08-17' AS Date))
INSERT [dbo].[Booking] ([Id], [HotelId], [CustomerId], [FirstName], [LastName], [Email], [RoomNumber], [NumberOfPeople], [Date]) VALUES (4, 23, 21, N'Hale', N'Reed', N'HaleReed@gmail.com', 123, 1, CAST(N'2024-08-15' AS Date))
INSERT [dbo].[Booking] ([Id], [HotelId], [CustomerId], [FirstName], [LastName], [Email], [RoomNumber], [NumberOfPeople], [Date]) VALUES (5, 46, 69, N'Mane', N'Haith', N'ManeH@gmail.com', 23, 4, CAST(N'2024-08-15' AS Date))
INSERT [dbo].[Booking] ([Id], [HotelId], [CustomerId], [FirstName], [LastName], [Email], [RoomNumber], [NumberOfPeople], [Date]) VALUES (6, 23, 11, N'Paige', N'Kay', N'PaigeK@gmail.com', 342, 3, CAST(N'2024-08-15' AS Date))
INSERT [dbo].[Booking] ([Id], [HotelId], [CustomerId], [FirstName], [LastName], [Email], [RoomNumber], [NumberOfPeople], [Date]) VALUES (9, 2, 70, N'Owen', N'Jareez', N'OwenJar@gmail.com', 88, 1, CAST(N'2024-08-15' AS Date))
INSERT [dbo].[Booking] ([Id], [HotelId], [CustomerId], [FirstName], [LastName], [Email], [RoomNumber], [NumberOfPeople], [Date]) VALUES (11, 8, 44, N'Liam', N'Pete', N'PeteL@gmail.com', 443, 2, CAST(N'2024-08-15' AS Date))
INSERT [dbo].[Booking] ([Id], [HotelId], [CustomerId], [FirstName], [LastName], [Email], [RoomNumber], [NumberOfPeople], [Date]) VALUES (12, 12, 32, N'Ian', N'Reyn', N'IanR@gmail.com', 213, 2, CAST(N'2024-08-14' AS Date))
INSERT [dbo].[Booking] ([Id], [HotelId], [CustomerId], [FirstName], [LastName], [Email], [RoomNumber], [NumberOfPeople], [Date]) VALUES (13, 32, 68, N'Yuzi', N'Ray', N'Yuzii@gmail.com', 112, 1, CAST(N'2024-08-14' AS Date))
INSERT [dbo].[Booking] ([Id], [HotelId], [CustomerId], [FirstName], [LastName], [Email], [RoomNumber], [NumberOfPeople], [Date]) VALUES (15, 36, 22, N'Valery', N'Peel', N'ValeryP@gmail.com', 44, 2, CAST(N'2024-08-14' AS Date))
INSERT [dbo].[Booking] ([Id], [HotelId], [CustomerId], [FirstName], [LastName], [Email], [RoomNumber], [NumberOfPeople], [Date]) VALUES (16, 18, 46, N'Kayn', N'Rain', N'Kaynn@gmail.com', 881, 2, CAST(N'2024-08-14' AS Date))
SET IDENTITY_INSERT [dbo].[Booking] OFF
GO
SET IDENTITY_INSERT [dbo].[CountryOfOrigin] ON 

INSERT [dbo].[CountryOfOrigin] ([Id], [Country], [Continent]) VALUES (1, N'Poland', N'Europe')
INSERT [dbo].[CountryOfOrigin] ([Id], [Country], [Continent]) VALUES (2, N'Germany', N'Europe')
INSERT [dbo].[CountryOfOrigin] ([Id], [Country], [Continent]) VALUES (3, N'France', N'Europe')
INSERT [dbo].[CountryOfOrigin] ([Id], [Country], [Continent]) VALUES (4, N'Spain', N'Europe')
INSERT [dbo].[CountryOfOrigin] ([Id], [Country], [Continent]) VALUES (5, N'USA', N'North America')
INSERT [dbo].[CountryOfOrigin] ([Id], [Country], [Continent]) VALUES (6, N'Canada', N'North America')
INSERT [dbo].[CountryOfOrigin] ([Id], [Country], [Continent]) VALUES (7, N'Brazil', N'South America')
INSERT [dbo].[CountryOfOrigin] ([Id], [Country], [Continent]) VALUES (8, N'South Korea', N'Asia')
INSERT [dbo].[CountryOfOrigin] ([Id], [Country], [Continent]) VALUES (9, N'China', N'Asia')
INSERT [dbo].[CountryOfOrigin] ([Id], [Country], [Continent]) VALUES (10, N'Philippines', N'Asia')
INSERT [dbo].[CountryOfOrigin] ([Id], [Country], [Continent]) VALUES (11, N'Indonesia', N'Asia')
INSERT [dbo].[CountryOfOrigin] ([Id], [Country], [Continent]) VALUES (12, N'Thailand', N'Asia')
INSERT [dbo].[CountryOfOrigin] ([Id], [Country], [Continent]) VALUES (13, N'Malta', N'Europe')
INSERT [dbo].[CountryOfOrigin] ([Id], [Country], [Continent]) VALUES (14, N'Singapore', N'Asia')
INSERT [dbo].[CountryOfOrigin] ([Id], [Country], [Continent]) VALUES (15, N'Sweden', N'Europe')
INSERT [dbo].[CountryOfOrigin] ([Id], [Country], [Continent]) VALUES (17, N'Japan', N'Asia')
INSERT [dbo].[CountryOfOrigin] ([Id], [Country], [Continent]) VALUES (18, N'Other', N'Other')
SET IDENTITY_INSERT [dbo].[CountryOfOrigin] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerInfo] ON 

INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (1, 1, 1)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (2, 1, 2)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (3, 1, 3)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (4, 1, 4)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (5, 2, 1)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (7, 2, 2)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (8, 2, 3)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (9, 2, 4)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (10, 3, 1)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (11, 3, 2)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (12, 3, 3)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (13, 3, 4)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (14, 4, 1)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (15, 4, 2)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (16, 4, 3)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (17, 4, 4)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (18, 5, 1)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (19, 5, 2)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (20, 5, 3)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (21, 5, 4)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (22, 6, 1)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (23, 6, 2)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (24, 6, 3)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (25, 6, 4)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (26, 7, 1)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (27, 7, 2)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (28, 7, 3)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (29, 7, 4)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (30, 8, 1)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (31, 8, 2)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (32, 8, 3)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (33, 8, 4)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (34, 9, 1)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (35, 9, 2)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (36, 9, 3)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (37, 9, 4)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (38, 10, 1)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (39, 10, 2)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (40, 10, 3)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (41, 10, 4)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (42, 11, 1)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (43, 11, 2)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (44, 11, 2)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (45, 11, 3)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (46, 11, 4)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (47, 12, 1)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (48, 12, 2)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (49, 12, 3)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (50, 12, 4)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (51, 13, 1)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (52, 13, 2)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (53, 13, 3)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (54, 13, 4)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (55, 14, 1)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (56, 14, 2)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (57, 14, 3)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (58, 14, 4)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (59, 15, 1)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (60, 15, 2)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (61, 15, 3)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (62, 15, 4)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (63, 15, 1)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (64, 15, 2)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (65, 17, 1)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (66, 17, 2)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (67, 17, 3)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (68, 17, 4)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (69, 18, 1)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (70, 18, 2)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (71, 18, 3)
INSERT [dbo].[CustomerInfo] ([Id], [CountryId], [PaymentId]) VALUES (72, 18, 4)
SET IDENTITY_INSERT [dbo].[CustomerInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[HotelInfo] ON 

INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (2, 1, 1, CAST(100.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (3, 1, 2, CAST(225.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (4, 1, 3, CAST(250.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (7, 1, 4, CAST(300.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (8, 1, 5, CAST(400.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (9, 1, 6, CAST(5000.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (10, 1, 7, CAST(150.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (11, 2, 1, CAST(150.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (12, 2, 2, CAST(250.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (13, 2, 3, CAST(275.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (14, 2, 4, CAST(300.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (15, 2, 5, CAST(350.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (16, 3, 1, CAST(180.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (17, 3, 2, CAST(200.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (18, 3, 3, CAST(250.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (19, 3, 4, CAST(300.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (20, 3, 5, CAST(350.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (21, 3, 7, CAST(200.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (22, 4, 1, CAST(120.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (23, 4, 2, CAST(240.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (24, 4, 3, CAST(260.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (25, 4, 4, CAST(300.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (26, 5, 1, CAST(100.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (27, 5, 2, CAST(170.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (28, 5, 3, CAST(200.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (29, 5, 4, CAST(250.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (30, 5, 5, CAST(300.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (31, 5, 6, CAST(4000.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (32, 5, 7, CAST(150.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (36, 6, 1, CAST(120.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (37, 6, 2, CAST(200.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (38, 6, 3, CAST(225.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (39, 6, 4, CAST(275.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (40, 8, 1, CAST(110.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (43, 8, 2, CAST(180.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (44, 8, 3, CAST(220.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (45, 8, 4, CAST(280.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (46, 8, 5, CAST(340.00 AS Decimal(16, 2)))
INSERT [dbo].[HotelInfo] ([Id], [ChainId], [TypeId], [AmountToBePaid]) VALUES (47, 8, 6, CAST(4500.00 AS Decimal(16, 2)))
SET IDENTITY_INSERT [dbo].[HotelInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[LocationChain] ON 

INSERT [dbo].[LocationChain] ([Id], [City], [Country]) VALUES (1, N'Warsaw', N'Poland')
INSERT [dbo].[LocationChain] ([Id], [City], [Country]) VALUES (2, N'Las Vegas', N'USA')
INSERT [dbo].[LocationChain] ([Id], [City], [Country]) VALUES (3, N'New York', N'USA')
INSERT [dbo].[LocationChain] ([Id], [City], [Country]) VALUES (4, N'Berlin', N'Germany')
INSERT [dbo].[LocationChain] ([Id], [City], [Country]) VALUES (5, N'Manila', N'Philippines')
INSERT [dbo].[LocationChain] ([Id], [City], [Country]) VALUES (6, N'Madrid', N'Spain')
INSERT [dbo].[LocationChain] ([Id], [City], [Country]) VALUES (8, N'Seoul ', N'South Korea')
SET IDENTITY_INSERT [dbo].[LocationChain] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([Id], [TypeOfPayment]) VALUES (1, N'Cash(LocalCurrency)')
INSERT [dbo].[Payment] ([Id], [TypeOfPayment]) VALUES (2, N'Card(ForeignCurrency)')
INSERT [dbo].[Payment] ([Id], [TypeOfPayment]) VALUES (3, N'Card(LocalCurrency)')
INSERT [dbo].[Payment] ([Id], [TypeOfPayment]) VALUES (4, N'Cash(ForeignCurrency)')
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([Id], [TypeOfRoom], [MaxPeople]) VALUES (1, N'Single Room', 1)
INSERT [dbo].[Type] ([Id], [TypeOfRoom], [MaxPeople]) VALUES (2, N'Queen', 2)
INSERT [dbo].[Type] ([Id], [TypeOfRoom], [MaxPeople]) VALUES (3, N'King', 2)
INSERT [dbo].[Type] ([Id], [TypeOfRoom], [MaxPeople]) VALUES (4, N'Suite', 4)
INSERT [dbo].[Type] ([Id], [TypeOfRoom], [MaxPeople]) VALUES (5, N'Deluxe Room', 4)
INSERT [dbo].[Type] ([Id], [TypeOfRoom], [MaxPeople]) VALUES (6, N' Presidential Suite', 4)
INSERT [dbo].[Type] ([Id], [TypeOfRoom], [MaxPeople]) VALUES (7, N'Double Room', 2)
SET IDENTITY_INSERT [dbo].[Type] OFF
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Customer-Info] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[CustomerInfo] ([Id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Customer-Info]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Hotel-Info] FOREIGN KEY([HotelId])
REFERENCES [dbo].[HotelInfo] ([Id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Hotel-Info]
GO
ALTER TABLE [dbo].[CustomerInfo]  WITH CHECK ADD  CONSTRAINT [FK_Customer-Info_CountryOfOrigin] FOREIGN KEY([CountryId])
REFERENCES [dbo].[CountryOfOrigin] ([Id])
GO
ALTER TABLE [dbo].[CustomerInfo] CHECK CONSTRAINT [FK_Customer-Info_CountryOfOrigin]
GO
ALTER TABLE [dbo].[CustomerInfo]  WITH CHECK ADD  CONSTRAINT [FK_Customer-Info_Payment] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Payment] ([Id])
GO
ALTER TABLE [dbo].[CustomerInfo] CHECK CONSTRAINT [FK_Customer-Info_Payment]
GO
ALTER TABLE [dbo].[HotelInfo]  WITH CHECK ADD  CONSTRAINT [FK_Hotel-Info_LocationChain] FOREIGN KEY([ChainId])
REFERENCES [dbo].[LocationChain] ([Id])
GO
ALTER TABLE [dbo].[HotelInfo] CHECK CONSTRAINT [FK_Hotel-Info_LocationChain]
GO
ALTER TABLE [dbo].[HotelInfo]  WITH CHECK ADD  CONSTRAINT [FK_Hotel-Info_Type] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Type] ([Id])
GO
ALTER TABLE [dbo].[HotelInfo] CHECK CONSTRAINT [FK_Hotel-Info_Type]
GO
