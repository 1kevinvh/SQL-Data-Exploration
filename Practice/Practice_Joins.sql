/*This is a comment*/
--This is also a comment

/*
Created by: Kevin Ho
Created Date: 08/18/2023
Description: Joins
*/

--This selects all columns from customer and invoice table and joins 
--the customer table to the invoice table. ON provides the link between the two tables.
--Filter by CustomerID'

/*
SELECT
	c.LastName,
	c.FirstName,
	i.InvoiceId,
	i.CustomerId,
	i.InvoiceDate,
	i.total
	
FROM
	Invoice AS i
INNER JOIN
	Customer AS c
ON
	i.CustomerId = c.CustomerId
ORDER BY c.CustomerId
*/


/*
 Inner Join only returns matching records, any data that doesnt match from
either table is not showed.

Left Outer Join combines all records from the left table with matching records from the right table.
Depends on list order from join statement
Right Outer Join not supported in SQLite
*/

/*
SELECT
	i.InvoiceId,
	c.CustomerId,
	c.FirstName,
	i.InvoiceDate,
	i.BillingAddress,
	i.total
	
FROM
	Invoice AS i
LEFT OUTER JOIN
	Customer AS c
ON
	i.CustomerId = c.CustomerId
ORDER BY c.CustomerId
*/






--Joining Many Tables
--10 Highest Individual Sales

SELECT
	e.FirstName,
	e.LastName,
	e.EmployeeId,
	c.FirstName,
	c.LastName,
	c.SupportRepId,
	i.CustomerId,
	i.total
FROM
	Invoice AS i
INNER JOIN
	Customer AS c
ON
	i.CustomerId = c.CustomerId
INNER JOIN
	Employee AS e
ON
	c.SupportRepId = e.EmployeeId
ORDER BY 
	i.total DESC
LIMIT 10


