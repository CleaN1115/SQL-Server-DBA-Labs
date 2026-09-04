USE InventoryManagement;
GO

SET NOCOUNT ON;

DECLARE @Counter INT = 1;

WHILE @Counter <= 50000
BEGIN

    INSERT INTO dbo.Products
    (
        ProductName,
        CategoryID,
        CreateDate,
        IsActive
    )

    VALUES
    (
        CONCAT('Test Product ', @Counter),
        1,
        SYSDATETIME(),
        1
    );

    SET @Counter = @Counter + 1;

END;
GO


