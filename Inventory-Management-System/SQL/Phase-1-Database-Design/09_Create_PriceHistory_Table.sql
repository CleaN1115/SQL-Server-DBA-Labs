/*
==========================================================
Company: Northwind Retail Group
Project: Inventory Management System
Ticket: #011
Description:
Creates the PriceHistory table to preserve supplier price
changes for each product.
==========================================================
*/

USE InventoryManagement;
GO

CREATE TABLE PriceHistory
(
    PriceHistoryID INT IDENTITY(1,1) PRIMARY KEY,

    ProductID INT NOT NULL,

    SupplierID INT NOT NULL,

    UnitPrice DECIMAL(10,2) NOT NULL,

    EffectiveFrom DATETIME2 NOT NULL
        CONSTRAINT DF_PriceHistory_EffectiveFrom
        DEFAULT SYSDATETIME(),

    EffectiveTo DATETIME2 NULL,

    CreatedByEmployeeID INT NULL,

    CONSTRAINT CK_PriceHistory_UnitPrice
        CHECK (UnitPrice > 0),

    CONSTRAINT CK_PriceHistory_DateRange
        CHECK
        (
            EffectiveTo IS NULL
            OR EffectiveTo > EffectiveFrom
        ),

    CONSTRAINT FK_PriceHistory_ProductSuppliers
        FOREIGN KEY (ProductID, SupplierID)
        REFERENCES ProductSuppliers(ProductID, SupplierID),

    CONSTRAINT FK_PriceHistory_Employees
        FOREIGN KEY (CreatedByEmployeeID)
        REFERENCES Employees(EmployeeID)
);
GO

SELECT *
FROM PriceHistory;
GO