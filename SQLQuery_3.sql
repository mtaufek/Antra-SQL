select distinct a.City 
from Customers a, Employees b 
where a.City <> b.city;

SELECT DISTINCT City
FROM Customers
WHERE City NOT IN
(SELECT City
FROM Employees)

-- List all products and their total order quantities throughout all orders.
SELECT p.ProductName, COUNT(od.Quantity) as "Quantity"
FROM Products p JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductName


-- List all Customer Cities and total products ordered by that city.
SELECT d.city , SUM(b.ProductID) "total products" 
FROM dbo.Products b INNER JOIN dbo.[Order Details] a
ON a.ProductID = b.ProductID 
INNER JOIN dbo.Orders c ON c.OrderID = a.OrderID
INNER JOIN dbo.Customers d  ON d.CustomerID = c.CustomerID 
GROUP BY d.City;

-- List all Customer Cities that have at least two customers.
-- a. Use union
SELECT City
FROM Customers
GROUP BY City
HAVING COUNT(CustomerID) = 2
UNION
SELECT City
FROM Customers
GROUP BY City
HAVING COUNT(CustomerID) > 2

-- b. Use sub-query
SELECT DISTINCT City
FROM Customers
WHERE City IN
(SELECT City 
FROM Customers
GROUP BY City 
HAVING COUNT(CustomerId) >= 2)

-- List all Customer Cities that have ordered at least two different kinds of products.
SELECT DISTINCT c.City, COUNT(DISTINCT od.ProductID) as "# Products"
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.City
HAVING COUNT(DISTINCT od.ProductID) >= 2

select d.city , count(distinct b.ProductID) "total products" from dbo.Products b inner join dbo.[Order Details] a
on a.ProductID = b.ProductID inner join dbo.Orders c on c.OrderID = a.OrderID
inner join dbo.Customers d  on d.CustomerID = c.CustomerID group by d.City having count(distinct b.productid) >= 2


-- List all Customers who have ordered products, 
-- but have the ‘ship city’ on the order different from their own customer cities.
SELECT DISTINCT c.ContactName, c.City, o.ShipCity
FROM Orders o JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.City <> o.ShipCity

select distinct d.CompanyName, d.City ,c.ShipCity   from 
dbo.Orders c 
inner join dbo.Customers d  on d.CustomerID = c.CustomerID where d.City <> c.ShipCity;

-- List 5 most popular products, 
-- their average price, 
-- and the customer city that ordered most quantity of it.

SELECT TOP 5 p.ProductName, AVG(p.UnitPrice) AS "Average Price", c.City
FROM Products p JOIN [Order Details] od ON p.ProductID = od.ProductID
JOIN Orders o ON o.OrderID = od.OrderID
JOIN Customers c ON c.CustomerID = o.CustomerID
GROUP BY p.ProductName, c.City 
ORDER BY SUM(od.Quantity) DESC;

select top 5  b.productname, avg(b.UnitPrice) "Average price", d.city  
from dbo.Products b inner join dbo.[Order Details] a on a.ProductID = b.ProductID 
inner join dbo.Orders c on c.OrderID = a.OrderID
inner join dbo.Customers d  on d.CustomerID = c.CustomerID 
group by b.ProductName, d.city 
order by sum(a.quantity) desc ;

-- List all cities that have never ordered something but we have employees there.
-- A. Use sub-query

SELECT City FROM Customers WHERE City IN
(SELECT City FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
AND o.EmployeeID IN (SELECT Employeeid FROM Orders)
GROUP BY c.City HAVING COUNT(OrderID) = 0)

select city from customers where city  in 
(select city  from customers a left join orders b 
on a.customerid = b.customerid  and b.employeeid in 
(select employeeid from orders) 
group by a.city 
having count(orderid) = 0)

-- B. Do not use sub-query

SELECT c.City, COUNT(o.orderID) as "# employees"
FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN Employees e ON e.EmployeeID = o.EmployeeID
GROUP BY c.City HAVING COUNT(o.OrderID) = 0

-- List one city, if exists, that is the city from where the employee sold most orders 
-- (not the product quantity) is, and also the city of most total quantity of products 
-- ordered from. (tip: join  sub-query)

SELECT DISTINCT c.City FROM Customers c 
JOIN Orders o ON c.CustomerID = o.CustomerID  WHERE c.City IN 
(SELECT 1 FROM Products p JOIN [Order Details] od ON p.ProductID = od.ProductID 
JOIN Orders oo ON od.OrderID = oo.OrderID
JOIN Customers cc ON cc.CustomerID = oo.CustomerID
GROUP BY cc.City 
ORDER BY COUNT(p.ProductID) DESC)

select distinct  b.city from orders a inner join customers b on a.CustomerID = b.CustomerID where
b.city in (select top 1 d.city  from 
dbo.Products b inner join dbo.[Order Details] a
on a.ProductID = b.ProductID inner join dbo.Orders c on c.OrderID = a.OrderID
inner join dbo.Customers d  on d.CustomerID = c.CustomerID group by d.City order by count(c.orderid) desc)
and 
b.city in (select top 1 d.city  from 
dbo.Products b inner join dbo.[Order Details] a
on a.ProductID = b.ProductID inner join dbo.Orders c on c.OrderID = a.OrderID
inner join dbo.Customers d  on d.CustomerID = c.CustomerID group by d.City order by count(a.ProductID) desc)
