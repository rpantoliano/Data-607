# Name: Richard Pantoliano, Jr.
# Data 607 Assignment 1

DROP SCHEMA IF EXISTS proj1;
CREATE SCHEMA proj1;
USE proj1;

CREATE TABLE MovieList (
    movie_name VARCHAR(100) PRIMARY KEY
);

CREATE TABLE Ratings (
	pkey int PRIMARY KEY AUTO_INCREMENT,
    movie_name VARCHAR(100),
    rating int,
    CONSTRAINT FOREIGN KEY (movie_name) REFERENCES MovieList(movie_name)
);

INSERT INTO MovieList (movie_name)
	values 	("Sully"), ("Don't Breathe"),
			("Suicide Squad"), ("Bad Moms"),
			("War Dogs"), ("Jason Bourne");

INSERT INTO Ratings (movie_name, rating)
	values	("Sully", 2), ("Suicide Squad", 4),
			("War Dogs", 1), ("War Dogs", 2),
            ("Jason Bourne", 5);
            
SELECT "Movie Title", "User Rating" FROM Ratings
	UNION
    Select movie_name, rating from Ratings
		INTO OUTFILE 'ratings.csv'
        FIELDS TERMINATED BY ','
        LINES TERMINATED BY '\n';

