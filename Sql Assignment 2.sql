Create the following dummy table in MySQL Workbench using CREATE FUNCTION-

create database employee_db;
use employee_db;

create table Employees (
EmpID int,
EmpName varchar(50),
Department varchar(50),
City varchar(50),
Salary int,
HireDate Date);

insert into Employees (EmpID, EmpName, Department, City, Salary, HireDate)
values
(101, 'Rahul Mehta', 'Sales', 'Delhi', 55000, '2020-04-12'),
(102, 'Priya Sharma', 'HR', 'Mumbai', 62000, '2019-09-25'),
(103, 'Aman Singh', 'IT', 'Bengaluru', 72000, '2021-03-10'),
(104, 'Neha Patel', 'Sales', 'Delhi', 48000, '2022-01-14'),
(105, 'Karan Joshi', 'Marketing', 'Pune', 45000, '2018-07-22'),
(106, 'Divya Nair', 'IT', 'Chennai', 81000, '2019-12-11'),
(107, 'Raj Kumar', 'HR', 'Delhi', 60000, '2020-05-28'),
(108, 'Simran Kaur', 'Finance', 'Mumbai', 58000, '2021-08-03'),
(109, 'Arjun Reddy', 'IT', 'Hyderabad', 70000, '2022-02-18'),
(110, 'Anjali Das', 'Sales', 'Kolkata', 51000, '2023-01-15');

select * from Employees;


Q1. Show employees working in either the ‘IT’ or ‘HR’ departments.

select * from Employees where Department = 'IT' or Department = 'HR';
select * from employees where Department in ('IT' , 'HR');


Q2. Retrieve employees whose department is in ‘Sales’, ‘IT’, or ‘Finance’.

select * from Employees where Department = 'Sales' or Department = 'IT' or Department = 'Finance';


Q3. Display employees whose salary is between ₹50,000 and ₹70,000.

select * from Employees where Salary <= 70000 and Salary >= 50000;


Q4. List employees whose names start with the letter ‘A’.

select * from Employees where EmpName like 'A%';


Q5. Find employees whose names contain the substring ‘an’.

select * from Employees where EmpName like '%an%';


Q6. Show employees who are from ‘Delhi’ or ‘Mumbai’ and earn more than ₹55,000

select * from Employees where City in ('Delhi', 'Mumbai')  and Salary >= 55000;


Q7. Display all employees except those from the ‘HR’ department.

select * from Employees where Department != 'HR';


Q8. Get all employees hired between 2019 and 2022, ordered by HireDate (oldest first).

select * from Employees where HireDate between '2019-09-25' and '2022-02-18' order by HireDate asc;
































