DELIMITER $$
CREATE PROCEDURE sp_get_All_Products_For_A_Seller_Below_Level(
IN p_seller_Id integer
)
BEGIN
SELECT
  p.product_id,
  p.Product_Name,
  p.Model_Id,
  p.Description,
  ps.price,
  ps.quantity
FROM tb_products p
INNER JOIN tb_productseller ps
  ON p.Id = ps.Product_Id
WHERE ps.Seller_Id = p_seller_Id
AND ps.quantity <= 5
AND p.Is_Deleted = 0
AND ps.Is_Deleted = 0;
End;
$$