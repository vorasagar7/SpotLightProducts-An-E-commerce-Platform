DELIMITER $$
CREATE PROCEDURE sp_Inventory_Management_Pending_Products_Get()
BEGIN
	SELECT Id,
		Product_Name,
		Model_Id,
		brand.Name AS Brand,
		category.Name AS Category,
		Description,
		Is_Spotlight
	FROM tb_Products product
	INNER JOIN tb_ReferenceListItem brand
	ON product.Brand_Id = brand.Id
	INNER JOIN tb_ReferenceListItem category
	ON product.Category_Id = category.Id
	WHERE Is_Deleted = 0
	AND Is_Approved = 0
END;
$$