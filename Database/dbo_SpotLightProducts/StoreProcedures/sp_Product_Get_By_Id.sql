DELIMITER $$
CREATE PROCEDURE sp_Product_Get_By_Id(
	IN p_productId INTEGER
)
BEGIN
	SELECT p.Id,
		p.Product_Name,
		p.Model_Id,
		brand.Name AS Brand,
		category.Name AS Category,
		p.Description,
		p.Is_Spotlight,
		CONCAT(seller.First_Name, seller.Last_Name) AS SellerName,
		ps.Price,
		ps.Quantity
	FROM tb_Products p
	INNER JOIN tb_ProductSeller ps
	ON ps.Product_Id = p.Id
	INNER JOIN tb_ReferenceListItem brand
	ON brand.Id = p.Brand_Id
	INNER JOIN tb_ReferenceListItem category
	ON category.Id = p.Category_Id
	INNER JOIN tb_AppUser seller
	ON seller.Id = ps.Seller_Id
	WHERE p.Id = p_productId
	AND p.Is_Deleted = 0
	AND p.Is_Approved = 1
	AND ps.Is_Deleted = 0
	ORDER BY p.SellerName

	SELECT reviews.Id,
		CONCAT(user.First_Name, user.Last_Name) AS UserName,
		Comment,
		Rating
	FROM tb_UserReviews review
	INNER JOIN tb_Products products
	ON review.Product_Id = products.Id
	INNER JOIN tb_AppUser user
	ON user.Id = review.User_Id
	WHERE reviews.Is_Deleted = 0
	AND products.Is_Deleted = 0
	AND user.Is_Active = 1
END;
$$