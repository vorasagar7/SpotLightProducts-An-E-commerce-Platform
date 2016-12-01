DELIMITER $$
CREATE PROCEDURE sp_get_Total_Count_Of_User(
IN p_role_Type integer
)
BEGIN
SELECT
  count(*) As Total_Number
  FROM tb_appuser ap
INNER JOIN tb_userrole ur
  ON ap.id = ur.User_Id
WHERE ur.role_id = p_role_Type
AND ap.Is_DELETED = 0
AND ur.Is_DELETED = 0;
End;
$$