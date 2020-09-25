select * from Northwind.dbo.Products ;
select * from Northwind.dbo.[Employees];
select * from Northwind.dbo.[Orders];
select * from Northwind.dbo.[Order Details];
SELECT *  FROM [Northwind].[dbo].[Customers]


--1. Query orders that were placed for the product 'Queso Cabrales'
SELECT * FROM [Northwind].[dbo].[Order Details] orderDetail
JOIN [Northwind].[dbo].[Products] products
on products.ProductID = orderDetail.ProductID 
WHERE products.ProductName = 'Queso Cabrales';

--2. Query orders that were placed for the product 'Manjimup Dried Apples' with a discount of 15%. Return the quantity ordered
SELECT * FROM [Northwind].[dbo].[Order Details] orderDetail
JOIN [Northwind].[dbo].[Products] products
on products.ProductID = orderDetail.ProductID 
WHERE products.ProductName = 'Manjimup Dried Apples' AND orderDetail.Discount = 0.15;

--	3. Query orders that were placed  with an ordered amount of 20 or greater. Return the product name and any discount
SELECT products.ProductName, orderDetail.Discount 
FROM [Northwind].[dbo].[Order Details] orderDetail
JOIN [Northwind].[dbo].[Products] products
on products.ProductID = orderDetail.ProductID 
WHERE orderDetail.Quantity >= 20;

--a. Expand this to Include the employee name who helped facilitate the order
SELECT emp.FirstName, emp.LastName, products.ProductName, orderDetail.Discount
FROM [Northwind].[dbo].[Employees] emp
JOIN [Northwind].[dbo].[Orders] orders
ON emp.EmployeeID = orders.EmployeeID

JOIN [Northwind].[dbo].[Order Details] orderDetail
ON orders.OrderID = orderDetail.OrderID

JOIN [Northwind].[dbo].[Products] products
ON products.ProductID = orderDetail. ProductID
WHERE orderDetail.Quantity >= 20;

--b. Try to reverse this query to find all employees who helped facilitate an order with 10 or more quantity of a single product
SELECT DISTINCT emp.FirstName, emp.LastName
FROM [Northwind].[dbo].[Employees] emp
JOIN [Northwind].[dbo].[Orders] orders
ON emp.EmployeeID = orders.EmployeeID

JOIN [Northwind].[dbo].[Order Details] orderDetail
ON orders.OrderID = orderDetail.OrderID

JOIN [Northwind].[dbo].[Products] products
ON products.ProductID = orderDetail. ProductID
WHERE orderDetail.Quantity > 10;

--4. Query for an order with all its details (order details, product information, employee and customer information)
SELECT *
FROM [Northwind].[dbo].[Employees] emp
JOIN [Northwind].[dbo].[Orders] orders
ON emp.EmployeeID = orders.EmployeeID

JOIN [Northwind].[dbo].[Customers] cust
on cust.CustomerID = orders.CustomerID

JOIN [Northwind].[dbo].[Order Details] orderDetail
ON orders.OrderID = orderDetail.OrderID

JOIN [Northwind].[dbo].[Products] products
ON products.ProductID = orderDetail. ProductID
