DELIMITER $$
CREATE PROCEDURE sp_Shopping_Cart_Entry_Delete(
	IN p_Shopping_Cart_Id INTEGER,
	IN p_User_Id INTEGER,
	IN p_Product_Id INTEGER,
	IN p_Seller_Id INTEGER,
	IN p_Quantity INTEGER
)
BEGIN
	SET @UserEmail = (SELECT Email from tb_AppUser WHERE Id = p_User_Id);
	UPDATE tb_ShoppingCart
	SET Is_Deleted = 1,
		Modified_By = @UserEmail,
		Modified_On = CURRENT_TIMESTAMP,
		VERSION = VERSION + 1
	WHERE Id = p_Shopping_Cart_Id;

	UPDATE tb_ProductSeller
	SET Quantity = Quantity + p_Quantity,
		Modified_By = @UserEmail,
		Modified_On = CURRENT_TIMESTAMP,
		VERSION = VERSION + 1
	WHERE Product_Id = p_Product_Id
	AND Seller_Id = p_Seller_Id;

	SELECT 1 AS SUCCESS, "" AS ErrMessage;
END;
$$