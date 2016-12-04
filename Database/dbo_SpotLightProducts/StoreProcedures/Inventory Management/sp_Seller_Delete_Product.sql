DELIMITER $$
CREATE PROCEDURE sp_Seller_Delete_Product(
	IN p_Product_Id INTEGER,
	IN p_Seller_Id INTEGER
)
BEGIN
	SET @SellerEmail = (SELECT Email from tb_AppUser WHERE Id = p_Seller_Id);
	UPDATE tb_productseller
		SET Is_Deleted = 1,
			Version = Version + 1,
			Modified_On = CURRENT_TIMESTAMP,
			Modified_By = @SellerEmail
		WHERE Id = p_Product_Id
		AND Seller_Id = p_Seller_Id;
		SELECT 
			1 AS SUCCESS,
			"Product Successfully Deleted" AS Message;
END;
$$