/*
==========================================================
Company: Northwind Retail Group
Project: Inventory Management System
Ticket: #005
Description:
Creates the Categories table.
==========================================================
*/

USE InventoryManagement;
GO

CREATE TABLE Categories
(
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,

    CategoryName NVARCHAR(100) NOT NULL UNIQUE,

    Description NVARCHAR(255) NULL,

    IsActive BIT NOT NULL DEFAULT 1
);
GO