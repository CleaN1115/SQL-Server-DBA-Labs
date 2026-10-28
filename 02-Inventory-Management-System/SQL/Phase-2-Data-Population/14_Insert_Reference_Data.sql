USE InventoryManagement;
GO

/* =========================
   Categories
   ========================= */

INSERT INTO Categories
(
    CategoryName,
    Description,
    IsActive
)
VALUES
('Electronics', 'Laptops, monitors, keyboards, mice, and other electronic equipment.', 1),
('Office Supplies', 'Paper, pens, notebooks, folders, and general office supplies.', 1),
('Furniture', 'Desks, chairs, cabinets, and other workplace furniture.', 1),
('Food and Beverage', 'Snacks, bottled drinks, coffee, and break-room supplies.', 1),
('Cleaning Supplies', 'Cleaning chemicals, wipes, gloves, and maintenance products.', 1);
GO

/* =========================
   Suppliers
   ========================= */

INSERT INTO Suppliers
(
    SupplierName,
    ContactName,
    Email,
    Phone,
    Address,
    IsActive
)
VALUES
('Dell Technologies', 'Mark Evans', 'sales@dellnorthwind.com', '800-555-1001', 'One Dell Way, Round Rock, TX', 1),
('Office Depot Business', 'Lisa Green', 'business@officedepotnorthwind.com', '800-555-1002', '6600 North Military Trail, Boca Raton, FL', 1),
('Global Furniture Supply', 'Robert King', 'orders@globalfurniturenorthwind.com', '800-555-1003', '4200 Commerce Drive, Dallas, TX', 1),
('Fresh Break Distributors', 'Maria Lopez', 'sales@freshbreaknorthwind.com', '800-555-1004', '1750 Market Street, Phoenix, AZ', 1),
('CleanPro Wholesale', 'James Walker', 'orders@cleanpronorthwind.com', '800-555-1005', '300 Industrial Avenue, Tempe, AZ', 1);
GO

/* =========================
   Warehouses
   ========================= */

INSERT INTO Warehouses
(
    WarehouseName,
    City,
    State,
    IsActive
)
VALUES
('Phoenix Distribution Center', 'Phoenix', 'Arizona', 1),
('Tempe Operations Warehouse', 'Tempe', 'Arizona', 1),
('Dallas Regional Warehouse', 'Dallas', 'Texas', 1);
GO

/* =========================
   Verification
   ========================= */

SELECT * FROM Categories;
SELECT * FROM Suppliers;
SELECT * FROM Warehouses;
GO