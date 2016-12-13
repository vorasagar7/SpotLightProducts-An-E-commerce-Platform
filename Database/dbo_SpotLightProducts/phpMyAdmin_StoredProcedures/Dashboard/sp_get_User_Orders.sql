DELIMITER $$
CREATE PROCEDURE sp_get_User_Orders(
IN p_user_Id VARCHAR(100)
)
BEGIN
SELECT
  uo.Buyer_Id,
  uo.Shipping_Address,
  om.Order_Id,
  om.Product_Id,
  om.Seller_Id,
  om.Quantity,
  om.Price,
  uo.Mode_Of_Payment_Id,
  om.Modified_On
FROM tb_UserOrder uo
INNER JOIN tb_OrderMapping om
  ON uo.id = om.Order_Id
WHERE uo.Buyer_Id = p_user_Id
AND uo.Is_Deleted = 0
AND om.Is_Deleted = 0
ORDER BY om.Modified_On DESC;
End;
$$