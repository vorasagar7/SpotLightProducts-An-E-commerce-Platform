DELIMITER $$
CREATE PROCEDURE sp_get_User_Orders(
IN p_userEmail VARCHAR(100)
)
BEGIN
declare userId varchar(100);
Select Id into userId from tb_AppUser where Email = p_userEmail;
select uo.Mode_Of_Payment_Id, uo.Buyer_Id, uo.Shipping_Address, om.Order_Id, om.Product_Id, om.Seller_Id, om.Quantity, om.Price from tb_UserOrder uo Inner Join tb_OrderMapping om on uo.id = om.Order_Id where uo.Buyer_Id=userId;
End;
$$