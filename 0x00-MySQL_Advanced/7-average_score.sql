-- script that creates a stored procedure ComputeAverageScoreForUser that computes and store the average score for a student. Note: An average score can be a decimal

/* Requirements:

Procedure ComputeAverageScoreForUser is taking 1 input:
user_id, a users.id value (you can assume user_id is linked to an existing users) */
-- creates a stored procedure ComputeAverageScoreForUser that computes and store the average score for a student
DELIMITER $$

DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
CREATE PROCEDURE ComputeAverageScoreForUser(
	IN user_id int)
BEGIN
 	DECLARE clc_score INT DEFAULT 0;
 	DECLARE project_counter INT DEFAULT 0;

SELECT COUNT(*)
        INTO project_counter
        FROM corrections
        WHERE corrections.user_id = user_id;
	SELECT AVG(score) INTO clc_score from corrections WHERE corrections.user_id = user_id;
	UPDATE users SET users.average_score =IF(projects_counter = 0, 0 ,clc_score) WHERE users.id = user_id;
END $$
DELIMITER ;