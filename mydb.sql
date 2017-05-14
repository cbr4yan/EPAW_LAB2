
CREATE DATABASE movieT;

USE movieT;

CREATE TABLE USER (
  id INTEGER NOT NULL AUTO_INCREMENT,
  username VARCHAR(255),
  password VARCHAR(255),
  email VARCHAR(255),
  name VARCHAR(255),
  surname VARCHAR(255),
  gender VARCHAR(255),
  birth DATE,
  register datetime NOT NULL DEFAULT NOW(),

  PRIMARY KEY (id)
);