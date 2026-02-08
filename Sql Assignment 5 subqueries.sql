SELECT * FROM employee_dataset.employee_dataset;

SELECT * FROM department_dataset.department_dataset;

SELECT * FROM sales_dataset.sales_dataset;

-- Basic Level
Q1. Retrieve the names of employees who earn more than (the average salary of all employees)

select name, salary from employee_dataset.employee_dataset 
where salary > (select avg(salary) from employee_dataset.employee_dataset);

-- average salary of all employees
select avg(salary) from employee_dataset.employee_dataset


Q2. Find the employees who belong to the department with the highest average salary.

select * FROM employee_dataset.employee_dataset where department_id = 
(select department_id FROM employee_dataset.employee_dataset group by department_id order by avg(salary) desc limit 1)

select department_id, avg(salary) from employee_dataset.employee_dataset group by department_id

Q3. List all employees who have made at least one sale.

SELECT *
FROM employee_dataset.employee_dataset
WHERE emp_id IN (SELECT DISTINCT emp_id FROM sales_dataset.sales_dataset);

Q4. Find the employee with the (highest sale amount).

select name, sale_amount from employee_dataset.employee_dataset as e join 
sales_dataset.sales_dataset as s on e.emp_id = s.emp_id where sale_amount = 
(select max(sale_amount) from sales_dataset.sales_dataset)


Q5. Retrieve the names of employees whose salaries are higher than (Shubham’s salary).

select emp_id, name, salary from employee_dataset.employee_dataset where salary > 
(select salary from employee_dataset.employee_dataset where name = 'Shubham')


-- Intermediate Level
Q1. Find employees who work in the (same department as Abhishek).

select name, department_id from employee_dataset.employee_dataset where department_id = 
(select department_id from employee_dataset.employee_dataset where name = 'Abhishek')


Q2. List departments that have at least one employee earning more than ₹60,000.

select d.department_name, e.department_id from employee_dataset.employee_dataset as e join department_dataset.department_dataset as d 
on e.department_id = d.department_id 
where e.salary > 60000


Q3. Find the department name of the employee who made the highest sale.

select department_name, sale_amount from employee_dataset.employee_dataset as e join department_dataset.department_dataset as d on 
e.department_id = d.department_id join sales_dataset.sales_dataset as s on e.emp_id = s.emp_id 
where s.sale_amount = (select max(sale_amount) from sales_dataset.sales_dataset)


Q4. Retrieve employees who have made sales greater than (the average sale amount).

select e.emp_id, name, sale_amount from employee_dataset.employee_dataset as e join sales_dataset.sales_dataset as s 
on e.emp_id = s.emp_id 
where sale_amount > 
(select avg(sale_amount) from sales_dataset.sales_dataset)


Q5. Find the total sales made by employees who earn more than the average salary

select sum(sale_amount) as total_sales_made_by_employees from employee_dataset.employee_dataset as e join sales_dataset.sales_dataset as s 
on e.emp_id = s.emp_id where e.salary > 
(select avg(salary) from employee_dataset.employee_dataset)


-- Advanced Level
Q1. Find employees who have not made any sales

select s.emp_id, name, sale_amount from employee_dataset.employee_dataset as e join sales_dataset.sales_dataset as s 
on e.emp_id = s.emp_id
where sale_amount is null


Q2. List departments where the average salary is above ₹55,000.

select department_name from employee_dataset.employee_dataset as e join department_dataset.department_dataset as d 
on e.department_id = d.department_id group by department_name having avg(salary) > 55000


Q3. Retrieve department names where the total sales exceed ₹10,000.

select d.department_name from employee_dataset.employee_dataset as e join department_dataset.department_dataset as d on 
e.department_id = d.department_id join sales_dataset.sales_dataset as s on e.emp_id = s.emp_id group by d.department_name
having sum(sale_amount) > 10000


Q4. Find the employee who has made the second-highest sale.

select e.emp_id, name, sale_amount from employee_dataset.employee_dataset as e join sales_dataset.sales_dataset as s 
on e.emp_id = s.emp_id 
where s.sale_amount = 
(select max(sale_amount) from sales_dataset.sales_dataset 
WHERE sale_amount < (SELECT MAX(sale_amount) FROM sales_dataset.sales_dataset))


Q5. Retrieve the names of employees whose salary is greater than the highest sale amount recorded

select e.emp_id, name from employee_dataset.employee_dataset as e join sales_dataset.sales_dataset as s 
on e.emp_id = s.emp_id 
where salary > 
(select max(sale_amount) from sales_dataset.sales_dataset)














