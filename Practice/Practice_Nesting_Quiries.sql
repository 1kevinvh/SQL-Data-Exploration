/*
Created by: Kevin Ho
Created Date: 08/18/2023
Description: Nesting Quiries ||Gather data on less than average invoices
*/

/*
SELECT
	round(AVG(Total),2) AS [Average Total]
FROM
	Invoice
*/
	
/*	
SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	Total <
	(SELECT 
		AVG(Total)
	FROM 
		Invoice)
ORDER BY
	Total DESC
*/



/*
--avg city performance vs global avg sales


SELECT
	BillingCity,
	ROUND(AVG(total),2) AS [City Average],
	(SELECT ROUND(AVG(total),2) FROM Invoice)AS [Global Average]
FROM
	Invoice
GROUP BY 
	BillingCity
ORDER BY 
	BillingCity
*/




/*
--Non-Aggregate Subqueries

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity
FROM
	Invoice
WHERE
	InvoiceDate > 
(SELECT
	InvoiceDate
FROM
	Invoice
WHERE
	InvoiceId = 251)
	
*/


/*
--Returning multiple values from a subquery

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity
FROM
	Invoice
WHERE
	InvoiceDate IN
(SELECT
	InvoiceDate
FROM
	Invoice
WHERE
	InvoiceId IN (251,252,254))
*/




--Distinct and NOT Clause

SELECT
	TrackId,
	Composer,
	Name
FROM
	Track
WHERE
	TrackId
NOT IN
(SELECT
	DISTINCT
	TrackId
FROM
	InvoiceLine
ORDER BY
	TrackId)
	