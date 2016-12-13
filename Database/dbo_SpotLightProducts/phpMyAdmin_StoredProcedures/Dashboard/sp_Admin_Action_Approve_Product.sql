DELIMITER $$
CREATE PROCEDURE sp_Admin_Action_Approve_Product(
	IN p_Product_Id INTEGER,
	IN p_Admin_Email VARCHAR(100)
)
BEGIN
	IF (EXISTS (
		SELECT 
			id
		FROM tb_Products
		WHERE Id = p_Product_Id
		AND Is_Approved = 1
		)
	)
	THEN
		SELECT 
			-1 AS SUCCESS, 
			"Product Already Approved" AS Message;
	ELSE
		UPDATE tb_Products
		SET Is_Approved = 1,
			Version = Version + 1,
			Modified_On = CURRENT_TIMESTAMP,
			Modified_By = p_Admin_Email
		WHERE Id = p_Product_Id
		AND Is_Deleted = 0;
		SELECT 
			1 AS SUCCESS,
			"Product Successfully Approved" AS Message;
	END IF;
END;
