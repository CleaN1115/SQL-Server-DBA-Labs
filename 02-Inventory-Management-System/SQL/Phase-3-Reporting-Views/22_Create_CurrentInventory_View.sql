/*
==========================================================
Company: Northwind Retail Group
Project: Inventory Management System
Ticket: #023
Description:
Creates a reporting view showing current inventory by
product and warehouse.
==========================================================
*/

USE InventoryManagement;
GO

CREATE VIEW dbo.vw_CurrentInventory
AS
SELECT
    i.InventoryID,
    p.ProductID,
    p.ProductName,
    c.CategoryName,
    w.WarehouseID,
    w.WarehouseName,
    w.City,
    w.State,
    i.QuantityOnHand,
    i.ReorderLevel,
    i.MinimumStockLevel,
    i.LastUpdatedDate,

    CASE
        WHEN i.QuantityOnHand <= i.MinimumStockLevel
            THEN 'CRITICAL'
        WHEN i.QuantityOnHand <= i.ReorderLevel
            THEN 'LOW STOCK'
        ELSE 'IN STOCK'
    END AS StockStatus
FROM dbo.Inventory AS i
INNER JOIN dbo.Products AS p
    ON i.ProductID = p.ProductID
INNER JOIN dbo.Categories AS c
    ON p.CategoryID = c.CategoryID
INNER JOIN dbo.Warehouses AS w
    ON i.WarehouseID = w.WarehouseID;
GO

SELECT *
FROM dbo.vw_CurrentInventory
ORDER BY WarehouseName, ProductName;
GO