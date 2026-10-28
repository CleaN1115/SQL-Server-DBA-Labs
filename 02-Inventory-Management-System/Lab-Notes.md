**Phase 1 - Database Design**

Clea N <nirerec@gmail.com>

1:41 PM (0 minutes ago)

to Claire



\# Inventory Management System - Lab Notes



\---



\# Ticket #003 - Create InventoryManagement Database



\*\*Date:\*\* July 14, 2026



\## Objective



Create the InventoryManagement database that will support the Inventory Management System.



\## Activities Performed



1\. Created the SQL script.

2\. Executed the script in SQL Server Management Studio.

3\. Verified that the database was successfully created.

4\. Refreshed Object Explorer.

5\. Confirmed the database appears under Databases.



\## Result



The InventoryManagement database was successfully created and is ready for table creation.



\## Evidence



Screenshot:

01\_Database\_Created.png



SQL Script:

SQL/01\_Create\_Database.sql



\## Lessons Learned



\- How to create a SQL Server database.

\- How to make a script safe to run multiple times using `IF DB\_ID(...) IS NULL`.

\- How to organize SQL scripts in a GitHub repository.



# Ticket #004 - Create Employees Table

## Objective

Create the Employees table to store employees who perform inventory transactions.

## Activities Performed

1. Designed the Employees table and selected suitable data types.
2. Created an identity primary key for EmployeeID.
3. Required first name, last name, email, job title, and hire date.
4. Added a UNIQUE constraint to prevent duplicate employee email addresses.
5. Allowed phone numbers to remain optional.
6. Added a default active status of 1.
7. Executed the script successfully in SSMS.
8. Verified that dbo.Employees appeared under the Tables folder.

## Result

The Employees table was created successfully in the InventoryManagement database.

## Evidence

- SQL script: `SQL/02_Create_Employee_Table.sql`
- Screenshot: `Screenshots/02_Employees_Table_Created.png`


# Ticket #005 – Categories Table

## Objective

Create the Categories table for product classification.

## Activities Performed

- Created the Categories table.
- Added an IDENTITY primary key.
- Enforced unique category names.
- Added an optional description.
- Added an IsActive flag for logical deactivation.

## Skills Practiced

- CREATE TABLE
- PRIMARY KEY
- UNIQUE
- DEFAULT
- Business rule implementation

## Result

The Categories table was successfully created and verified.


# Ticket #006 – Suppliers Table

## Objective

Create the Suppliers table to store supplier information for inventory management.

## Activities Performed

- Created the Suppliers table.
- Added SupplierID as an IDENTITY primary key.
- Added SupplierName with a UNIQUE constraint.
- Added ContactName, Email, Phone, and Address columns.
- Applied a UNIQUE constraint to the Email column.
- Added an IsActive column with a default value of 1.

## Skills Practiced

- CREATE TABLE
- PRIMARY KEY
- IDENTITY
- UNIQUE Constraints
- DEFAULT Constraint
- Database normalization concepts

## Result

The Suppliers table was successfully created and verified using a SELECT statement.

## Evidence

- SQL script: `04_Create_Suppliers_Table.sql`
- Screenshot: `04_Suppliers_Table_Created.png`

## Reflection

This exercise reinforced the importance of avoiding duplicate supplier records. Using UNIQUE constraints on SupplierName and Email helps maintain data integrity and supports a normalized database design.


# Ticket #007 – Warehouses Table

## Objective

Create the Warehouses table to store warehouse locations where inventory is received and managed.

## Activities Performed

- Created the Warehouses table.
- Added WarehouseID as an IDENTITY primary key.
- Added WarehouseName with a UNIQUE constraint.
- Added City and State columns.
- Added an IsActive column with a default value of 1.

## Skills Practiced

- CREATE TABLE
- PRIMARY KEY
- IDENTITY
- UNIQUE Constraints
- DEFAULT Constraint
- Designing reference tables

## Result

The Warehouses table was successfully created and verified using a SELECT statement.

## Evidence

- SQL script: `05_Create_Warehouses_Table.sql`
- Screenshot: `05_Warehouses_Table_Created.png`

## Reflection

This exercise demonstrated how reference tables support business operations by organizing warehouse locations. The UNIQUE constraint on WarehouseName prevents duplicate warehouse records and helps maintain consistent inventory tracking across multiple locations.

