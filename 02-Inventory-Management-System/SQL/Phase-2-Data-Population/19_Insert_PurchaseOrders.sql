USE InventoryManagement;
GO

INSERT INTO PurchaseOrders
(
    SupplierID,
    OrderedByEmployeeID,
    OrderDate,
    ExpectedDeliveryDate,
    OrderStatus,
    Notes
)
VALUES
(1,2,'2026-07-01','2026-07-05','RECEIVED','Monthly laptop purchase'),
(2,2,'2026-07-03','2026-07-07','RECEIVED','Office supplies replenishment'),
(3,6,'2026-07-08','2026-07-12','PARTIALLY RECEIVED','Furniture order'),
(4,2,'2026-07-10','2026-07-14','RECEIVED','Break room supplies'),
(5,6,'2026-07-12','2026-07-16','PENDING','Cleaning supplies restock'),
(1,2,'2026-07-15','2026-07-20','ORDERED','Additional laptops'),
(2,6,'2026-07-18','2026-07-23','APPROVED','Office stationery'),
(3,2,'2026-07-20','2026-07-25','PENDING','New office furniture');
GO

SELECT *
FROM PurchaseOrders;
GO