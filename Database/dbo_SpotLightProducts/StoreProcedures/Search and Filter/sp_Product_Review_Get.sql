DELIMITER $$
CREATE PROCEDURE sp_Product_Review_Get(
	IN p_productId INTEGER
)
BEGIN
SELECT review.Id,
		CONCAT(user.First_Name, user.Last_Name) AS UserName,
		review.Comments,
		review.Rating,
		review.Modified_On
	FROM tb_UserReviews review
	INNER JOIN tb_Products products
	ON review.Product_Id = products.Id
	INNER JOIN tb_AppUser user
	ON user.Id = review.User_Id
	WHERE review.Is_Deleted = 0
	AND products.Is_Deleted = 0
	AND user.Is_Deleted = 0
	ORDER BY review.Modified_On DESC;
END;
$$