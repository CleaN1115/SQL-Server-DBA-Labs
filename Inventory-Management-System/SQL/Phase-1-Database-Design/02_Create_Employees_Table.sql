/*
==========================================================
Company: Northwind Retail Group
Project: Inventory Management System
Ticket: #004
Author: Claire N
Description:
Creates the Employees table.
==========================================================
*/

USE InventoryManagement;
GO

CREATE TABLE Employees
(
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,

    FirstName NVARCHAR(50) NOT NULL,

    LastName NVARCHAR(50) NOT NULL,

    Email NVARCHAR(100) NOT NULL UNIQUE,

    Phone NVARCHAR(20) NULL,

    JobTitle NVARCHAR(50) NOT NULL,

    HireDate DATE NOT NULL,

    IsActive BIT NOT NULL DEFAULT 1
);
GO