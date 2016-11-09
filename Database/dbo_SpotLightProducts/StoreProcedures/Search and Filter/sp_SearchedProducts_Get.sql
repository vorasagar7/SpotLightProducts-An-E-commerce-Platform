DELIMITER $$
CREATE PROCEDURE sp_SearchedProducts_Get(
  IN p_searchQuery VARCHAR(100)
)
BEGIN
	SELECT p.Id, p.Product_Name, p.Model_Id, brand.Name AS Brand, category.Name AS Category, CONCAT(au.First_Name,au.Last_Name), p.Description, ps.Price, ps.Quantity FROM tb_Products p
	INNER JOIN tb_ProductSeller ps
	ON p.Id = ps.Product_Id
	INNER JOIN tb_AppUser au
	ON au.Id = ps.Seller_Id
	INNER JOIN tb_ReferenceListItem brand
	ON brand.Id = p.Brand_Id
	INNER JOIN tb_ReferenceListItem category
	ON category.Id = p.Category_Id
	WHERE p.Product_Name like CONCAT('%',p_searchQuery,'%')
	OR p.Model_Id like CONCAT('%',p_searchQuery,'%')
	OR brand.Name like CONCAT('%',p_searchQuery,'%')
	OR category.Name like CONCAT('%',p_searchQuery,'%')
	OR p.Description like CONCAT('%',p_searchQuery,'%')
	OR CONCAT(au.First_Name, au.Last_Name) like CONCAT('%',p_searchQuery,'%')
END;
$$