## Ticket #008 – Inventory Table
Objective

Design and create the Inventory table to track product quantities across multiple warehouses while enforcing data integrity using SQL Server constraints.

Activities Performed
Created the Inventory table.
Added InventoryID as an IDENTITY primary key.
Created foreign key relationships to the Products and Warehouses tables.
Added a UNIQUE constraint on ProductID and WarehouseID to prevent duplicate inventory records for the same product in the same warehouse.
Added QuantityOnHand, ReorderLevel, and MinimumStockLevel columns to support inventory management.
Added CHECK constraints to prevent negative inventory and stock level values.
Configured LastUpdatedDate with a default value using SYSDATETIME() to automatically record when inventory records are created.
Verified the table was successfully created in SQL Server Management Studio.
Skills Practiced
Database table design
SQL Server data integrity
Primary keys
Identity columns
Foreign key relationships
Unique constraints
Check constraints
Default constraints
Inventory database modeling
Result

The Inventory table was successfully created and integrated with the existing database schema. The design prevents duplicate inventory records, enforces valid stock values, and maintains referential integrity between products and warehouses.

Evidence

SQL Script

08_Create_Inventory_Table.sql

Screenshot

08_Inventory_Table_Created.png
Reflection

This lab strengthened my understanding of how inventory is modeled in a relational database. During the design process, I evaluated different approaches for the primary key, including using a surrogate key (InventoryID) versus a composite key. I chose to use an identity primary key while enforcing the business rule with a UNIQUE constraint on ProductID and WarehouseID. This approach simplifies future relationships while ensuring that each product can only have one inventory record per warehouse. I also learned how SQL Server constraints help protect data quality by preventing duplicate records and invalid inventory quantities.


One of the biggest lessons from this lab was that good database design is driven by business rules, not just SQL syntax.

For example:

A product can exist in multiple warehouses.
A warehouse can store many products.
Inventory quantities should never be negative.
There should only be one inventory record for each product in a specific warehouse.

Designing the table around these rules results in a database that is easier to maintain, more reliable, and closer to what is used in real enterprise environments.

# Ticket #009 – Price History Table

## Objective

Create a PriceHistory table to preserve changes in supplier pricing instead of overwriting previous prices.

## Activities Performed

- Created PriceHistoryID as an identity primary key.
- Connected each price record to a ProductSuppliers relationship.
- Added UnitPrice with a CHECK constraint requiring a value greater than zero.
- Added EffectiveFrom and EffectiveTo dates.
- Added a date-range constraint to prevent invalid pricing periods.
- Added CreatedByEmployeeID for audit tracking.
- Verified the table using a SELECT statement.

## Result

The PriceHistory table was successfully created and can retain both current and historical supplier prices.

## Evidence

- SQL script: `09_Create_PriceHistory_Table.sql`
- Screenshot: `09_PriceHistory_Table_Created.png`

## Reflection

This design avoids overwriting historical prices. A NULL EffectiveTo value identifies the current price, while completed date ranges preserve previous supplier pricing for reporting and auditing.


# Ticket #010 – Inventory Transactions Table

## Objective

Create an audit table that records every inventory movement performed by employees.

## Activities Performed

- Created TransactionID as an identity primary key.
- Connected transactions to Products, Warehouses, and Employees.
- Added TransactionType to classify inventory movements.
- Added QuantityChange to record increases and decreases in stock.
- Added TransactionDate with a default timestamp.
- Added optional Notes for additional context.
- Added CHECK constraints for approved transaction types and non-zero quantities.
- Verified the table using a SELECT statement.

## Result

The InventoryTransactions table was created successfully and provides an audit trail for inventory activity.

## Evidence

- SQL script: `10_Create_InventoryTransactions_Table.sql`
- Screenshot: `10_InventoryTransactions_Table_Created.png`

## Reflection

This table preserves every inventory movement instead of only storing the current balance. It supports auditing, troubleshooting, historical reporting, and reconciliation between transaction history and current inventory quantities.


# Ticket #011 – Purchase Orders Table

## Objective

Create the PurchaseOrders header table to record supplier orders and track their overall status.

## Activities Performed

