DELIMITER $$
CREATE PROCEDURE sp_User_ID_ROLE_ID_Get(
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
			appUser.id AS UserId,
			userRole.role_id As roleID
		FROM tb_AppUser appUser
		INNER JOIN
		tb_userrole userRole
		ON userRole.User_id = appUser.id
		INNER JOIN
		tb_approle appRole
		ON appRole.id = userRole.role_id
        WHERE appUser.email = p_User_Email;
	ELSE
		SELECT 
		0 AS User_id,
		0 AS Role_id;
	END IF;
END;
$$