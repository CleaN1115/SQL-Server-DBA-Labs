/*
==========================================================
Company: Northwind Retail Group
Project: Inventory Management System
Ticket: #014
Description:
Creates the PurchaseOrderDetails line-item table.
==========================================================
*/

USE InventoryManagement;
GO

CREATE TABLE PurchaseOrderDetails
(
    PurchaseOrderDetailID INT IDENTITY(1,1) PRIMARY KEY,

    PurchaseOrderID INT NOT NULL,

    ProductID INT NOT NULL,

    QuantityOrdered INT NOT NULL,

    ActualQuantityDelivered INT NOT NULL
        CONSTRAINT DF_PurchaseOrderDetails_ActualDelivered
        DEFAULT 0,

    UnitPrice DECIMAL(10,2) NOT NULL,

    LineStatus NVARCHAR(30) NOT NULL
        CONSTRAINT DF_PurchaseOrderDetails_LineStatus
        DEFAULT 'PENDING',

    CONSTRAINT UQ_PurchaseOrderDetails_Order_Product
        UNIQUE (PurchaseOrderID, ProductID),

    CONSTRAINT CK_PurchaseOrderDetails_QuantityOrdered
        CHECK (QuantityOrdered > 0),

    CONSTRAINT CK_PurchaseOrderDetails_ActualDelivered
        CHECK
        (
            ActualQuantityDelivered >= 0
            AND ActualQuantityDelivered <= QuantityOrdered
        ),

    CONSTRAINT CK_PurchaseOrderDetails_UnitPrice
        CHECK (UnitPrice > 0),

    CONSTRAINT CK_PurchaseOrderDetails_LineStatus
        CHECK
        (
            LineStatus IN
            (
                'PENDING',
                'PARTIALLY RECEIVED',
                'RECEIVED',
                'CANCELLED'
            )
        ),

    CONSTRAINT FK_PurchaseOrderDetails_PurchaseOrders
        FOREIGN KEY (PurchaseOrderID)
        REFERENCES PurchaseOrders(PurchaseOrderID),

    CONSTRAINT FK_PurchaseOrderDetails_Products
        FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID)
);
GO

SELECT *
FROM PurchaseOrderDetails;
GO