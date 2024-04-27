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
 	DECLARE sum_score INT DEFAULT 0;
 	DECLARE project_counter INT DEFAULT 0;

	SELECT SUM(score)
	INTO sum_score
	FROM corrections WHERE corrections.user_id = user_id;

	SELECT COUNT(*)
        INTO project_counter
        FROM corrections WHERE corrections.user_id = user_id;
UPDATE users SET users.average_score = IF(project_counter = 0, 0 , sum_score / project_counter) WHERE users.id = user_id;
END $$
DELIMITER ;