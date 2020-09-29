--1. Select all the records from the "Customers" table.
SELECT * FROM Northwind.dbo.Customers;

--2. Get distinct countries from the Customers table.
SELECT DISTINCT Country from Northwind.dbo.Customers;

--3. Get all the records from the table Customers where the Customer’s ID starts with “Bl”.
SELECT * from Northwind.dbo.Customers WHERE CustomerID  LIKE '%BI'