USE [YW_VehicleInventoryDb];
GO

SET IDENTITY_INSERT [YW_Locations] ON;

MERGE [YW_Locations] AS target
USING (
	VALUES
		(101, 'LOC-101', 'Downtown Pickup Hub'),
		(102, 'LOC-102', 'Airport Terminal Lot'),
		(103, 'LOC-103', 'West End Service Center')
) AS source ([Id], [LocationCode], [LocationName])
ON target.[Id] = source.[Id]
WHEN NOT MATCHED BY TARGET THEN
	INSERT ([Id], [LocationCode], [LocationName])
	VALUES (source.[Id], source.[LocationCode], source.[LocationName]);

SET IDENTITY_INSERT [YW_Locations] OFF;

MERGE [YW_Vehicles] AS target
USING (
	VALUES
		('CAR-001', 101, 'Compact Sedan', 'Available'),
		('CAR-002', 101, 'Midsize SUV', 'Rented'),
		('CAR-003', 102, 'Luxury Sedan', 'Reserved'),
		('CAR-004', 102, 'Minivan', 'UnderService'),
		('CAR-005', 103, 'Pickup Truck', 'Available'),
		('CAR-006', 101, 'Electric Hatchback', 'Available'),
		('CAR-007', 103, 'Convertible', 'Rented'),
		('CAR-008', 102, 'Full-size SUV', 'Available')
) AS source ([VehicleCode], [LocationId], [VehicleType], [Status])
ON target.[VehicleCode] = source.[VehicleCode]
WHEN NOT MATCHED BY TARGET THEN
	INSERT ([VehicleCode], [LocationId], [VehicleType], [Status])
	VALUES (source.[VehicleCode], source.[LocationId], source.[VehicleType], source.[Status]);
GO
