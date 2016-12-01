DELIMITER $$
CREATE PROCEDURE sp_get_Seller_Revenue(
IN p_seller_Id integer
)
BEGIN
	SELECT 
		SUM(om.Quantity*om.Price) As Total_Revenue 
	FROM tb_ordermapping om
	INNER JOIN tb_userorder uo
  ON uo.Id = om.Order_Id
	WHERE seller_id = p_seller_Id
	AND om.Is_Deleted = 0;
End;
$$