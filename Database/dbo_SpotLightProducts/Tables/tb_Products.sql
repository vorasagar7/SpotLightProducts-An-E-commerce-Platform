CREATE TABLE tb_Products (
    Id INTEGER,     
    Product_Name VARCHAR(50),     
    Model_Id VARCHAR(50),     
    Brand_Id INTEGER, 
    Category_Id INTEGER,
    Description VARCHAR(1000),
    Is_Approved BOOLEAN DEFAULT 0,
    Is_Spotlight BOOLEAN DEFAULT 0,
    Is_Deleted BOOLEAN DEFAULT 0,     
    Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     
    Created_By VARCHAR(100),     
    Modified_On TIMESTAMP,     
    Modified_By VARCHAR(100),     
    Version INTEGER DEFAULT 1, 
    CONSTRAINT pk_tb_Products_Id PRIMARY KEY(Id),
    CONSTRAINT fk_tb_Products_Brand_Id FOREIGN KEY(Brand_Id) REFERENCES tb_ReferenceListItem(Id), 
    CONSTRAINT fk_tb_Products_Category_Id FOREIGN KEY(Category_Id) REFERENCES tb_ReferenceListItem(Id)   
)