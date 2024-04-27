-- script that creates a stored procedure ComputeAverageScoreForUser that computes and store the average score for a student. Note: An average score can be a decimal

/* Requirements:

Procedure ComputeAverageScoreForUser is taking 1 input:
user_id, a users.id value (you can assume user_id is linked to an existing users) */
--  creates a stored procedure ComputeAverageScoreForUser that computes and store the average score for a student
DELIMITER $$

DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
CREATE PROCEDURE ComputeAverageScoreForUser(
	IN user_id int)
BEGIN
 	DECLARE clc_score DECIMAL;
	SELECT AVG(score) INTO clc_score from corrections  WHERE user_id = user_id;
	UPDATE users SET average_score = clc_score WHERE id = user_id;
END $$
DELIMITER ;