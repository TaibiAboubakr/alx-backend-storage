-- a SQL script that creates an index idx_name_first on the table names and the first letter of name.
/* Requirements:
Import this table dump: names.sql.zip
Only the first letter of name must be indexed
*/
-- Add a new column to store the first letter
ALTER TABLE names
ADD COLUMN first_letter_name CHAR(1);

-- Step 2: Populate the new column with the first letter of the original column
UPDATE names
SET first_letter_name = LEFT(name, 1);
-- creates an index idx_name_first on the table names
CREATE INDEX idx_name_first ON names(first_letter_name);
