USE InventoryManagement;
GO

CREATE VIEW dbo.vw_PurchaseHistory
AS
SELECT
    po.PurchaseOrderID,

    s.SupplierName,

    p.ProductName,

    CONCAT(e.FirstName,' ',e.LastName)
        AS OrderedBy,

    pod.QuantityOrdered,

    pod.ActualQuantityDelivered,

    pod.UnitPrice,

    (pod.QuantityOrdered * pod.UnitPrice)
        AS TotalCost,

    po.OrderDate,

    po.OrderStatus
FROM PurchaseOrders po

INNER JOIN Suppliers s
ON po.SupplierID = s.SupplierID

INNER JOIN Employees e
ON po.OrderedByEmployeeID = e.EmployeeID

INNER JOIN PurchaseOrderDetails pod
ON po.PurchaseOrderID = pod.PurchaseOrderID

INNER JOIN Products p
ON pod.ProductID = p.ProductID;
GO

SELECT *
FROM dbo.vw_PurchaseHistory;
GO