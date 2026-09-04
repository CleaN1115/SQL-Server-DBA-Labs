USE InventoryManagement;
GO

-- Product searches
CREATE NONCLUSTERED INDEX IX_Products_ProductName
ON dbo.Products(ProductName);
GO

-- Inventory lookups by warehouse and product
CREATE NONCLUSTERED INDEX IX_Inventory_Warehouse_Product
ON dbo.Inventory(WarehouseID, ProductID)
INCLUDE
(
    QuantityOnHand,
    ReorderLevel,
    MinimumStockLevel,
    LastUpdatedDate
);
GO

-- Inventory transaction history
CREATE NONCLUSTERED INDEX IX_InventoryTransactions_Product_Date
ON dbo.InventoryTransactions(ProductID, TransactionDate DESC)
INCLUDE
(
    WarehouseID,
    EmployeeID,
    TransactionType,
    QuantityChange
);
GO

-- Purchase order lookups
CREATE NONCLUSTERED INDEX IX_PurchaseOrders_Supplier_OrderDate
ON dbo.PurchaseOrders(SupplierID, OrderDate DESC)
INCLUDE
(
    OrderedByEmployeeID,
    ExpectedDeliveryDate,
    OrderStatus
);
GO


---run this to verify the indexes:

SELECT
    OBJECT_NAME(i.object_id) AS TableName,
    i.name AS IndexName,
    i.type_desc
FROM sys.indexes AS i
WHERE OBJECT_NAME(i.object_id) IN
(
    'Products',
    'Inventory',
    'InventoryTransactions',
    'PurchaseOrders'
)
AND i.name IS NOT NULL
ORDER BY TableName, IndexName;
