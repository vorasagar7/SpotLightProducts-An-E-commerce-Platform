CREATE TABLE tb_UserOrder (
    Id INTEGER AUTO_INCREMENT,     
    Mode_Of_Payment_Id INTEGER not null,     
    Buyer_Id INTEGER not null,     
    Shipping_Address VARCHAR(1000) not null,
    Is_Deleted BOOLEAN DEFAULT 0,
    Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     
    Created_By VARCHAR(100) not null,     
    Modified_On TIMESTAMP not null,     
    Modified_By VARCHAR(100) not null,     
    Version INTEGER DEFAULT 1, 
    CONSTRAINT pk_tb_UserOrder_Id PRIMARY KEY(Id),
    CONSTRAINT fk_tb_UserOrder_Mode_Of_Payment_Id FOREIGN KEY(Mode_Of_Payment_Id) REFERENCES tb_ReferenceListItem(Id),
    CONSTRAINT fk_tb_UserOrder_Buyer_Id FOREIGN KEY(Buyer_Id) REFERENCES tb_AppUser(Id)
);