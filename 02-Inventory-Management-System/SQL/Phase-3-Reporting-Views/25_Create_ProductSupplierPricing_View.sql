USE InventoryManagement;
GO

CREATE VIEW dbo.vw_ProductSupplierPricing
AS
SELECT
    p.ProductID,
    p.ProductName,
    c.CategoryName,
    s.SupplierID,
    s.SupplierName,
    ps.SupplierPrice,
    ps.IsPreferredSupplier,
    ps.CreatedDate
FROM dbo.ProductSuppliers AS ps
INNER JOIN dbo.Products AS p
    ON ps.ProductID = p.ProductID
INNER JOIN dbo.Categories AS c
    ON p.CategoryID = c.CategoryID
INNER JOIN dbo.Suppliers AS s
    ON ps.SupplierID = s.SupplierID;
GO

SELECT *
FROM dbo.vw_ProductSupplierPricing
ORDER BY ProductName, IsPreferredSupplier DESC, SupplierPrice;
GO