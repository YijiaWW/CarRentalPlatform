USE [VehicleInventoryDb]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vehicle]') AND type in (N'U'))
ALTER TABLE [dbo].[Vehicle] DROP CONSTRAINT IF EXISTS [FK_Vehicle_VehicleType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Inventory]') AND type in (N'U'))
ALTER TABLE [dbo].[Inventory] DROP CONSTRAINT IF EXISTS [FK_Inventory_VehicleStatus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Inventory]') AND type in (N'U'))
ALTER TABLE [dbo].[Inventory] DROP CONSTRAINT IF EXISTS [FK_Inventory_VehicleLocation]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Inventory]') AND type in (N'U'))
ALTER TABLE [dbo].[Inventory] DROP CONSTRAINT IF EXISTS [FK_Inventory_Vehicle]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Inventory]') AND type in (N'U'))
ALTER TABLE [dbo].[Inventory] DROP CONSTRAINT IF EXISTS [DF__Inventory__LastU__74AE54BC]
GO
/****** Object:  Index [UQ__VehicleT__737584F61253212D]    Script Date: 2026-02-03 11:11:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VehicleType]') AND type in (N'U'))
ALTER TABLE [dbo].[VehicleType] DROP CONSTRAINT IF EXISTS [UQ__VehicleT__737584F61253212D]
GO
/****** Object:  Index [UQ__VehicleS__737584F697EFE4BF]    Script Date: 2026-02-03 11:11:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VehicleStatus]') AND type in (N'U'))
ALTER TABLE [dbo].[VehicleStatus] DROP CONSTRAINT IF EXISTS [UQ__VehicleS__737584F697EFE4BF]
GO
/****** Object:  Index [UQ__VehicleL__737584F65980E5BE]    Script Date: 2026-02-03 11:11:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VehicleLocation]') AND type in (N'U'))
ALTER TABLE [dbo].[VehicleLocation] DROP CONSTRAINT IF EXISTS [UQ__VehicleL__737584F65980E5BE]
GO
/****** Object:  Table [dbo].[VehicleType]    Script Date: 2026-02-03 11:11:41 PM ******/
DROP TABLE IF EXISTS [dbo].[VehicleType]
GO
/****** Object:  Table [dbo].[VehicleStatus]    Script Date: 2026-02-03 11:11:41 PM ******/
DROP TABLE IF EXISTS [dbo].[VehicleStatus]
GO
/****** Object:  Table [dbo].[VehicleLocation]    Script Date: 2026-02-03 11:11:41 PM ******/
DROP TABLE IF EXISTS [dbo].[VehicleLocation]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 2026-02-03 11:11:41 PM ******/
DROP TABLE IF EXISTS [dbo].[Vehicle]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 2026-02-03 11:11:41 PM ******/
DROP TABLE IF EXISTS [dbo].[Inventory]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 2026-02-03 11:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VehicleId] [int] NOT NULL,
	[VehicleLocationId] [int] NOT NULL,
	[VehicleStatusId] [int] NOT NULL,
	[LastUpdated] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 2026-02-03 11:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Make] [nvarchar](50) NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[VehicleTypeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleLocation]    Script Date: 2026-02-03 11:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleLocation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleStatus]    Script Date: 2026-02-03 11:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleType]    Script Date: 2026-02-03 11:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Inventory] ON 
GO
INSERT [dbo].[Inventory] ([Id], [VehicleId], [VehicleLocationId], [VehicleStatusId], [LastUpdated]) VALUES (1, 1, 1, 1, CAST(N'2026-02-01T18:38:44.5689735' AS DateTime2))
GO
INSERT [dbo].[Inventory] ([Id], [VehicleId], [VehicleLocationId], [VehicleStatusId], [LastUpdated]) VALUES (2, 2, 1, 2, CAST(N'2026-02-01T18:38:44.5689735' AS DateTime2))
GO
INSERT [dbo].[Inventory] ([Id], [VehicleId], [VehicleLocationId], [VehicleStatusId], [LastUpdated]) VALUES (3, 3, 2, 1, CAST(N'2026-02-01T18:38:44.5689735' AS DateTime2))
GO
INSERT [dbo].[Inventory] ([Id], [VehicleId], [VehicleLocationId], [VehicleStatusId], [LastUpdated]) VALUES (4, 4, 2, 3, CAST(N'2026-02-01T18:38:44.5689735' AS DateTime2))
GO
INSERT [dbo].[Inventory] ([Id], [VehicleId], [VehicleLocationId], [VehicleStatusId], [LastUpdated]) VALUES (5, 5, 3, 1, CAST(N'2026-02-01T18:38:44.5689735' AS DateTime2))
GO
INSERT [dbo].[Inventory] ([Id], [VehicleId], [VehicleLocationId], [VehicleStatusId], [LastUpdated]) VALUES (6, 6, 3, 4, CAST(N'2026-02-01T18:38:44.5689735' AS DateTime2))
GO
INSERT [dbo].[Inventory] ([Id], [VehicleId], [VehicleLocationId], [VehicleStatusId], [LastUpdated]) VALUES (7, 1, 4, 1, CAST(N'2026-02-01T18:38:44.5689735' AS DateTime2))
GO
INSERT [dbo].[Inventory] ([Id], [VehicleId], [VehicleLocationId], [VehicleStatusId], [LastUpdated]) VALUES (8, 2, 4, 2, CAST(N'2026-02-01T18:38:44.5689735' AS DateTime2))
GO
INSERT [dbo].[Inventory] ([Id], [VehicleId], [VehicleLocationId], [VehicleStatusId], [LastUpdated]) VALUES (9, 3, 1, 1, CAST(N'2026-02-01T18:38:44.5689735' AS DateTime2))
GO
INSERT [dbo].[Inventory] ([Id], [VehicleId], [VehicleLocationId], [VehicleStatusId], [LastUpdated]) VALUES (10, 4, 2, 3, CAST(N'2026-02-01T18:38:44.5689735' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Inventory] OFF
GO
SET IDENTITY_INSERT [dbo].[Vehicle] ON 
GO
INSERT [dbo].[Vehicle] ([Id], [Make], [Model], [VehicleTypeId]) VALUES (1, N'Toyota', N'Camry', 1)
GO
INSERT [dbo].[Vehicle] ([Id], [Make], [Model], [VehicleTypeId]) VALUES (2, N'Honda', N'Civic', 1)
GO
INSERT [dbo].[Vehicle] ([Id], [Make], [Model], [VehicleTypeId]) VALUES (3, N'Ford', N'Escape', 2)
GO
INSERT [dbo].[Vehicle] ([Id], [Make], [Model], [VehicleTypeId]) VALUES (4, N'Toyota', N'RAV4', 2)
GO
INSERT [dbo].[Vehicle] ([Id], [Make], [Model], [VehicleTypeId]) VALUES (5, N'Ford', N'F-150', 3)
GO
INSERT [dbo].[Vehicle] ([Id], [Make], [Model], [VehicleTypeId]) VALUES (6, N'Chevy', N'Express', 4)
GO
SET IDENTITY_INSERT [dbo].[Vehicle] OFF
GO
SET IDENTITY_INSERT [dbo].[VehicleLocation] ON 
GO
INSERT [dbo].[VehicleLocation] ([Id], [Name]) VALUES (3, N'Cambridge')
GO
INSERT [dbo].[VehicleLocation] ([Id], [Name]) VALUES (4, N'Guelph')
GO
INSERT [dbo].[VehicleLocation] ([Id], [Name]) VALUES (1, N'Kitchener')
GO
INSERT [dbo].[VehicleLocation] ([Id], [Name]) VALUES (2, N'Waterloo')
GO
SET IDENTITY_INSERT [dbo].[VehicleLocation] OFF
GO
SET IDENTITY_INSERT [dbo].[VehicleStatus] ON 
GO
INSERT [dbo].[VehicleStatus] ([Id], [Name]) VALUES (1, N'Available')
GO
INSERT [dbo].[VehicleStatus] ([Id], [Name]) VALUES (4, N'Maintenance')
GO
INSERT [dbo].[VehicleStatus] ([Id], [Name]) VALUES (3, N'Rented')
GO
INSERT [dbo].[VehicleStatus] ([Id], [Name]) VALUES (2, N'Reserved')
GO
SET IDENTITY_INSERT [dbo].[VehicleStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[VehicleType] ON 
GO
INSERT [dbo].[VehicleType] ([Id], [Name]) VALUES (1, N'Sedan')
GO
INSERT [dbo].[VehicleType] ([Id], [Name]) VALUES (2, N'SUV')
GO
INSERT [dbo].[VehicleType] ([Id], [Name]) VALUES (3, N'Truck')
GO
INSERT [dbo].[VehicleType] ([Id], [Name]) VALUES (4, N'Van')
GO
SET IDENTITY_INSERT [dbo].[VehicleType] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__VehicleL__737584F65980E5BE]    Script Date: 2026-02-03 11:11:41 PM ******/
ALTER TABLE [dbo].[VehicleLocation] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__VehicleS__737584F697EFE4BF]    Script Date: 2026-02-03 11:11:41 PM ******/
ALTER TABLE [dbo].[VehicleStatus] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__VehicleT__737584F61253212D]    Script Date: 2026-02-03 11:11:41 PM ******/
ALTER TABLE [dbo].[VehicleType] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inventory] ADD  DEFAULT (sysdatetime()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Vehicle] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[Vehicle] ([Id])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Vehicle]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_VehicleLocation] FOREIGN KEY([VehicleLocationId])
REFERENCES [dbo].[VehicleLocation] ([Id])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_VehicleLocation]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_VehicleStatus] FOREIGN KEY([VehicleStatusId])
REFERENCES [dbo].[VehicleStatus] ([Id])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_VehicleStatus]
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_VehicleType] FOREIGN KEY([VehicleTypeId])
REFERENCES [dbo].[VehicleType] ([Id])
GO
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FK_Vehicle_VehicleType]
GO
