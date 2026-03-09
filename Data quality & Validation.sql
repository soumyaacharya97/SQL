Create database sales_transaction;
use sales_transaction;

create table sales_transaction (
txn_id int primary key,
customer_id varchar(10),
customer_name varchar(50),
product_id varchar(10),
quantity int null,
txn_amount int null,
txn_date DATE null,
city varchar(50));

INSERT INTO sales_transaction 
(txn_id, customer_id, customer_name, product_id, quantity, txn_amount, txn_date, city)
VALUES
(201, 'C101', 'Rahul Mehta', 'P11', 2, 4000, '2025-12-01', 'Mumbai'),
(202, 'C102', 'Anjali Rao', 'P12', 1, 1500, '2025-12-01', 'Bengaluru'),
(203, 'C101', 'Rahul Mehta', 'P11', 2, 4000, '2025-12-01', 'Mumbai'),
(204, 'C103', 'Suresh Iyer', 'P13', 3, 6000, '2025-12-02', 'Chennai'),
(205, 'C104', 'Neha Singh', 'P14', NULL, 2500, '2025-12-02', 'Delhi'),
(206, 'C105', 'N/A', 'P15', 1, NULL, '2025-12-03', 'Pune'),
(207, 'C106', 'Amit Verma', 'P16', 1, 1800, NULL, 'Pune'),
(208, 'C101', 'Rahul Mehta', 'P11', 2, 4000, '2025-12-01', 'Mumbai');

select * from sales_transaction;

-- Q.7 write an sql query on sales_transaction to list all duplicate keys and their counts using the
-- business key (customer_id + prodcut_id+ rxn_date + txn_amount)

SELECT 
    customer_id,
    product_id,
    txn_date,
    txn_amount,
    COUNT(*) AS duplicate_count
FROM sales_transaction
GROUP BY 
    customer_id,
    product_id,
    txn_date,
    txn_amount
HAVING COUNT(*) > 1;
 
 
 create table customers_master (
 customer_id varchar(10),
 customer_name varchar(50),
 city varchar(50));

 insert into customers_master
 ( customer_id,customer_name,city)
 values 
 ('c101','rahul mehta','mumbai'),
 ('c102','anjali rao','bengaluru'),
 ('c103','suresh iyer','chennai'),
 ('c104','neha singh','delhi');
 
 select * from customers_master;
 
 
 select distinct s.customer_id 
 from sales_transaction  s
 left join customers_master c
 on s.customer_id = c.customer_id 
 where c.customer_id is null;