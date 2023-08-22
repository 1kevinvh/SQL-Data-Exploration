/*
Created by: Kevin Ho
Created Date: 08/19/2023
Description: DML - Data Manipulation Language
*/

--INSERT, UPDATE, DELETE

--INSERT DATA

/*
INSERT INTO 
	Artist(Name)
VALUES('Bob Marley')
*/




--UPDATE 276 artistid from bob marley to damien marley

/*
UPDATE
	Artist
SET
	Name = 'Damien Marley'
WHERE
	ArtistId = 276
*/




--DELETE

DELETE FROM
	Artist
WHERE
	ArtistId = 276

