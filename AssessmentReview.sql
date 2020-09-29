--1. Create a database called CompanyDb.
CREATE DATABASE CompanyDb;

--2. Create a table called Department. Department has the following colums:
--int PK auto-increment
--Name - nvarchar 25 NOT NULL
--Hiring - bit
--Location - nvarchar 50
USE CompanyDb;
CREATE TABLE Department (
     Id INT IDENTITY(1,1) PRIMARY KEY
    ,[Name] NVARCHAR(25) NOT NULL
    ,Hiring BIT
    ,[Location] NVARCHAR(50)
);

--3. Add the two departments to the table
--Name: Technololgy             Hiring: True      Location: 1570 Woodward Ave.
--Name: Shipping & Receiving    Hirign: False     Location: Southfield
INSERT INTO CompanyDb.dbo.Department ([Name], Hiring, [Location])
VALUES('Technology', 1, '1570 Woodward Ave.');

INSERT INTO CompanyDb.dbo.Department ([Name], Hiring, [Location])
VALUES('Marketing', 0, 'Cleveland');

--4. Construct a table named Employee. Employee has the following columns:
--SSN - nchar 9 PK
--DOB - Date
--Phone - nchar 10
--FirstName - nvarchar 30 NOT NULL
--LastName - nvarchar 30 NOT NULL
--DepartmentId - this is a foreign key reference to Departments. Choose the appropriate data type. (Note this is a many-to-one relationship. Many employees to one department)
USE CompanyDb;
CREATE TABLE Employee (
     SSN NCHAR(9) PRIMARY KEY
    ,DOB DATE
    ,Phone NCHAR(10)
    ,FirstName NVARCHAR(30) NOT NULL
    ,LastName NVARCHAR(30) NOT NULL
    ,DepartmentId INT FOREIGN KEY REFERENCES Department(Id)
);

--5. Add the 4 employees to the table
--SSN: 123456789  DOB: 1/5/1975  Phone: 3135555505   FirstName: Charles   LastName: Charleston   Department: Shipping & Receiving
--SSN: 987654321  DOB: 5/2/1990  Phone: 2489995555   FirstName: Jimmy     LastName: Scrambles    Department: Technology
--SSN: 456789123  DOB: 8/6/2001  Phone: 7895555525   FirstName: Vince     LastName: Jabowski     Departmetn: Technology
--SSN: 654854632  DOB: 4/6/1988  Phone: 3139721400   FirstName: John      LastName: Johnston     Department: Shipping & Receiving
INSERT INTO CompanyDb.dbo.Employee (SSN, DOB, Phone, FirstName, LastName, DepartmentId)
VALUES('123456789','1/5/1975', '3135555505','Charles', 'Charleston', 2);

INSERT INTO CompanyDb.dbo.Employee (SSN, DOB, Phone, FirstName, LastName, DepartmentId)
VALUES('987654321','5/2/1990', '2489995555','Jimmy', 'Scrambles', 1);

INSERT INTO CompanyDb.dbo.Employee (SSN, DOB, Phone, FirstName, LastName, DepartmentId)
VALUES('456789123','8/6/2001', '7895555525','Vince', 'Jabowski', 1);

INSERT INTO CompanyDb.dbo.Employee (SSN, DOB, Phone, FirstName, LastName, DepartmentId)
VALUES('654854632','4/6/1988', '3139721400','John', 'Johnston', 2);

--6. Update the youngest employee to have the LastName of "Spiderman"
UPDATE CompanyDb.dbo.Employee 
SET LastName = 'Spiderman'
WHERE DOB = (Select MAX(DOB) FROM CompanyDb.dbo.Employee);

--7. Select all employees with the LastName that starts with "J".
SELECT * FROM CompanyDb.dbo.Employee WHERE LastName LIKE 'J%';

--8. Remove the oldest employee
DELETE FROM CompanyDb.dbo.Employee WHERE DOB = (Select MIN(DOB) FROM CompanyDb.dbo.Employee);

--9. Select all employees with a 313 area code
SELECT * FROM CompanyDb.dbo.Employee WHERE phone LIKE '313%';

--10: Select all employees that have a DOB before 9/9/1999
SELECT * FROM CompanyDb.dbo.Employee WHERE DOB < '9/9/1999';

--11. Update the employees with DOB after 2000 to have no phone number
UPDATE CompanyDb.dbo.Employee 
SET Phone = NULL
WHERE DOB >= '1/1/2001';

--12. Select all employees that do not have a phone number
SELECT * FROM CompanyDb.dbo.Employee WHERE phone IS NULL;

--13. Use one statement to list all employees along with the name and location of the department the employee belongs to
SELECT * FROM CompanyDb.dbo.Employee
JOIN Department ON Employee.DepartmentId = Department.Id;

--14. Delete both talbes and all their contents from the database
DELETE FROM CompanyDb.dbo.Employee;
DELETE FROM CompanyDb.dbo.Department;
DROP TABLE CompanyDb.dbo.Employee;
DROP TABLE CompanyDb.dbo.Department;