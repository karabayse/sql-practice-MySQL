CREATE DATABASE practicemysql;

CREATE TABLE customers(
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

INSERT INTO customers (firstName, lastName, email, address, city, state, zipcode)
VALUES ('Jane', 'Doe', 'janedoe@gac.edu', '123 Main Street', 'Hopkins', 'MN', '55343'),
('John', 'Doe', 'johndoe@gac.edu', '800 W College Ave', 'St. Peter', 'MN', '56082'),
('June', 'Doe', 'junedoe@gac.edu', '800 W College Ave', 'St. Peter', 'MN', '56082'),
('James', 'Doe', 'jamesdoe@gac.edu', '800 W College Ave', 'St. Peter', 'MN', '56082'),
('Jan', 'Doe', 'jandoe@gac.edu', '456 Country Lane', 'Lester Prairie', 'MN', '55354');


-- UPDATE
UPDATE customers
SET email = 'junedoe@gmail.com'
WHERE id = 3;


-- DELETE
DELETE FROM customers
WHERE id = 3;


-- ALTER TABLE
ALTER TABLE customers ADD gradYear VARCHAR(255);
ALTER TABLE customers ADD testCol VARCHAR(255);

ALTER TABLE customers
MODIFY COLUMN gradYear INT(4);

ALTER TABLE customers
DROP COLUMN testCol;


-- SELECT
SELECT * FROM customers;

SELECT firstName, lastName FROM customers;

-- id is the primary key and is unique
SELECT * FROM customers WHERE id = 4;

-- Order By (sort)
SELECT * FROM customers ORDER BY lastName;
-- Order By in descending order
SELECT * FROM customers ORDER BY lastName DESC;
-- Order By in ascending order
SELECT * FROM customers ORDER BY lastName ASC;

SELECT state from customers;
-- Distinct (filter out duplicates)
SELECT DISTINCT state from customers;

ALTER TABLE customers
ADD COLUMN age INT;

INSERT INTO customers (age)
VALUES (24), (19), (20), (30);

SELECT * FROM customers WHERE age <20;


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
SELECT * FROM customers
WHERE age
BETWEEN 18 and 22;

-- LIKE with % at beginning
-- Filters cities that end in 'r'
SELECT * FROM customers
WHERE city LIKE '%r'
-- LIKE with % at the end
-- Filters cities that begin with 's'
SELECT * FROM customers
WHERE city LIKE 's%'
-- LIKE and NOT LIKE with % on both ends
-- Filters cities that contain 'a'
SELECT * FROM customers
WHERE city LIKE '%a%'
-- Filters cities that do not contain 'a'
SELECT * FROM customers
WHERE city NOT LIKE '%a%'


-- IN
SELECT * FROM customers
WHERE state IN ('Minnesota', 'Wisconsin');


-- INDEXES
-- * An index can be created in a table to find data more quickly and efficiently
-- * Users do not see indexes, they are just simply used to speed up searches/queries
-- * Only create indexes on columns (and tables) that will be frequently searched against
CREATE INDEX CIndex
ON customers(city);

SELECT city FROM customers;

DROP INDEX CIndex ON customers;


CREATE TABLE products (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255),
  price INT,
  PRIMARY KEY(id)
);


-- FOREIGN KEY
-- Used to prevent data corruption within database or an unstable database
-- Prevents us from deleting records that are needed for other records
CREATE TABLE orders (
  id INT NOT NULL AUTO_INCREMENT,
  orderNumber INT,
  productId INT,
  customerId INT,
  orderDate DATETIME default CURRENT_TIMESTAMP,
  PRIMARY KEY(id),
  FOREIGN KEY(customerId) REFERENCES customers(id),
  FOREIGN KEY(productId) REFERENCES products(id)
);


-- JOINS
-- Used to combine rows from two or more tables based on a common field between them
-- Types:  INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN
INSERT INTO products(name, price) VALUES
('Product One', 10),
('Product Two', 5),
('Product Three', 65),
('Product Four', 45),
('Product Five', 100);

INSERT INTO orders(orderNumber, productId, customerId) VALUES
(001, 1, 4),
(002, 3, 1),
(004, 1, 1),
(005, 1, 2),
(006, 1, 1),
(007, 4, 6),
(008, 4, 4),
(009, 2, 5);

-- INNER JOIN
-- Most popular
-- Returns all rows when there is at least 1 match in both tables
SELECT customers.firstName, customers.lastName, orders.orderNumber
FROM customers
INNER JOIN orders
ON customers.id = orders.customerId
ORDER BY orders.orderNumber;

-- LEFT JOIN
-- Returns matching rows from the Left Table with matching rows from the Right Table
SELECT customers.firstName, customers.lastName, orders.orderNumber, orders.orderDate
FROM customers
LEFT JOIN orders
ON customers.id = orders.customerId
ORDER BY customers.lastName;

-- RIGHT JOIN
SELECT orders.orderNumber, customers.firstName, customers.lastName
FROM orders
RIGHT JOIN customers
ON orders.customerId = customers.id
ORDER BY orders.orderNumber;
