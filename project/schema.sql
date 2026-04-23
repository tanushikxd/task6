DROP TABLE IF EXISTS first_names;
DROP TABLE IF EXISTS last_names;
DROP TABLE IF EXISTS streets;
DROP TABLE IF EXISTS cities;

CREATE TABLE first_names (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    locale VARCHAR(10)
);

CREATE TABLE last_names (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    locale VARCHAR(10)
);

CREATE TABLE streets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    street_name VARCHAR(50),
    locale VARCHAR(10)
);

CREATE TABLE cities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    city_name VARCHAR(50),
    locale VARCHAR(10)
);