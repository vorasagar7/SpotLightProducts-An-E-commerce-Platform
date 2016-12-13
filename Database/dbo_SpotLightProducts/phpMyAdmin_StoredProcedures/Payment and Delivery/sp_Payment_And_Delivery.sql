DELIMITER $$
CREATE PROCEDURE sp_Payment_And_Delivery(
IN p_user_Id integer,
In p_type_Of_Payment integer,
In p_shiping_Address Varchar(100)
)
BEGIN
	SET @UserEmail = (SELECT Email from tb_AppUser WHERE Id = p_user_Id);
	INSERT INTO tb_userorder (
		`Mode_Of_Payment_Id`, 
		`Buyer_Id`, 
		`Shipping_Address`,  
		`Created_By`, 
		`Modified_On`, 
		`Modified_By`
	)
	VALUES (
		p_type_Of_Payment, 
		p_user_Id, 
		p_shiping_Address, 
		@UserEmail,  
		CURRENT_TIMESTAMP, 
		@UserEmail
	);
	set @OrderID = (select LAST_INSERT_ID());
	INSERT INTO tb_ordermapping(
		Seller_id, 
		Order_Id,
		Product_Id,
		Quantity,
		Price,
		Created_By,
		Modified_On,
		Modified_By
	)
	SELECT
		sc.seller_Id,
		@OrderID,
		sc.Product_id,
		sc.Quantity,
		sc.Price,
		@UserEmail,
		CURRENT_TIMESTAMP,
		@UserEmail
	FROM tb_shoppingcart sc
	WHERE Buyer_Id = p_user_Id 
	AND IS_DELETED = 0;
	
	UPDATE tb_shoppingcart 
		SET IS_DELETED = 1,
		Modified_By = @UserEmail,
		Modified_On = CURRENT_TIMESTAMP,
		VERSION = VERSION + 1
		WHERE IS_DELETED = 0 
		AND Buyer_Id = p_user_Id;
	SELECT 1 AS SUCCESS, "" AS ErrMessage, @OrderID AS User_Order_ID;
End;
$$