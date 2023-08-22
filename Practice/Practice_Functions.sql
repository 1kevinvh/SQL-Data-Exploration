/*This is a comment*/
--This is also a comment

/*
Created by: Kevin Ho
Created Date: 08/18/2023
Description: Functions
*/


--|| double pipe, concatonate

/*
SELECT 
	FirstName,
	LastName,
	Address,
	FirstName||' '||LastName ||' '|| Address ||', '|| City ||' '|| State ||' '|| PostalCode AS [Mailing Address]
FROM
	Customer
WHERE
	Country = 'USA'
*/

	
--UPPER() makes the string upper case
--LOWER() lowe case
--Tunkate, shorten text. SUBSTR

/*
SELECT 
	FirstName,
	LastName,
	Address,
	FirstName||' '||LastName ||' '|| Address ||', '|| City ||' '|| State ||' '|| PostalCode AS [Mailing Address],
	LENGTH(PostalCode),
	substr(PostalCode,1,5)AS [5 Digit Postal Code],
	UPPER(FirstName) AS [First Name All Caps],
	LOWER(LastName) AS [Last Name All Lower]
FROM
	Customer
WHERE
	Country = 'USA'
*/
	
	
	
	
	
--Date Functions
--strftime


SELECT
	LastName,
	FirstName,
	BirthDate,
	strftime('%Y-%m-%d', Birthdate) AS [Birthdate No Timecode],
	strftime('%Y-%m-%d','now') - strftime('%Y-%m-%d', Birthdate) AS [Age]
FROM
Employee