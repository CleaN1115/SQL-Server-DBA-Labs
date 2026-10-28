/*
==========================================================
Company: Northwind Retail Group
Project: Inventory Management System
Ticket: #008
Description:
Creates the Products table.
==========================================================
*/

USE InventoryManagement;
GO

CREATE TABLE Products
(
    ProductID INT IDENTITY(1,1) PRIMARY KEY,

    ProductName NVARCHAR(150) NOT NULL,

    CategoryID INT NOT NULL,

    CreatedDate DATETIME2 NOT NULL
        DEFAULT SYSDATETIME(),

    IsActive BIT NOT NULL
        DEFAULT 1,

    CONSTRAINT FK_Products_Categories
        FOREIGN KEY(CategoryID)
        REFERENCES Categories(CategoryID)
);
GO

SELECT *
FROM Products;