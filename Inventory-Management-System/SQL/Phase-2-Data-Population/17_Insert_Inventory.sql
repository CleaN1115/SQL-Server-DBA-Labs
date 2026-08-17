USE InventoryManagement;
GO

INSERT INTO Inventory
(
    ProductID,
    WarehouseID,
    QuantityOnHand,
    ReorderLevel,
    MinimumStockLevel,
    LastUpdatedDate
)
VALUES
-- Phoenix Distribution Center
(1,1,25,10,5,GETDATE()),
(2,1,18,10,5,GETDATE()),
(3,1,30,15,8,GETDATE()),
(4,1,150,50,25,GETDATE()),
(5,1,100,40,20,GETDATE()),
(6,1,500,100,50,GETDATE()),
(7,1,1000,250,100,GETDATE()),
(8,1,300,75,40,GETDATE()),
(9,1,250,60,30,GETDATE()),
(10,1,180,50,25,GETDATE()),

-- Tempe Operations Warehouse
(11,2,20,8,4,GETDATE()),
(12,2,35,10,5,GETDATE()),
(13,2,15,5,2,GETDATE()),
(14,2,120,40,20,GETDATE()),
(15,2,200,50,25,GETDATE()),

-- Dallas Regional Warehouse
(16,3,180,50,20,GETDATE()),
(17,3,90,30,15,GETDATE()),
(18,3,250,60,30,GETDATE()),
(19,3,160,40,20,GETDATE()),
(20,3,300,75,40,GETDATE());
GO

SELECT *
FROM Inventory
ORDER BY WarehouseID, ProductID;
GO