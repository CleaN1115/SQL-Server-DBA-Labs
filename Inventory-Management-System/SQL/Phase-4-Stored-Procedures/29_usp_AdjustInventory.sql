USE InventoryManagement;
GO

CREATE PROCEDURE dbo.usp_AdjustInventory
    @ProductID INT,
    @WarehouseID INT,
    @NewQuantity INT,
    @EmployeeID INT,
    @Notes NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Prevent negative inventory
    IF @NewQuantity < 0
    BEGIN
        THROW 50003, 'Inventory quantity cannot be negative.', 1;
    END;

    DECLARE @CurrentQuantity INT;
    DECLARE @Adjustment INT;

    -- Read current inventory
    SELECT
        @CurrentQuantity = QuantityOnHand
    FROM dbo.Inventory
    WHERE ProductID = @ProductID
      AND WarehouseID = @WarehouseID;

    -- Make sure the inventory record exists
    IF @CurrentQuantity IS NULL
    BEGIN
        THROW 50004, 'Inventory record not found for this product and warehouse.', 1;
    END;

    -- Calculate the difference
    SET @Adjustment = @NewQuantity - @CurrentQuantity;

    -- Nothing changed
    IF @Adjustment = 0
    BEGIN
        PRINT 'No inventory adjustment required.';
        RETURN;
    END;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Update current inventory
        UPDATE dbo.Inventory
        SET
            QuantityOnHand = @NewQuantity,
            LastUpdatedDate = SYSDATETIME()
        WHERE ProductID = @ProductID
          AND WarehouseID = @WarehouseID;

        -- Record the audit trail
        INSERT INTO dbo.InventoryTransactions
        (
            ProductID,
            WarehouseID,
            EmployeeID,
            TransactionType,
            QuantityChange,
            TransactionDate,
            Notes
        )
        VALUES
        (
            @ProductID,
            @WarehouseID,
            @EmployeeID,
            'ADJUSTMENT',
            @Adjustment,
            SYSDATETIME(),
            @Notes
        );

        COMMIT TRANSACTION;
    END TRY

    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        THROW;
    END CATCH;
END;
GO