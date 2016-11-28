DELIMITER $$
CREATE PROCUEDURE sp_User_Shopping_Cart_Get(
	IN p_userId INTEGER
)
BEGIN
	SELECT cart.Id,
		product.Id,
		product.Product_Name,
		product.Model_Id,
		brand.Name AS Brand,
		category.Name AS Category,
		product.Description,
		CONCAT(seller.First_Name, seller.Last_Name) AS SellerName,
		cart.Quantity,
		cart.Price
	FROM tb_ShoppingCart cart
	INNER JOIN tb_Products product
	ON cart.Product_Id = product.Id
	INNER JOIN tb_ReferenceListItem brand
	ON brand.Id = product.Brand_Id
	INNER JOIN tb_ReferenceListItem category
	ON category.Id = product.Category_Id
	INNER JOIN tb_AppUser seller
	ON seller.Id = cart.Seller_Id
	INNER JOIN tb_ProductSeller ps
	ON ps.Product_Id = product.Id AND ps.Seller_Id = cart.Seller_Id
	WHERE cart.Buyer_Id = p_userId
	AND cart.Is_Deleted = 0
	AND product.Is_Deleted = 0
	AND ps.Is_Deleted = 0
	ORDER BY product.Product_Name;
END;
$$