CREATE TABLE tb_UserOrder (
    Id INTEGER,     
    Mode_Of_Payment_Id INTEGER,     
    Buyer_Id INTEGER,     
    Shipping_Address VARCHAR(1000),
    IsDeleted BOOLEAN DEFAULT 0,
    Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     
    Created_By VARCHAR(100),     
    Modified_On TIMESTAMP,     
    Modified_By VARCHAR(100),     
    Version INTEGER DEFAULT 1, 
    CONSTRAINT pk_tb_UserOrder_Id PRIMARY KEY(Id),
    CONSTRAINT fk_tb_UserOrder_Mode_Of_Payment_Id FOREIGN KEY(Mode_Of_Payment_Id) REFERENCES tb_ReferenceListItem(Id)
    CONSTRAINT fk_tb_UserOrder_Buyer_Id FOREIGN KEY(Buyer_Id) REFERENCES tb_AppUser(Id)
)