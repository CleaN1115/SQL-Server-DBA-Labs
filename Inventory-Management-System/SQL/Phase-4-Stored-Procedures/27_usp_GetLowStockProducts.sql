CREATE PROCEDURE dbo.usp_GetLowStockProducts
    @WarehouseName NVARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        l.ProductName,
        l.CategoryName,
        l.WarehouseName,
        l.QuantityOnHand,
        l.ReorderLevel,
        l.MinimumStockLevel,
        l.StockStatus,
        s.SupplierName AS PreferredSupplier,
        l.LastUpdatedDate
    FROM dbo.vw_LowStockProducts AS l
    LEFT JOIN dbo.ProductSuppliers AS ps
        ON l.ProductID = ps.ProductID
       AND ps.IsPreferredSupplier = 1
    LEFT JOIN dbo.Suppliers AS s
        ON ps.SupplierID = s.SupplierID
    WHERE
        @WarehouseName IS NULL
        OR l.WarehouseName LIKE '%' + @WarehouseName + '%'
    ORDER BY
        CASE
            WHEN l.StockStatus = 'CRITICAL' THEN 1
            WHEN l.StockStatus = 'LOW STOCK' THEN 2
            ELSE 3
        END,
        l.QuantityOnHand;
END;
GO