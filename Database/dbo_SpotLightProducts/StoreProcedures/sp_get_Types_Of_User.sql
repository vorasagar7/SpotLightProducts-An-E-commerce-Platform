DELIMITER $$
CREATE PROCEDURE sp_get_Types_Of_User(
IN p_role_Type integer
)
BEGIN
select ap.first_name, ap.last_name, ap.Email from tb_appuser ap inner join tb_userrole ur on ap.id = ur.User_Id where ur.role_id=p_role_Type;
End;
$$