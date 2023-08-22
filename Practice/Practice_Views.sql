/*
Created by: Kevin Ho
Created Date: 08/19/2023
Description: Views
*/



CREATE VIEW V_AvgTotal AS 
SELECT
	round(avg(total),2) AS [Average Total]
FROM
	Invoice
	
	