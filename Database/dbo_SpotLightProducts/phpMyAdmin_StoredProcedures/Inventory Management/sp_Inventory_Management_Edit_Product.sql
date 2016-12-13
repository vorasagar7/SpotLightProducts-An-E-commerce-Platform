DELIMITER $$
CREATE PROCEDURE sp_Inventory_Management_Edit_Product(
	IN p_Product_Id INTEGER,
	IN p_Model_Id VARCHAR(50),
	IN p_Seller_Id INTEGER,
	IN p_Product_Name VARCHAR(50),
	IN p_Brand_Id INTEGER,
	IN p_Category_Id INTEGER,
	IN p_Description VARCHAR(1000),
	IN p_Is_Spotlight BOOLEAN,
	IN p_Quantity INTEGER,
	IN p_Price FLOAT(10,2)
)
BEGIN
	SET @SellerEmail = (SELECT Email from tb_AppUser WHERE Id = p_Seller_Id);
	UPDATE tb_Products
	SET Product_Name = p_Product_Name,
	Model_Id = p_Model_Id,
	Brand_Id = p_Brand_Id,
	Category_Id = p_Category_Id,
	Description = p_Description,
	Is_Spotlight = p_Is_Spotlight,
	ModifiedOn = CURRENT_TIMESTAMP,
	ModifiedBy = @SellerEmail,
	Version = Version + 1
	WHERE Id = p_Product_Id
	AND Is_Deleted = 0;

	UPDATE tb_ProductSeller
	SET Price = p_Price,
	Quantity = p_Quantity,
	ModifiedOn = CURRENT_TIMESTAMP,
	ModifiedBy = @SellerEmail,
	Version = Version + 1
	WHERE Product_Id = p_Product_Id
	AND Seller_Id = p_Seller_Id
	AND Is_Deleted = 0;
END;
$$