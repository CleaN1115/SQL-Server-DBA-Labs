/*
==========================================================
Company: Northwind Retail Group
Project: Inventory Management System
Ticket: #013
Description:
Creates the PurchaseOrders header table.
==========================================================
*/

USE InventoryManagement;
GO

CREATE TABLE PurchaseOrders
(
    PurchaseOrderID INT IDENTITY(1,1) PRIMARY KEY,

    SupplierID INT NOT NULL,

    OrderedByEmployeeID INT NOT NULL,

    OrderDate DATETIME2 NOT NULL
        CONSTRAINT DF_PurchaseOrders_OrderDate
        DEFAULT SYSDATETIME(),

    ExpectedDeliveryDate DATE NULL,

    OrderStatus NVARCHAR(30) NOT NULL
        CONSTRAINT DF_PurchaseOrders_OrderStatus
        DEFAULT 'PENDING',

    Notes NVARCHAR(255) NULL,

    CONSTRAINT CK_PurchaseOrders_OrderStatus
        CHECK
        (
            OrderStatus IN
            (
                'PENDING',
                'APPROVED',
                'ORDERED',
                'PARTIALLY RECEIVED',
                'RECEIVED',
                'CANCELLED'
            )
        ),

    CONSTRAINT CK_PurchaseOrders_DeliveryDate
        CHECK
        (
            ExpectedDeliveryDate IS NULL
            OR ExpectedDeliveryDate >= CAST(OrderDate AS DATE)
        ),

    CONSTRAINT FK_PurchaseOrders_Suppliers
        FOREIGN KEY (SupplierID)
        REFERENCES Suppliers(SupplierID),

    CONSTRAINT FK_PurchaseOrders_Employees
        FOREIGN KEY (OrderedByEmployeeID)
        REFERENCES Employees(EmployeeID)
);
GO

SELECT *
FROM PurchaseOrders;
GO