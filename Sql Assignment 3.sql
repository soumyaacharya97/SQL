 Create the following dummy tables in MySQL Workbench using CREATE FUNCTION-
 
create database sql_join;
use sql_join;

Table 1: Customers

create table Customers (
CustomerID int,
CustomerName varchar(50),
City varchar (50));

insert into Customers (CustomerID, CustomerName, City)
values
(1, 'john smith', 'New York'),
(2, 'Mary Johnson', 'Chicago'),
(3, 'Peter Adams', 'Los Angeles'),
(4, 'Nancy Miller', 'Houston'),
(5, 'Robert White', 'Miami');

select * from Customers


Table 2: Orders

create table Orders (
OrderID int,
CustomerID int,
OrderDate date,
Amount int);

insert into Orders (OrderID, CustomerID, OrderDate, Amount)
values
(101, 1, '2024-10-01', 250),
(102, 2, '2024-10-05', 300),
(103, 1, '2024-10-07', 150),
(104, 6, '2024-10-10', 450),
(105, 3, '2024-10-12', 400);

select * from Orders

Table 3: Payments

create table Payments (
PaymentID varchar(50),
CustomerID int,
PaymentDate date,
Amount int);

insert into Payments (PaymentID, CustomerID, PaymentDate, Amount)
values
('P001', 1, '2024-10-02', 250),
('P002', 2, '2024-10-06', 300),
('P003', 3, '2024-10-11', 450),
('P004', 4, '2024-10-15', 200); 

select * from Payments

Table 4: Employees

create table Employeees (
EmployeeID int,
EmployeeName varchar(50),
ManagerID varchar(50));

insert into Employeees (EmployeeID, EmployeeName, ManagerID)
values
(1, 'Alex Green', NULL),
(2, 'Brian Lee', 1),
(3, 'Carol Ray', 1),
(4, 'David Kim', 2),
(5, 'Eva Smith', 2);

select * from Employeees


Q1. Retrieve all customers who have placed at least one order.

select c.customerID, c.CustomerName From Customers as c join orders as o on c.CustomerID = O.customerID

or 

select Distinct c.customerID, c.CustomerName From Customers as c join orders as o on c.CustomerID = O.customerID


Q2. Retrieve all customers and their orders, including customers who have not placed any orders.

select * from Customers left join Orders on Customers.CustomerID = Orders.CustomerID
 
 or 
 
SELECT c.CustomerID, c.CustomerName, c.City, o.OrderID, o.OrderDate, o.Amount
FROM Customers c
LEFT JOIN Orders o 
ON c.CustomerID = o.CustomerID;


Q3. Retrieve all orders and their corresponding customers, including orders placed by unknown
customers.

select * from Customers right join Orders on Customers.CustomerID = Orders.CustomerID


Q4. Display all customers and orders, whether matched or not.

SELECT c.CustomerID, c.CustomerName, c.City, o.OrderID, o.OrderDate, o.Amount
FROM Customers c
LEFT JOIN Orders o 
ON c.CustomerID = o.CustomerID
UNION
SELECT c.CustomerID, c.CustomerName, c.City, o.OrderID, o.OrderDate, o.Amount
FROM Customers c
RIGHT JOIN Orders o 
ON c.CustomerID = o.CustomerID;


Q5. Find customers who have not placed any orders.

select c.customerid, c.customername from customers as c left join orders as o on c.customerid = o.customerid 
where o.orderid is null


Q6. Retrieve customers who made payments but did not place any orders

select c.CustomerID, c.CustomerName From Customers as c join Payments as p on c.CustomerID = p.CustomerID 
left join orders as o on c.customerid = o.customerid where o.orderid is null


Q7. Generate a list of all possible combinations between Customers and Orders

select * from customers join orders 


Q8. show all customers along with order and payment amounts in one table.

select * from customers left join orders on customers.customerid = orders.customerid 
left join payments on customers.customerid = payments.customerid


Q9. Retrieve all customers who have both placed orders and made payments

select distinct c.customerid, c.customername from customers as c join orders as o on c.customerid = o.customerid 
join payments as p on c.customerid = p.customerid




























