DELIMITER $$
CREATE PROCEDURE sp_Forget_Password(
In p_Email Varchar(100)
)
BEGIN
	SELECT  
		pwd 
    FROM tb_AppUser 
    WHERE email = p_Email
	AND Is_DELETED = 0;
End;
