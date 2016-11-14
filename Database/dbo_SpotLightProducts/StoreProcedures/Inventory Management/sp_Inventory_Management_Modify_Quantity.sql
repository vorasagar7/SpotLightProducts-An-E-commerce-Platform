DELIMITER $$
CREATE PROCEDURE sp_Inventory_Management_Modify_Quantity(
	IN p_Product_Id INTEGER,
	IN p_Model_Id VARCHAR(50),
	IN p_Seller_Id INTEGER,
	IN p_Quantity INTEGER,
	IN p_Price FLOAT(10,2),
	IN p_User
)
BEGIN
	SET @SellerEmail = (SELECT Email from tb_AppUser WHERE Id = p_Seller_Id);
	UPDATE tb_ProductSeller
	SET Quantity = p_Quantity,
	Price = p_Price,
	Version = Version + 1,
	CreatedBy = @SellerEmail,
	ModifiedOn = CURRENT_TIMESTAMP,
	ModifiedBy = @SellerEmail
	WHERE Product_Id = p_Product_Id
	AND Seller_Id = p_Seller_Id
	AND IsDeleted = 0
END;
$$