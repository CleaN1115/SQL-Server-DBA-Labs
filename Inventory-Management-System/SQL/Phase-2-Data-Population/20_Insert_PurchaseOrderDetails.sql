USE InventoryManagement;
GO

INSERT INTO PurchaseOrderDetails
(
    PurchaseOrderID,
    ProductID,
    QuantityOrdered,
    ActualQuantityDelivered,
    UnitPrice,
    LineStatus
)
VALUES
-- Purchase Order 1
(1,1,20,20,850.00,'RECEIVED'),
(1,2,15,15,920.00,'RECEIVED'),

-- Purchase Order 2
(2,6,200,200,5.50,'RECEIVED'),
(2,7,500,500,1.25,'RECEIVED'),
(2,8,100,100,3.00,'RECEIVED'),

-- Purchase Order 3
(3,11,10,6,250.00,'PARTIALLY RECEIVED'),
(3,12,20,20,180.00,'RECEIVED'),

-- Purchase Order 4
(4,14,50,50,18.00,'RECEIVED'),
(4,15,100,100,7.50,'RECEIVED'),

-- Purchase Order 5
(5,16,75,0,4.25,'PENDING'),
(5,17,40,0,5.75,'PENDING'),

-- Purchase Order 6
(6,3,25,0,180.00,'PENDING'),

-- Purchase Order 7
(7,9,200,0,2.50,'PENDING'),
(7,10,100,0,4.00,'PENDING'),

-- Purchase Order 8
(8,13,15,0,300.00,'PENDING');
GO

SELECT *
FROM PurchaseOrderDetails;
GO