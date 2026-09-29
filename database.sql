CREATE DATABASE train;

USE train;

CREATE TABLE train_detail (
    train_no INT PRIMARY KEY,
    cost DECIMAL(10,2),
    starting_point VARCHAR(50),
    destination VARCHAR(60),
    via VARCHAR(90),
    time_of_departure VARCHAR(40),
    date_available VARCHAR(88));


CREATE TABLE user_information (
    unique_id INT PRIMARY KEY,
    uname VARCHAR(40) NOT NULL,
    age INT,
    gender VARCHAR(50),
    train_no INT,
    starting_point VARCHAR(50),
    destination VARCHAR(60),
    reservation VARCHAR(30) DEFAULT 'not reserved');
