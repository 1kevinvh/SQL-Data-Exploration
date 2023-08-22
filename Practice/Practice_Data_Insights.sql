/*This is a comment*/
--This is also a comment

/*
Created by: Kevin Ho
Created Date: 08/17/2023
Description: Finding out how many customers purchased 2 songs at 99 cents each.


--% is wild card character, always works with like. I dont care what comes next.





SELECT
	InvoiceDate as "Invoice Date",
	BillingAddress as "Billing Address",
	BillingCity as "Billing City",
	total
FROM
	Invoice
--Only displays totals that are 1.98 on the invoices tab.
WHERE
	/*total = 1.98,
Displays totals between said values
	total BETWEEN 1.98 AND 5
Displays totals that are 1.98 or 3.96
	total IN (1.98,3.96)
Displays where a specific value is something
	BillingCity = 'Brussels',
	BillingCity IN ('Brussels', 'Orlando', 'Paris')
Displays cities that only start with "B"
	BillingCity like 'B%'
'B' anywhere in name
	BillingCity like '%B%'
Show how many invoices are on a date
	InvoiceDate = '2010-05-22 00:00:00'
	DATE(InvoiceDate) > '2010-05-22' AND total < 3.00
	total > 1.98 AND (BillingCity LIKE 'P%' OR BillingCity LIKE 'D%')
ORDER BY InvoiceDate 

*/








/*
WSDA Music Sales Goals:
They want as many customers as possible to spend between $7.00 and $15.00

Sales Categories:
Baseline Purchase - Between $0.99 and $1.99
Low Purchase - Between $2.00 and $6.99
Target Purchase - Between $7.00 and $15.00
Top Performer - Above $15.00
*/

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total,
	CASE
	WHEN total < 2.00 THEN 'Baseline Purchase'
	WHEN total BETWEEN 2.00 AND 6.99 THEN 'Low Purchase'
	When total BETWEEN 7.00 AND 15.00 THEN 'Target Purchase'
	ELSE 'Top Performer'
	END AS PurchaseType
FROM
	Invoice
WHERE 
	PurchaseType = 'Top Performer'
ORDER BY
	BillingCity