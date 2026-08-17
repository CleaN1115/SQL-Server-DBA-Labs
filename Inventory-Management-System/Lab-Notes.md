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