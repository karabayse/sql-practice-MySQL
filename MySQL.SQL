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

UPDATE students
SET email = 'junedoe@gmail.com'
WHERE id = 3;

DELETE FROM students
WHERE id = 3;

ALTER TABLE students ADD gradYear INT(255);