- Created PurchaseOrderID as an identity primary key.
- Connected purchase orders to Suppliers and Employees.
- Added OrderDate with an automatic timestamp.
- Added ExpectedDeliveryDate for delivery planning.
- Added OrderStatus with approved status values.
- Added a date constraint to prevent expected delivery dates before the order date.
- Added optional Notes for order-level information.

## Result

The PurchaseOrders table was created successfully and can track each supplier order from creation through receipt or cancellation.

## Evidence

- SQL script: `11_Create_PurchaseOrders_Table.sql`
- Screenshot: `11_PurchaseOrders_Table_Created.png`


# Phase 2 – Database Population

## Objective

Populate the Inventory Management database with realistic business data to simulate a production environment and support testing, reporting, and application development.

## Activities Performed

- Inserted employee records.
- Inserted product categories.
- Inserted suppliers.
- Inserted warehouse locations.
- Inserted products.
- Linked products with suppliers.
- Populated inventory quantities.
- Inserted historical pricing information.
- Created purchase orders.
- Added purchase order line items.
- Recorded inventory transactions.

## Skills Practiced

- INSERT statements
- Foreign key relationships
- Referential integrity
- Test data generation
- Business workflow simulation

## Result

The database was successfully populated with realistic sample data that supports reporting, stored procedures, Power BI dashboards, and application testing.

## Evidence

### SQL Scripts

- 13_Insert_Employees.sql
- 14_Insert_Reference_Data.sql
- 15_Insert_Products.sql
- 16_Insert_ProductSuppliers.sql
- 17_Insert_Inventory.sql
- 18_Insert_PriceHistory.sql
- 19_Insert_PurchaseOrders.sql
- 20_Insert_PurchaseOrderDetails.sql
- 21_Insert_InventoryTransactions.sql

### Screenshots

- Employees Data Inserted
- Categories Data Inserted
- Suppliers Data Inserted
- Warehouses Data Inserted
- Products Data Inserted
- Product Suppliers Data Inserted
- Inventory Data Inserted
- Price History Data Inserted
- Purchase Orders Data Inserted
- Purchase Order Details Data Inserted
- Inventory Transactions Data Inserted

## Reflection

Populating the database with realistic business data validated the database design and foreign key relationships. It also created a production-like environment for developing views, stored procedures, reporting queries, and performance tuning exercises. This phase reinforced the importance of inserting data in the correct dependency order to maintain referential integrity.

# Phase # - Reporting View

# Ticket #022 – Current Inventory View

## Objective

Create a reporting view that combines inventory, product, category, and warehouse information into one reusable dataset.

## Activities Performed

- Created `dbo.vw_CurrentInventory`.
- Joined the Inventory, Products, Categories, and Warehouses tables.
- Displayed current stock levels by warehouse.
- Used a CASE expression to classify inventory as IN STOCK, LOW STOCK, or CRITICAL.
- Verified the view using a SELECT statement.

## Skills Practiced

- CREATE VIEW
- INNER JOIN
- CASE expressions
- Reusable reporting objects
- Power BI-ready data preparation

## Result

The view was created successfully and provides a simplified inventory dataset for reporting and application use.

## Evidence

- SQL script: `22_Create_CurrentInventory_View.sql`
- Screenshot: `22_CurrentInventory_View.png`


# Ticket #023 – Low Stock Products View

## Objective

Create a reusable reporting view that identifies products requiring replenishment.

## Activities Performed

- Created `dbo.vw_LowStockProducts`.
- Reused the existing `dbo.vw_CurrentInventory` view.
- Filtered records where QuantityOnHand was at or below ReorderLevel.
- Included both LOW STOCK and CRITICAL inventory conditions.
- Tested the view using a temporary inventory quantity change.
- Restored the original inventory quantity after verification.

## Skills Practiced

- Creating dependent views
- Reusing existing database objects
- Filtering business data
- CASE-based result ordering
- Testing and restoring data changes

## Result

The view was created successfully and returns inventory records that require purchasing or management attention.

## Evidence

- SQL script: `23_Create_LowStockProducts_View.sql`
- Screenshot:  `23_LowStockProduct_View.png`
   
   
  # Ticket #024 – Purchase History View

## Objective

