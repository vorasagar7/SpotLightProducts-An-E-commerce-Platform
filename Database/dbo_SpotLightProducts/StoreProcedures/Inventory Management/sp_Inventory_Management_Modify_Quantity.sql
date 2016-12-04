DELIMITER $$
CREATE PROCEDURE sp_Inventory_Management_Modify_Quantity(
	IN p_Product_Id INTEGER,
	IN p_Seller_Id INTEGER,
	IN p_Quantity INTEGER,
	IN p_Price FLOAT(10,2)
)
BEGIN
	SET @SellerEmail = (SELECT Email from tb_AppUser WHERE Id = p_Seller_Id);
	UPDATE tb_ProductSeller
	SET Quantity = p_Quantity,
	Price = p_Price,
	Version = Version + 1,
	CreatedBy = @SellerEmail,
	Modified_On = CURRENT_TIMESTAMP,
	Modified_By = @SellerEmail
	WHERE Product_Id = p_Product_Id
	AND Seller_Id = p_Seller_Id
	AND Is_Deleted = 0;
	SELECT 1 AS SUCCESS, "" AS ErrMessage;
END;
$$