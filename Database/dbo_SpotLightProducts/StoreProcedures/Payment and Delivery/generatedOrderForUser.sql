INSERT INTO `spotlightproducts`.`tb_shoppingcart` (`Buyer_Id`, `Product_Id`, `Seller_Id`, `Quantity`, `Price`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('1', '1', '5', '2', '120', '0', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);
INSERT INTO `spotlightproducts`.`tb_shoppingcart` (`Buyer_Id`, `Product_Id`, `Seller_Id`, `Quantity`, `Price`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('1', '2', '5', '2', '110', '0', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);
INSERT INTO `spotlightproducts`.`tb_shoppingcart` (`Buyer_Id`, `Product_Id`, `Seller_Id`, `Quantity`, `Price`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('1', '3', '6', '1', '2020', '0', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);


Insert into tb_userorder
get rows from shopping cart
insert the count rows into order mapping
update shopping cart, set isDeleted = 1 for that user;


DELIMITER $$
CREATE PROCEDURE sp_payment_And_Delivery(
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
	UPDATE tb_shoppingcart set IS_DELETED = 1 where IS_DELETED = 0 and Buyer_Id = p_user_Id
End;
$$