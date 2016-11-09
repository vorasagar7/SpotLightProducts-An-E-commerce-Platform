DELIMITER $$
CREATE PROCEDURE sp_get_Types_Of_User(
IN p_role_Type integer
)
BEGIN
SELECT
  ap.first_name,
  ap.last_name,
  ap.Email
FROM tb_appuser ap
INNER JOIN tb_userrole ur
  ON ap.id = ur.User_Id
WHERE ur.role_id = p_role_Type
AND ap.Is_Active = 1
AND ur.Is_DELETED = 0;
End;
$$