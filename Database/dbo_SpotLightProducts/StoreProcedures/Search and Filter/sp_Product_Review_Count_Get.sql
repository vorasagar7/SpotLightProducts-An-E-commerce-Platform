DELIMITER $$
CREATE PROCEDURE sp_Product_Review_Count_Get(
	IN p_productId INTEGER
)
BEGIN
SELECT count(*)
	FROM tb_UserReviews review
	INNER JOIN tb_Products products
	ON review.Product_Id = products.Id
	INNER JOIN tb_AppUser user
	ON user.Id = review.User_Id
	WHERE review.Is_Deleted = 0
	AND products.Is_Deleted = 0
	AND user.Is_Deleted = 0
	AND products.id=p_productId;
END;
$$