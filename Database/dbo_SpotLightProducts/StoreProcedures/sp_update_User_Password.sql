DELIMITER $$
CREATE PROCEDURE sp_update_User_Password(
IN p_userEmail VARCHAR(100),
IN p_currentPassword VARCHAR(100),
IN p_newPassword VARCHAR(100)
)
BEGIN
declare oldPassword varchar(100);
declare userId varchar(100);
Select pwd, Id into oldPassword, userId from tb_AppUser where Email = p_userEmail;
If oldPassword = p_currentPassword  THEN
	Update tb_AppUser set Pwd = p_newPassword where Id = userId;
	Select 1 as Success , "Password Successfully Changed" as Message;
ELSE
	Select -1 as Success, "Current Password Doesn't match with the entered one" as Message;
END IF;
End;
$$