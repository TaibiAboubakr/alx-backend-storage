-- Active: 1699973134556@@127.0.0.1@3306@testdb
-- a SQL script that creates an index idx_name_first on the table names and the first letter of name.
/* Requirements:

Import this table dump: names.sql.zip
Only the first letter of name must be indexed
*/
-- creates an index idx_name_first on the table names
CREATE INDEX idx_name_first
ON names(name);
