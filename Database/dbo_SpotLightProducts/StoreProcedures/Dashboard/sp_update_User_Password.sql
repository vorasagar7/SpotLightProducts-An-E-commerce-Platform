DELIMITER $$
CREATE PROCEDURE sp_update_User_Password(
IN p_userID integer,
IN p_currentPassword VARCHAR(100),
IN p_newPassword VARCHAR(100)
)
BEGIN
declare oldPassword varchar(100);
SELECT
  pwd INTO oldPassword
FROM tb_AppUser
WHERE id = p_userID
AND Is_DELETED = 0;
If oldPassword = p_currentPassword  THEN
	UPDATE tb_AppUser
	SET Pwd = p_newPassword,
	VERSION = VERSION + 1
	WHERE Id = p_userID;
	Select 1 as Success , "Password Successfully Changed" as Message;
ELSE
	Select -1 as Success, "Current Password Doesn't match with the entered one" as Message;
END IF;
End;
$$