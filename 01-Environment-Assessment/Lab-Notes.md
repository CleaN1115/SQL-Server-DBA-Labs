Scenario:

My manager has assigned me to assess an existing SQL Server 2019 instance named TEST. 
My task is to document the environment, verify connectivity, inspect the database, and
prepare the server for ongoing administration.


Task 1:

Verified SQL Server Version and Properties

SELECT @@VERSION

SELECT 
     SERVERPROPERTY('Edition') AS Editon,
     SERVERPROPERTY('ProductVersion') AS ProductVersion,
     SERVERPROPERTY('MachineName') AS MachineName,
     SERVERPROPERTY('InstanceName') AS InstanceName;

RESULTS:

Verified that the server is running Microsoft SQL Server  2019 Enterprise Edition.
Version 15.0.2000.5
Machine Name: CLEA
Instance Name : TEST

Task 2: - Database Inventory
Identify all databases hosted on SQL Server instance.

SELECT 
    name,
    database_id,
    create_date,
    compatibility_level
FROM sys.databases;

RESULTS:
	- Verified the SQL Server contains the required system databases.
	- Confirmed all databases are in the ONLINE state
	- Reviewed the recovery model and compatibility levels for each database.

The SQL Server instance contains the required system databases (master, model, msdb, tempd) along 
With user databases (BLESSINGS and DBA_Lab). The environment is ready for administrative tasks and future 
Lab exercises.

Task 3: - Database File Location and Assessment
Identified the physical storage location of SQL Server database files.

Query Executed and results
SELECT
    name,
    physical_name,
    type_desc
FROM sys.master_files;

Activities performed:-
	- Verified the location of all data files (.mdf/.ndf).
	- Verified the location of all transaction logs (.ldf).
	- Reviewed the file layout for each database.
	- Distinguished between data files (ROWS) and transactional log files (LOG).

SELECT
    DB_NAME(database_id) AS DatabaseName,
    name AS LogicalFileName,
    Physical_name,
    type_desc,
    size * 8 / 1024 AS SizeMB
FROM sys.master_files
ORDER BY DatabaseName;

Results:-
	- Confirmed that each database has the expected data and files. Observed that tempdb is configured with multiple data files, which a common configuration for improving performance under concurrent workload.

Real-World DBA Knowledge
In production, DBA often place:
	- Data files (.mdf, .ndf) on one storage volume.
	- Log files (.ldf) on a storage, high-performance storage volume.

Task 4:- Create a User Table

Objective: Create a table to store employee information in the DBA_Lab database. 

Activity Performed:
	- Created the Employees table with appropriate data types.
	- Defined EmployeeID as primary key.

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

Results: Successfully created the table.


Task 5:- Insert Sample Data

Objective: Inserted sample data into the Employees table.

Activities Performed:
	- Inserted five employee records.
	- Verified that the data was stored correctly using SELECT.

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

Task 6:- Querying and Verifying Data

1st Query:- Find all employees
2nd Query:- Find employees earning more than $80000
3rd Query:- Sort by salary (highest first) and Count Employees

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

Results:
	- Successfully Retrieved all employee records.
	- Filtered employee records by salary in descending order.
	- Counted the total number of employees records in the table.

Skills Demonstrated:
	- Data retrieval using SELECT
	- Filtering data with WHERE
	- Sorting data using ORDER BY
	- Aggregating data with COUNT()
	- Verifying data integrity after insertion

This exercise reinforced the use of common T-SQL queries to retrieve, filter, sort, 
and summarize data. These commands are frequently used by SQL Server DBAs to 
validate application data, troubleshoot issues, and confirm that database changes have been applied correctly.


Task 7: Full Database Backup

Objective: I Performed a full backup of the DBA_Lab database to protect against data loss.

Activities performed:
	- I performed a full backup using SQL Server Management Studio.
	- Saved the backup as .bak file.
	- Verified that the backup using RESTORE HEADERONLY

  BACKUP DATABASE [DBA_Lab] TO  DISK = N'D:\TEST\MSSQL\BACKUP\DBA_Lab.bak' 
WITH NOFORMAT, NOINIT,  NAME = N'DBA_Lab-Full Database Backup', 
SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO


RESTORE HEADERONLY
FROM DISK = 'D:\TEST\MSSQL\BACKUP\DBA_Lab.bak';

RESTORE VERIFYONLY
FROM DISK = 'D:\TEST\MSSQL\BACKUP\DBA_Lab.bak';

RESTORE FILELISTONLY
FROM DISK = 'D:\TEST\MSSQL\BACKUP\DBA_Lab.bak';

Skills demonstrated:
	- Full database backup
	- Backup verification
	- Disaster recovery fundamentals

Lesson Learned:
	- A full backup captures the entire database at a specific point in time. 
  It is foundation of a disaster recovery strategy and is required before restoring a database.
	
Task 8: Restore Database

Objective:

Restore a full database backup to a new database to validate the backup and practice disaster recovery 
Procedures.

Activities performed
	- Verified The recovery model of all the databases.
	- Changed the recovery model for AdventuresWorks2019 from SIMPLE to FULL Recovery Model.
	- Restored the DBA_Lab backup as a new database named DBA_Lab_Restore.
	- Used the MOVE option to specify new locations for the data and log files.
	- Verified that the restored database was accessible.

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

Result:
	- Successfully restored the backup to new database without affecting the original database.

Skills Demonstrated:
	- ALTER Database from SIMPLE to FULL Recovery Model.
	- Database restore
	- Disaster recovery
	- File relocation during restore
	- Backup validation

Lessons Learned:

A successful backup is only useful if it can be restored. This exercise 
demonstrates the complete backup and recovery process using SQL Server.

Task 9: 
Objective: Monitoring Transaction log size wit DMVs for all databases.

Command Used:
	- DBCC SQLPERF(LOGSPACE);

Findings:
	- DBA_Lab log size:7.99 MB
	- Log space used: 20.19%
	- Status: 0 (Healthy)

What I Learned:
	- DBCC SQLPERF(LOGSPACE) displays the transaction log size and the percentage currently in use.
	- Monitoring log usage helps me identify when transaction logs are filling up.
	- If transaction log continue to grow without shrinking or being truncated  (depending on the recovery model),
  the database can eventually run out of disk space.


NOTES:
During this lab, I monitored Transaction log utilization using DBCC SQLPERF(LOGSPACE) and 
learned that SQL Server provides several methods for tracking log health, including
Dynamic Management Views (DMV), catalog views, and SSMS report. Understanding these tools 
enables me to proactively identify excessive log growth, verify backup effectiness,
and maintain database availability.