Create a reporting view showing purchase order history across suppliers, products, and employees.

## Activities Performed

- Created dbo.vw_PurchaseHistory.
- Joined PurchaseOrders, PurchaseOrderDetails, Suppliers, Employees, and Products.
- Calculated TotalCost using QuantityOrdered and UnitPrice.
- Displayed supplier, employee, product, and order information in one report.
- Verified the view using a SELECT statement.

## Skills Practiced

- CREATE VIEW
- INNER JOIN
- Calculated Columns
- Business Reporting
- Multi-table Queries

## Result

The view provides a reusable purchasing report suitable for Power BI dashboards and operational reporting.

## Evidence

- SQL script: 24_Create_PurchaseHistory_View.sql
- Screenshot: 24_PurchaseHistory_View.png


# Ticket #025 – Product Supplier Pricing View

## Objective

Create a reusable reporting view showing products, suppliers, supplier prices, and preferred supplier status.

## Activities Performed

- Created `dbo.vw_ProductSupplierPricing`.
- Joined ProductSuppliers, Products, Categories, and Suppliers.
- Displayed supplier-specific pricing for each product.
- Included preferred supplier status.
- Verified the view using a SELECT statement.

## Skills Practiced

- CREATE VIEW
- INNER JOIN
- Many-to-many relationship reporting
- Supplier price comparison
- Power BI-ready data preparation

## Result

The view was created successfully and provides a simplified dataset for supplier price comparison and purchasing decisions.

## Evidence

- SQL script: `25_Create_ProductSupplierPricing_View.sql`
- Screenshot: `25_ProductSupplierPricing_View.png`


# Phase 4 – Stored Procedures

## Ticket #026 – Search Products

### Objective

Create a reusable stored procedure that allows users to search for products by partial product name.

### Activities Performed

- Created `usp_SearchProducts`.
- Accepted a product name as an input parameter.
- Used the LIKE operator to perform partial searches.
- Joined Products and Categories.
- Tested the procedure with multiple search values.

### Skills Practiced

- CREATE PROCEDURE
- Parameters
- LIKE
- INNER JOIN
- Reusable database logic

### Result

The stored procedure successfully returns products matching the supplied search term.

### Evidence

- SQL Script: `26_usp_SearchProducts.sql`
- Screenshot: `26_SearchProducts_Procedure.png`

Phase 4 – Stored Procedures

## Ticket #030 – Get Inventory by Warehouse

created a parameterized stored procedure to return inventory by warehouse and practiced INNER JOIN, parameters, and reusable reporting logic.

- SQL Script: `30_usp_GetInventoryByWarehouse.sql`
- Screenshot: `30_GetInventoryByWarehouse_Procedure`


# Ticket #031 – Product Price History

## Objective

Create a reusable stored procedure that returns the historical and current pricing information for a product.

## Activities Performed

- Created `dbo.usp_ProductPriceHistory`.
- Added `@ProductID` as a required parameter.
- Added `@SupplierID` as an optional parameter for filtering.
- Joined PriceHistory, Products, Categories, Suppliers, and Employees.
- Used a CASE expression to identify CURRENT and HISTORICAL prices.
- Ordered results by the most recent effective date.
- Tested the procedure with and without the optional supplier parameter.

## Skills Practiced

- CREATE PROCEDURE
- Optional Parameters
- INNER JOIN
- LEFT JOIN
- CASE Expressions
- Business Reporting
- Reusable Database Logic

## Result

The stored procedure successfully returns a product's price history, including supplier information, effective dates, and the employee who created the record. The optional supplier parameter allows the same procedure to be reused for multiple reporting scenarios.

## Evidence

- SQL Script: `31_usp_ProductPriceHistory.sql`
- Screenshot: `31_ProductPriceHistory_Procedure.png`

# Phase 4 Summary – Stored Procedures

## What I Built

- usp_SearchProducts
- usp_GetLowStockProducts
- usp_ReceiveInventory
- usp_AdjustInventory
- usp_GetInventoryByWarehouse
- usp_ProductPriceHistory

## SQL Server Concepts Learned

- CREATE PROCEDURE
- Input Parameters
- Optional Parameters
- Variables
- Transactions
- TRY...CATCH
- THROW
- Error Handling
- Business Logic
- Data Validation
- Audit Trails

