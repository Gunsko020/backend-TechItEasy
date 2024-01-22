DROP TABLE IF EXISTS users;

DROP TABLE IF EXISTS remotecontrollers CASCADE;
DROP TABLE IF EXISTS c1modules CASCADE;
DROP TABLE IF EXISTS wallbrackets CASCADE;
DROP TABLE IF EXISTS televisions CASCADE;
DROP TABLE IF EXISTS tellbrackets;

CREATE TABLE users(
	username VARCHAR(100) NOT NULL UNIQUE,
	password VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE remotecontrollers(
	remotecontrollerid SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	brand VARCHAR (100),
	price DOUBLE PRECISION,
	currentstock INT,
	sold INT,
	compatiblewith VARCHAR(100),
	batterytype VARCHAR(100)
);

CREATE TABLE c1modules(
	c1moduleid SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	brand VARCHAR (100),
	price DOUBLE PRECISION,
	currentStock INT,
	sold INT
);

CREATE TABLE wallbrackets(
	wallbracketid SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	brand VARCHAR (100),
	price DOUBLE PRECISION,
	currentstock INT,
	sold INT,
	adjustable BOOLEAN
);


CREATE TABLE televisions(
	televisionid SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	brand VARCHAR (100),
	price DOUBLE PRECISION,
	currentstock INT,
	sold INT,
	type VARCHAR(100),
	available DOUBLE PRECISION,
	refreshrate DOUBLE PRECISION,
	screentype VARCHAR(100),
	remotecontrollerid INT,
	c1moduleid INT,
	CONSTRAINT fk_c1module FOREIGN KEY (c1moduleid) REFERENCES c1modules (c1moduleid),
	CONSTRAINT fk_remotecontroller FOREIGN KEY (remotecontrollerid) REFERENCES remotecontrollers (remotecontrollerid)
);

CREATE TABLE tellbrackets(
	televisionid INT,
	wallbracketid BIGINT,
	CONSTRAINT fk_television FOREIGN KEY (televisionid) REFERENCES televisions (televisionid),
	CONSTRAINT fk_wallbracket FOREIGN KEY (wallbracketid) REFERENCES wallbrackets (wallbracketid)

);

INSERT INTO users (username,password) VALUES ('Gunsko','amsterdam'), ('Bart', 'ww2345');
SELECT * FROM users;

INSERT INTO remotecontrollers (name,brand,price,currentstock,sold,compatiblewith,batterytype) 
VALUES ('blackrct','philips',230,120,20,'ptv01','x23'), ('greyrct','samsung',360,220,40,'stv01','q50');

SELECT * FROM remotecontrollers;

INSERT INTO c1modules (name,brand,price,currentstock,sold)
VALUES ('turtle','nvidia',100,400,80),('snake','nvidia',15,200,40);

SELECT * FROM c1modules;

INSERT INTO wallbrackets (name,brand,price,currentstock,sold,adjustable)
VALUES ('midwest','gucci',4000,12,2, true ) , ('midsouth','louis',8000,8,3,true);

SELECT * FROM wallbrackets;

INSERT INTO televisions (name,brand,price,currentstock,sold,type,available,refreshrate,
						 screentype,remotecontrollerid,c1moduleid) VALUES
						 ('whitetv','samsung',800,201,49,'ledtv',35,10,'plasma',1,1),
						 ('redtv','samsung',400,101,39,'ledtv',25,9,'plasma',2,2);
						 
SELECT * FROM televisions;

INSERT INTO tellbrackets (televisionid,wallbracketid) VALUES (1,1),(2,2);

SELECT * FROm tellbrackets;

SELECT username from users;
SELECT price,brand  from televisions;


SELECT televisionid from televisions
JOIN c1modules ON televisions.televisionid= c1modules.c1moduleid
JOIN remotecontrollers ON televisions.televisionid = remotecontrollers.remotecontrollerid;







