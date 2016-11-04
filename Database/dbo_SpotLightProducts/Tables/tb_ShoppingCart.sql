CREATE TABLE tb_ShoppingCart (
    Id INTEGER AUTO_INCREMENT,     
    Buyer_Id INTEGER not null,
    Product_Id INTEGER not null,
    Seller_Id INTEGER not null,
    Quantity INTEGER not null,
    Price FLOAT(10,2) not null,
    IsDeleted BOOLEAN DEFAULT 0,
    Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     
    Created_By VARCHAR(100) not null,     
    Modified_On TIMESTAMP not null,     
    Modified_By VARCHAR(100) not null,     
    Version INTEGER DEFAULT 1, 
    CONSTRAINT pk_tb_ShoppingCart_Id PRIMARY KEY(Id),
    CONSTRAINT fk_tb_ShoppingCart_Buyer_Id FOREIGN KEY(Buyer_Id) REFERENCES tb_AppUser(Id),
    CONSTRAINT fk_tb_ShoppingCart_Product_Id FOREIGN KEY(Product_id) REFERENCES tb_Products(Id),
    CONSTRAINT fk_tb_ShoppingCart_Seller_Id FOREIGN KEY(Seller_Id) REFERENCES tb_AppUser(Id)   
)


