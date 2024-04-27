--  SQL script that creates a trigger that resets the attribute valid_email only when the email has been changed
-- creates a trigger that resets the attribute valid_email only when the email
use testdb
DELIMITER $$
DROP TRIGGER IF EXISTS reset_email;
CREATE TRIGGER reset_email
AFTER UPDATE ON users FOR EACH ROW
BEGIN
	UPDATE users SET valid_email = 0 WHERE id = NEW.id;
END$$
DELIMITER ;