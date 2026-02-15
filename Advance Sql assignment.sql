create database advance_sql
use advance_sql

-- create table Products

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

INSERT INTO Products VALUES
(1, 'Keyboard', 'Electronics', 1200),
(2, 'Mouse', 'Electronics', 800),
(3, 'Chair', 'Furniture', 2500),
(4, 'Desk', 'Furniture', 5500);


-- create table sales

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
);

INSERT INTO Sales VALUES
(1, 1, 4, '2024-01-05'),
(2, 2, 10, '2024-01-06'),
(3, 3, 2, '2024-01-10'),
(4, 4, 1, '2024-01-11');

select * from sales



Q1. What is a Common Table Expression (CTE), and how does it improve SQL query readability?

A CTE is a temporary result set defined within the execution scope of a single SQL statement. 
It improves readability by eliminating deep nested subqueries.


Q2. Why are some views updatable while others are read-only? Explain with an example.

- Updatable: Simple views selecting columns from a single table.
- Read-Only: Views with aggregates (SUM, COUNT), GROUP BY, or JOINs.


Q3. What advantages do stored procedures offer compared to writing raw SQL queries repeatedly?

 stored procedure offers significant operational and security benifits over repeatedly writing raw SQL queries. By centralizing 
 logic diectly on the database server. the following advantages are :-
 
 - Performance Optimization
 - Enhanced Security
 - Maintainability and Abstraction
 
 
 Q4. What is the purpose of triggers in a database? Mention one use case where a trigger is essential.
 
 Triggers automatically execute on events (INSERT/UPDATE/DELETE). Essential for Audit Trails
 
 
 Q5. Explain the need for data modelling and normalization when designing a database.
 
 - Modelling: Defines structure.
- Normalization: Reduces redundancy and anomalies


Q6. Write a CTE to calculate the total revenue for each product
(Revenues = Price × Quantity), and return only products where revenue > 3000.

WITH ProductRevenue AS (
    SELECT 
        p.ProductName,
        (p.Price * s.Quantity) AS TotalRevenue
    FROM Products p
    JOIN Sales s ON p.ProductID = s.ProductID
)
SELECT ProductName, TotalRevenue 
FROM ProductRevenue
WHERE TotalRevenue > 3000;


Q7.  Create a view named vw_CategorySummary that shows:
Category, TotalProducts, AveragePrice.

CREATE VIEW vw_CategorySummary AS
SELECT 
    Category,
    COUNT(ProductID) AS TotalProducts,
    AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category;


Q8. Create an updatable view containing ProductID, ProductName, and Price.
Then update the price of ProductID = 1 using the view.

-- 1. Create the View
CREATE VIEW vw_ProductDetails AS
SELECT ProductID, ProductName, Price 
FROM Products;

-- 2. Update Price using the View
UPDATE vw_ProductDetails
SET Price = 1500
WHERE ProductID = 1;


Q9. Create a stored procedure that accepts a category name and returns all products belonging to that
category.

CREATE PROCEDURE GetProductsByCategory(IN categoryInput VARCHAR(50))
BEGIN
    SELECT * FROM Products 
    WHERE Category = categoryInput;
END //

DELIMITER 

Q10.  Create an AFTER DELETE trigger on the Products table that archives deleted product rows into a new
table ProductArchive. The archive should store ProductID, ProductName, Category, Price, and DeletedAt
timestamp

-- 1. Create Archive Table
CREATE TABLE ProductArchive (
    ArchiveID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    DeletedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Create the Trigger
DELIMITER //

CREATE TRIGGER trg_AfterDeleteProduct
AFTER DELETE ON Products
FOR EACH ROW
BEGIN
    INSERT INTO ProductArchive (ProductID, ProductName, Category, Price, DeletedAt)
    VALUES (OLD.ProductID, OLD.ProductName, OLD.Category, OLD.Price, NOW());


