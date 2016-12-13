DELIMITER $$
CREATE PROCEDURE sp_get_Rating_For_Product(
In p_product_Id integer
)
BEGIN
	SET @rowCount = (select ceiling(avg(rating)) from tb_userreviews where product_id=p_product_Id); 
	IF @rowCount > 0 THEN
		Select @rowCount;
	ELSE
		Select 0;
	END IF;
End;
$$