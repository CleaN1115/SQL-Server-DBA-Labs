USE InventoryManagement;
GO

CREATE PROCEDURE dbo.usp_ProductPriceHistory
    @ProductID INT,
    @SupplierID INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        p.ProductName,
        c.CategoryName,
        s.SupplierName,
        ph.UnitPrice,
        ph.EffectiveFrom,
        ph.EffectiveTo,
        CONCAT(e.FirstName, ' ', e.LastName) AS CreatedBy,

        CASE
            WHEN ph.EffectiveTo IS NULL THEN 'CURRENT'
            ELSE 'HISTORICAL'
        END AS PriceStatus

    FROM dbo.PriceHistory AS ph

    INNER JOIN dbo.Products AS p
        ON ph.ProductID = p.ProductID

    INNER JOIN dbo.Categories AS c
        ON p.CategoryID = c.CategoryID

    INNER JOIN dbo.Suppliers AS s
        ON ph.SupplierID = s.SupplierID

    LEFT JOIN dbo.Employees AS e
        ON ph.CreatedByEmployeeID = e.EmployeeID

    WHERE ph.ProductID = @ProductID
      AND (
            @SupplierID IS NULL
            OR ph.SupplierID = @SupplierID
          )

    ORDER BY ph.EffectiveFrom DESC;
END;
GO