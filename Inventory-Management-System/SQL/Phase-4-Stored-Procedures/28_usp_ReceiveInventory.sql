USE InventoryManagement;
GO

CREATE PROCEDURE dbo.usp_ReceiveInventory
    @ProductID INT,
    @WarehouseID INT,
    @QuantityReceived INT,
    @EmployeeID INT,
    @Notes NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @QuantityReceived <= 0
    BEGIN
        THROW 50001, 'Quantity received must be greater than zero.', 1;
    END;

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE dbo.Inventory
        SET
            QuantityOnHand = QuantityOnHand + @QuantityReceived,
            LastUpdatedDate = SYSDATETIME()
        WHERE ProductID = @ProductID
          AND WarehouseID = @WarehouseID;

        IF @@ROWCOUNT = 0
        BEGIN
            THROW 50002, 'Inventory record not found for this product and warehouse.', 1;
        END;

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
            'RECEIVED',
            @QuantityReceived,
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