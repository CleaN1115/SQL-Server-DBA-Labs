USE InventoryManagement;
GO

INSERT INTO Employees
(
    FirstName,
    LastName,
    Email,
    Phone,
    JobTitle,
    HireDate,
    IsActive
)
VALUES
('John','Smith','john.smith@northwindretail.com','602-555-0101','Inventory Manager',GETDATE(),1),
('Sarah','Johnson','sarah.johnson@northwindretail.com','602-555-0102','Purchasing Specialist',GETDATE(),1),
('Michael','Brown','michael.brown@northwindretail.com','602-555-0103','Warehouse Supervisor',GETDATE(),1),
('Emily','Davis','emily.davis@northwindretail.com','602-555-0104','Warehouse Associate',GETDATE(),1),
('David','Wilson','david.wilson@northwindretail.com','602-555-0105','Inventory Analyst',GETDATE(),1),
('Jessica','Martinez','jessica.martinez@northwindretail.com','602-555-0106','Procurement Manager',GETDATE(),1),
('Daniel','Anderson','daniel.anderson@northwindretail.com','602-555-0107','Operations Manager',GETDATE(),1),
('Ashley','Thomas','ashley.thomas@northwindretail.com','602-555-0108','Receiving Clerk',GETDATE(),1),
('Matthew','Taylor','matthew.taylor@northwindretail.com','602-555-0109','Warehouse Associate',GETDATE(),1),
('Amanda','Moore','amanda.moore@northwindretail.com','602-555-0110','Supply Chain Coordinator',GETDATE(),1);

SELECT * FROM Employees;