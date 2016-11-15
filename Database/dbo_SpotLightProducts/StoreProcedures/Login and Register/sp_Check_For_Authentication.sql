DELIMITER $$
CREATE PROCEDURE sp_Check_For_Authentication
(
  IN p_userEmail varchar(100),
	IN p_password varchar(100)
)
BEGIN
	CREATE TEMPORARY TABLE UserTable(
		Id INTEGER,
		FirstName VARCHAR(50),
		LastName VARCHAR(50),
		Email VARCHAR(100)
	);
	INSERT INTO UserTable(
		Id,
		FirstName,
		LastName,
        Email
	)
	SELECT Id,
		First_Name,
		Last_Name,
		Email
		FROM tb_AppUser
		WHERE Email = p_userEmail
		AND Pwd = p_password
		AND Is_DELETED = 0;

	SET @rowCount = (SELECT COUNT(*) FROM UserTable);
	IF @rowCount > 0 THEN
		SELECT Id, 
			FirstName, 
			LastName, 
			Email 
		FROM UserTable;
	ELSE
		SELECT 
			NULL AS Id, 
			NULL AS FirstName, 
			NULL AS LastName, 
			NULL AS Email;
	END IF;


	DROP TABLE UserTable;
END;
$$