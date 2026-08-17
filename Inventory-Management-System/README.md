Inventory Management System
Company: Northwind Retail Group — Fictional Company
Role: Junior SQL Server Database Administrator
Project Status: In Development

Project Overview
This project simulates a real-world inventory management solution for a retail company.

Warehouse employees will use Power Apps to enter inventory information. The data will be stored in Microsoft SQL Server and displayed to managers through a Power BI dashboard.

Planned Technologies
Microsoft SQL Server
SQL Server Management Studio
T-SQL
Microsoft Power Apps
Microsoft Power BI
GitHub
Planned DBA Responsibilities
Design and create the inventory database
Create tables, primary keys and foreign keys
Apply data validation and constraints
Manage database users and permissions
Create backups and test database restores
Monitor transaction log usage
Support Power Apps data entry
Prepare SQL views for Power BI reporting
Document scripts, testing and results
Current Phase
Ticket #002 — Create and verify the Inventory Management database.

# Inventory Management System

## Project Overview

This project is part of my SQL Server DBA portfolio and simulates a real-world inventory management database used by an organization to manage products, suppliers, warehouses, employees, and inventory.

The project is designed using SQL Server best practices, including relational database design, constraints, normalization, and data integrity.

---

## Company

Northwind Retail Group

---

## Project Goal

Design and build an enterprise-style SQL Server database from the ground up while documenting each step as if working in a production environment.

---

## Technologies Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- GitHub
- GitHub Desktop
- Visual Studio Code

---

## Skills Demonstrated

- Database Design
- Data Modeling
- Primary Keys
- Foreign Keys
- Identity Columns
- Composite Business Rules
- UNIQUE Constraints
- CHECK Constraints
- DEFAULT Constraints
- Data Integrity
- Relational Database Design

---

## Database Objects Completed

### Tables

- Employees
- Categories
- Suppliers
- Warehouses
- Products
- ProductSuppliers
- Inventory

---

## Business Rules Implemented

- Employee email addresses are unique.
- Supplier email addresses are unique.
- Warehouse names are unique.
- Categories cannot have duplicate names.
- A product can have multiple suppliers.
- A supplier can supply multiple products.
- Inventory quantities cannot be negative.
- A product can only have one inventory record per warehouse.

---

## Project Structure

```
Inventory-Management-System
│
├── SQL
├── Screenshots
├── README.md
└── Lab-Notes.md
```

---

## Current Progress

| Ticket | Status |
|---------|--------|
| #001 Database | ✅ Completed |
| #002 Employees | ✅ Completed |
| #003 Categories | ✅ Completed |
| #004 Suppliers | ✅ Completed |
| #005 Warehouses | ✅ Completed |
| #006 Products | ✅ Completed |
| #007 ProductSuppliers | ✅ Completed |
| #008 Inventory | ✅ Completed |

---

## Next Steps

- Price History
- Purchase Orders
- Purchase Order Details
- Inventory Transactions
- Stored Procedures
- Views
- Indexes
- Triggers
- Backup and Restore
- Security
- Performance Tuning

---

## About This Portfolio

This repository documents my hands-on SQL Server DBA learning journey. Rather than following isolated exercises, I am building a complete business database while applying database design principles, enforcing business rules, and documenting each task as though working on real production tickets.