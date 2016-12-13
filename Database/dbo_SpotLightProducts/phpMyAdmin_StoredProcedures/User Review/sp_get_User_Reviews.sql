DELIMITER $$
CREATE PROCEDURE sp_get_User_Reviews(
IN p_user_Id integer
)
BEGIN
	SELECT
	  urv.User_Id,
	  urv.Product_Id,
	  p.Product_Name,
	  p.Model_Id,
	  urv.modified_On,
	  urv.Comments,
	  urv.Rating,
	  brand.Name AS BrandName
	FROM tb_userreviews urv
	INNER JOIN tb_appuser ap
	  ON ap.id = urv.User_Id
	INNER JOIN tb_products p
	  ON p.Id = urv.Product_Id
	INNER JOIN tb_ReferenceListItem brand
		ON brand.Id = p.Brand_Id
	WHERE urv.User_Id = p_user_Id
	AND ap.Is_Deleted = 0
	ORDER BY urv.modified_On DESC;
End;
$$