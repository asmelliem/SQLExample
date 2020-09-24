--Using the NorthWind Database SELECT from the Employee table in the schema dbo WHERE Country is USA
SELECT *
  FROM [Northwind].[dbo].[Employees]
  WHERE [Country] = 'USA';

--Using the NorthWind Database SELECT from the Employee table in the schema dbo WHERE hired date is May 1st 1992
SELECT *
  FROM [Northwind].[dbo].[Employees]
  WHERE [HireDate] = '05/01/1992';

--Using the NorthWind Database SELECT from the Employee table in the schema dbo WHERE hired date is greater than or equal to 1993
SELECT *
  FROM [Northwind].[dbo].[Employees]
  WHERE [HireDate] >= '1993';

--Using the NorthWind Database SELECT from the Employee table in the schema dbo WHERE Country is USA and Hire Date is greater than 1992
SELECT *
  FROM [Northwind].[dbo].[Employees]
  WHERE [HireDate] >= '1993' AND [Country] = 'USA';

--Using the NorthWind Database SELECT from the Employee table in the schema dbo WHERE an Employee reports to Andrew Fuller
SELECT *
  FROM [Northwind].[dbo].[Employees]
  WHERE [ReportsTo] = 2;

--Using the NorthWind Database SELECT from the Employee table in the schema dbo WHERE an Employee has a BA
SELECT *
  FROM [Northwind].[dbo].[Employees]
  WHERE [Notes] LIKE '% BA%';


--Add a new record to the employee table where the employee reports to Nancy Davolio and the employee is a 'Vice President, Sales' and the employee was hired yesterday. 
SELECT *
  FROM [Northwind].[dbo].[Employees]

INSERT INTO [Northwind].[dbo].[Employees] (LastName,FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, Address, City, Region, PostalCode, Country, HomePhone, Extension, Photo, Notes, ReportsTo, PhotoPath)
  VALUES ('Doe', 'John', 'Vice President, Sales', 'Mr.', '02/05/1980', '09/22/2020', '1050 Woodward Ave.', 'Detroit', 'MI', '48226', 'USA', '(123) 456-7890', '1234', '0x1235353531534', 'Test Person', 1, 'https://accweb/employees/blah'); 

--Add a new record to the Product Table - this can be whatever you like! Make it something fun and ensure it is not discontinued!
SELECT *
FROM [Northwind].[dbo].[Products]
WHERE [ProductID] = 79;

 INSERT INTO [Northwind].[dbo].[Products] (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
  VALUES ('Dumpling', 1, 1, '1 boxes x 2 bags', 4.0000, 20, 0, 10, 0); 

--Add a new record to the Order Details Table that references a new record in the Orders table 
--(I.E add a new record in the Order table as well!!!) that references your favorite Product from the previous example
--Need to create the order first by updating the order table, which references the customer and employee table. 
--Then update the order details table, which references the order and product table. 
SELECT * 
FROM [Northwind].[dbo].[Orders]
WHERE [CustomerID] = 'ALFKI'

SELECT * 
FROM [Northwind].[dbo].[Order Details]
WHERE [OrderID] = 11078 OR [OrderID] = 10248;

INSERT INTO [Northwind].[dbo].[Orders] (CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry)
  VALUES ('ALFKI', 11, '9/20/2020', '9/30/2020', '9/23/2020', 3, 5.2900, 'Test Ship Name', 'Example Address', 'Pretend City', 'NULL', '12345', 'USA'); 

INSERT INTO [Northwind].[dbo].[Order Details] (OrderID, ProductID, UnitPrice, Quantity, Discount)
  VALUES (11078, 79, 4.0000, 5, 0);

INSERT INTO [Northwind].[dbo].[Order Details] (OrderID, ProductID, UnitPrice, Quantity, Discount)
  VALUES (10248, 79, 4.0000, 5, 0);

--Update the Employee Record for Nancy Davolio, set her title to President, Sales
select * FROM [Northwind].[dbo].[Employees]

UPDATE [Northwind].[dbo].[Employees]
SET [Title] = 'President, Sales'
WHERE [EmployeeID] = 1;

--Update the employee record for Andrew Fuller to state that he reports to Nancy Davolio the new President of Sales
UPDATE [Northwind].[dbo].[Employees]
SET [ReportsTo] = 1
WHERE [LastName] = 'Fuller' AND [FirstName] = 'Andrew';

--Update the Employee record for Anne Dodsworth. Change Anne's title to Vice President, Sales and set that she reports to Nancy Davolio
UPDATE [Northwind].[dbo].[Employees]
SET [ReportsTo] = 1, [Title] = 'Vice President, Sales'
WHERE [LastName] = 'Dodsworth' AND [FirstName] = 'Anne';