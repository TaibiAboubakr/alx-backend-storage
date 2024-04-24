-- Active: 1699973134556@@127.0.0.1@3306@testdb
-- creates a table users
-- create a table users
CREATE TABLE IF NOT EXISTS users
(
id INT AUTO_INCREMENT PRIMARY KEY,
email VARCHAR(255) NOT NULL UNIQUE,
name VARCHAR(255),
country ENUM('US', 'CO', 'TN') NOT NULL DEFAULT 'US'
);