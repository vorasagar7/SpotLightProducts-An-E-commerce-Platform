DELIMITER $$
CREATE PROCEDURE sp_User_ID_Get(
	IN p_User_Email VARCHAR(100)
)
BEGIN
	IF (EXISTS(
		SELECT id 
			FROM tb_AppUser 
			WHERE Email = p_User_Email
			)
		) 
	THEN
		SELECT 
			id AS User_id 
		FROM tb_AppUser 
        WHERE email = p_User_Email;
	ELSE
		SELECT 0 AS User_id;
	END IF;
END;
