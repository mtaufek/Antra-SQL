
/* Q1 */
/* SELECT ProductID, Name, Color, ListPrice
FROM Production.Product */

/* Q2 */
/* SELECT ProductID, Name, Color, ListPrice
FROM Production.Product
WHERE ListPrice <> 0 */

/* Q3 */
/* SELECT ProductID, Name, Color, ListPrice
FROM Production.Product
WHERE Color IS NULL */

/* Q4 */
/* SELECT ProductID, Name, Color, ListPrice
FROM Production.Product
WHERE Color IS NOT NULL */

/* Q5 */
/* SELECT ProductID, Name, Color, ListPrice
FROM Production.Product
WHERE Color IS NOT NULL
AND ListPrice > 0 */

/* Q6 */
/* SELECT CONCAT(Name, Color) AS NameColor
FROM Production.Product
WHERE Color IS NOT NULL */

/* Q7 */
/* SELECT Name, Color 
FROM Production.Product
WHERE Name LIKE '%Crankarm' OR NAME LIKE 'Chainring%' */


/* Q8 */
/* SELECT ProductID, Name
FROM Production.Product
WHERE ProductID BETWEEN 400 AND 500 */

/* Q9 */
/* SELECT ProductID, Name, Color
FROM Production.Product
WHERE Color = 'Black' OR Color = 'Blue' */

/* Q10 */
/*SELECT Name, ProductID
FROM Production.Product
WHERE Name LIKE 'S%' */

/* Q11 */
SELECT Name, ListPrice
FROM Production.Product
WHERE Name LIKE 'S%'
ORDER BY Name

/* Q12 */
/* SELECT Name, ListPrice
FROM Production.Product
WHERE Name LIKE '[SA]%'
ORDER BY Name ASC */

/* Q13 */
/* SELECT Name
FROM Production.Product
WHERE NAME LIKE 'SPO[^K]%' */

/* Q14 */
/* SELECT DISTINCT Color
FROM Production.Product
ORDER BY Color DESC */

/* Q15 */
/* SELECT DISTINCT ProductSubcategoryID, Color
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL AND Color IS NOT NULL */






