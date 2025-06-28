-- Create the database
CREATE DATABASE EmployeeDB;

-- Use the database
USE EmployeeDB;

-- Create Departments table
CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(50)
);

-- Insert sample departments
INSERT INTO Departments VALUES
(101, 'Human Resources'),
(102, 'Finance'),
(103, 'IT'),
(104, 'Marketing');

-- Create Employees table
CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
DepartmentID INT,
JoiningDate DATE,
Salary DECIMAL(10, 2),
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Insert sample employees
INSERT INTO Employees VALUES
(1, 'Sindhu', 'Vijayan', 101, '2022-05-10', 55000.00),
(2, 'Ravi', 'Kumar', 102, '2020-07-15', 62000.00),
(3, 'Meena', 'Raj', 103, '2019-01-12', 72000.00),
(4, 'Anand', 'Krishnan', 104, '2021-03-20', 58000.00);

-- Create LeaveRecords table
CREATE TABLE LeaveRecords (
LeaveID INT PRIMARY KEY,
EmployeeID INT,
LeaveDate DATE,
Reason VARCHAR(100),
FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Insert sample leave records
INSERT INTO LeaveRecords VALUES
(1, 1, '2024-06-12', 'Medical'),
(2, 2, '2024-05-05', 'Vacation'),
(3, 3, '2024-04-20', 'Personal');

-- Create PerformanceReviews table
CREATE TABLE PerformanceReviews (
ReviewID INT PRIMARY KEY,
EmployeeID INT,
ReviewDate DATE,
Rating INT,
Comments VARCHAR(255),
FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Insert sample performance reviews
INSERT INTO PerformanceReviews VALUES
(1, 1, '2024-12-01', 4, 'Good team player'),
(2, 2, '2024-11-20', 3, 'Meets expectations'),
(3, 3, '2024-11-15', 5, 'Excellent performance');

-- Example Queries

-- List all employees with department names
SELECT E.EmployeeID, E.FirstName, E.LastName, D.DepartmentName, E.JoiningDate, E.Salary
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID;

-- List employees with salary above 60000
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary > 60000;

-- Find total number of employees in each department
SELECT D.DepartmentName, COUNT(E.EmployeeID) AS EmployeeCount
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName;

-- List all leave records for a specific employee
SELECT L.LeaveDate, L.Reason
FROM LeaveRecords L
JOIN Employees E ON L.EmployeeID = E.EmployeeID
WHERE E.FirstName = 'Sindhu';

-- Find highest paid employee
SELECT FirstName, LastName, MAX(Salary) AS MaxSalary
FROM Employees;
