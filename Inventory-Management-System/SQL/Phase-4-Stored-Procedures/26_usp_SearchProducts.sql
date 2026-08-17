/*
==========================================================
Company: Northwind Retail Group
Project: Inventory Management System
Ticket: #026
Description:
Searches products by partial product name.
==========================================================
*/

USE InventoryManagement;
GO

CREATE PROCEDURE dbo.usp_SearchProducts

    @ProductName NVARCHAR(100)

AS
BEGIN

    SET NOCOUNT ON;

    SELECT

        p.ProductID,
        p.ProductName,
        c.CategoryName,
        p.IsActive

    FROM Products p

    INNER JOIN Categories c
        ON p.CategoryID = c.CategoryID

    WHERE p.ProductName LIKE '%' + @ProductName + '%'

    ORDER BY p.ProductName;

END;
GO

ALTER PROCEDURE dbo.usp_SearchProducts
    @ProductName NVARCHAR(100) = NULL,
    @CategoryName NVARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        p.ProductID,
        p.ProductName,
        c.CategoryName,
        p.IsActive
    FROM dbo.Products AS p
    INNER JOIN dbo.Categories AS c
        ON p.CategoryID = c.CategoryID
    WHERE
        (@ProductName IS NULL
            OR p.ProductName LIKE '%' + @ProductName + '%')
        AND
        (@CategoryName IS NULL
            OR c.CategoryName LIKE '%' + @CategoryName + '%')
    ORDER BY p.ProductName;
END;
GO