## Business Skills Demonstrated

- Inventory receiving
- Inventory adjustments
- Warehouse reporting
- Product search
- Price history reporting
- Low stock monitoring

## Lessons Learned

This phase reinforced the importance of centralizing business logic in SQL Server through stored procedures. I learned how to use transactions to maintain data consistency, validate input before processing, handle errors with TRY...CATCH and THROW, and create reusable procedures that support real-world inventory management workflows.


# Phase 5 – Performance and Optimization.


## Ticket #032 – Add Useful Indexes

Created nonclustered and covering indexes to support common search, inventory, transaction-history, and purchase-order queries.

- Product searches
- Inventory lookups by warehouse and product
- Inventory transaction history
- Purchase order lookups
- INCLUDE columns

The INCLUDE columns are there so SQL Server may be able to answer certain queries directly from the index without going back to the base table. That type of index is often called a covering index when it contains everything a query needs.

# Ticket #033 – Execution Plan and Index Testing

## Objective

Evaluate how SQL Server executes a product search query and determine whether the ProductName index is used.

## Activities Performed

- Enabled the Actual Execution Plan.
- Enabled STATISTICS IO and STATISTICS TIME.
- Executed a ProductName search query.
- Reviewed the execution plan generated by SQL Server.
- Reviewed logical reads, CPU time, and elapsed time.

## Skills Practiced

- Execution Plans
- Query Performance Analysis
- STATISTICS IO
- STATISTICS TIME
- Clustered Index Scan
- SQL Server Query Optimizer

## Result

SQL Server selected a **Clustered Index Scan** instead of the nonclustered ProductName index. Because the Products table currently contains a small number of rows, the Query Optimizer determined that scanning the clustered index had a lower estimated cost than performing an Index Seek. This demonstrates that SQL Server automatically chooses the execution plan with the lowest estimated cost based on the available data and table size.

## Lessons Learned

A nonclustered index does not guarantee that SQL Server will perform an Index Seek. The Query Optimizer evaluates table size, data distribution, and estimated query cost before selecting the most efficient execution plan.

## Result

Initially, SQL Server performed a Clustered Index Scan because the Products table contained only a small number of rows. After inserting over 50,000 products and updating statistics, SQL Server changed to a Nonclustered Index Seek on the ProductName index.

The execution plan also showed a Key Lookup because the nonclustered index did not contain all the columns required by the query. SQL Server used the clustered index to retrieve the remaining columns.

## Lessons Learned

- SQL Server chooses execution plans based on cost.
- As tables grow larger, indexes become more beneficial.
- A Nonclustered Index Seek is more efficient for selective lookups than a Clustered Index Scan.
- A Key Lookup occurs when the index does not contain all columns required by the query.
- A covering index can eliminate Key Lookups and improve query performance.

## Result

Initially, SQL Server performed a Clustered Index Scan because the Products table contained only a small number of rows. After inserting over 50,000 products and updating statistics, SQL Server changed to a Nonclustered Index Seek on the ProductName index.

The execution plan also showed a Key Lookup because the nonclustered index did not contain all the columns required by the query. SQL Server used the clustered index to retrieve the remaining columns.

## Lessons Learned

- SQL Server chooses execution plans based on cost.
- As tables grow larger, indexes become more beneficial.
- A Nonclustered Index Seek is more efficient for selective lookups than a Clustered Index Scan.
- A Key Lookup occurs when the index does not contain all columns required by the query.
- A covering index can eliminate Key Lookups and improve query performance.



# Ticket #034 – Query Performance Optimization with Covering Index

## Objective

Improve query performance by analyzing execution plans and optimizing a nonclustered index to eliminate a Key Lookup.

## Activities Performed

- Created a nonclustered index on `ProductName`.
- Executed a product search query using the Actual Execution Plan.
- Observed that SQL Server initially performed a Clustered Index Scan when the table contained a small number of rows.
- Inserted over 50,000 product records to simulate a production-sized workload.
- Updated SQL Server statistics.
- Re-executed the query and observed that SQL Server switched to a Nonclustered Index Seek.
- Identified a Key Lookup because the nonclustered index did not contain all columns required by the query.
- Recreated the index as a covering index using the `INCLUDE` clause.
- Verified that SQL Server no longer required a Key Lookup.

