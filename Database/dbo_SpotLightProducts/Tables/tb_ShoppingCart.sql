CREATE TABLE tb_ShoppingCart (
    Id INTEGER,     
    Buyer_Id INTEGER,
    Product_Id INTEGER,
    Seller_Id INTEGER,
    Quantity INTEGER,
    Price FLOAT(10,2),
    IsDeleted BOOLEAN DEFAULT 0,
    Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     
    Created_By VARCHAR(100),     
    Modified_On TIMESTAMP,     
    Modified_By VARCHAR(100),     
    Version INTEGER DEFAULT 1, 
    CONSTRAINT pk_tb_ShoppingCart_Id PRIMARY KEY(Id),
    CONSTRAINT fk_tb_ShoppingCart_Buyer_Id FOREIGN KEY(Buyer_Id) REFERENCES tb_AppUser(Id)
    CONSTRAINT fk_tb_ShoppingCart_Product_Id FOREIGN KEY(Product_id) REFERENCES tb_Products(Id),
    CONSTRAINT fk_tb_ShoppingCart_Seller_Id FOREIGN KEY(Seller_Id) REFERENCES tb_AppUser(Id)   
)