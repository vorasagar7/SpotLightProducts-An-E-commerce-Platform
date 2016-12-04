DELIMITER $$
CREATE PROCEDURE sp_Inventory_Management_Add_Product(
	IN p_Product_Name VARCHAR(100),
	IN p_Model_Id VARCHAR(100),
	IN p_Brand_Id INTEGER,
	IN p_Category_Id INTEGER,
	IN p_Seller_Id INTEGER,
	IN p_Description VARCHAR(1000),
	IN p_Is_Spotlight BOOLEAN,
	IN p_Quantity INTEGER,
	IN p_Price FLOAT(10,2)
)
BEGIN
	SET @SellerEmail = (SELECT Email from tb_AppUser WHERE Id = p_Seller_Id);
	INSERT INTO tb_Products(
			Product_Name,
			Model_Id,
			Brand_Id,
			Category_Id,
			Description,
			Is_Spotlight,
			Created_By,
			Modified_On,
			Modified_By
		)
		VALUES(
			p_Product_Name,
			p_Model_Id,
			p_Brand_Id,
			p_Category_Id,
			p_Description,
			p_Is_Spotlight,
			@SellerEmail,
			CURRENT_TIMESTAMP,
			@SellerEmail
		);
	SET @productId = (SELECT LAST_INSERT_ID());
	
    INSERT INTO tb_ProductSeller(
			Product_Id,
			Seller_Id,
			Price,
			Quantity,
			Created_By,
			Modified_On,
			Modified_By
	)
	VALUES(
		@productId,
		p_Seller_Id,
		p_Price,
		p_Quantity,
		@SellerEmail,
		CURRENT_TIMESTAMP,
		@SellerEmail
	);
	SELECT 1 AS SUCCESS, "" AS ErrMessage;
END;
$$