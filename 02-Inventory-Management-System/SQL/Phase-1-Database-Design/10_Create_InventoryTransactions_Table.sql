/*
==========================================================
Company: Northwind Retail Group
Project: Inventory Management System
Ticket: #012
Description:
Creates the InventoryTransactions table to record every
inventory movement for auditing and reporting.
==========================================================
*/

USE InventoryManagement;
GO

CREATE TABLE InventoryTransactions
(
    TransactionID INT IDENTITY(1,1) PRIMARY KEY,

    ProductID INT NOT NULL,

    WarehouseID INT NOT NULL,

    EmployeeID INT NOT NULL,

    TransactionType NVARCHAR(30) NOT NULL,

    QuantityChange INT NOT NULL,

    TransactionDate DATETIME2 NOT NULL
        CONSTRAINT DF_InventoryTransactions_TransactionDate
        DEFAULT SYSDATETIME(),

    Notes NVARCHAR(255) NULL,

    CONSTRAINT CK_InventoryTransactions_TransactionType
        CHECK
        (
            TransactionType IN
            (
                'RECEIVED',
                'SOLD',
                'RETURNED',
                'DAMAGED',
                'ADJUSTMENT',
                'TRANSFER_IN',
                'TRANSFER_OUT'
            )
        ),

    CONSTRAINT CK_InventoryTransactions_QuantityChange
        CHECK (QuantityChange <> 0),

    CONSTRAINT FK_InventoryTransactions_Products
        FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID),

    CONSTRAINT FK_InventoryTransactions_Warehouses
        FOREIGN KEY (WarehouseID)
        REFERENCES Warehouses(WarehouseID),

    CONSTRAINT FK_InventoryTransactions_Employees
        FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID)
);
GO

SELECT *
FROM InventoryTransactions;
GO