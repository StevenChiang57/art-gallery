
CREATE DATABASE art_gallery;
USE art_gallery;

CREATE TABLE ARTIST
(
Artist VARCHAR(15) NOT NULL UNIQUE,
Phone VARCHAR(10),
Address VARCHAR(20),
Birth_place VARCHAR(15),
Age INT,
Style VARCHAR(30),
INDEX(Phone),
PRIMARY KEY (Artist)
);

CREATE TABLE Art_shows
(
Artist VARCHAR(15),
Datewhen Date,
Timewhen Time,
Location VARCHAR(20),
Contact VARCHAR(30),
Contactphone VARCHAR(10),
FOREIGN KEY (Artist) REFERENCES ARTIST(Artist),
FOREIGN KEY (Contactphone) REFERENCES ARTIST(Phone),
PRIMARY KEY (Artist)
);

CREATE TABLE Art_Work
(
Artist VARCHAR(15),
Title VARCHAR(15) NOT NULL UNIQUE,
Type_art VARCHAR(30),
Datecreation Date,
Dateacquired Date,
Price INT,
Location VARCHAR(20),
FOREIGN KEY (Artist) REFERENCES Artist(Artist), 
PRIMARY KEY (Title)
);

CREATE TABLE CUSTOMER
(
CustomerID VARCHAR(10) NOT NULL UNIQUE,
Phone VARCHAR(10),
Artpref VARCHAR(30),
PRIMARY KEY (CustomerID)
);


INSERT INTO ARTIST (Artist, Phone, Address, Birth_place, Age, Style)
VALUES ("John", "1234567890", "123 earth st", "earth town", 46, "Pop Art");
INSERT INTO ARTIST (Artist, Phone, Address, Birth_place, Age, Style)
VALUES ("Baery", "3748295023", "564 power st", "power town", 28, "Pottery");
INSERT INTO ARTIST (Artist, Phone, Address, Birth_place, Age, Style)
VALUES ("Naei", "4839573928", "352 flower st", "flower town", 37, "Conceptual Art");
INSERT INTO ARTIST (Artist, Phone, Address, Birth_place, Age, Style)
VALUES ("Brian", "4280538361", "328 farm st", "farm town", 44, "Still Life");

INSERT INTO Art_shows(Artist, Datewhen, Timewhen, Location, Contact, Contactphone)
VALUES ("John", "2017-02-05", "12:30:00", "374 Earth St", "JohnEarth@gmail.com", "1234567890");
INSERT INTO Art_shows(Artist, Datewhen, Timewhen, Location, Contact, Contactphone)
VALUES ("Baery", "2019-11-06", "11:00:00", "395 Power St", "BaeryPower@gmail.com", "3748295023");
INSERT INTO Art_shows(Artist, Datewhen, Timewhen, Location, Contact, Contactphone)
VALUES ("Naei", "2018-08-15", "10:30:00", "382 Flower St", "NaeiFlower@gmail.com", "4839573928");
INSERT INTO Art_shows(Artist, Datewhen, Timewhen, Location, Contact, Contactphone)
VALUES ("Brian", "2017-05-18", "08:30:00", "832 Farm St", "BrianFarm@gmail.com", "4280538361");

INSERT INTO Art_Work(Artist, Title, Type_art, Datecreation, DateAcquired, Price, Location)
VALUES ("John", "earth's rock", "Pop Art", "2006-03-05", "2010-06-12", 57, "Blue Room");
INSERT INTO Art_Work(Artist, Title, Type_art, Datecreation, DateAcquired, Price, Location)
VALUES ("Baery", "Edge of light", "Pottery", "2008-10-25", "2011-03-15", 102, "Front Room");
INSERT INTO Art_Work(Artist, Title, Type_art, Datecreation, DateAcquired, Price, Location)
VALUES ("Naei", "Flower's petal", "Conceptual Art", "2002-06-01", "2005-07-26", 78, "Basement");
INSERT INTO Art_Work(Artist, Title, Type_art, Datecreation, DateAcquired, Price, Location)
VALUES ("Brian", "Hills Peak", "Still Life", "2011-05-17", "2013-01-10", 65, "Blue Room");

INSERT INTO CUSTOMER( CustomerID, Phone, Artpref)
VALUES("Sien", "3983099432", "Minimalism");
INSERT INTO CUSTOMER( CustomerID, Phone, Artpref)
VALUES("Edun", "3983099432", "Sculpture");
INSERT INTO CUSTOMER( CustomerID, Phone, Artpref)
VALUES("Rein", "3983099432", "Pop Art");
INSERT INTO CUSTOMER( CustomerID, Phone, Artpref)
VALUES("Jessica", "3983099432", "Still Life");
/*
SELECT *
FROM ARTIST ;
SELECT *
FROM Art_shows;
SELECT *
FROM Art_work;
SELECT *
FROM Customer;

SELECT * FROM Art_shows WHERE Timewhen = '10:30:00'
*/