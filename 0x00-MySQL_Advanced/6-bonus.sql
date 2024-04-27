-- script that creates a stored procedure AddBonus that adds a new correction for a student.
/* Requirements:

Procedure AddBonus is taking 3 inputs (in this order):
user_id, a users.id value (you can assume user_id is linked to an existing users)
project_name, a new or already exists projects - if no projects.name found in the table, you should create it
score, the score value for the correction */

-- Creates a stored procedure AddBonus that adds a new correction for a student.
DELIMITER $$

DROP PROCEDURE IF EXISTS AddBonus;
CREATE PROCEDURE AddBonus(
	IN user_id int,
	IN project_name VARCHAR(255),
	IN score int)
BEGIN
 	DECLARE project_id INT;
	SELECT id  INTO project_id from projects WHERE name = project_name;
	IF project_id IS NULL THEN
		INSERT INTO projects (name) VALUES(project_name);
		SELECT id  INTO project_id from projects WHERE name = project_name;
	END IF;
	INSERT INTO corrections VALUES (user_id, project_id, score);
END $$
DELIMITER ;