## Skills Practiced

- Query Performance Tuning
- Clustered Index Scan
- Nonclustered Index Seek
- Key Lookup Analysis
- Covering Indexes
- SQL Server Query Optimizer
- Execution Plans
- STATISTICS IO
- STATISTICS TIME
- Index Design

## Result

The execution plan evolved through three stages:

1. **Clustered Index Scan** – SQL Server scanned the clustered index because the Products table contained very few rows.
2. **Index Seek + Key Lookup** – After adding a large volume of data, SQL Server used the nonclustered index to locate the matching row but performed a Key Lookup to retrieve additional columns.
3. **Covering Index** – After recreating the index with included columns, SQL Server satisfied the query directly from the nonclustered index, eliminating the Key Lookup and improving query efficiency.

## Lessons Learned

- SQL Server chooses execution plans based on estimated cost.
- Indexes become more beneficial as table size increases.
- A Nonclustered Index Seek is generally more efficient than a Clustered Index Scan for selective searches.
- A Key Lookup occurs when the index does not contain all columns required by a query.
- A Covering Index can eliminate Key Lookups by including the additional columns needed by the query.
- Keeping statistics up to date helps the Query Optimizer choose the most efficient execution plan.

## Evidence

### SQL Scripts

- `32_Create_Performance_Indexes.sql`
- `33_ExecutionPlan_Index_Test.sql`
- `34_Insert_Large_Product_Dataset.sql`

### Screenshots

- Clustered Index Scan
- Index Seek with Key Lookup
- Covering Index (Key Lookup Eliminated)
- STATISTICS IO and TIME


## Result

The original query used `YEAR(OrderDate) = 2026`, which resulted in a Nonclustered Index Scan.

I rewrote the predicate using a SARGable date range:

`OrderDate >= '20260101' AND OrderDate < '20270101'`

The query initially continued to scan because the existing composite index had `SupplierID` as its leading column.

I created a new nonclustered covering index with `OrderDate` as the leading key. After rerunning the query, SQL Server changed the execution plan from an **Index Scan to an Index Seek**.

## Lessons Learned

- Functions applied to indexed columns can make predicates Non-SARGable.
- Rewriting a query does not automatically guarantee an Index Seek.
- The leading column of a composite index matters.
- Index design should reflect actual query patterns.
- Execution plans should be used to verify whether an optimization actually worked.


# Phase 6 – DBA Administration

## Tickets #036–#039 – Database Backup, Integrity Check, and Recovery Testing

### Objective

Protect the `InventoryManagement` database from data loss and validate that the database can be successfully recovered from a backup.

The goal was not only to create a backup, but also to verify the backup, check database integrity, and perform an actual test restore.

---

## Ticket #036 – Full Database Backup

### Activities Performed

- Identified the SQL Server default backup directory using `SERVERPROPERTY`.
- Created a full backup of the `InventoryManagement` database.
- Used `CHECKSUM` to add additional backup validation.
- Used `STATS = 10` to monitor backup progress.
- Confirmed that the backup completed successfully.

### SQL Server Concepts Practiced

- `BACKUP DATABASE`
- Full Database Backups
- `CHECKSUM`
- `STATS`
- Backup File Management

### Result

A successful full database backup was created:

`InventoryManagement_Full.bak`

---

## Ticket #037 – Backup Verification

### Objective

Verify that SQL Server can read and validate the backup before relying on it for recovery.

### Activities Performed

- Used `RESTORE VERIFYONLY` against the full backup.
- Used `WITH CHECKSUM` during verification.
- Confirmed that SQL Server reported the backup set as valid.

### Result

SQL Server returned:

`The backup set on file 1 is valid.`

### Lesson Learned

A successful backup command alone is not enough. Backups should be verified and periodically test-restored to confirm that the recovery process works.

---

## Ticket #038 – Database Integrity Check

### Objective

Check the logical and physical integrity of the `InventoryManagement` database.

### Activities Performed

- Executed `DBCC CHECKDB`.
- Used `WITH NO_INFOMSGS` to suppress unnecessary informational messages.
- Confirmed that the integrity check completed successfully without reported corruption.

