DELIMITER $$
CREATE PROCEDURE sp_Check_Product_By_Model_Id(
	IN p_Model_Id VARCHAR(50)
)
BEGIN
	SELECT product.Id,
		product.Product_Name,
		product.Model_Id,
		brand.Name AS Brand,
		category.Name AS Category
		product.Description,
		product.IsSpotlight,
		product.IsApproved
	FROM tb_Products product
	INNER JOIN tb_ReferenceListItem brand
	ON product.Brand_Id = brand.Id
	INNER JOIN tb_ReferenceListItem category
	ON product.Category_Id = category.Id 
	WHERE product.Model_Id = p_Model_Id
	AND product.IsDeleted = 0;
END;
$$