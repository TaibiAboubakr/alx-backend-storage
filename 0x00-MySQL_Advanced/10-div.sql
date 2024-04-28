-- a SQL script that creates a function SafeDiv that divides (and returns) the first by the second number or returns 0 if the second number is equal to 0.
/*Requirements:

You must create a function
The function SafeDiv takes 2 arguments:
a, INT
b, INT
And returns a / b or 0 if b == 0
*/

DELIMITER $$
-- drop function 
DROP FUNCTION IF EXISTS SafeDiv;
-- function SafeDiv that divides (and returns) the first by the second number or returns 0 if the second number is equal to 0.
CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS FLOAT DETERMINISTIC
BEGIN
    DECLARE result FLOAT;
	SET result = 0;
	IF b = 0 THEN
		RETURN result;
	END IF; 
    SET result = (a/b) ;
    RETURN result;
END$$
DELIMITER ;
SELECT SafeDiv(6, 4);