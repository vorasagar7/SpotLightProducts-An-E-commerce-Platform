DELIMITER $$
CREATE PROCEDURE sp_Admin_Action_Pending_Products_Get()
BEGIN
	SELECT 
		product.Id AS Product_ID,
		product.Product_Name,
		product.Model_Id,
		brand.Name AS Brand,
		category.Name AS Category,
        CONCAT(appuser.First_Name , appuser.Last_Name) AS SellerName,
		productseller.Price,
        productseller.Quantity,
		product.Is_Spotlight
	FROM tb_Products product
	INNER JOIN tb_ReferenceListItem brand
	ON product.Brand_Id = brand.Id
	INNER JOIN tb_ReferenceListItem category
	ON product.Category_Id = category.Id
	INNER JOIN tb_Productseller productseller
	ON product.Id = productseller.product_Id
	INNER JOIN tb_appuser appuser
	ON productseller.Seller_Id = appuser.id
	WHERE product.Is_Deleted = 0
	AND product.Is_Approved = 0;
END;
$$