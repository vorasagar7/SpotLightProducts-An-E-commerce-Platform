DELIMITER $$
CREATE PROCEDURE sp_Seller_ApprovedProducts_Get(
IN p_seller_Id integer
)
BEGIN
SELECT
  p.id,
  p.Product_Name,
  p.Model_Id,
  p.Description,
  ps.price,
  ps.quantity,
  brand.Name AS Brand,
  category.Name AS Category
FROM tb_products p
INNER JOIN tb_productseller ps
  ON p.Id = ps.Product_Id
INNER JOIN tb_ReferenceListItem brand
	ON p.Brand_Id = brand.Id
INNER JOIN tb_ReferenceListItem category
	ON p.Category_Id = category.Id
WHERE ps.Seller_Id = p_seller_Id
AND p.Is_Approved = 1
AND p.Is_Deleted = 0
AND ps.Is_Deleted = 0;
End;
$$