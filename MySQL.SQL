CREATE DATABASE practicemysql;

CREATE TABLE students(
  id INT NOT NULL AUTO_INCREMENT,
  firstName VARCHAR(255),
  lastName VARCHAR(255),
  email VARCHAR(255),
  address VARCHAR(255),
  city VARCHAR(255),
  state VARCHAR(255),
  zipcode INT(255),
  PRIMARY KEY(id)
);

INSERT INTO students (firstName, lastName, email, address, city, state, zipcode)
VALUES ('Jane', 'Doe', 'janedoe@gac.edu', '800 W College Ave', 'St. Peter', 'MN', '56082'),
('John', 'Doe', 'johndoe@gac.edu', '800 W College Ave', 'St. Peter', 'MN', '56082'),
('June', 'Doe', 'junedoe@gac.edu', '800 W College Ave', 'St. Peter', 'MN', '56082'),
('James', 'Doe', 'jamesdoe@gac.edu', '800 W College Ave', 'St. Peter', 'MN', '56082'),
('Jan', 'Doe', 'jandoe@gac.edu', '800 W College Ave', 'St. Peter', 'MN', '56082');


-- UPDATE
UPDATE students
SET email = 'junedoe@gmail.com'
WHERE id = 3;


-- DELETE
DELETE FROM students
WHERE id = 3;


-- ALTER TABLE
ALTER TABLE students ADD gradYear VARCHAR(255);
ALTER TABLE students ADD testCol VARCHAR(255);

ALTER TABLE students
MODIFY COLUMN gradYear INT(4);

ALTER TABLE students
DROP COLUMN testCol;


-- SELECT
SELECT * FROM students;

SELECT firstName, lastName FROM students;

-- id is the primary key and is unique
SELECT * FROM students WHERE id = 4;

-- Order By (sort)
SELECT * FROM students ORDER BY lastName;
-- Order By in descending order
SELECT * FROM students ORDER BY lastName DESC;
-- Order By in ascending order
SELECT * FROM students ORDER BY lastName ASC;

SELECT state from students;
-- Distinct (filter out duplicates)
SELECT DISTINCT state from students;

ALTER TABLE students
ADD COLUMN age INT;

INSERT INTO students (age)
VALUES (18), (19), (20), (21);

SELECT * FROM students WHERE age <20;


-- OPERATORS

=  Equal to
Example:  Professor = 'Austen'

<>  Not equal to
Many DBMSs accept != in addition to <>
Example:  Major <> 'Spanish'

> Greater than
Example:  Graduation_Date > '2019-05-31'

< Less than
Example:  Graduation_Date < '2019-05-31'

>= Greater than or equal
Example:  Years_Attended >= 1

<= Less than or equal
Example:  Years_Attended <= 4

BETWEEN  Between an inclusive range
Example:  Tuition cost BETWEEN 30000.00 AND 50000.00

%  Wild Card

LIKE  Match a character pattern
Example:  First_Name LIKE 'Jane%'

IN  Equal to one of multiple possible values
Example:  Graduation_Date IN (2019, 2020, 2021, 2022)

IS or IS NOT  Compare to null (missing data)
Example:  Address is NOT NULL

IS NOT DISTINCT FROM  Is equal to value or both are nulls (missing data)
Example:  Start_Date IS NOT DISTINCT FROM Graduation_Date

AS  Used to change a field name when viewing results
Example:  SELECT student AS 'alumni'


-- SELECT with OPERATORS
SELECT * FROM students
WHERE age
BETWEEN 18 and 22;

-- LIKE with % at beginning
-- Filters cities that end in 'r'
SELECT * FROM students
WHERE city LIKE '%r'
-- LIKE with % at the end
-- Filters cities that begin with 's'
SELECT * FROM students
WHERE city LIKE 's%'
-- LIKE with % on both ends
-- Filters cities that contain 'a'
SELECT * FROM students
WHERE city LIKE '%a%'
