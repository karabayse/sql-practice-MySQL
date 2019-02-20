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


-- Update
UPDATE students
SET email = 'junedoe@gmail.com'
WHERE id = 3;


-- Delete
DELETE FROM students
WHERE id = 3;


-- Alter Table
ALTER TABLE students ADD gradYear VARCHAR(255);
ALTER TABLE students ADD testCol VARCHAR(255);

ALTER TABLE students
MODIFY COLUMN gradYear INT(4);

ALTER TABLE students
DROP COLUMN testCol;


-- Select
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
