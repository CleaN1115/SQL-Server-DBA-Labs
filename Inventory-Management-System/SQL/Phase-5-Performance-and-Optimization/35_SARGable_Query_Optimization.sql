---the Non-SARGable query


USE InventoryManagement;
GO

SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO

SELECT
    PurchaseOrderID,
    SupplierID,
    OrderedByEmployeeID,
    OrderDate,
    OrderStatus
FROM dbo.PurchaseOrders
WHERE YEAR(OrderDate) = 2026;
GO

---the SARGable version

SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO

SELECT
    PurchaseOrderID,
    SupplierID,
    OrderedByEmployeeID,
    OrderDate,
    OrderStatus
FROM dbo.PurchaseOrders
WHERE OrderDate >= '20260101'
  AND OrderDate < '20270101';
GO

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO

---Let's create an index where OrderDate is the leading key.

USE InventoryManagement;
GO

CREATE NONCLUSTERED INDEX IX_PurchaseOrders_OrderDate
ON dbo.PurchaseOrders(OrderDate)
INCLUDE
(
    SupplierID,
    OrderedByEmployeeID,
    OrderStatus
);
GO


---the SARGable query with Actual Execution Plan enabled

SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO

SELECT
    PurchaseOrderID,
    SupplierID,
    OrderedByEmployeeID,
    OrderDate,
    OrderStatus
FROM dbo.PurchaseOrders
WHERE OrderDate >= '20260101'
  AND OrderDate < '20270101';
GO

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO
