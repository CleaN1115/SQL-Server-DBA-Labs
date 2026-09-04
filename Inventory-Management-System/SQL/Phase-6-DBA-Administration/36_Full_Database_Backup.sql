USE master;
GO

BACKUP DATABASE InventoryManagement
TO DISK = 'D:\TEST\MSSQL\BACKUP\InventoryManagement_Full.bak'
WITH
    INIT,
    CHECKSUM,
    STATS = 10;
GO