USE InventoryManagement;
GO

CREATE PROCEDURE dbo.usp_GetInventoryByWarehouse
    @WarehouseID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        i.InventoryID,
        p.ProductID,
        p.ProductName,
        c.CategoryName,
        w.WarehouseName,
        i.QuantityOnHand,
        i.ReorderLevel,
        i.MinimumStockLevel,
        i.LastUpdatedDate
    FROM dbo.Inventory AS i
    INNER JOIN dbo.Products AS p
        ON i.ProductID = p.ProductID
    INNER JOIN dbo.Categories AS c
        ON p.CategoryID = c.CategoryID
    INNER JOIN dbo.Warehouses AS w
        ON i.WarehouseID = w.WarehouseID
    WHERE i.WarehouseID = @WarehouseID
    ORDER BY p.ProductName;
END;
GO