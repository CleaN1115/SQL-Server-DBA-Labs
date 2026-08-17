/*
==========================================================
Company: Northwind Retail Group
Project: Inventory Management System
Ticket: #006
Description:
Creates the Suppliers table.
==========================================================
*/

USE InventoryManagement;
GO

CREATE TABLE Suppliers
(
    SupplierID INT IDENTITY(1,1) PRIMARY KEY,

    SupplierName NVARCHAR(150) NOT NULL UNIQUE,

    ContactName NVARCHAR(100) NULL,

    Email NVARCHAR(150) NULL UNIQUE,

    Phone NVARCHAR(25) NULL,

    Address NVARCHAR(255) NULL,

    IsActive BIT NOT NULL DEFAULT 1
);
GO

SELECT *
FROM Suppliers;