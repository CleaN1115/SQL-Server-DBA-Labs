USE InventoryManagement;
GO

INSERT INTO InventoryTransactions
(
    ProductID,
    WarehouseID,
    EmployeeID,
    TransactionType,
    QuantityChange,
    TransactionDate,
    Notes
)
VALUES
(1,1,2,'RECEIVED',20,'2026-07-05','Purchase Order #1 received'),
(2,1,2,'RECEIVED',15,'2026-07-05','Purchase Order #1 received'),
(6,1,2,'RECEIVED',200,'2026-07-07','Purchase Order #2 received'),
(7,1,2,'RECEIVED',500,'2026-07-07','Purchase Order #2 received'),
(8,1,2,'RECEIVED',100,'2026-07-07','Purchase Order #2 received'),

(11,2,6,'RECEIVED',6,'2026-07-12','Partial delivery from Purchase Order #3'),
(12,2,6,'RECEIVED',20,'2026-07-12','Purchase Order #3 received'),

(14,2,2,'RECEIVED',50,'2026-07-14','Purchase Order #4 received'),
(15,2,2,'RECEIVED',100,'2026-07-14','Purchase Order #4 received'),

(1,1,4,'SOLD',-3,'2026-07-15','Customer order'),
(4,1,4,'SOLD',-12,'2026-07-15','Customer order'),
(6,1,4,'SOLD',-50,'2026-07-16','Office supply request'),

(16,3,8,'DAMAGED',-2,'2026-07-17','Packaging damaged'),
(17,3,8,'ADJUSTMENT',5,'2026-07-18','Inventory count correction'),

(3,1,5,'TRANSFER_OUT',-5,'2026-07-19','Transferred to Tempe warehouse'),
(3,2,5,'TRANSFER_IN',5,'2026-07-19','Received from Phoenix warehouse');
GO

SELECT *
FROM InventoryTransactions
ORDER BY TransactionDate;
GO