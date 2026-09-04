USE InventoryManagement;
GO

SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO

SELECT
    ProductID,
    ProductName,
    CategoryID,
    IsActive
FROM dbo.Products
WHERE ProductName = 'Dell Latitude 5550 Laptop';
GO

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO