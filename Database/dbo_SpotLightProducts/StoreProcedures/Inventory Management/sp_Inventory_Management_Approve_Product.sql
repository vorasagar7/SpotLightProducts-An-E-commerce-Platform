DELIMITER $$
CREATE PROCEDURE sp_Inventory_Management_Approve_Product(
	IN p_Product_Id INTEGER,
	IN p_Model_Id VARCHAR(50),
	IN p_Admin_Id INTEGER
)
BEGIN
	SET @AdminEmail = (SELECT Email from tb_AppUser WHERE Id = p_Admin_Id);
	UPDATE tb_Products
	SET Is_Approved = 1,
		Version = Version + 1,
		ModifiedOn = CURRENT_TIMESTAMP,
		ModifiedBy = @AdminEmail
	WHERE Id = p_Product_Id
	AND Is_Deleted = 0
END;
$$