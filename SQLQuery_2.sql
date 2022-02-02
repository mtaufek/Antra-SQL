
SELECT DISTINCT p.ProductName, o.OrderDate
FROM [Order Details] d INNER JOIN Products p ON d.ProductID = p.ProductID
INNER JOIN Orders o ON o.OrderID = d.OrderID
WHERE o.OrderDate BETWEEN '1997-01-27' AND '2022-01-27'
ORDER BY o.OrderDate ASC

SELECT TOP 5 ShipPostalCode
FROM Orders
WHERE OrderDate BETWEEN '1997-01-27' AND '2022-01-27'
GROUP BY ShipPostalCode
ORDER BY COUNT(ShipPostalCode) DESC

SELECT City, COUNT(ContactName) as 'Number of Customers'
FROM Customers
GROUP BY City
HAVING COUNT(ContactName) > 2
ORDER BY COUNT(ContactName) DESC

SELECT c.ContactName, o.OrderDate
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
ORDER BY o.OrderDate DESC

SELECT c.CustomerID, SUM(d.Quantity) AS 'Product count'
FROM Customers c INNER JOIN Orders o 
ON c.CustomerID = o.CustomerID
JOIN [Order Details] d ON d.OrderID = o.OrderID
GROUP BY c.CustomerID
HAVING SUM(d.Quantity) > 100
ORDER BY SUM(d.Quantity) DESC

SELECT Suppliers.CompanyName, Shippers.CompanyName
FROM Suppliers CROSS JOIN Shippers

-- Display the products order each day. Show Order date and Product Name.
SELECT DISTINCT o.OrderDate, p.ProductName
FROM [Order Details] d JOIN Products p ON d.ProductID = p.ProductID
JOIN Orders o ON o.OrderID = d.OrderID

-- Displays pairs of employees who have the same job title.
SELECT a.FirstName + ' ' + a.LastName, b.FirstName + ' ' + b.LastName
FROM Employees a INNER JOIN Employees b ON a.Title = b.Title

-- Display all the Managers who have more than 2 employees reporting to them.
SELECT a.FirstName + ' ' + a.LastName
FROM Employees a JOIN Employees b ON b.ReportsTo = a.EmployeeID
WHERE a.Title LIKE '%manager%'
GROUP BY a.FirstName, a.LastName
HAVING COUNT(b.ReportsTo) > 2

/* Display the customers and suppliers by city. The results should have the following columns:
    City
    Name
    Contact Name,
    Type (Customer or Supplier)
*/
/* SELECT City, ContactName, 'Customer' AS TYPE
FROM Customers
UNION 
SELECT City, ContactName, 'Suppler' AS TYPEs
FROM Suppliers */

SELECT DISTINCT City
FROM Customer