### SQL Server Concepts Practiced

- `DBCC CHECKDB`
- Database Integrity
- Corruption Detection
- Database Health Checks

### Result

`DBCC CHECKDB` completed successfully with no reported integrity errors.

---

## Ticket #039 – Test Database Restore

### Objective

Perform an actual restore test to confirm that the full backup can be used to recover the database successfully.

### Activities Performed

- Used `RESTORE FILELISTONLY` to identify the logical data and log file names contained in the backup.
- Created a separate recovery database named `InventoryManagement_RestoreTest`.
- Used `WITH MOVE` to restore the database using new physical MDF and LDF files.
- Used `WITH RECOVERY` to bring the restored database online.
- Verified the restored database status.
- Queried tables in the restored database to validate that the data was successfully recovered.

### SQL Server Concepts Practiced

- `RESTORE FILELISTONLY`
- `RESTORE DATABASE`
- `WITH MOVE`
- `WITH RECOVERY`
- MDF and LDF Files
- Backup Validation
- Disaster Recovery Testing

### Result

The `InventoryManagement` database was successfully restored as:

`InventoryManagement_RestoreTest`

The restored database was brought online and its data was validated successfully.

---

## Key Lessons Learned

- A backup strategy is incomplete if backups are never tested.
- `RESTORE VERIFYONLY` provides useful backup validation, but an actual test restore provides stronger recovery assurance.
- `DBCC CHECKDB` helps identify logical and physical database corruption.
- `RESTORE FILELISTONLY` identifies the logical files contained inside a SQL Server backup.
- `WITH MOVE` allows a backup to be restored using different physical file locations.
- Recovery procedures should be tested before an actual production emergency occurs.

## Evidence

- `36_Full_Database_Backup.sql`
- `37_Verify_Database_Backup.sql`
- `38_DBCC_CHECKDB.sql`
- `39_Test_Database_Restore.sql`
- `36_Full_Database_Backup.png`
- `37_Backup_Verification.png`
- `38_DBCC_CHECKDB_Success.png`
- `39_Test_Restore_Success.png`


# Ticket #040 – Database Health Monitoring

## Objective
Create monitoring queries to quickly review SQL Server database health, configuration, file usage, and backup status.

## Activities Performed
- Checked database status using `sys.databases`.
- Reviewed database recovery models and compatibility levels.
- Reviewed database data and log file locations and sizes.
- Queried `msdb` backup history.
- Reviewed the most recent Full, Differential, and Transaction Log backups.

## Skills Practiced
- SQL Server Health Monitoring
- `sys.databases`
- `sys.master_files`
- `msdb.dbo.backupset`
- Recovery Models
- Backup Monitoring
- Database File Monitoring

## Result
Successfully created a reusable monitoring script for reviewing database availability, configuration, file information, and backup history.

## Key Lesson
Database administration includes proactively monitoring database health and backup status rather than waiting for failures to occur.


# Ticket #041 – Index Fragmentation Monitoring

## Objective

Evaluate index fragmentation and determine whether index maintenance was necessary.

## Activities Performed

- Used `sys.dm_db_index_physical_stats` to analyze index fragmentation.
- Reviewed fragmentation percentage and page count.
- Compared clustered and nonclustered indexes.
- Evaluated whether indexes required REORGANIZE or REBUILD operations.

## Findings

The largest indexes were located on the Products table.

- `IX_Products_ProductName` contained approximately 346 pages with about 2% fragmentation.
- The Products clustered index contained approximately 413 pages with less than 1% fragmentation.
- Most other indexes showed 0% fragmentation and were very small.

## DBA Decision

No index maintenance was performed.

The fragmentation levels were low and did not justify a REORGANIZE or REBUILD operation. Performing unnecessary index maintenance would consume system resources without providing a meaningful performance benefit.

## Skills Practiced

- Index Fragmentation Analysis
- `sys.dm_db_index_physical_stats`
- Page Count Analysis
- REORGANIZE vs REBUILD
- Evidence-Based Maintenance Decisions
- SQL Server Performance Monitoring

## Key Lesson

Index maintenance should not be performed automatically based only on fragmentation percentage. A DBA should consider index size, workload, fragmentation level, and actual performance impact before deciding whether maintenance is necessary.