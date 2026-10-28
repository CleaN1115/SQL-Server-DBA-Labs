USE InventoryManagement;
GO

INSERT INTO Products
(
    ProductName,
    CategoryID,
    CreateDate,
    IsActive
)
VALUES
('Dell Latitude 5550 Laptop', 1, GETDATE(), 1),
('HP EliteBook 840 G11', 1, GETDATE(), 1),
('Dell 24-inch Monitor', 1, GETDATE(), 1),
('Logitech Wireless Mouse', 1, GETDATE(), 1),
('Logitech Keyboard', 1, GETDATE(), 1),

('A4 Copy Paper', 2, GETDATE(), 1),
('Blue Ballpoint Pens', 2, GETDATE(), 1),
('Spiral Notebook', 2, GETDATE(), 1),
('Sticky Notes', 2, GETDATE(), 1),
('File Folder', 2, GETDATE(), 1),

('Office Desk', 3, GETDATE(), 1),
('Ergonomic Office Chair', 3, GETDATE(), 1),
('Metal Filing Cabinet', 3, GETDATE(), 1),

('Coffee Beans', 4, GETDATE(), 1),
('Bottled Water Pack', 4, GETDATE(), 1),

('Disinfectant Wipes', 5, GETDATE(), 1),
('Glass Cleaner', 5, GETDATE(), 1),
('Latex Gloves', 5, GETDATE(), 1),
('Hand Soap', 5, GETDATE(), 1),
('Trash Bags', 5, GETDATE(), 1);
GO

SELECT *
FROM Products;
GO