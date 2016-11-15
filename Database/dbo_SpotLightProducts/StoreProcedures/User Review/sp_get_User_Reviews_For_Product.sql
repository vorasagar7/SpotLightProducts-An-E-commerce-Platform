DELIMITER $$
CREATE PROCEDURE sp_get_User_Reviews_For_Product(
IN p_user_Id integer,
In p_product_Id integer
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
	  brand.Name AS Brand Name
	FROM tb_userreviews urv
	INNER JOIN tb_appuser ap
	 ON ap.id = urv.User_Id
	INNER JOIN tb_products p
	  ON p.Id = urv.Product_Id
	INNER JOIN tb_ReferenceListItem brand
	  ON brand.Id = p.Brand_Id
	WHERE urv.User_Id = p_user_Id
	AND ap.Is_DELETED = 0
	AND urv.Product_Id = p_product_Id;
	ORDER BY urv.modified_On DESC;
End;
$$