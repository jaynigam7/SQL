create database prac;
USE prac;

SELECT *,
FirstName + ' ' + COALESCE(LastName,'') AS FullName
FROM Customers;
SELECT * FROM Employees;
SELECT * FROM Orders;
SELECT * FROM OrdersArchive;
SELECT * FROM Products;

CREATE TABLE Sales (
    SaleID INT,
    CustomerID INT,
    ProductID INT,
    Category VARCHAR(50),
    Quantity INT,
    Amount DECIMAL(10,2),
    City VARCHAR(50)
);
INSERT INTO Sales VALUES
(1,101,201,'Electronics',2,25000,'Delhi'),
(2,102,202,'Clothing',3,3000,'Mumbai'),
(3,103,203,'Electronics',1,15000,'Jaipur'),
(4,101,204,'Furniture',2,12000,'Delhi'),
(5,104,205,'Clothing',5,5000,'Pune'),
(6,105,201,'Electronics',1,12500,'Mumbai'),
(7,102,206,'Furniture',3,18000,'Mumbai'),
(8,106,207,'Electronics',2,22000,'Delhi'),
(9,107,208,'Books',4,2000,'Chennai'),
(10,108,209,'Books',2,1000,'Jaipur'),
(11,109,210,'Clothing',6,6000,'Delhi'),
(12,101,202,'Clothing',4,4000,'Delhi'),
(13,103,211,'Furniture',1,8000,'Jaipur'),
(14,104,212,'Electronics',3,36000,'Pune'),
(15,105,213,'Books',5,2500,'Mumbai'),
(16,106,214,'Furniture',2,14000,'Delhi'),
(17,107,215,'Electronics',1,18000,'Chennai'),
(18,108,216,'Clothing',2,2200,'Jaipur'),
(19,109,217,'Books',7,3500,'Delhi'),
(20,110,218,'Furniture',4,24000,'Pune'),
(21,101,219,'Electronics',2,28000,'Delhi'),
(22,102,220,'Books',3,1500,'Mumbai'),
(23,103,221,'Electronics',1,12000,'Jaipur'),
(24,104,222,'Furniture',2,16000,'Pune'),
(25,105,223,'Clothing',5,5500,'Mumbai'),
(26,106,224,'Books',6,3000,'Delhi'),
(27,107,225,'Electronics',2,26000,'Chennai'),
(28,108,226,'Furniture',3,21000,'Jaipur'),
(29,109,227,'Clothing',4,4800,'Delhi'),
(30,110,228,'Electronics',1,14000,'Pune');

-- SCHOOL LEVEL QUESTION

--Display all records.
SELECT TOP(10) * FROM Sales;
--Display only Category and Amount.
SELECT TOP(10) Category, Amount FROM Sales;
--Show all sales from Delhi.
SELECT COUNT(*) FROM Sales 
WHERE City = 'Delhi';
--Show sales where Amount > 10000.
SELECT * FROM Sales 
WHERE Amount > 10000 AND City = 'Delhi';
--Show products belonging to Electronics.
SELECT ProductID FROM Sales
WHERE Category = 'Electronics';
--Display unique cities.
SELECT DISTINCT City
FROM Sales;
--Sort records by Amount ascending.
SELECT * From Sales 
ORDER BY Amount DESC;
--Sort records by Amount descending.
SELECT * From Sales 
ORDER BY Amount;
--Display TOP 5 sales.
SELECT TOP(5)* FROM Sales;
--Show sales where Quantity > 3.
SELECT * FROM Sales
WHERE Quantity > 3;

-- BASIC LEVEL QUESTION

