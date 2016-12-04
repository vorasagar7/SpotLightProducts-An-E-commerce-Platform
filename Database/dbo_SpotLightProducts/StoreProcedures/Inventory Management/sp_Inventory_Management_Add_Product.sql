DELIMITER $$
CREATE PROCEDURE sp_User_ID_Get(
	IN p_User_Email INTEGER
)
BEGIN
	IF (EXISTS (SET @SellerId = (SELECT id from tb_AppUser WHERE email = p_User_Email)));
		SELECT SellerId
	ELSE
		SELECT 0;
END;
$$