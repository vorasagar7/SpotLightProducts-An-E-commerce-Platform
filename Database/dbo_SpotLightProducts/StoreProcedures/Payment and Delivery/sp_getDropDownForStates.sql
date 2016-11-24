DELIMITER $$
CREATE PROCEDURE sp_getDropDownForStates(
)
BEGIN
	SELECT 
		10 as StateId, 
		rli.id AS StateValueId, 
        rli.Name AS StateName
	FROM tb_referencelist rl
		INNER JOIN
		tb_referencelistitem rli
	ON rl.id=rli.List_Id
	WHERE rl.name = 'States'
	ORDER BY Sort_Order;
END;
$$