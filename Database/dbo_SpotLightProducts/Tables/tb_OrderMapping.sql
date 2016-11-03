CREATE TABLE tb_OrderMapping (
    Id INTEGER,     
    Seller_Id INTEGER,     
    Order_Id INTEGER,  
    Product_Id INTEGER,  
    Quantity INTEGER,
    Price varchar(100),
    IsDeleted BOOLEAN DEFAULT 0,
    Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     
    Created_By VARCHAR(100),     
    Modified_On TIMESTAMP,     
    Modified_By VARCHAR(100),     
    Version INTEGER DEFAULT 1, 
    CONSTRAINT pk_tb_OrderMapping_Id PRIMARY KEY(Id),
    CONSTRAINT fk_tb_OrderMapping_Seller_Id FOREIGN KEY(Seller_Id) REFERENCES tb_AppUser(Id),
    CONSTRAINT fk_tb_OrderMapping_Order_Id FOREIGN KEY(Order_Id) REFERENCES tb_UserOrder(Id),
    CONSTRAINT fk_tb_OrderMapping_Product_Id FOREIGN KEY(Product_Id) REFERENCES tb_Products(Id)
)