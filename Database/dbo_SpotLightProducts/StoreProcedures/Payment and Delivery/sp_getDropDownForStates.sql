DELIMITER $$
CREATE PROCEDURE sp_getDropDownForStates(
)
BEGIN
	SELECT 
		10 as Id, 
		rli.id, rli.Name 
	FROM tb_referencelist rl
		INNER JOIN
		tb_referencelistitem rli
	ON rl.id=rli.List_Id
	WHERE rl.name = 'States'
	ORDER BY Sort_Order;
END;
$$