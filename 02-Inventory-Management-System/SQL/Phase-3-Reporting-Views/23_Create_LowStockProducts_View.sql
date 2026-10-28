/*
==========================================================
Company: Northwind Retail Group
Project: Inventory Management System
Ticket: #024
Description:
Creates a reporting view showing products that have reached
their reorder or minimum stock levels.
==========================================================
*/

USE InventoryManagement;
GO

CREATE VIEW dbo.vw_LowStockProducts
AS
SELECT
    InventoryID,
    ProductID,
    ProductName,
    CategoryName,
    WarehouseID,
    WarehouseName,
    City,
    State,
    QuantityOnHand,
    ReorderLevel,
    MinimumStockLevel,
    StockStatus,
    LastUpdatedDate
FROM dbo.vw_CurrentInventory
WHERE QuantityOnHand <= ReorderLevel;
GO

SELECT *
FROM dbo.vw_LowStockProducts
ORDER BY
    CASE
        WHEN StockStatus = 'CRITICAL' THEN 1
        WHEN StockStatus = 'LOW STOCK' THEN 2
        ELSE 3
    END,
    QuantityOnHand;
GO