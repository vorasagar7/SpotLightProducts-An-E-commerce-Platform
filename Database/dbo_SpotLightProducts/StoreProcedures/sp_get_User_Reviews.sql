DELIMITER $$
CREATE PROCEDURE sp_get_User_Reviews(
IN p_user_Id integer
)
BEGIN
select urv.User_Id, urv.Product_Id, urv.Comment, urv.Rating from tb_userreviews urv where urv.User_Id = p_user_Id;
End;
$$