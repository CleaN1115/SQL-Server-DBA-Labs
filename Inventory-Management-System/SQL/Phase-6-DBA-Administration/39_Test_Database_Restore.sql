RESTORE FILELISTONLY
FROM DISK = 'D:\TEST\MSSQL\BACKUP\InventoryManagement_Full.bak';
GO

--Perform the Test Restore

USE master;
GO

RESTORE DATABASE InventoryManagement_RestoreTest
FROM DISK = 'D:\TEST\MSSQL\BACKUP\InventoryManagement_Full.bak'
WITH
    MOVE 'InventoryManagement'
        TO 'D:\TEST\MSSQL\TEST DATA\InventoryManagement_RestoreTest.mdf',

    MOVE 'InventoryManagement_log'
        TO 'D:\TEST\MSSQL\TEST LOG\InventoryManagement_RestoreTest_log.ldf',

    RECOVERY,
    STATS = 10;
GO


---InventoryManagement_RestoreTest | ONLINE | ...

USE InventoryManagement_RestoreTest;
GO

SELECT COUNT(*) AS ProductCount
FROM dbo.Products;

SELECT TOP 10 *
FROM dbo.Inventory;
GO