CREATE TABLE tb_ProductSeller (
    Id INTEGER,     
    Product_Id INTEGER,     
    Seller_Id INTEGER,     
    Price FLOAT(10,2),
    Quantity INTEGER,
    Is_Deleted BOOLEAN DEFAULT 0,     
    Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     
    Created_By VARCHAR(100),     
    Modified_On TIMESTAMP,     
    Modified_By VARCHAR(100),     
    Version INTEGER DEFAULT 1, 
    CONSTRAINT pk_tb_ProductSeller_Id PRIMARY KEY(Id),
    CONSTRAINT fk_tb_ProductSeller_Product_Id FOREIGN KEY(Product_Id) REFERENCES tb_Products(Id),
    CONSTRAINT fk_tb_ProductSeller_Seller_Id FOREIGN KEY(Seller_Id) REFERENCES tb_AppUser(Id)   
  )