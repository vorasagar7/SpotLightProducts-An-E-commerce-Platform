DELIMITER $$
CREATE PROCEDURE sp_Get_User_Count_By_Month(
)
BEGIN
	SELECT 
		COUNT(u.ID) AS total, 
		DATE_FORMAT(merge_date,'%b') AS month, 
		YEAR(m.merge_date) AS year
		FROM (
           SELECT 
				'2016-01-01' AS merge_date
		   UNION SELECT '2016-02-01' AS merge_date
           UNION SELECT '2016-03-01' AS merge_date
           UNION SELECT '2016-04-01' AS merge_date
           UNION SELECT '2016-05-01' AS merge_date
           UNION SELECT '2016-06-01' AS merge_date
           UNION SELECT '2016-07-01' AS merge_date
           UNION SELECT '2016-08-01' AS merge_date
           UNION SELECT '2016-09-01' AS merge_date
           UNION SELECT '2016-10-01' AS merge_date
           UNION SELECT '2016-11-01' AS merge_date
           UNION SELECT '2016-12-01' AS merge_date
          ) AS m
			LEFT JOIN tb_appuser u 
			ON MONTH(m.merge_date) = MONTH(u.created_On) 
			AND YEAR(m.merge_date) = YEAR(u.created_On)
		GROUP BY m.merge_date
		ORDER BY 1+1;
End;

