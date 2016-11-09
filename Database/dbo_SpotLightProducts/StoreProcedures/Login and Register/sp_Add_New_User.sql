DELIMITER $$
Create Procedure sp_Add_New_User
(
In p_First_Name varchar(100),
In p_Last_Name varchar(100),
In p_Email varchar(100),
In p_Password varchar(100),
In p_role_id integer
)
BEGIN
IF (EXISTS(SELECT Email FROM tb_AppUser where Email = p_Email)) THEN
Select -1 as Success , "User Already Registered" as ErrMessage;
ELSE
INSERT INTO `tb_AppUser` (`First_Name`, `Last_Name`, `Email`, `Pwd`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES (p_First_Name, p_Last_Name,p_Email, p_Password, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER, '1');
set @userID = (select LAST_INSERT_ID());
INSERT INTO `tb_UserRole` (`User_Id`, `Role_Id`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES (@userID, p_role_id, CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER, '1');
   Select 1 as Success, "" as ErrMessage, @user_id As User_Id;
END IF;
End;
$$