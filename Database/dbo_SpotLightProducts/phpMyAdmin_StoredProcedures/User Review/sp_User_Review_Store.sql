DELIMITER $$
Create PROCEDURE sp_User_Review_Store (
	In p_Product_ID integer,
	In p_Comments varchar(100),
	In p_Rating varchar(100),
	In p_User_Email varchar(100)
)
BEGIN
	declare userID integer;
	SELECT
		id INTO userID
		FROM tb_AppUser
		WHERE email = p_User_Email
		AND Is_DELETED = 0;
	INSERT INTO tb_userreviews (
		Product_Id,
		User_Id,
		Comments,
		Rating,
		Created_By,
		Modified_On,
		Modified_By
	) 
		VALUES (
			p_Product_ID, 
			userID,
			p_Comments, 
			p_Rating, 
			p_User_Email, 
			CURRENT_TIMESTAMP,
			p_User_Email
		);
		set @reviewID = (select LAST_INSERT_ID());
		Select 
			1 as Success, 
			"" as Message, 
			@reviewID As UserReview_Id;
End;
$$