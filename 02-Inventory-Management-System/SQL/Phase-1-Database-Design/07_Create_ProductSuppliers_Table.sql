/*
==========================================================
Company: Northwind Retail Group
Project: Inventory Management System
Ticket: #009
Description:
Creates the ProductSuppliers bridge table.
==========================================================
*/

USE InventoryManagement;
GO

CREATE TABLE ProductSuppliers
(
    ProductID INT NOT NULL,

    SupplierID INT NOT NULL,

    SupplierPrice DECIMAL(10,2) NOT NULL,

    IsPreferredSupplier BIT NOT NULL
        DEFAULT 0,

    CreatedDate DATETIME2 NOT NULL
        DEFAULT SYSDATETIME(),

    CONSTRAINT PK_ProductSuppliers
        PRIMARY KEY (ProductID, SupplierID),

    CONSTRAINT FK_ProductSuppliers_Products
        FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID),

    CONSTRAINT FK_ProductSuppliers_Suppliers
        FOREIGN KEY (SupplierID)
        REFERENCES Suppliers(SupplierID)
);
GO

SELECT *
FROM ProductSuppliers;