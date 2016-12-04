DELIMITER $$
CREATE PROCEDURE sp_Brand_Category_ReferenceData_Get(
)
BEGIN
	CREATE TEMPORARY TABLE tb_ReferenceData(
		ID INTEGER,
		ObjectID INTEGER,
		Name VARCHAR(200)
	);
	INSERT INTO tb_ReferenceData(
		ID,
		ObjectId,
		Name
	)
	SELECT 
		10, 
		rli.id, 
        rli.Name
	FROM tb_referencelist rl
		INNER JOIN
		tb_referencelistitem rli
	ON rl.id=rli.List_Id
	WHERE rl.Name = "Brand"
	ORDER BY Sort_Order;
	
	INSERT INTO tb_ReferenceData(
		ID,
		ObjectId,
		Name
	)
	SELECT 
		20, 
		rli.id, 
        rli.Name
	FROM tb_referencelist rl
		INNER JOIN
		tb_referencelistitem rli
	ON rl.id=rli.List_Id
	WHERE rl.Name = "Categories"
	ORDER BY Sort_Order;
	
	SELECT ID,
		ObjectID,
		Name
	FROM tb_ReferenceData
	ORDER BY ID;
	
	DROP TABLE tb_ReferenceData;
END;
$$