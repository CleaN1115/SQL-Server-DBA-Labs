/*
==========================================================
Company: Northwind Retail Group
Project: Inventory Management System
Ticket: #007
Description:
Creates the Warehouses table.
==========================================================
*/

USE InventoryManagement;
GO

CREATE TABLE Warehouses
(
    WarehouseID INT IDENTITY(1,1) PRIMARY KEY,

    WarehouseName NVARCHAR(100) NOT NULL UNIQUE,

    City NVARCHAR(100) NOT NULL,

    State NVARCHAR(100) NOT NULL,

    IsActive BIT NOT NULL DEFAULT 1
);
GO

SELECT *
FROM Warehouses;