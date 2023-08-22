/*
Created by: Kevin Ho
Created Date: 08/18/2023
Description: Grouping | AVG invoice totals by city 
*/

/*
SELECT
	BillingCity AS [Billing City],
	ROUND(AVG(total),2) AS [Average Total]
FROM
	Invoice
WHERE
	BillingCity LIKE 'B%'
GROUP BY 
	BillingCity
HAVING
	AVG(total) > 5
ORDER BY
	BillingCity
	
*/





SELECT
	BillingCountry AS [Billing Country],
	BillingCity AS [Billing City],
	ROUND(AVG(total),2) AS [Average Total]
FROM
	Invoice
GROUP BY 
	BillingCountry,
	BillingCity
HAVING
	AVG(total) > 5
ORDER BY
	BillingCountry