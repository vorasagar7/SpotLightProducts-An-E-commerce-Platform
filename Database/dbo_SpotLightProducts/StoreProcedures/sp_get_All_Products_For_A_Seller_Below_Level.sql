DELIMITER $$
CREATE PROCEDURE sp_get_All_Products_For_A_Seller_Below_Level(
IN p_seller_Id integer
)
BEGIN
select p.Product_Name, p.Model_Id, p.Description, ps.price, ps.quantity from tb_products p inner join tb_productseller ps on p.Id = ps.Product_Id where ps.Seller_Id=5 and ps.quantity <= 5;
End;
$$