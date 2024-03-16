CREATE TABLE IF NOT EXISTS city(
	id SERIAL,
	name VARCHAR(100),
	population INT,
	PRIMARY KEY(id) 
);

SELECT *
FROM city;

DROP TABLE artists;
