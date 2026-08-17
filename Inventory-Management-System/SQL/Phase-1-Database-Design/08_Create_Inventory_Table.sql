/*
==========================================================
Company: Northwind Retail Group
Project: Inventory Management System
Ticket: #010
Description:
Creates the Inventory table to track product quantities
by warehouse.
==========================================================
*/
USE InventoryManagement;
GO

CREATE TABLE Inventory
(
    InventoryID INT IDENTITY(1,1) PRIMARY KEY,

    ProductID INT NOT NULL,

    WarehouseID INT NOT NULL,

    QuantityOnHand INT NOT NULL
        CONSTRAINT CHK_Inventory_QuantityOnHand
        CHECK (QuantityOnHand >= 0),

    ReorderLevel INT NOT NULL
        CONSTRAINT CHK_Inventory_ReorderLevel
        CHECK (ReorderLevel >= 0),

    MinimumStockLevel INT NOT NULL
        CONSTRAINT CHK_Inventory_MinimumStockLevel
        CHECK (MinimumStockLevel >= 0),

    LastUpdatedDate DATETIME2 NOT NULL
        CONSTRAINT DF_Inventory_LastUpdatedDate
        DEFAULT SYSDATETIME(),

    CONSTRAINT UQ_Inventory_Product_Warehouse
        UNIQUE (ProductID, WarehouseID),

    CONSTRAINT FK_Inventory_Products
        FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID),

    CONSTRAINT FK_Inventory_Warehouses
        FOREIGN KEY (WarehouseID)
        REFERENCES Warehouses(WarehouseID)
);
GO

SELECT *
FROM Inventory;