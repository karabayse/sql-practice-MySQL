CREATE DATABASE practicemysql;

CREATE TABLE customers(
  id INT NOT NULL AUTO_INCREMENT,
  firstName VARCHAR(255),
  lastName VARCHAR(255),
  email VARCHAR(255),
  address VARCHAR(255),
  city VARCHAR(255),
  zipcode INT(255),
  PRIMARY KEY(id)
);