--Show Electronics sales above ₹20,000.
SELECT Category ,Amount FROM Sales
WHERE Category = 'Electronics' AND Amount > 20000;
--Display unique categories.
SELECT DISTINCT Category FROM Sales;
--Show top 5 highest-value sales.
SELECT TOP(5)* FROM Sales
ORDER BY Amount DESC;
--Display sales from Mumbai ordered by Amount.
SELECT * FROM Sales
WHERE City = 'Mumbai'
ORDER BY Amount;
--Find sales between ₹5,000 and ₹20,000.
SELECT * FROM Sales
WHERE Amount BETWEEN 5000 AND 20000;
--Show sales not belonging to Books category.
SELECT * FROM Sales
WHERE Category != 'Books';
--Display all sales ordered by Category then Amount.
SELECT * FROM Sales
ORDER BY Category ,Amount;
--Find top 3 lowest-value sales.
SELECT TOP(3)* FROM Sales
ORDER BY Amount ASC;
--Show sales where Quantity is exactly 2.
SELECT * FROM Sales
WHERE Quantity = 2;
--Display customers who purchased Electronics.
SELECT CustomerID, Category FROM SALES
WHERE Category = 'Electronics';

-- INTERMEDIATE LEVEL QUESTIONS

-- Find total revenue.
SELECT SUM(Amount) AS TotalSales FROM Sales;
--Find total revenue by category.
SELECT SUM(Amount) AS TotalSales, Category FROM Sales
GROUP BY Category;
--Find average sale amount by category.
SELECT AVG(Amount) AS AverageSales, Category FROM Sales
GROUP BY Category;
--Count sales in each city.
SELECT COUNT(Amount) AS TotalSales , City FROM Sales
GROUP BY City;
--Find total quantity sold per category.
SELECT SUM(Quantity) AS TotalQuantity,Category FROM Sales
GROUP BY Category;
--Find highest sale amount in each category.
SELECT Category,MAX(Amount) AS HighestSales FROM Sales
GROUP BY Category;
--Find lowest sale amount in each category.
SELECT Category, MIN(Amount) as LowestSales FROM Sales
GROUP BY Category;
--Count transactions by customer.
SELECT CustomerID, COUNT(Quantity) AS TotalQuantity FROM Sales
GROUP BY CustomerID
ORDER BY TotalQuantity DESC;
--Find total spending by each customer.
SELECT CustomerID, SUM(Amount) AS TotalSpending FROM Sales
GROUP BY CustomerID
ORDER BY TotalSpending DESC;
--Find average quantity sold by category.
SELECT AVG(Quantity) AS AverageQuantity, Category FROM Sales
GROUP BY Category;

--Hard Level Practice (HAVING + GROUP BY)

--Find categories with total revenue greater than ₹50,000.
SELECT Category, SUM(Amount) AS TotalRevenue FROM Sales
GROUP BY Category
HAVING SUM(Amount) > 50000;
--Find customers who spent more than ₹40,000.
 SELECT CustomerID , SUM(Amount) AS Spending FROM Sales
 GROUP BY CustomerID
 HAVING SUM(Amount) > 40000;
--Find cities having more than 5 sales.
SELECT City , count(Quantity) AS TotalSales FROM Sales
GROUP BY City
HAVING count(Quantity)>5;
--Find categories where average sale amount exceeds ₹10,000.
SELECT Category, AVG(Amount) AS AvgSales FROM SaLes
GROUP BY Category
HAVING AVG(Amount) > 10000;
--Find customers with more than 2 transactions. 
SELECT CustomerID, COUNT(Quantity) AS TotalTransactions FROM Sales
GROUP BY CustomerID
HAVING COUNT(Quantity)>2;
--Find top 3 customers by total spending.
SELECT TOP(3)CustomerID, SUM(Amount) FROM Sales
GROUP BY CustomerID
ORDER BY MAX(Amount);
--Find categories with total quantity sold greater than 10.
SELECT Category ,SUM(Quantity)AS TotalQuantity FROM Sales
GROUP BY Category
HAVING SUM(Quantity) >10;
--Find cities whose total sales exceed ₹60,000.
SELECT City , SUM(Amount) AS TotalSales FROM Sales
GROUP BY City
HAVING SUM(Amount) > 60000;
--Find customers whose average purchase exceeds ₹15,000.
SELECT CustomerID, AVG(Amount) FROM Sales
GROUP BY CustomerID
HAVING AVG(Amount) > 15000;
--Find the category generating the highest revenue.
SELECT TOP(1)Category, SUM(Amount) FROM Sales
GROUP BY Category
ORDER BY SUM(Amount);