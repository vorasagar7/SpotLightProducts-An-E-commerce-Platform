CREATE TABLE tb_UserReviews ( 
    Id INTEGER AUTO_INCREMENT, 
    Product_Id INTEGER, 
    User_Id INTEGER, 
    Comment VARCHAR(1000), 
    Rating INTEGER, 
    Is_Deleted BOOLEAN DEFAULT 0, 
    Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    Created_By VARCHAR(100), 
    Modified_On TIMESTAMP, 
    Modified_By VARCHAR(100), 
    Version INTEGER DEFAULT 1,
    CONSTRAINT pk_tb_Reviews_Id PRIMARY KEY(Id), 
    CONSTRAINT fk_tb_Reviews_Product_Id FOREIGN KEY(Product_Id) REFERENCES tb_Products(Id), 
    CONSTRAINT fk_tb_Reviews_User_Id FOREIGN KEY(User_Id) REFERENCES tb_AppUser(Id),
    CONSTRAINT ck_tb_Reviews_Rating CHECK(Rating >0 AND Rating < 6)  
);