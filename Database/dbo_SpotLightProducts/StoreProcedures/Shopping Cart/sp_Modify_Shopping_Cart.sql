DELIMITER $$
CREATE PROCEDURE sp_Modify_Shopping_Cart(
	IN p_shopping_Cart_Id INTEGER,
	IN p_User_Id INTEGER,
	IN p_Product_Id INTEGER,
	IN p_Seller_Id INTEGER,
	IN p_Quantity INTEGER,
	IN p_Price FLOAT(10,2)
)
BEGIN
	SET @UserEmail = (SELECT Email from tb_AppUser WHERE Id = p_User_Id);
	IF p_shopping_Cart_Id > 0 THEN
		UPDATE tb_ShoppingCart
		SET Quantity = p_Quantity,
			Price = p_Price,
			ModifiedBy = @UserEmail,
			ModifiedOn = CURRENT_TIMESTAMP,
			VERSION = VERSION + 1
		WHERE Id = p_shopping_Cart_Id;

		SET @shoppingCartID = p_shopping_Cart_Id;

		UPDATE tb_ProductSeller
		SET Quantity = Quantity - p_Quantity,
			ModifiedBy = CURRENT_USER,
			ModifiedOn = CURRENT_TIMESTAMP,
			VERSION = VERSION + 1
		WHERE Product_Id = p_Product_Id
			AND Seller_Id = p_Seller_Id;
	ELSE
		INSERT INTO tb_ShoppingCart(
			Buyer_Id,
			Product_Id,
			Seller_Id,
			Quantity,
			Price,
			CreatedBy,
			ModifiedOn,
			ModifiedBy
		)
		VALUES(
			p_User_Id,
			p_Product_Id,
			p_Seller_Id,
			p_Quantity,
			p_Price,
			@UserEmail,
			CURRENT_TIMESTAMP,
			@UserEmail
		);
		set @shoppingCartID = (select LAST_INSERT_ID());
		UPDATE tb_ProductSeller
		SET Quantity = Quantity - p_Quantity,
			ModifiedBy = CURRENT_USER,
			ModifiedOn = CURRENT_TIMESTAMP,
			VERSION = VERSION + 1
		WHERE Product_Id = p_Product_Id
			AND Seller_Id = p_Seller_Id;
	END IF;
	SELECT 1 AS SUCCESS, "" AS Err Message, @shoppingCartID AS ShoppingCartID
END;
$$