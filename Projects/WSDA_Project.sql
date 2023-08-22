/*
Created by: Kevin Ho
Created Date: 08/17/2023
Description: Figure out financial discrepancy between 2011 and 2012
*/

--CHALLENGE 1
--1. How many transactions took place between 2011-2012

/*
SELECT
	Count(*)
FROM
	Invoice
WHERE
	InvoiceDate >= '2011-01-01' 
AND
	InvoiceDate <= '2012-12-31'

	*/
	
--2. How much money did WSDA make between 2011 and 2012

/*
SELECT
	sum(total) AS [Total Income]
FROM
	Invoice
WHERE
	InvoiceDate >= '2011-01-01' 
AND
	InvoiceDate <= '2012-12-31'
*/



--CHALLENGE 2

/*
1. Get a list of customers who made purchases between 2011 and 2012.
2. Get a list of customers, sales reps, and total transaction amounts for each customer 
between 2011 and 2012.
3. How many transactions are above the average transaction amount during the same 
time period?
4. What is the average transaction amount for each year that WSDA Music has been 
in business?
*/


--1. Get a list of customers who made purchases between 2011 and 2012.

/*
SELECT
	c.FirstName,
	c.LastName,
	i.total
FROM
	Invoice i
INNER JOIN
	Customer c
ON i.CustomerId = c.CustomerId
WHERE
	InvoiceDate >= '2011-01-01' 
AND
	InvoiceDate <= '2012-12-31'
ORDER BY
	i.total DESC
*/


--2. Get a list of customers, sales reps, and total transaction amounts for each customer 

/*
SELECT
	c.CustomerId AS [Customer ID],
	c.FirstName AS [Customer First Name],
	c.LastName AS [Customer Last Name],
	e.EmployeeId AS [Employee ID],
	e.FirstName AS [Employee First Name],
	e.LastName AS [Employee Last Name],
	i.total AS [Total Sales]
FROM
	Invoice i
INNER JOIN
	Customer c
ON i.CustomerId = c.CustomerId
INNER JOIN
	Employee e
ON e.EmployeeId = c.SupportRepId
WHERE
	InvoiceDate >= '2011-01-01' 
AND
	InvoiceDate <= '2012-12-31'
ORDER BY
	i.total DESC
*/


--3. How many transactions are above the average transaction amount during the same 
--time period?


-- Find Avg transaction amount between 2011 and 2012
/*
SELECT
	round(avg(total),2) AS [Averge Transaction Amount]
FROM
	Invoice
WHERE
	InvoiceDate >= '2011-01-01' 
AND
	InvoiceDate <= '2012-12-31'
*/
--Get the number of transactions above the average transaction amount
/*
SELECT
	Count(total) AS [Number of Transactions Above Average Amount]
FROM
	Invoice
WHERE
	(
	SELECT
		round(avg(total),2) AS [Averge Transaction Amount]
	FROM
		Invoice
	WHERE
		InvoiceDate >= '2011-01-01' 
	AND
		InvoiceDate <= '2012-12-31'
		)
AND
	InvoiceDate >= '2011-01-01' 
AND
	InvoiceDate <= '2012-12-31'
*/
	
	
--4. What is the average transaction amount for each year that WSDA Music has been 
--in business?

/*
SELECT
	Count(total) AS [# of Transactions Above Avg Amt],
	strftime('%Y',invoicedate) AS [Year]
FROM
	Invoice
GROUP BY
	strftime('%Y',invoicedate)
*/


		
		
		
--CHALLENGE 3
/*
1. Get a list of employees who exceeded the average transaction amount from sales they 
generated during 2011 and 2012.
2. Create a Commission Payout column that displays each employee’s commission 
based on 15% of the sales transaction amount.
3. Which employee made the highest commission?
4. List the customers that the employee identified in the last question.
5. Which customer made the highest purchase?
6. Look at this customer record—do you see anything suspicious?
7. Who do you conclude is our primary person of interest?
*/
		
		
--1. Get a list of employees who exceeded the average transaction amount from sales they 
--generated during 2011 and 2012.


/*
SELECT 
	e.FirstName AS [Customer First Name],
	e.LastName AS [Customer Last Name],
	sum(i.total) AS [Total Sales]
FROM
	Invoice i
INNER JOIN
	Customer c
ON i.CustomerId = c.CustomerId
INNER JOIN
	Employee e
ON e.EmployeeId = c.SupportRepId
WHERE
	InvoiceDate >= '2011-01-01' 
AND
	InvoiceDate <= '2012-12-31'
AND
	i.total > 11.66
GROUP BY
	e.FirstName,
	e.LastName
ORDER BY e.LastName
*/


--2. Create a Commission Payout column that displays each employee’s commission 
--based on 15% of the sales transaction amount.

/*
SELECT 
	e.FirstName AS [Customer First Name],
	e.LastName AS [Customer Last Name],
	sum(i.total) AS [Total Sales],
	round(sum(i.total)*.15,2) AS [Commisssion]
FROM
	Invoice i
INNER JOIN
	Customer c
ON i.CustomerId = c.CustomerId
INNER JOIN
	Employee e
ON e.EmployeeId = c.SupportRepId
WHERE
	InvoiceDate >= '2011-01-01' 
AND
	InvoiceDate <= '2012-12-31'
GROUP BY
	e.FirstName,
	e.LastName
ORDER BY e.LastName
*/


--3. Which employee made the highest commission?
--Jane Peacock


--4. List the customers that the employee identified in the last question.

/*
SELECT
	c.FirstName AS [Customer First Name],
	c.LastName AS [Customer Last Name],
	e.FirstName AS [Employee First Name],
	e.LastName AS [Employee Last Name],
	sum(i.total) AS [Total Sales],
	round(sum(i.total)*.15,2) AS [Commisssion]
FROM 
	Invoice i
INNER JOIN
	Customer c
ON c.CustomerId = i.CustomerId
INNER JOIN
	Employee e
ON e.EmployeeId = c.SupportRepId
WHERE 
	e.FirstName = 'Jane'
AND
	e.LastName = 'Peacock'
GROUP BY
	c.FirstName,
	c.LastName,
	e.FirstName,
	e.LastName
ORDER BY [Total Sales] DESC
*/



--5. Which customer made the highest purchase?
--John Doeein



--6. Look at this customer record—do you see anything suspicious?

SELECT
	*
FROM
	Customer c
WHERE
	c.LastName = 'Doeein'
	
	

--7. Who do you conclude is our primary person of interest?
--John Doeein