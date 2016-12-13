DELIMITER $$
CREATE PROCEDURE sp_get_All_Products_For_A_Seller(
IN p_seller_Id integer
)
BEGIN
SELECT
  p.Product_Name,
  p.Model_Id,
  p.Description,
  ps.price,
  ps.quantity
FROM tb_products p
INNER JOIN tb_productseller ps
  ON p.Id = ps.Product_Id
WHERE ps.Seller_Id = p_seller_Id 
AND p.Is_Deleted = 0 
AND ps.Is_Deleted = 0;
End;
$$
