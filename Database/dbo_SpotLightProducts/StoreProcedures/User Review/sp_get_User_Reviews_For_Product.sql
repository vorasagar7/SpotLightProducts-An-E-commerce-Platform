DELIMITER $$
CREATE PROCEDURE sp_get_User_Reviews_For_Product(
IN p_user_Id integer,
In p_product_Id integer
)
BEGIN
select urv.User_Id, urv.Product_Id, urv.Comment, urv.Rating from tb_userreviews urv where urv.User_Id = p_user_Id and urv.Product_Id=p_product_Id;
End;
$$