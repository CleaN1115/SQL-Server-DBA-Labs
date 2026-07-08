SELECT @@VERSION

SELECT 
     SERVERPROPERTY('Edition') AS Editon,
     SERVERPROPERTY('ProductVersion') AS ProductVersion,
     SERVERPROPERTY('MachineName') AS MachineName,
     SERVERPROPERTY('InstanceName') AS InstanceName;


SELECT 
    name,
    database_id,
    create_date,
    compatibility_level
FROM sys.databases;
   
SELECT
    name,
    physical_name,
    type_desc
FROM sys.master_files;


SELECT 
    name,
    database_id,
    recovery_model_desc,
    compatibility_level
FROM sys.databases
ORDER BY database_id;


SELECT
    DB_NAME(database_id) AS DatabaseName,
    name AS LogicalFileName,
    Physical_name,
    type_desc,
    size * 8 / 1024 AS SizeMB
FROM sys.master_files
ORDER BY DatabaseName;

SELECT
    DB_NAME(database_id),
    name,
    physical_name,
    type_desc
FROM sys.master_files;


Use DBA_Lab;

CREATE TABLE Employees
(
    EmployeesID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastNames VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2)
);

SELECT name
FROM sys.tables;

INSERT INTO Employees
(EmployeesID, FirstName, LastNames, Department, HireDate, Salary)
VALUES
(1,'Claire','Nirere','Database Administration','2026-06-30',85000),
(2,'John','Smith','IT Support','2025-01-15',6500),
(3,'Sarah','Johnson','Infrastructure','2024-08-10',78000),
(4,'David','Brown','Cybersecurity','2023-11-20',90000),
(5,'Emily','Wilson','Cloud Engineering','2025-03-05',88000);

SELECT *
FROM Employees;

SElECT *
FROM Employees
WHERE Salary > 80000;

SELECT *
FROM Employees
ORDER BY Salary Desc;

SELECT COUNT(*) AS TotalEmployees
FROM Employees

RESTORE HEADERONLY
FROM DISK = 'D:\TEST\MSSQL\BACKUP\DBA_Lab.bak';

RESTORE VERIFYONLY
FROM DISK = 'D:\TEST\MSSQL\BACKUP\DBA_Lab.bak';

RESTORE FILELISTONLY
FROM DISK = 'D:\TEST\MSSQL\BACKUP\DBA_Lab.bak';

RESTORE DATABASE DBA_Lab_Restore
FROM DISK = 'D:\TEST\MSSQL\BACKUP\DBA_Lab.bak'
WITH
MOVE 'DBA_lab' TO 'D:\TEST\MSSQL\TEST DATA\DBA_Lab_Restore.mdf',
MOVE 'DBA_Lab_log' TO 'D:\TEST\MSSQL\TEST LOG\DBA_Lab_Restore_Log.ldf';

SELECT 
    name,
    recovery_model_desc
FROM sys.databases;

ALTER DATABASE Adventureworks2019
SET RECOVERY FULL;

SELECT
    name,
    recovery_model_desc
FROM sys.databases
WHERE name = 'Adventureworks2019';

USE DBA_Lab

DBCC SQLPERF(LOGSPACE);

DBCC CHECKDB 

SELECT name
FROM sys.databases
ORDER BY name;
