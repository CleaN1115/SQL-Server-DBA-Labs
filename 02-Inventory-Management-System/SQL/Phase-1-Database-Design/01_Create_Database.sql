-- ===========================================================
-- Company: Northwind Retail Group
-- Project: Inventory Management System
-- Ticket: #003
-- Author: Claire N
-- Description:
-- Creates the InventoryManagement database.
-- ===========================================================

IF DB_ID('InventoryManagement') IS NULL
BEGIN
CREATE DATABASE InventoryManagement;
PRINT 'InventoryManagement database created successfully.';
END
ELSE
BEGIN
PRINT 'InventoryManagement database already exists.';
END
GO

USE InventoryManagement;
GO
